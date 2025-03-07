<?
	
	class ControllerKPReward extends Controller {
		protected $error = array();

		public function reminder(){
			if (!$this->config->get('rewardpoints_reminder_enable')){
				echoLine('[ControllerKPReward::smscron] SMS Reminder is disabled in cron', 'e');
				exit;
			}

			$sql = "SELECT DISTINCT(c.customer_id), c.firstname, c.lastname, c.telephone, ";
			$sql .= " (SELECT SUM(points) as total FROM customer_reward crt WHERE customer_id = c.customer_id) AS points_amount, ";
			$sql .= " (SELECT " . (int)$this->config->get('config_reward_lifetime') . " - DATEDIFF(NOW(), MAX(date_added)) as points_days_left FROM customer_reward crdl WHERE points > 0  AND customer_id = c.customer_id) AS points_days_left ";
			$sql .= " FROM customer_reward cr LEFT JOIN customer c ON (cr.customer_id = c.customer_id) "; 
			$sql .= " WHERE ";				
			$sql .= " customer_reward_id IN ";
			$sql .= " (SELECT customer_reward_id FROM customer_reward WHERE points > 0 AND DATE(date_added) = DATE(DATE_SUB(NOW(), INTERVAL " . (int)$this->config->get('rewardpoints_reminder_days_noactive') . " DAY))) ";
		//	$sql .= " AND customer_reward_id NOT IN ";
		//	$sql .= " (SELECT customer_reward_id FROM customer_reward WHERE DATE(date_added) > DATE(DATE_SUB(NOW(), INTERVAL " . (int)$this->config->get('rewardpoints_reminder_days_noactive') . " DAY)) AND reason_code = 'ORDER_PAYMENT') ";				
			$sql .= " AND (SELECT SUM(points) AS total FROM customer_reward crt WHERE customer_id = c.customer_id) >= " . (int)$this->config->get('rewardpoints_reminder_min_amount') . "";		

			$query = $this->db->query($sql);
			
			if ($query->num_rows){
				echoLine('[ControllerKPReward::smscron] Have total ' . $query->num_rows . ' customers', 'i');

				foreach ($query->rows as $row){				
					echoLine('[ControllerKPReward::smscron] Sending reminder to ' . $row['customer_id'] . ' with phone ' . $row['telephone'], 's');
					$this->smsAdaptor->sendRewardReminder($row, ['points_amount' => $row['points_amount'], 'points_days_left' => $row['points_days_left']]);
				}
			} else {
				echoLine('[ControllerKPReward::smscron] Have no customers', 'e');
			}		

		}
		
		public function cron() {
			
			$log = new Log('reward_queue.log');
			
			$this->load->model('setting/setting');
			$this->load->model('setting/store');
			$this->load->model('sale/order');
			$this->load->model('sale/customer');
			
			echoLine('[ControllerKPReward::cron] Начали сгорание бонусов');
			$query = $this->db->query("SELECT cr.*, c.language_id FROM customer_reward cr LEFT JOIN customer c ON (cr.customer_id = c.customer_id) WHERE burned = 0 AND DATE(cr.date_added) <= DATE_SUB(NOW(), INTERVAL " . $this->config->get('config_reward_lifetime') . " DAY) AND points > 0 AND points > points_paid ORDER BY customer_reward_id ASC");
			
			if ($query->num_rows){
				foreach ($query->rows as $row){
					$points_left = $row['points'] - $row['points_paid'];
					echoLine('Бонусы ' . $row['customer_id'] . ' по причине ' . $row['reason_code'] . ', были добавлены ' . $row['date_added'] . ', из них осталось ' . $points_left);
					
					$log->write('Сгорание: Бонусы ' . $row['customer_id'] . ' по причине ' . $row['reason_code'] . ', были добавлены ' . $row['date_added'] . ', из них осталось ' . $points_left);
					
					$description = sprintf($this->language->getCatalogLanguageString($row['language_id'], 'account/reward', 'text_reward_burn'), date('d.m.Y', strtotime($row['date_added'])), $row['description']);
					
					$this->customer->setBurnedByCRID($row['customer_reward_id']);
					$this->customer->addReward($row['customer_id'], $description, (-1)*$points_left, 0, 'POINTS_BURNED_BY_TIME');
				}
			}
			
			
			echoLine('[ControllerKPReward::cron] Начали начисление бонусов');
			
			$query = $this->db->query("SELECT * FROM customer_reward_queue WHERE DATE(date_activate) <= DATE(NOW()) ORDER BY customer_reward_queue_id ASC");
			
			if ($query->num_rows){
				foreach ($query->rows as $row){
					//Проверка существования записи
					
					if ($this->customer->getRewardInTableByOrder($row['customer_id'], $row['order_id'])){
						//Это типа нештатная какая-то ситуация, несколько начислений, такого быть не должно
						//Разве что заказ несколько раз отменен а потом выполнен, в таком случае редактируем запись
						
						echoLine('Обновляем баллы покупателю ' . $row['customer_id'] . ' за заказ ' . $row['order_id']);						
						$log->write('Обновляем баллы покупателю ' . $row['customer_id'] . ' за заказ ' . $row['order_id']);
						
						
						$this->customer->updateRewardInTableByOrder($row['customer_id'], $row['order_id'], $row['points']);
						} else {
						
						echoLine('Начисляем баллы покупателю ' . $row['customer_id'] . ' за заказ ' . $row['order_id']);
						$log->write('Начисляем баллы покупателю ' . $row['customer_id'] . ' за заказ ' . $row['order_id']);
						
						$this->customer->addReward($row['customer_id'], $row['description'], $row['points'], $row['order_id'], $row['reason_code']);
						
					}
										
					$this->customer->clearRewardQueueByCRQID($row['customer_reward_queue_id']);					
				}
			}
			
			echoLine('[ControllerKPReward::cron] Начали начисление бонусов c днем рождения');
			$this->db->query("UPDATE customer SET birthday_date = DAY(DATE(birthday)) WHERE LENGTH(birthday) > 4 AND birthday <> '0000-00-00';");
			$this->db->query("UPDATE customer SET birthday_month = MONTH(DATE(birthday)) WHERE LENGTH(birthday) > 4 AND birthday <> '0000-00-00';");
			
			$query = $this->db->query("SELECT DISTINCT(customer_id), store_id, language_id FROM customer WHERE birthday_month = '" . (int)date('n', strtotime('+1 day')) . "' AND birthday_date = '" . (int)date('j', strtotime('+1 day')) . "'");
			
			if ($query->num_rows){
				foreach ($query->rows as $row){
					//Валидация нет ли случайно уже такой записи за последние 365 дней
					
					$validate_query = $this->db->query("SELECT * FROM customer_reward WHERE customer_id = '" . $row['customer_id'] . "' AND reason_code = 'BIRTHDAY_GREETING_REWARD' AND DATE(date_added) >= '" . date('Y-m-d', strtotime('-1 year')) . "'");
					
					if (!$validate_query->num_rows){
						
						echoLine('[ControllerKPReward::cron] У клиента ' . $row['customer_id'] . ' нету начисления за 365 дней');
						
						$points = (int)$this->model_setting_setting->getKeySettingValue('config', 'rewardpoints_birthday', (int)$row['store_id']);
						$description = $this->language->getCatalogLanguageString($row['language_id'], 'account/reward', 'text_birthday_add');
						
						echoLine('Начисляем ' . $points . ' баллы покупателю ' . $row['customer_id'] . ' за день рождения ');
						$log->write('Начисляем ' . $points . ' баллы покупателю ' . $row['customer_id'] . ' за день рождения ');
						
						$this->customer->addReward($row['customer_id'], $description, $points, 0, 'BIRTHDAY_GREETING_REWARD');
						
					
					} else {
						
						echoLine('[ControllerKPReward::cron] У клиента ' . $row['customer_id'] . ' уже есть начисление за 365 дней');
					
					}
					
				}
			}		
		}				
	}							