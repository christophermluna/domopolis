<?

class ControllerDPRainForest extends Controller {	
	private $maxSteps = 10;
	private $categoriesData = null;

	private $iterations = null;
	private $current_iteration = null;
	private $current_category = null;

	private $existentAsins = [];
	private $rainforestAmazon = null;

	
	public function __construct($registry){
		ini_set('memory_limit', '4G');

		parent::__construct($registry);

		if (php_sapi_name() != 'cli'){
			die();
		}

		if (!$this->config->get('config_rainforest_enable_api')){
			die('RNF API NOT ENABLED');
		}

		if (!$this->config->get('config_rainforest_category_model')){
			die('RNF Category API Workmode not set');
		}

		$this->rainforestAmazon = $this->registry->get('rainforestAmazon');
		$this->rainforestAmazon->checkIfPossibleToMakeRequest();

	//	$this->fullFillExistentAsins();
	}

	/*
	Second workers (tried, but unneded, because of db slow latency)
	*/
	public function parsetechcategory_fork(){
		$this->parsetechcategory();
	}

	public function editfullproductscron_fork(){
		$this->editfullproductscron();
	}

	public function editfullproductscronl2_fork(){
		$this->editfullproductscronl2();
	}

	private function fullFillExistentAsins(){
		$query = $this->db->ncquery("SELECT DISTINCT asin FROM product");

		foreach ($query->rows as $row){
			$this->existentAsins[] = $row['asin'];
		}
	}

	private function addExistentAsin($asin){
		$this->existentAsins[] = $asin;
	}

	private function asinExists($asin){
		$query = $this->db->ncquery("SELECT product_id FROM product WHERE asin = '" . $this->db->escape($asin) . "'");

		return $query->num_rows;
	}

	private function recursiveTree($category_id, $type){
		$childCategories = $this->rainforestAmazon->categoryParser->setType($type)->getCategoryChildren($category_id);

		if ($childCategories) {
			foreach ($childCategories as $childCategory){

				echoLine('[recursiveTree] Category ' . $childCategory['path'], 'i');
				$this->rainforestAmazon->categoryParser->setType($type)->createCategory($childCategory);										
				if ($childCategory['has_children']){
					$this->recursiveTree($childCategory['id'], $type);
				}
			}
		}
	}

	public function parseCategoryPage($category_id, $rfCategory){
		$categoryResultIndex = \hobotix\RainforestAmazon::categoryModeResultIndexes[$this->config->get('config_rainforest_category_model')];

		$continue = false;
		if (!empty($rfCategory[$categoryResultIndex]) && count($rfCategory[$categoryResultIndex])){
			$continue = true;				

			$i = 1;
			$total = count($rfCategory[$categoryResultIndex]);
			foreach ($rfCategory[$categoryResultIndex] as $rfSimpleProduct){			
				$counters = ($this->current_iteration . '/' . $this->iterations . ' : ');
				$counters .= ($this->current_category . '/' . \hobotix\RainforestAmazon::categoryRequestLimits . ' : ');
				$counters .= ($i . '/' . $total);

				if (!$this->rainforestAmazon->productsRetriever->getProductsByAsin($rfSimpleProduct['asin'])){					
					echoLine('[parseCategoryPage] Product ' . $rfSimpleProduct['asin'] . ' not found, ' . $counters, 'i');		

					if ($this->rainforestAmazon->productsRetriever->model_product_get->checkIfAsinIsDeleted($rfSimpleProduct['asin'])){
						echoLine('[parseCategoryPage] ASIN deleted, skipping!', 'w');					
					} else {	

						$this->rainforestAmazon->productsRetriever->addSimpleProductWithOnlyAsin(
							[
								'asin' 					=> $rfSimpleProduct['asin'], 
								'amazon_best_price' 	=> (!empty($rfSimpleProduct['price']))?$rfSimpleProduct['price']['value']:'0',
								'category_id' 			=> $category_id, 
								'name' 					=> $rfSimpleProduct['title'], 
								'amazon_product_link' 	=> $rfSimpleProduct['link'],
								'amazon_product_image'  => $rfSimpleProduct['image'], 
								'image' 				=> $this->rainforestAmazon->productsRetriever->getImage($rfSimpleProduct['image']), 
								'added_from_amazon' 	=> 1
							]
						);		

					}

				} else {
					echoLine('[parseCategoryPage] Product ' . $rfSimpleProduct['asin'] . ' found ' . $counters, 'i');						

					//Логика работы с найденными товарами - только в случае стандартной модели, если первый Product найден - то останавливаем работу
					if ($this->config->get('config_rainforest_category_model') == 'standard' && $this->categoriesData[$category_id]['amazon_fulfilled']){
						echoLine('[parseCategoryPage] Product ' . $rfSimpleProduct['asin'] . ' found, stopped page parsing', 's');
						return false;						
						break;
					}
				}

				$i++;
			}
		}

		return $continue;
	}

	private function getCategoryAndCreateChildren($currentCategoryInfo, $currentCategory){
		$type = $this->config->get('config_rainforest_category_model');
		$currentCategoryInfoName = $this->rainforestAmazon->categoryParser->getCategoryNameFromData($currentCategoryInfo);
		
		if ($childData = $this->rainforestAmazon->categoryParser->getCategoryChildrenFromData($currentCategoryInfo)){
			foreach ($childData as $childInfo){
				$guessedID = $this->rainforestAmazon->categoryParser->guessCategoryID($childInfo['id']);

				if (!$this->rainforestAmazon->categoryParser->checkIfCategoryExists($guessedID)){
					echoLine('[fixunexistentcategoriescron] ' . $childInfo['name'] . ', ' . $guessedID . ' не существует!');

					if ($currentChildCategoryInfo = $this->rainforestAmazon->categoryRetriever->getCategoryFromAmazon(['amazon_category_id' => $guessedID, 'page' => 1])->getJsonResult()){
						if ($this->rainforestAmazon->categoryParser->validateIfGuessedCategoryExists($currentChildCategoryInfo)){
							$currentChildCategoryInfoName = $this->rainforestAmazon->categoryParser->getCategoryNameFromData($currentChildCategoryInfo);

							echoLine('[fixunexistentcategoriescron] Получили дочернюю ' . $currentCategoryInfoName . ' -> ' . $currentChildCategoryInfoName);

							$data = [
								'id'				=> $guessedID,
								'parent_id' 		=> $currentCategory['amazon_category_id'],
								'store_parent_id' 	=> $currentCategory['category_id'],
								'name'				=> $currentChildCategoryInfoName,
								'path'				=> $currentCategory['full_name'] . ' > ' . $currentChildCategoryInfoName,
								'link'				=> $childInfo['link']
							];

							echoLine('[fixunexistentcategoriescron] Добавляем категорию: ' . $currentChildCategoryInfoName);
							$this->rainforestAmazon->categoryParser->createCategory($data);
							$justAddedCategoryFromDatabase = $this->rainforestAmazon->categoryParser->setType($type)->getCategoriesWithChildrenFromDatabase($guessedID);

							$this->getCategoryAndCreateChildren($currentChildCategoryInfo, $justAddedCategoryFromDatabase);						

						} else {
							echoLine('[fixunexistentcategoriescron] ' . $childInfo['name'] . ', ' . $guessedID . ' не существует на Amazon, пропускаем!');							
						}
					}

					
				} else {
					echoLine('[fixunexistentcategoriescron] ' . $childInfo['name'] . ', ' . $guessedID . ' существует, пропускаем!');
				}					
			}
		}
	}	

	/*
	Функционал очистки базы товаров (запуск всех функций очистки подряд)
	*/
	public function cleardatabasecron(){
		if (!$this->config->get('config_enable_amazon_specific_modes')){
			echoLine('[ControllerDPRainForest::cleardatabasecron] Setting config_enable_amazon_specific_modes is set to off, skipping!');
			return false;
		}

		if ($this->config->get('config_rainforest_delete_no_offers') && $this->config->get('config_rainforest_delete_no_offers_counter')){
			echoLine('[ControllerDPRainForest::cleardatabasecron] Starting deletenoofferscron(1)!', 's');
			$this->deletenoofferscron(1);
		}
		if ($this->config->get('config_rainforest_delete_no_offers_manual') && $this->config->get('config_rainforest_delete_no_offers_counter_manual')){
			echoLine('[ControllerDPRainForest::cleardatabasecron] Starting deletenoofferscron(0)!', 's');
		//	$this->deletenoofferscron(0);
		}		


		if ($this->config->get('config_rainforest_delete_invalid_asins')){
			echoLine('[ControllerDPRainForest::cleardatabasecron] Starting deleteinvalidasinscron(1)!', 's');
			$this->deleteinvalidasinscron(1);
		}
		if ($this->config->get('config_rainforest_delete_invalid_asins_for_manual')){
			echoLine('[ControllerDPRainForest::cleardatabasecron] Starting deleteinvalidasinscron(0)!', 's');
			$this->deleteinvalidasinscron(0);
		}


		if ($this->config->get('config_rainforest_skip_low_price_products') > 0 && $this->config->get('config_rainforest_drop_low_price_products')){
			echoLine('[ControllerDPRainForest::cleardatabasecron] Starting deletecheapcron(1)!', 's');
			$this->deletecheapcron(1);
		}
		if ($this->config->get('config_rainforest_skip_low_price_products') > 0 && $this->config->get('config_rainforest_drop_low_price_products_for_manual')){
			echoLine('[ControllerDPRainForest::cleardatabasecron] Starting deletecheapcron(0)!', 's');
			$this->deletecheapcron(0);
		}

		echoLine('[ControllerDPRainForest::cleardatabasecron] Starting deleteduplicatescron(0)!', 's');
		$this->deleteduplicatescron();

		echoLine('[ControllerDPRainForest::cleardatabasecron] Starting deletebadfromqueuecron(0)!', 's');
		$this->deletebadfromqueuecron();	
	}

	/*
	Функционал очистки очереди 
	*/
	public function deletebadfromqueuecron(){
		if ($this->config->get('config_enable_amazon_specific_modes') && $this->config->get('config_rainforest_enable_add_queue_parser')){
			echoLine('[ControllerDPRainForest::deletenoofferscron] Cleaning bad queue products!', 'w');
			$this->db->query("DELETE FROM amzn_add_queue WHERE product_id = '-1'");
		}
	}

	/*
	Очистка базы от дублей товаров с разными кодами, но одинаковыми асинами (хз откуда они могут появляться, но факт что появляются)
	*/
	public function deleteduplicatescron(){
		if (!$this->config->get('config_enable_amazon_specific_modes')){
			echoLine('[ControllerDPRainForest::deleteduplicatescron] Setting config_enable_amazon_specific_modes is set to off, skipping!');
			return false;
		}

		$query = $this->db->query("SELECT asin, COUNT(product_id) as total, GROUP_CONCAT(product_id SEPARATOR ',') as 'products' FROM product WHERE added_from_amazon = 1 AND asin <> 'INVALID' AND asin <> '' GROUP BY asin HAVING(COUNT(`product_id`)) > 1");

		foreach ($query->rows as $row){
			echoLine('[ControllerDPRainForest::deletedoublescron] Found duplicate : ' . $row['asin'] . ', ' . $row['total'] . ' products', 'e');
			$products = explode(',', $row['products']);

			$delete_products = [];
			$enable_products = [];
			$disable_products = [];

			foreach ($products as $product_id){
				if ($this->rainforestAmazon->offersParser->PriceLogic->checkIfProductIsOnAnyWarehouse($product_id)){
					echoLine('[ControllerDPRainForest::deletedoublescron] Product ' . $product_id . ' is on stock, skipping and enabling', 'i');
					$this->rainforestAmazon->productsRetriever->model_product_edit->enableProduct($product_id);
				} elseif ($this->rainforestAmazon->offersParser->PriceLogic->checkIfProductIsInOrders($product_id)){						
					$disable_products[] = $product_id;						
				} else {						
					$delete_products[] = $product_id;			
				}
			}

			if (count($products) == count($disable_products)){
				array_shift($disable_products);
			}

			echoLine('[ControllerDPRainForest::deletedoublescron] To disable: ' . count($disable_products) . ' left!', 'i');
			foreach ($disable_products as $product_id){
				echoLine('[ControllerDPRainForest::deletedoublescron] Product ' . $product_id . ' is in orders, disabling', 'i');
				$this->rainforestAmazon->productsRetriever->model_product_edit->disableProduct($product_id);
			}

			if (count($products) == count($delete_products)){
				array_shift($delete_products);
			}

			echoLine('[ControllerDPRainForest::deletedoublescron] To delete: ' . count($delete_products) . ' left!', 'i');
			foreach ($delete_products as $product_id){
				echoLine('[ControllerDPRainForest::deletedoublescron] Product ' . $product_id . ' not in orders, deleting', 'w');
				$this->rainforestAmazon->productsRetriever->model_product_edit->deleteProductSimple($product_id);
			}
		}
	}

	/*
	Очистка базы от товаров отсутствующими офферами
	*/
	public function deletenoofferscron($added_from_amazon = 1){
		echoLine('[ControllerDPRainForest::deletenoofferscron] Working in scope added_from_amazon = ' . (int)$added_from_amazon, 'e');

		if (!$this->config->get('config_enable_amazon_specific_modes')){
			echoLine('[ControllerDPRainForest::deletenoofferscron] Setting config_enable_amazon_specific_modes is set to off, skipping!');
			return false;
		}

		if ($added_from_amazon) {
			if (!$this->config->get('config_rainforest_delete_no_offers') || !$this->config->get('config_rainforest_delete_no_offers_counter')) {
				echoLine('[ControllerDPRainForest::deletenoofferscron] Setting for added_from_amazon = 1 is set to off, skipping');
				return false;
			}
		}

		if (!$added_from_amazon) {
			if (!$this->config->get('config_rainforest_delete_no_offers_manual') || !$this->config->get('config_rainforest_delete_no_offers_counter_manual')) {
				echoLine('[ControllerDPRainForest::deletenoofferscron] Setting for added_from_amazon = 0 is set to off, skipping');
				return false;
			}
		}
		
		$query = $this->db->query("SELECT p.product_id, p.asin, p.old_asin, pd.name FROM product p
			LEFT JOIN product_description pd ON (p.product_id = pd.product_id)
			WHERE 
			pd.language_id = '" . (int)$this->config->get('config_language_id') . "'
			AND
			amzn_no_offers = 1 
			AND amzn_no_offers_counter >= '" . (int)$this->config->get('config_rainforest_delete_no_offers_counter') . "' 
			AND asin <> ''
			AND added_from_amazon = '" . (int)$added_from_amazon . "'
			AND amzn_last_offers != '0000-00-00 00:00:00'");

		$i = 1;
		foreach ($query->rows as $row){
			echoLine($row['product_id'] . '/' . $row['asin'] . ' ' . $i . '/' . $query->num_rows);

			if ($this->rainforestAmazon->offersParser->PriceLogic->checkIfProductIsOnAnyWarehouse($row['product_id'])){
				echoLine('[ControllerDPRainForest::deletenoofferscron] Product ' . $row['product_id'] . ' is on stock, skipping and enabling', 'i');
				$this->rainforestAmazon->productsRetriever->model_product_edit->enableProduct($row['product_id']);

			} elseif ($this->rainforestAmazon->offersParser->PriceLogic->checkIfProductIsInOrders($row['product_id'])){
				echoLine('[ControllerDPRainForest::deletenoofferscron] Product ' . $row['product_id'] . ' is in orders, disabling', 'i');
				$this->rainforestAmazon->productsRetriever->model_product_edit->disableProduct($row['product_id'])->addAsinToIgnored($query->row['asin'], $query->row['name']);
			} else {
				echoLine('[ControllerDPRainForest::deletenoofferscron] Product ' . $row['product_id'] . ' not in orders, deleting', 'e');
				$this->rainforestAmazon->productsRetriever->model_product_edit->deleteProductSimple($row['product_id'])->addAsinToIgnored($query->row['asin'], $query->row['name']);
			}	

			$i++;
		}				
	}

	/*
	Очистка базы от товаров с невалидным ASIN
	*/
	public function deleteinvalidasinscron($added_from_amazon = 1){
		echoLine('[ControllerDPRainForest::deletenoofferscron] Working in scope added_from_amazon = ' . (int)$added_from_amazon, 'e');

		if (!$this->config->get('config_enable_amazon_specific_modes')){
			echoLine('[ControllerDPRainForest::deleteinvalidasinscron] Setting config_enable_amazon_specific_modes is set to off, skipping!');
			return false;
		}

		if ($added_from_amazon) {
			if (!$this->config->get('config_rainforest_delete_invalid_asins')) {
				echoLine('[ControllerDPRainForest::deleteinvalidasinscron] Setting for added_from_amazon = 1 is set to off, skipping');
				return false;
			}
		}

		if (!$added_from_amazon) {
			if (!$this->config->get('config_rainforest_delete_invalid_asins_for_manual')) {
				echoLine('[ControllerDPRainForest::deleteinvalidasinscron] Setting for added_from_amazon = 0 is set to off, skipping');
				return false;
			}
		}

		$query = $this->db->query("SELECT p.product_id, p.asin, p.old_asin, pd.name FROM product p
			LEFT JOIN product_description pd ON (p.product_id = pd.product_id)
			WHERE 
			pd.language_id = '" . (int)$this->config->get('config_language_id') . "'
			AND added_from_amazon = '" . (int)$added_from_amazon . "'
			AND p.asin = 'INVALID'");


		$i = 1;
		foreach ($query->rows as $row){
			if (empty($row['old_asin'])){
				$row['old_asin'] = 'INVALID';
			}

			echoLine($row['product_id'] . '/' . $row['old_asin'] . ' ' . $i . '/' . $query->num_rows);

			if ($this->rainforestAmazon->offersParser->PriceLogic->checkIfProductIsOnAnyWarehouse($row['product_id'])){
				echoLine('[ControllerDPRainForest::deleteinvalidasinscron] Product ' . $row['product_id'] . ' is on stock, skipping and enabling', 'i');
				$this->rainforestAmazon->productsRetriever->model_product_edit->enableProduct($row['product_id']);
			} elseif ($this->rainforestAmazon->offersParser->PriceLogic->checkIfProductIsInOrders($row['product_id'])){
				echoLine('[ControllerDPRainForest::deleteinvalidasinscron] Product ' . $row['product_id'] . ' is in orders, disabling', 'i');
				$this->rainforestAmazon->productsRetriever->model_product_edit->disableProduct($row['product_id'])->addAsinToIgnored($query->row['old_asin'], $query->row['name']);
			} else {
				echoLine('[ControllerDPRainForest::deleteinvalidasinscron] Product ' . $row['product_id'] . ' not in orders, deleting', 'e');
				$this->rainforestAmazon->productsRetriever->model_product_edit->deleteProductSimple($row['product_id'])->addAsinToIgnored($query->row['old_asin'], $query->row['name']);
			}				

			$i++;
		}
	}

	/*
	Если изменяется настройка или порог минимальной цены, то нужно запустить эту функцию
	*/
	public function deletecheapcron($added_from_amazon = 1){		
		echoLine('[ControllerDPRainForest::deletecheapcron] Working in scope added_from_amazon = ' . (int)$added_from_amazon, 'e');

		if (!$this->config->get('config_enable_amazon_specific_modes')){
			echoLine('[ControllerDPRainForest::deletecheapcron] Setting config_enable_amazon_specific_modes is set to off, skipping!');
			return false;
		}

		if ($added_from_amazon) {
			if ($this->config->get('config_rainforest_skip_low_price_products') <= 0 || !$this->config->get('config_rainforest_drop_low_price_products')) {
				echoLine('[ControllerDPRainForest::deletecheapcron] Setting for added_from_amazon = 1 is set to off, skipping');
				return false;
			}
		}

		if (!$added_from_amazon) {
			if ($this->config->get('config_rainforest_skip_low_price_products') <= 0 || !$this->config->get('config_rainforest_drop_low_price_products_for_manual')) {
				echoLine('[ControllerDPRainForest::deletecheapcron] Setting for added_from_amazon = 0 is set to off, skipping');
				return false;
			}
		}

		$query = $this->db->query("SELECT p.product_id, p.asin, pd.name FROM product p
			LEFT JOIN product_description pd ON (p.product_id = pd.product_id)
			WHERE 
			pd.language_id = '" . (int)$this->config->get('config_language_id') . "'
			AND amazon_best_price > 0
			AND status = 1 
			AND added_from_amazon = '" . (int)$added_from_amazon . "'
			AND amazon_best_price < '" . (float)$this->config->get('config_rainforest_skip_low_price_products') . "'");

		$i = 1;
		foreach ($query->rows as $row){
			echoLine($row['product_id'] . '/' . $row['asin'] . ' ' . $i . '/' . $query->num_rows);

			if ($this->rainforestAmazon->offersParser->PriceLogic->checkIfProductIsOnAnyWarehouse($row['product_id'])){
				echoLine('[ControllerDPRainForest::deletecheapcron] Product ' . $row['product_id'] . ' is on stock, skipping and enabling', 'i');
				$this->rainforestAmazon->productsRetriever->model_product_edit->enableProduct($row['product_id']);
			} elseif ($this->rainforestAmazon->offersParser->PriceLogic->checkIfProductIsInOrders($row['product_id'])){
				echoLine('[ControllerDPRainForest::deletecheapcron] Product ' . $row['product_id'] . ' is in orders, disabling', 'i');
					$this->rainforestAmazon->productsRetriever->model_product_edit->disableProduct($row['product_id']); //->addAsinToIgnored($query->row['asin'], $query->row['name']);
				} else {
					echoLine('[ControllerDPRainForest::deletecheapcron] Product ' . $row['product_id'] . ' not in orders, deleting', 'e');
					$this->rainforestAmazon->productsRetriever->model_product_edit->deleteProductSimple($row['product_id']); //->addAsinToIgnored($query->row['asin'], $query->row['name']);
				}			

				$i++;
			}
		}

	/*
	Фиксит дерево категорий
	*/
	public function fixunexistentcategoriescron(){
		if (!$this->config->get('config_rainforest_enable_category_tree_parser')){
			echoLine('[ControllerDPRainForest::fixunexistentcategoriescron] CRON IS DISABLED IN ADMIN', 'e');
			return;
		}

		$type = $this->config->get('config_rainforest_category_model');
		$currentCategories = $this->rainforestAmazon->categoryParser->setType($type)->getCategoriesWithChildrenFromDatabase();

		foreach ($currentCategories as $currentCategory){
			echoLine('[fixunexistentcategoriescron] Категория ' . $currentCategory['name'] . ', ' . $currentCategory['amazon_category_id']);	

			if ($currentCategoryInfo = $this->rainforestAmazon->categoryRetriever->getCategoryFromAmazon(['amazon_category_id' => $currentCategory['amazon_category_id'], 'page' => 1])->getJsonResult()){
				$this->getCategoryAndCreateChildren($currentCategoryInfo, $currentCategory);
			}

			$this->rainforestAmazon->categoryParser->setType($type)->updateFinalCategories();
			$this->rainforestAmazon->categoryParser->setType($type)->rebuildAmazonTreeToStoreTree();
			$this->rainforestAmazon->categoryParser->setType($type)->model_catalog_category->repairCategories();
		}
	}

	/*
	Создает первичное дерево категорий. Дальше лучше использовать fixnewcategoriescron
	*/
	public function addcategoriescron(){
		if (!$this->config->get('config_rainforest_enable_category_tree_parser')){
			echoLine('[ControllerDPRainForest::addcategoriescron] CRON IS DISABLED IN ADMIN', 'e');
			return;
		}

		$type = $this->config->get('config_rainforest_category_model');		
		
		if ($type == 'bestsellers') {
			if (!empty($this->config->get('config_rainforest_root_categories'))){
				//Если задана корневая категория, то создаем ее, это работает только блять с бестселлерами
				$this->rainforestAmazon->categoryParser->setType($type)->createTopCategoryFromSettings(prepareEOLArray($this->config->get('config_rainforest_root_categories')));
			}
		}	

		//Если тип у нас стандартный - то мы создадим корневые категории автоматически.
		//В случае с бестселлерами это не работает почему-то
		if ($type == 'standard'){
			$topCategories = $this->rainforestAmazon->categoryParser->setType($type)->getTopCategories();

			foreach ($topCategories['categories'] as $topCategory){
				$this->rainforestAmazon->categoryParser->setType($type)->createCategory($topCategory);				
			}
		}
		

		unset($topCategory);
		foreach ($this->rainforestAmazon->categoryParser->setType($type)->getTopCategoriesFromDataBase() as $topCategory){
			$this->recursiveTree($topCategory['category_id'], $type);
		}

		$this->rainforestAmazon->categoryParser->setType($type)->updateFinalCategories();

		if ($this->config->get('config_rainforest_enable_auto_tree')){
			$this->rainforestAmazon->categoryParser->setType($type)->rebuildAmazonTreeToStoreTree();
			$this->rainforestAmazon->categoryParser->setType($type)->model_catalog_category->repairCategories();			
		}
	}	

	/*
	Обработка очереди вариантов (если отложена)
	*/
	public function addvariantsqueuecron(){
		if (!$this->config->get('config_rainforest_enable_add_variants_queue_parser')){
			echoLine('[ControllerDPRainForest::addvariantsqueuecron] CRON IS DISABLED IN ADMIN', 'e');
			return;
		}

		$this->load->library('hobotix/FPCTimer');

		if ($this->config->has('config_rainforest_add_variants_queue_parser_time_start') && $this->config->has('config_rainforest_add_variants_queue_parser_time_end')){
			$interval = new \hobotix\Interval($this->config->get('config_rainforest_add_variants_queue_parser_time_start') . '-' . $this->config->get('config_rainforest_add_variants_queue_parser_time_end'));

			if (!$interval->isNow()){
				echoLine('[ControllerDPRainForest::addvariantsqueuecron] NOT ALLOWED TIME', 'e');
				return;
			} else {
				echoLine('[ControllerDPRainForest::addvariantsqueuecron] ALLOWED TIME', 's');				
			}
		}

		$products = $this->rainforestAmazon->productsRetriever->model_product_get->getVariantsAddQueue();

		if ($products){
			$this->translateAdaptor->checkIfItIsPossibleToMakeRequest();

			foreach ($products as $product){
				echoLine('[ControllerDPRainForest::addvariantsqueuecron] Starting with product ' . $product['product_id'] . ', ' . $product['asin'], 'i');					
				$this->rainforestAmazon->productsRetriever->model_product_edit->deleteFromVariantsAddQueue($product['asin']);

				if ($product['json'] && json_decode($product['json'])){
					echoLine('[ControllerDPRainForest::addvariantsqueuecron] JSON with information found for ' . $product['asin'], 's');
					$json = json_decode($product['json'], true);	
				} else {
					echoLine('[ControllerDPRainForest::addvariantsqueuecron] JSON with information not found for ' . $product['asin'] . ', trying to recover', 'e');

					$results = $this->rainforestAmazon->simpleProductParser->getProductByASINS([[
						'product_id' 	=> $product['product_id'], 
						'asin' 			=> $product['asin']
					]]
				);

					foreach ($results as $product_id => $result){					
						if ($result && !empty($result['asin'])){
							echoLine('[ControllerDPRainForest::fixlostjson] Recovered ' . $product_id . ' -> ' . $result['asin'], 's');

							$this->rainforestAmazon->infoUpdater->updateProductAmazonLastSearch($product_id);
							$this->rainforestAmazon->infoUpdater->updateProductAmznData([
								'product_id' 	=> $product_id, 
								'asin' 			=> $result['asin'], 
								'json' 			=> json_encode($result)
							], false);

							$json = $result;
						} else {
							echoLine('[ControllerDPRainForest::fixlostjson] Could not recover ' . $product_id . ' -> ' . $result['asin'], 'e');						
						}
					}
				}

				if (!empty($json)){
					echoLine('[ControllerDPRainForest::addvariantsqueuecron] Finally got JSON passing to parse ' . $product['asin'], 's');
					$this->rainforestAmazon->productsRetriever->editFullProductVariants($product['product_id'], $json);
				}
			}
		} else {
			echoLine('[ControllerDPRainForest::addvariantsqueuecron] Variant queue is empty', 'i');				
		}
	}

	/*
	Обработка очереди добавления ASIN - добавление и обработка данных
	*/
	public function addasinsqueuecron(){
		if (!$this->config->get('config_rainforest_enable_add_queue_parser')){
			echoLine('[ControllerDPRainForest::addasinsqueuecron] CRON IS DISABLED IN ADMIN', 'e');
			return;
		}

		$this->load->library('hobotix/FPCTimer');

		if ($this->config->has('config_rainforest_add_queue_parser_time_start') && $this->config->has('config_rainforest_add_queue_parser_time_end')){
			$interval = new \hobotix\Interval($this->config->get('config_rainforest_add_queue_parser_time_start') . '-' . $this->config->get('config_rainforest_add_queue_parser_time_end'));

			if (!$interval->isNow()){
				echoLine('[ControllerDPRainForest::addasinsqueuecron] NOT ALLOWED TIME', 'e');
				return;
			} else {
				echoLine('[ControllerDPRainForest::addasinsqueuecron] ALLOWED TIME', 's');				
			}
		}

		$timer = new \hobotix\FPCTimer();
		$this->load->model('catalog/product');

		$asins = $this->rainforestAmazon->productsRetriever->getAsinAddQueue();	
		$asinsToCategories 	= [];
		$asinsSlice 		= [];

		if ($asins){
			$this->translateAdaptor->checkIfItIsPossibleToMakeRequest();

			echoLine('[ControllerDPRainForest::addasinsqueuecron] Total ASINs in queue: ' . count($asins));

			foreach ($asins as $asin){
				if ($this->rainforestAmazon->productsRetriever->model_product_get->checkIfAsinIsDeleted($asin['asin'])){
					echoLine('[ControllerDPRainForest::addasinsqueuecron] ASIN deleted, removing from deleted list!', 'i');	
					$this->rainforestAmazon->productsRetriever->model_product_edit->removeAsinFromIgnored($asin['asin']);					
				}

				if ($product_id = $this->rainforestAmazon->productsRetriever->model_product_get->getProductIdByAsin($asin['asin'])){
					echoLine('[ControllerDPRainForest::addasinsqueuecron] Product with ASIN ' . $asin['asin'] . ' already exists', 'i');
					$this->rainforestAmazon->productsRetriever->model_product_edit->setProductIDInQueue($asin['asin'], $product_id);

					if ($category_id = $this->model_catalog_product->getProductMainCategoryId($product_id)){
						$this->rainforestAmazon->productsRetriever->model_product_edit->setCategoryIDInQueue($asin['asin'], $category_id);
					}
					continue;
				}

				$asinsToCategories[$asin['asin']] = $asin['category_id'];
				$asinsToBrandLogic[$asin['asin']] = $asin['brand_logic'];
				$asinsSlice[$asin['asin']] = [
					'asin' 			=> $asin['asin'],
					'product_id' 	=> $asin['asin']
				];
			}

			$asinsToOffers = [];

			if ($asinsToCategories && $asinsSlice){
				echoLine('[ControllerDPRainForest::addasinsqueuecron] Products left: ' . count($asinsSlice), 'i');

				$results = $this->rainforestAmazon->simpleProductParser->getProductByASINS($asinsSlice);

				foreach ($results as $asin => $rfProduct){

					if (!empty($asinsToCategories[$asin])){
						$category_id = $asinsToCategories[$asin];
					} else {
						$category_id = $this->config->get('config_rainforest_default_technical_category_id');
					}

					if (!empty($asinsToBrandLogic[$asin])){
						$rfProduct['brand_logic'] = true;
					}					

					if ($rfProduct){					
						$product_id = $this->rainforestAmazon->productsRetriever->addSimpleProductWithOnlyAsin(
							[
								'asin' 					=> $rfProduct['asin'], 
								'amazon_best_price' 	=> (!empty($rfProduct['buybox_winner']) && !empty($rfProduct['buybox_winner']['price']) && !empty($rfProduct['buybox_winner']['price']['value']))?$rfProduct['buybox_winner']['price']['value']:'0',
								'category_id' 			=> $category_id, 
								'name' 					=> $rfProduct['title'], 
								'amazon_product_link' 	=> $rfProduct['link'],
								'amazon_product_image'  => $rfProduct['main_image']['link'], 
								'image' 				=> $this->rainforestAmazon->productsRetriever->getImage($rfProduct['main_image']['link']), 
								'added_from_amazon' 	=> 1
							]
						);
					} else {
						$this->rainforestAmazon->productsRetriever->model_product_edit->setProductIDInQueue($asin, -1);
						echoLine('[addasinsqueuecron] Product does not exist!: ' . $asin, 'e');
						continue;
					}

					if ($product_id){											
						echoLine('[ControllerDPRainForest::addasinsqueuecron] Product added: ' . $product_id, 's');
						$this->rainforestAmazon->productsRetriever->editFullProduct($product_id, $rfProduct);
						$this->rainforestAmazon->productsRetriever->model_product_edit->setProductIDInQueue($asin, $product_id);

						if ($category_id = $this->model_catalog_product->getProductMainCategoryId($product_id)){
							$this->rainforestAmazon->productsRetriever->model_product_edit->setCategoryIDInQueue($asin, $category_id);
						}

						if ((!empty($rfProduct['buybox_winner']))){
							$this->rainforestAmazon->productsRetriever->model_product_edit->enableProduct($product_id);
						}

						$asinsToOffers[] = $asin;

					} else {
						echoLine('[ControllerDPRainForest::addasinsqueuecron] ASIN Product can not be added, some error happened!', 'e');
						$this->rainforestAmazon->productsRetriever->model_product_edit->setProductIDInQueue($asin, -1);							
					//	$this->rainforestAmazon->productsRetriever->model_product_edit->deleteASINFromQueue($asin);
						continue;
					}					
				}

				if ($asinsToOffers){
					if ($this->config->get('config_rainforest_delay_queue_offers')){
						foreach($asinsToOffers as $asin){
							$this->rainforestAmazon->offersParser->addAsinToProductsAmazonOffersQueue($asin);
						}
					} else {

						$results = $this->rainforestAmazon->getProductsOffersASYNC($asinsToOffers);

						if ($results){
							foreach ($results as $asin => $offers){				
								$this->rainforestAmazon->offersParser->addOffersForASIN($asin, $offers);					
							}
						}
					}
				}
			}

		} else {
			echoLine('[addasinsqueuecron] Queue is empty, or all is parsed', 's');				
		}
	}


	/*
	Основной крон, добавляющий товары согласно выбранной логики
	*/
	public function addnewproductscron(){	

		if (!$this->config->get('config_rainforest_enable_new_parser')){
			echoLine('[ControllerDPRainForest::addnewproductscron] CRON IS DISABLED IN ADMIN', 'e');
			return;
		}

		$this->load->library('hobotix/FPCTimer');

		if ($this->config->has('config_rainforest_new_parser_time_start') && $this->config->has('config_rainforest_new_parser_time_end')){
			$interval = new \hobotix\Interval($this->config->get('config_rainforest_new_parser_time_start') . '-' . $this->config->get('config_rainforest_new_parser_time_end'));

			if (!$interval->isNow()){
				echoLine('[ControllerDPRainForest::addnewproductscron] NOT ALLOWED TIME', 'e');
				return;
			} else {
				echoLine('[ControllerDPRainForest::addnewproductscron] ALLOWED TIME', 's');				
			}
		}

		$timer = new \hobotix\FPCTimer();

		$this->rainforestAmazon->categoryRetriever->checkSynced();
		$this->categoriesData = $this->rainforestAmazon->categoryRetriever->getCategories();

		foreach ($this->categoriesData as $category_id => $category){
			$this->categoriesData[$category_id]['page'] = 1;
		}

		$total = count($this->categoriesData);		
		$this->iterations = $iterations = ceil($total/\hobotix\RainforestAmazon::categoryRequestLimits);
		echoLine('[addnewproductscron] Всего ' . $total . ' категорий!');		

		$otherPageRequests = [];		
		for ($i = 1; $i <= ($iterations+1); $i++){
			$this->translateAdaptor->checkIfItIsPossibleToMakeRequest();
			
			$timer = new \hobotix\FPCTimer();
			$this->current_iteration = $i;
			echoLine('[addnewproductscron] Шаг 1 Итерация ' . $i . ' из ' . $iterations . ', категории с ' . (\hobotix\RainforestAmazon::categoryRequestLimits * ($i-1)) . ' по ' . \hobotix\RainforestAmazon::categoryRequestLimits * $i);
			
			$slice = array_slice($this->categoriesData, \hobotix\RainforestAmazon::categoryRequestLimits * ($i-1), \hobotix\RainforestAmazon::categoryRequestLimits);
			$rfCategoryJSONS = $this->rainforestAmazon->categoryRetriever->getCategoriesFromAmazonAsync($slice);

			$continue = [];
			
			$this->current_category = 0;
			foreach ($rfCategoryJSONS as $category_id => $rfCategoryJSON){	
				$this->current_category++;		
				if ($this->parseCategoryPage($category_id, $rfCategoryJSON)){

					$this->rainforestAmazon->categoryRetriever->setJsonResult($rfCategoryJSON);

					if (!$this->rainforestAmazon->categoryRetriever->getNextPage()){
						echoLine('[addnewproductscron] Category ' . $this->categoriesData[$category_id]['name'] . ' complete, setting finish marker');
						$this->rainforestAmazon->categoryRetriever->setLastCategoryUpdateDate($category_id)->setCategorySynced($category_id);
					} 

					for ($z = 2; $z <= $this->rainforestAmazon->categoryRetriever->getTotalPages(); $z++){
						$this->categoriesData[$category_id]['page'] = $z;
						$this->categoriesData[$category_id]['total'] = $this->rainforestAmazon->categoryRetriever->getTotalPages();

						$otherPageRequests[] = $this->categoriesData[$category_id];
					}
				}
			}
		}

		$total = count($otherPageRequests);
		$this->iterations = $iterations = ceil($total/\hobotix\RainforestAmazon::categoryRequestLimits);
		echoLine('[addnewproductscron] Всего eще ' . $total . ' запросов!');
		for ($i = 1; $i <= ($iterations+1); $i++){
			$this->current_iteration = $i;
			echoLine('[addnewproductscron] Шаг 2 Итерация ' . $i . ' из ' . $iterations . ', категории с ' . (\hobotix\RainforestAmazon::categoryRequestLimits * ($i-1)) . ' по ' . \hobotix\RainforestAmazon::categoryRequestLimits * $i);
			$slice = array_slice($otherPageRequests, \hobotix\RainforestAmazon::categoryRequestLimits * ($i-1), \hobotix\RainforestAmazon::categoryRequestLimits);

			$rfCategoryJSONS = $this->rainforestAmazon->categoryRetriever->getCategoriesFromAmazonAsync($slice);

			$this->current_category = 0;
			foreach ($rfCategoryJSONS as $category_id => $rfCategoryJSON){
				$this->current_category++;

				$this->parseCategoryPage($category_id, $rfCategoryJSON);
				$this->rainforestAmazon->categoryRetriever->setJsonResult($rfCategoryJSON);

				if (!$this->rainforestAmazon->categoryRetriever->getNextPage()){
					echoLine('[addnewproductscron] Category ' . $this->categoriesData[$category_id]['name'] . ' complete, setting finish marker');
					$this->rainforestAmazon->categoryRetriever->setLastCategoryUpdateDate($category_id)->setCategorySynced($category_id);
				}
			}
		}

		$this->setpricesfast();
		$this->updateimagesfromamazon();	
	}

	/*
	Проверяет асины в случае их изменения и перезаписывает из сохраненной таблички кэшированных данных, и обновляет полностью информацию о товаре
	*/
	public function recoverasinscron(){

		if (!$this->config->get('config_rainforest_enable_recoverasins_parser')){
			echoLine('[ControllerDPRainForest::recoverasins] CRON IS DISABLED IN ADMIN', 'e');
			return;
		}

		if ($this->config->has('config_rainforest_recoverasins_parser_time_start') && $this->config->has('config_rainforest_recoverasins_parser_time_end')){
			$interval = new \hobotix\Interval($this->config->get('config_rainforest_recoverasins_parser_time_start') . '-' . $this->config->get('config_rainforest_recoverasins_parser_time_end'));

			if (!$interval->isNow()){
				echoLine('[ControllerDPRainForest::recoverasins] NOT ALLOWED TIME', 'e');
				return;
			} else {
				echoLine('[ControllerDPRainForest::recoverasins] ALLOWED TIME', 's');				
			}
		}

		if ($this->config->get('config_enable_amazon_specific_modes')){
			$total = $this->rainforestAmazon->productsRetriever->model_product_get->getTotalProductsWithChangedAsins();
			
			$this->load->library('hobotix/FPCTimer');

			echoLine('[recoverasins] Total products: ' . $total);

			$timer = new \hobotix\FPCTimer();	

			$slice = $this->rainforestAmazon->productsRetriever->model_product_get->getProductsWithChangedAsins((int)\hobotix\RainforestAmazon::productRequestLimits);
			echoLine('[recoverasins] Have ' . count($slice) . ' changed asins, trying to recover...');

			foreach ($slice as $changed){
				echoLine('[recoverasins] Changed ' . $changed['product_id'] . ' with asin ' . $changed['asin_in_product_table'] . ' -> ' . $changed['asin']);					
			}	

			$results = $this->rainforestAmazon->simpleProductParser->getProductByASINS($slice);

			foreach ($results as $product_id => $result){
				$this->rainforestAmazon->infoUpdater->updateProductAmazonLastSearch($product_id);

				if ($result){
					echoLine('[recoverasins] Product ' . $product_id . ' -> ' . $result['asin']);
					echoLine('[recoverasins] Old name:' . $slice[$product_id]['name']);
					echoLine('[recoverasins] New name:' . $result['title']);

					$this->rainforestAmazon->productsRetriever->editFullProduct($product_id, $result);
					$this->rainforestAmazon->infoUpdater->updateASINInDatabase(['product_id' => $product_id, 'asin' => $result['asin']]);

				} else {
					echoLine('[recoverasins] Could not recover ' . $product_id . ' -> ' . $result['asin']);
					$this->rainforestAmazon->infoUpdater->updateASINInDatabase(['product_id' => $product_id, 'asin' => 'INVALID']);				
				}
			}				

			echoLine('[fixlostjson] Iteration time: ' . $timer->getTime() . ' sec.');
			unset($timer);	
		}
	}

	/*
	Проверяет существование данных в файлах и перескачивает их по мере необходимости
	*/
	public function fixlostjson(){
		$total = $this->rainforestAmazon->productsRetriever->model_product_get->getTotalProductsWithFullData();

		$this->load->library('hobotix/FPCTimer');

		$iterations = ceil($total/(int)\hobotix\RainforestAmazon::productRequestLimits);
		echoLine('[fixlostjson] Total products: ' . $total);
		$k = 1;	

		$total_lost = 0;
		for ($i = 1; $i <= ($iterations+1); $i++){
			$timer = new \hobotix\FPCTimer();	

			echoLine('[fixlostjson] Iteration ' . $i . '/' . $iterations);

			$slice = $this->rainforestAmazon->productsRetriever->model_product_get->getProductsWithFullDataWithLostJSON(($i-1) * (int)\hobotix\RainforestAmazon::productRequestLimits);
			if ($slice){
				$total_lost += count($slice);						
				echoLine('[fixlostjson] Have ' . count($slice) . ' lost json files, recovering', 'w');

				foreach ($slice as $lost){
					echoLine('[fixlostjson] Lost ' . $lost['product_id'] . ' with asin ' . $lost['asin']);					
				}				

				$results = $this->rainforestAmazon->simpleProductParser->getProductByASINS($slice);

				foreach ($results as $product_id => $result){					
					if ($result && !empty($result['asin'])){
						echoLine('[fixlostjson] Recovered ' . $product_id . ' -> ' . $result['asin'], 's');

						$this->rainforestAmazon->infoUpdater->updateProductAmazonLastSearch($product_id);
						$this->rainforestAmazon->infoUpdater->updateProductAmznData([
						'product_id' 	=> $product_id, 
						'asin' 			=> $result['asin'], 
						'json' 			=> json_encode($result)
						], false);
					} else {
						echoLine('[fixlostjson] Could not recover ' . $product_id . ' -> ' . $result['asin'], 'e');						
					}
				}				
			}

			echoLine('[fixlostjson] Iteration time: ' . $timer->getTime() . ' sec.');
			unset($timer);	
		}

		echoLine('[fixlostjson] Total lost files: ' . $total_lost);
	}

	/*
	Скачивает полную информацию о товаре, переводит и редактирует товар
	*/
	public function editfullproductscron($parsetechcategory = false){

		if (!$this->config->get('config_rainforest_enable_data_parser')){
			echoLine('[ControllerDPRainForest::editfullproductscron] CRON IS DISABLED IN ADMIN', 'e');
			return;
		}

		if (!$parsetechcategory){
			$this->load->library('hobotix/FPCTimer');
			if ($this->config->has('config_rainforest_data_parser_time_start') && $this->config->has('config_rainforest_data_parser_time_end')){
				$interval = new \hobotix\Interval($this->config->get('config_rainforest_data_parser_time_start') . '-' . $this->config->get('config_rainforest_data_parser_time_end'));

				if (!$interval->isNow()){
					echoLine('[ControllerDPRainForest::editfullproductscron] NOT ALLOWED TIME', 'e');
					return;
				} else {
					echoLine('[ControllerDPRainForest::editfullproductscron] ALLOWED TIME', 's');				
				}
			}
		}

		$timer = new \hobotix\FPCTimer();

		if ($parsetechcategory){
			$products = $this->rainforestAmazon->productsRetriever->getProductsFromTechCategory();
		} else {
			$products = $this->rainforestAmazon->productsRetriever->getProducts();		
		}

		echoLine('[editfullproductscron] Total products ' . count($products));

		$total = count($products);
		$iterations = ceil($total/\hobotix\RainforestAmazon::productRequestLimits);

		for ($i = 1; $i <= ($iterations+1); $i++){
			$timer = new \hobotix\FPCTimer();
			echoLine('[editfullproductscron] Итерация ' . $i . ' из ' . $iterations . ', товары с ' . (\hobotix\RainforestAmazon::productRequestLimits * ($i-1)) . ' по ' . \hobotix\RainforestAmazon::productRequestLimits * $i);

			$slice = array_slice($products, \hobotix\RainforestAmazon::productRequestLimits * ($i-1), \hobotix\RainforestAmazon::productRequestLimits);

			$results = $this->rainforestAmazon->simpleProductParser->getProductByASINS($slice);

			foreach ($results as $product_id => $result){				
				$this->rainforestAmazon->infoUpdater->updateProductAmazonLastSearch($product_id);

				if ($result){
					echoLine('[editfullproductscron] Product ' . $product_id . ', найден, ASIN ' . $result['asin']);				

					if ($parsetechcategory){
						$this->rainforestAmazon->productsRetriever->editJustProductCategory($product_id, $result);					
					} else {
						$this->rainforestAmazon->productsRetriever->editFullProduct($product_id, $result);						
					}

				} else {

					echoLine('[EditFullProducts] Product ' . $product_id . ', не найден, ASIN ');
					$this->rainforestAmazon->infoUpdater->updateASINInDatabase(['product_id' => $product_id, 'asin' => 'INVALID']);

				}

			}

			echoLine('[EditFullProducts] Времени на итерацию: ' . $timer->getTime() . ' сек.');
			unset($timer);
		}

		$this->rainforestAmazon->productsRetriever->model_product_edit->resetUnexsistentVariants();
	}

	/*
	Парсер "технической категории"
	*/
	public function parsetechcategory(){		

		if (!$this->config->get('config_rainforest_enable_tech_category_parser')){
			echoLine('[ControllerDPRainForest::parsetechcategory] CRON IS DISABLED IN ADMIN', 'e');
			return;
		}

		$this->load->library('hobotix/FPCTimer');

		if ($this->config->has('config_rainforest_tech_category_parser_time_start') && $this->config->has('config_rainforest_tech_category_parser_time_end')){
			$interval = new \hobotix\Interval($this->config->get('config_rainforest_tech_category_parser_time_start') . '-' . $this->config->get('config_rainforest_tech_category_parser_time_end'));

			if (!$interval->isNow()){
				echoLine('[ControllerDPRainForest::editfullproductscron] NOT ALLOWED TIME', 'e');
				return;
			} else {
				echoLine('[ControllerDPRainForest::editfullproductscron] ALLOWED TIME', 's');				
			}
		}

		if ($this->config->get('config_rainforest_default_technical_category_id') && $this->config->get('config_rainforest_default_unknown_category_id')){
			$this->editfullproductscron(true);
		}
	}

	/*
	Парсер товаров уровня 2 (для тех, данные которых уже есть)
	*/
	public function editfullproductscronl2(){		

		if (!$this->config->get('config_rainforest_enable_data_l2_parser')){
			echoLine('[ControllerDPRainForest::editfullproductscronl2] CRON IS DISABLED IN ADMIN', 'e');
			return;
		}

		$this->load->library('hobotix/FPCTimer');

		if ($this->config->has('config_rainforest_data_l2_parser_time_start') && $this->config->has('config_rainforest_data_l2_parser_time_end')){
			$interval = new \hobotix\Interval($this->config->get('config_rainforest_data_l2_parser_time_start') . '-' . $this->config->get('config_rainforest_data_l2_parser_time_end'));

			if (!$interval->isNow()){
				echoLine('[ControllerDPRainForest::editfullproductscron] NOT ALLOWED TIME', 'e');
				return;
			} else {
				echoLine('[ControllerDPRainForest::editfullproductscron] ALLOWED TIME', 's');				
			}
		}
		
		$timer = new \hobotix\FPCTimer();

		$products = $this->rainforestAmazon->productsRetriever->getProductsWithFullDataButNotFullfilled();

		if ($products){
			$i = 1;
			$total = count($products);
			echoLine('[editfullproductscronl2] Total products: ' . $total);

			foreach ($products as $product){
				echoLine('[editfullproductscronl2] Product ' . $product['asin'] . ' ' . $i . '/' . $total);

				$this->rainforestAmazon->productsRetriever->editFullProduct($product['product_id'], json_decode($product['json'], true));
				$i++;
			}
		}

		$this->rainforestAmazon->productsRetriever->model_product_edit->resetUnexsistentVariants();
	}

	/*
	Обновляет картинки в случае если есть информация, но что-то пошло не так
	*/
	public function updateimagesfromamazon(){		
		$products = $this->rainforestAmazon->productsRetriever->model_product_get->getProductsWithNoImages();

		foreach ($products as $product_id => $amazon_product_image){
			$this->rainforestAmazon->productsRetriever->model_product_edit->editProductFields($product_id, [['name' => 'image', 'type' => 'varchar', 'value' => $this->rainforestAmazon->productsRetriever->getImage($amazon_product_image)]]);
		}
	}

	/*
	Обновляет картинки в случае если есть информация, но что-то пошло не так
	*/
	public function fixproductimages(){		
		$products = $this->rainforestAmazon->productsRetriever->model_product_get->getProductsWhichWeteAddedFrom('2023-05-12');

		echoLine('[fixproductimages] Total products get: ' . count($products), 'i');

		$i = 1;
		$c = count($products);
		foreach ($products as $product){			
			echoLine('[fixproductimages] Fixing product images for product ' . $product['asin'] . ', ' . $i . ' of ' . $c, 'i');
			$this->rainforestAmazon->productsRetriever->parseProductImages($product['product_id'], json_decode($product['json'], true));
		}
	}

	/*
	Обновляет видео товаров в случае если есть информация, но что-то пошло не так
	*/
	public function fixproductvideos(){		
		$products = $this->rainforestAmazon->productsRetriever->model_product_get->getProductsWhichWeteAddedFrom('2023-05-12');

		echoLine('[fixproductimages] Total products get: ' . count($products), 'i');

		$i = 1;
		$c = count($products);
		foreach ($products as $product){
			echoLine('[fixproductimages] Fixing product videos for product ' . $product['asin'] . ', ' . $i . ' of ' . $c, 'i');
			$this->rainforestAmazon->productsRetriever->parseProductVideos($product['product_id'], json_decode($product['json'], true));
		}
	}

	/*
	Пересчитывает даты доставки или поставки офферов амазона
	*/
	public function fixoffersdates(){
		$total = $this->rainforestAmazon->offersParser->getTotalAmazonOffers();		
		$iterations = ceil($total/(int)\hobotix\RainforestAmazon::generalDBQueryLimit);

		echoLine('[fixoffersdates] Всего офферов: ' . $total);
		$k = 1;		

		for ($i = 1; $i <= ($iterations+1); $i++){
			$offers = $this->rainforestAmazon->offersParser->getAmazonOffers(($i-1) * (int)\hobotix\RainforestAmazon::generalDBQueryLimit);
			if ($offers){		
				foreach ($offers as $offer){
					if ($dates = $this->rainforestAmazon->offersParser->parseAmazonDeliveryComment($offer['deliveryComments'])){

						$string = '[fixoffersdates] Оффер ' . $offer['amazon_offer_id'];
						$string .= ', ';
						$string .= $offer['deliveryComments'];
						$string .= ' -> ';
						$string .= $dates['minDays'];
						$string .= ', from '; 
						$string .= $dates['deliveryFrom'];
						$string .= ', to '; 
						$string .= $dates['deliveryTo'];
						$string .= (' (' . $i . '/' . $k . '/' . $total . ')');

						echoLine($string);								
						$this->rainforestAmazon->offersParser->setAmazonOfferDates($offer['amazon_offer_id'], $dates);

					} else {
						echoLine('[fixoffersdates] FAILED TO PARSE DATE: ' . $offer['deliveryComments']);	
					}
					$k++;	
				}
			}	
		}
	}

	/*
	Быстрая установка цен, через прайслоджик
	*/
	public function setpricesfast(){		
		$total = $this->rainforestAmazon->productsRetriever->model_product_get->getTotalProductsWithFastPrice();		

		$iterations = ceil($total/(int)\hobotix\RainforestAmazon::generalDBQueryLimit);

		echoLine('[setpricesfast] Total products: ' . $total);
		$k = 1;		

		for ($i = 1; $i <= ($iterations+1); $i++){
			$products = $this->rainforestAmazon->productsRetriever->model_product_get->getProductsWithFastPrice(($i-1) * (int)\hobotix\RainforestAmazon::generalDBQueryLimit);
			if ($products){		
				foreach ($products as $product){
					echoLine('[setpricesfast] Product ' . $product['product_id'] . ' / ' . $product['asin'] . ' ' . $i . '/' . $k . '/' . $total);
					
					$this->rainforestAmazon->offersParser->PriceLogic->updateProductPrices($product['asin'], $product['amazon_best_price'], true);
					$k++;	
				}
			}	
		}		
	}

	/*
	Полная переустановка цен, через прайслоджик, в случае багов в прайслоджике
	*/
	public function fixpricesfull(){
		$total = $this->rainforestAmazon->productsRetriever->model_product_get->getTotalProductsWithFastPriceFull();		

		$iterations = ceil($total/(int)\hobotix\RainforestAmazon::generalDBQueryLimit);

		echoLine('[fixpricesfull] Total products: ' . $total);
		$k = 1;		

		for ($i = 1; $i <= ($iterations+1); $i++){
			$products = $this->rainforestAmazon->productsRetriever->model_product_get->getProductsWithFastPriceFull(($i-1) * (int)\hobotix\RainforestAmazon::generalDBQueryLimit);
			if ($products){		
				foreach ($products as $product){
					echoLine('[fixpricesfull] Product ' . $product['product_id'] . ' / ' . $product['asin'] . ' ' . $i . '/' . $k . '/' . $total);
					
					$this->rainforestAmazon->offersParser->PriceLogic->updateProductPrices($product['asin'], $product['amazon_best_price'], true);
					$k++;	
				}
			}	
		}		
	}

	/*
	Перекладывает информацию о товарах в файловый кэш из БД
	*/
	public function puttofilecache(){		
		$total = $this->rainforestAmazon->productsRetriever->model_product_get->getTotalProductsWithFullDataInDB();		

		$iterations = ceil($total/(int)\hobotix\RainforestAmazon::generalDBQueryLimit);
		echoLine('[puttofilecache] Total products: ' . $total);
		$k = 1;		

		for ($i = 1; $i <= ($iterations+1); $i++){
			$products = $this->rainforestAmazon->productsRetriever->model_product_get->getProductsWithFullDataInDB(($i-1) * (int)\hobotix\RainforestAmazon::generalDBQueryLimit);
			if ($products){		
				foreach ($products as $product){

					if ($product['json']){
						echoLine('[puttofilecache] Product ' . $product['product_id'] . ' / ' . $product['asin'] . ' ' . $i . '/' . $k . '/' . $total);
						
						$this->rainforestAmazon->infoUpdater->updateProductAmznData($product, false);
						$k++;	
					}
				}
			}	
		}
	}
	
	/*
	Переназначает вес товаров, в случае изменений в логике определения веса товаров
	*/
	public function fixweights(){
		$total = $this->rainforestAmazon->productsRetriever->model_product_get->getTotalProductsWithFullData(['weight' => 0]);

		$iterations = ceil($total/(int)\hobotix\RainforestAmazon::generalDBQueryLimit);
		echoLine('[fixweights] Total products: ' . $total);
		$k = 1;	

		for ($i = 1; $i <= ($iterations+1); $i++){
			$products = $this->rainforestAmazon->productsRetriever->model_product_get->getProductsWithFullData(($i-1) * (int)\hobotix\RainforestAmazon::generalDBQueryLimit, ['weight' => 0]);
			if ($products){		
				foreach ($products as $product){
					echoLine('[fixweights] Product ' . $product['product_id'] . '/' . $product['asin'] . ' ' . $i . '/' . $k . '/' . $total);

					$json = json_decode($product['json'], true);
					$json['product_id'] = $product['product_id'];

					$this->rainforestAmazon->infoUpdater->parseAndUpdateProductDimensions($json);
					$k++;			
				}
			}	
		}
	}

	/*
	Переназначает размер товаров, в случае изменений в логике определения размера товаров
	*/
	public function fixlengths(){
		$total = $this->rainforestAmazon->productsRetriever->model_product_get->getTotalProductsWithFullData(['length' => 0]);

		$iterations = ceil($total/(int)\hobotix\RainforestAmazon::generalDBQueryLimit);
		echoLine('[fixweights] Total products: ' . $total);
		$k = 1;	

		for ($i = 1; $i <= ($iterations+1); $i++){
			$products = $this->rainforestAmazon->productsRetriever->model_product_get->getProductsWithFullData(($i-1) * (int)\hobotix\RainforestAmazon::generalDBQueryLimit, ['length' => 0]);
			if ($products){		
				foreach ($products as $product){
					echoLine('[fixweights] Product ' . $product['product_id'] . '/' . $product['asin'] . ' ' . $i . '/' . $k . '/' . $total);

					$json = json_decode($product['json'], true);
					$json['product_id'] = $product['product_id'];

					$this->rainforestAmazon->infoUpdater->parseAndUpdateProductDimensions($json);
					$k++;			
				}
			}	
		}
	}

	/*
	Фиксит дубли атрибутов
	*/
	public function fixattributes(){
		$this->db->query("UPDATE attribute_description SET name = TRIM(name)");
		$this->db->query("UPDATE attribute_description SET name = REPLACE(name, '- ', '') WHERE name LIKE ('-%') AND language_id <> '" . (int)$this->config->get('config_rainforest_source_language_id') . "'");

		$query = $this->db->query("SELECT *, GROUP_CONCAT(attribute_id SEPARATOR ',') as 'other_attributes' FROM attribute_description WHERE language_id = 2 GROUP BY name HAVING(count(attribute_id)) > 1");

		foreach ($query->rows as $row){
			$current_attribute_id 		= $row['attribute_id'];
			$current_attribute 			= $this->rainforestAmazon->productsRetriever->model_product_edit->getAttributeDescriptions($row['attribute_id']);			
			$current_attribute_rnf_name = '';
			$attribute_has_rnf_name_id	= false;			

			foreach ($other_attributes = explode(',', $row['other_attributes']) as $other_attribute_id){
				$other_attribute = $this->rainforestAmazon->productsRetriever->model_product_edit->getAttributeDescriptions($other_attribute_id);

				unset($attribute_line);
				foreach ($other_attribute as $attribute_line){
					if ($attribute_line['language_id'] == $this->config->get('config_rainforest_source_language_id') && mb_strlen($attribute_line['name']) > 0){
						$current_attribute_rnf_name 	= $attribute_line['name'];
						$attribute_has_rnf_name_id 		= $attribute_line['attribute_id'];
						break;
					}
				}

				if ($current_attribute_rnf_name){
					break;
				}
			}

			if ($current_attribute_rnf_name){
				echoLine('[fixattributes] Атрибут ' . $row['name'] . ', rnf name: ' . $current_attribute_rnf_name . ', main_id: ' . $attribute_has_rnf_name_id);

				unset($other_attribute_id);
				foreach ($other_attributes = explode(',', $row['other_attributes']) as $other_attribute_id){
					if ($other_attribute_id != $attribute_has_rnf_name_id){
						echoLine('[fixattributes] Перепривязываем атрибуты ' . $other_attribute_id . ' -> ' . $attribute_has_rnf_name_id);
						$this->rainforestAmazon->productsRetriever->model_product_edit->changeProductAttributes($other_attribute_id, $attribute_has_rnf_name_id);
						$this->rainforestAmazon->productsRetriever->model_product_edit->deleteAttribute($other_attribute_id);
					}

				}


			} else {
				echoLine('[fixattributes] Атрибут ' . $row['name'] . ', no rnf name');				

				foreach ($other_attributes = explode(',', $row['other_attributes']) as $to_delete_attribute_id){
					echoLine('[fixattributes] Атрибут ' . $to_delete_attribute_id . ', нужно удалить, но пока не удаляем');
					$this->rainforestAmazon->productsRetriever->model_product_edit->deleteAttribute($to_delete_attribute_id);
				}
			}
		}
	}	

	/*
	Фиксит переводы строк
	*/
	public function fixtranslations(){		
		$this->rainforestAmazon->productsRetriever->translateAdaptor->setDebug(true);
		$this->rainforestAmazon->productsRetriever->model_product_edit->cleanFailedTranslations();


		//1. product_description
		foreach (hobotix\Amazon\productModelEdit::descriptionFields as $field) {
			echoLine('[fixtranslations] Исправление перевода: ' . $field);
			$products = $this->rainforestAmazon->productsRetriever->model_product_get->getProductsWithNoFieldTranslation($field);

			$i = 1;
			$total = count($products);
			foreach ($products as $product){
				$product_translate_data = [];
				foreach ($this->registry->get('languages') as $language_code => $language) {
					$source = atrim($product['source_' . $field]);

					if ($product['language_id'] == $language['language_id'] && $this->config->get('config_rainforest_enable_language_' . $language_code)){	
						echoLine('[fixtranslations] Товар: ' . $product['product_id'] . ', ' . $i . '/' . $total);

						$translated = $this->rainforestAmazon->productsRetriever->translateAdaptor->translate($source, $this->config->get('config_rainforest_source_language'), $language_code, true);

						$product_translate_data[$language['language_id']] = [
							$field 			=> $translated						
						];
					}
				}

				if ($product_translate_data){
					$this->rainforestAmazon->productsRetriever->model_product_edit->editProductDescriptionField($product['product_id'], $field, $product_translate_data);		
				}	

				$i++;			
			}
		}

		//2. product_attribute
		$attributes = $this->rainforestAmazon->productsRetriever->model_product_get->getProductsWithNoAttributeTranslation();

		$i = 1;
		$total = count($attributes);
		foreach ($attributes as $attribute){
			$attribute_translate_data = [];
			foreach ($this->registry->get('languages') as $language_code => $language) {
				$source = atrim($attribute['source_text']);

				if ($attribute['language_id'] == $language['language_id'] && $this->config->get('config_rainforest_enable_language_' . $language_code)){
					echoLine('[fixtranslations] Атрибут: ' . $attribute['product_id'] . ':' . $attribute['attribute_id'] . ', ' . $i . '/' . $total);

					$translated = $this->rainforestAmazon->productsRetriever->translateAdaptor->translate($source, $this->config->get('config_rainforest_source_language'), $language_code, true);

					$attribute_translate_data[$language['language_id']] = [
						'text' 			=> $translated						
					];
				}
			}

			if ($attribute_translate_data){
				$this->rainforestAmazon->productsRetriever->model_product_edit->editProductAttributeText($attribute['product_id'], $attribute['attribute_id'], $attribute_translate_data);		
			}
			
			$i++;
		}

		//3. product_video_titles
		$videos = $this->rainforestAmazon->productsRetriever->model_product_get->getProductsWithNoVideoTitleTranslation();

		$i = 1;
		$total = count($videos);
		foreach ($videos as $video){
			$video_translate_data = [];
			foreach ($this->registry->get('languages') as $language_code => $language) {
				$source = atrim($video['source_title']);

				if ($video['language_id'] == $language['language_id'] && $this->config->get('config_rainforest_enable_language_' . $language_code)){
					echoLine('[fixtranslations] Видео: ' . $video['product_id'] . ':' . $video['product_video_id'] . ', ' . $i . '/' . $total);

					$translated = $this->rainforestAmazon->productsRetriever->translateAdaptor->translate($source, $this->config->get('config_rainforest_source_language'), $language_code, true);

					$video_translate_data[$language['language_id']] = [
						'title' 			=> $translated						
					];
				}
			}			

			if ($video_translate_data){
				$this->rainforestAmazon->productsRetriever->model_product_edit->editProductVideoTitle($video['product_video_id'], $video_translate_data);		
			}
			
			$i++;
		}	
	}

	/*
	Фиксит привязки вариантов методом записи в табличку с айдишками
	*/
	public function fixvariantsbyids(){		
		$total = $this->rainforestAmazon->productsRetriever->model_product_get->getTotalProductsWithFullData();

		$this->rainforestAmazon->productsRetriever->model_product_edit->clearIdsVariantsTable();

		$iterations = ceil($total/(int)\hobotix\RainforestAmazon::generalDBQueryLimit);
		echoLine('[fixvariants] Total products: ' . $total);
		$k = 1;	

		for ($i = 1; $i <= ($iterations+1); $i++){
			$products = $this->rainforestAmazon->productsRetriever->model_product_get->getProductsWithFullData(($i-1) * (int)\hobotix\RainforestAmazon::generalDBQueryLimit);
			if ($products){		
				foreach ($products as $product){
					echoLine('[fixvariants] Product ' . $product['product_id'] . '/' . $product['asin'] . ' ' . $i . '/' . $k . '/' . $total);

					$this->rainforestAmazon->productsRetriever->fixProductVariants($product['product_id'], json_decode($product['json'], true), false);
					$k++;			
				}
			}	
		}

		$this->rainforestAmazon->productsRetriever->model_product_edit->deNormalizeVariantsTable();
		$this->rainforestAmazon->productsRetriever->model_product_edit->resetUnexsistentVariants();						
	}

	/*
		Перестроение вариантов
	*/
	public function rebuildvariants(){
		$this->rainforestAmazon->productsRetriever->model_product_edit->clearAsinVariantsTable();
		$this->setvariants()->fixvariants();
	}

	/*
	Начальное заполнение таблички вариантов, v2 логика вариантов на асинах
	*/
	public function setvariants(){		
		$total = $this->rainforestAmazon->productsRetriever->model_product_get->getTotalProductsWithFullData();		

		$iterations = ceil($total/(int)\hobotix\RainforestAmazon::generalDBQueryLimit);
		echoLine('[fixvariants] Total products: ' . $total);
		$k = 1;	

		for ($i = 1; $i <= ($iterations+1); $i++){
			$products = $this->rainforestAmazon->productsRetriever->model_product_get->getProductsWithFullData(($i-1) * (int)\hobotix\RainforestAmazon::generalDBQueryLimit);
			if ($products){		
				foreach ($products as $product){
					echoLine('[fixvariants] Product ' . $product['product_id'] . '/' . $product['asin'] . ' ' . $i . '/' . $k . '/' . $total);

					$this->rainforestAmazon->productsRetriever->model_product_edit->setProductVariants(json_decode($product['json'], true));
					$k++;			
				}
			}	
		}		
		$this->rainforestAmazon->productsRetriever->model_product_edit->resetUnexsistentVariants();	

		return $this;				
	}

	/*
	Фиксит привязки вариантов методом прохода таблички c asin
	*/
	public function fixvariants(){		
		$total = $this->rainforestAmazon->productsRetriever->model_product_get->getTotalProductsWithVariantsSet();

		$iterations = ceil($total/(int)\hobotix\RainforestAmazon::generalDBQueryLimit);
		echoLine('[fixvariants] Total products: ' . $total);
		$k = 1;	

		for ($i = 1; $i <= ($iterations+1); $i++){
			$products = $this->rainforestAmazon->productsRetriever->model_product_get->getProductsWithVariantsSet(($i-1) * (int)\hobotix\RainforestAmazon::generalDBQueryLimit);
			if ($products){		
				foreach ($products as $product){
					echoLine('[fixvariants] Product ' . $product['main_asin'] . ' -> ' . $product['variant_asin'] . ' ' . $i . '/' . $k . '/' . $total);

					if ($product['main_asin'] == $product['variant_asin']){
						$this->rainforestAmazon->productsRetriever->model_product_edit->updateProductMainVariantIdByAsin($product['main_asin'], 0);						
					} else {
						$this->rainforestAmazon->productsRetriever->model_product_edit->updateProductMainVariantIdByParentAsinByAsin($product['variant_asin'], $product['main_asin']);		
					}
					
					$k++;	
				}
			}	
		}		
		$this->rainforestAmazon->productsRetriever->model_product_edit->resetUnexsistentVariants();		

		return $this;				
	}

	/*
	Фиксит названия товаров функцией normalizeProductName из InfoUpdater
	*/
	public function fixattributestexts(){		
		$total = $this->rainforestAmazon->infoUpdater->getTotalAttributes();
		$iterations = ceil($total/(int)\hobotix\Amazon\InfoUpdater::descriptionsQueryLimit);
		echoLine('[fixattributestexts] Всего атрибутов: ' . $total);
		$k = 1;			

		for ($i = 1; $i <= ($iterations+1); $i++){
			$attributes = $this->rainforestAmazon->infoUpdater->getAttributes(($i-1) * (int)\hobotix\Amazon\InfoUpdater::descriptionsQueryLimit);
			if ($attributes){		
				foreach ($attributes as $attribute){
					echoLine('[fixattributestexts] ' . $i . '/' . $iterations);	

			//		echoLine ($attribute['text'] . ' -> ' .  $this->rainforestAmazon->infoUpdater->normalizeProductAttributeText($attribute['text']) );
					
					$this->rainforestAmazon->productsRetriever->model_product_edit->updateProductAttribute($attribute['product_id'], [
						'text' 			=>	$this->rainforestAmazon->infoUpdater->normalizeProductAttributeText($attribute['text']),	
						'attribute_id'	=> 	$attribute['attribute_id'],				
						'language_id'	=>	$attribute['language_id']
					]);				
					
				}
			}	
		}	

		echoLine('[fixattributestexts] DELETING EMPTY');
		$this->db->query("DELETE FROM product_attribute WHERE `text` = ''");	
		echoLine('[fixattributestexts] OPTIMIZING');
		$this->db->query("OPTIMIZE TABLE product_attribute");
	}

	/*
	Фиксит экспортные названия товаров при помощи openAI
	*/
	public function exportnamesai(){	
		if (!$this->config->get('config_openai_enable_shorten_names') || !$this->config->get('config_openai_enable') || !$this->config->get('config_rainforest_export_names_with_openai')){
			die('OPENAPI NOT ENABLED');
		}

		$names = $this->rainforestAmazon->productsRetriever->model_product_get->getProductsWithNoShortNames();
		echoLine('[exportnamesai] Total products: ' . count($names), 'i');

		$i = 1;
		foreach ($names as $row){
			echoLine('[exportnamesai] Making export name for ' . $row['product_id'] .' '. $i  .' of '. count($names), 'i');	

			if ($row['name'] && !trim($row['short_name_d'])){
				if (mb_strlen($row['name']) < $this->config->get('config_openai_exportnames_length')){
					$export_name = $row['name'];
				} else {
					$export_name = $this->openaiAdaptor->exportName($row['name'], $this->registry->get('languages_all_id_code_mapping')[(int)$row['language_id']]);
				}

				if ($export_name){
					$this->rainforestAmazon->productsRetriever->model_product_edit->updateProductShortName($row['product_id'],
						[
							'language_id' 	=> $row['language_id'],
							'short_name_d' 	=> $export_name
						]
					);
				}
			}

			$i++;
		}
	}

	/*
	Фиксит названия товаров функцией normalizeProductName из InfoUpdater
	*/
	public function fixnames(){		
		$total = $this->rainforestAmazon->infoUpdater->getTotalNames();
		$iterations = ceil($total/(int)\hobotix\Amazon\InfoUpdater::descriptionsQueryLimit);
		echoLine('[fixnames] Total products: ' . $total);
		$k = 1;			

		for ($i = 1; $i <= ($iterations+1); $i++){
			$products = $this->rainforestAmazon->infoUpdater->getNames(($i-1) * (int)\hobotix\Amazon\InfoUpdater::descriptionsQueryLimit);
			if ($products){		
				foreach ($products as $product){
					echoLine('[fixnames] ' . $i . '/' . $iterations);	

					//$this->rainforestAmazon->infoUpdater->normalizeProductName($product['name']);				
					
					$this->rainforestAmazon->productsRetriever->model_product_edit->updateProductName($product['product_id'], [
						'name' 			=>	$this->rainforestAmazon->infoUpdater->normalizeProductName($product['name']),						
						'language_id'	=>	$product['language_id']
					]);				
					
				}
			}	
		}		
	}

	/*
	Добавляет отзывы товаров из уже заполненных и сохраненных данных
	*/
	public function fixreviews(){		
		$total = $this->rainforestAmazon->productsRetriever->model_product_get->getTotalProductsWithFullData(['reviews_parsed' => 0, 'status' => 1, 'filled_from_amazon' => 1, 'amzn_no_offers' => 0]);		

		$iterations = ceil($total/(int)\hobotix\RainforestAmazon::generalDBQueryLimit);
		echoLine('[fixreviews] Total products: ' . $total);
		$k = 1;	

		for ($i = 1; $i <= ($iterations+1); $i++){
			$products = $this->rainforestAmazon->productsRetriever->model_product_get->getProductsWithFullData(($i-1) * (int)\hobotix\RainforestAmazon::generalDBQueryLimit, ['reviews_parsed' => 0, 'status' => 1, 'filled_from_amazon' => 1, 'amzn_no_offers' => 0]);
			if ($products){		
				foreach ($products as $product){
					echoLine('[fixreviews] Product ' . $product['product_id'] . '/' . $product['asin'] . ' ' . $i . '/' . $k . '/' . $total);

					$this->rainforestAmazon->productsRetriever->parseProductTopReviews($product['product_id'], json_decode($product['json'], true));
					$k++;			
				}
			}	
		}		
	}

	/*
	Добавляет рейтинг товаров из уже заполненных
	*/
	public function fixrating(){		
		$total = $this->rainforestAmazon->productsRetriever->model_product_get->getTotalProductsWithFullData(['amzn_rating' => 0]);		

		$iterations = ceil($total/(int)\hobotix\RainforestAmazon::generalDBQueryLimit);
		echoLine('[fixreviews] Total products: ' . $total);
		$k = 1;	

		for ($i = 1; $i <= ($iterations+1); $i++){
			$products = $this->rainforestAmazon->productsRetriever->model_product_get->getProductsWithFullData(($i-1) * (int)\hobotix\RainforestAmazon::generalDBQueryLimit, ['amzn_rating' => 0]);
			if ($products){		
				foreach ($products as $product){
					echoLine('[fixreviews] Product ' . $product['product_id'] . '/' . $product['asin'] . ' ' . $i . '/' . $k . '/' . $total);

					$this->rainforestAmazon->productsRetriever->parseProductRating($product['product_id'], json_decode($product['json'], true));
					$k++;			
				}
			}	
		}		
	}
}