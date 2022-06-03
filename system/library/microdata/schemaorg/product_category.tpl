<?php
if ($this->config->get('schemaorg_status') == 1) {
?>	

			<span itemscope="" itemtype="http://schema.org/AggregateRating">
			<meta itemprop="itemReviewed" content="<?php echo $heading_title; ?>" />
			<meta itemprop="ratingValue" content="5" />
			<meta itemprop="bestRating" content="5" />
			<meta itemprop="ratingCount" content="<? echo (mb_strlen($heading_title, 'UTF-8') * 11); ?>" />		
		</span>
	
<?php
    foreach ($products as $product) {
?> <span itemtype="http://schema.org/ItemList" itemscope> <span itemtype="http://schema.org/Product" itemprop="itemListElement" itemscope> <meta itemprop="name" content="<?php
        echo htmlspecialchars($product['name'], ENT_QUOTES);
?>"> <meta itemprop="url" content="<?php
        echo $product['href'];
?>"> <?php
        if ($product['rating']) {
?> <span itemscope itemprop="aggregateRating" itemtype="http://schema.org/AggregateRating"> <meta itemprop="reviewCount" content="<?php
            echo preg_replace("/[^0-9]/", "", $product['reviews']);
?>"> <meta itemprop="ratingValue" content="<?php
            echo $product['rating'];
?>"> <meta itemprop="bestRating" content="5"> <meta itemprop="worstRating" content="1"> </span> <?php
        }
?> <?php
        if ($product['thumb']) {
?> <meta itemprop="image" content="<?php
            echo $thumb;
?>"> <?php
        }
?> <?php
        if ($this->config->get('schemaorg_island') == 1) {
?> <span itemscope itemprop="offers" itemtype="http://schema.org/Offer"> <?php
            if ($this->config->get('schemaorg_price') == 1) {
?> <meta itemprop="price" content="<?php
                if (!empty($product['special'])) {
                    echo preg_replace("/[^0-9.]/", "", $product['special']);
                } else {
                    echo preg_replace("/[^0-9.]/", "", $product['price']);
                }
?>"> <?php
            }
?> <?php
            if ($this->config->get('schemaorg_price') == 2) {
?> <meta itemprop="price" content="<?php
                if (!empty($product['special'])) {
                    echo preg_replace("/[^0-9]/", "", $product['special']);
                } else {
                    echo preg_replace("/[^0-9]/", "", $product['price']);
                }
?>"> <?php
            }
?> <meta itemprop="priceCurrency" content="<?php
            echo $this->currency->getCode();
?>"> </span> <?php
            if (!empty($product['description'])) {
?> <meta itemprop="description" content="<?php
                echo str_replace("\"", "&quot;", utf8_substr(trim(strip_tags(html_entity_decode($product['description'], ENT_QUOTES, 'UTF-8')), " \t\n\r"), 0, 500) . '..');
?>"> <?php
            }
?> <?php
        }
?> <?php
        if ($this->config->get('schemaorg_island') == 2) {
?> <?php
            if (!empty($product['description'])) {
?> <meta itemprop="description" content="<?php
                echo str_replace("\"", "&quot;", utf8_substr(trim(strip_tags(html_entity_decode($product['description'], ENT_QUOTES, 'UTF-8')), " \t\n\r"), 0, 500) . '..');
?>"> <?php
            }
?> <?php
        }
?> <?php
        if ($this->config->get('schemaorg_island') == 3) {
?><?php
        }
?> </span> </span> <?php
    }
?> <?php
}
?>