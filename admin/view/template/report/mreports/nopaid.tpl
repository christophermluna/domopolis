<?php echo $header; ?>
<style>
	span.get_ttn_info {cursor:pointer; display:inline-block; border-bottom:1px dashed black;}
</style>
<div id="content">	
	<div class="box">
		<div class="heading order_head">
			<h1>Заказы в ожидании оплаты</h1>
		</div>
		<div class="content">					
				<div style="clear:both"></div>
				<div id="nopaidscan"  >
					<i class="fa fa-spinner fa-spin"></i>
				</div>	 
				<script>
					$(document).ready(function(){								
						$('#nopaidscan').load('index.php?route=common/home/getNoPaidResult&token=<?php echo $token; ?>');	
					});
				</script>
				
				<div id="ttninfo"></div>
				<div style="clear:both;"></div>
		</div>
	</div>
</div>


<?php echo $footer; ?>