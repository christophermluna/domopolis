<?php echo $header; ?>
<div id="content">
	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	</div>
	<?php if ($error_warning) { ?>
		<div class="warning"><?php echo $error_warning; ?></div>
	<?php } ?>
	<?php if ($success) { ?>
		<div class="success"><?php echo $success; ?></div>
	<?php } ?>
	<div class="box">
		<div class="heading order_head">
			<h1><img src="view/image/setting.png" alt="" /> <?php echo $heading_title; ?> / <?php echo $config_name; ?></h1>			
				<div class="buttons">
				<?php /* ?>	
					<a onclick="$('#save_button').toggle()" class="button">Показать кнопку сохранения</a>
					<a onclick="$('#form').submit();" class="button" id="save_button" style="display:none; border-color:red;color:white;background-color: red">СОХРАНИТЬ [ НЕ НАЖИМАТЬ НА ХУЕВОМ ИНТЕРНЕТЕ ]</a>
				<?php */ ?>	
					<a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a>
				</div>
		</div>
		<div class="content">
			<style>
				#tabs > a {font-weight:700}
			</style>
			<div id="tabs" class="htabs">
				<a href="#tab-general"><i class="fa fa-bars"></i> <?php echo $tab_general; ?></a>
				<a href="#tab-store"><i class="fa fa-cogs"></i> <?php echo $tab_store; ?></a>
				<a href="#tab-terms"><i class="fa fa-clock-o"></i> Сроки</a>
				<a href="#tab-deliveryapis"><span style="color:#7F00FF;"><i class="fa fa-truck"></i> Доставки</span></a>
				<a href="#tab-app"><i class="fa fa-mobile"></i> APP</a>
				<a href="#tab-local"><i class="fa fa-bars"></i> <?php echo $tab_local; ?></a>
				<a href="#tab-option"><i class="fa fa-cogs"></i> <?php echo $tab_option; ?></a>
				<a href="#tab-image"><i class="fa fa-cogs"></i> Картинки</a>			
				<a href="#tab-mail"><i class="fa fa-envelope"></i> Почта</a>				
				<a href="#tab-sms"><i class="fa fa-mobile"></i> SMS</a>
				<?php if ($config_smsgate_library_enable_viber) { ?>
					<a href="#tab-viber" ><i class="fa fa-mobile"></i> Viber</a>
				<?php } ?>
				<a href="#tab-server"><i class="fa fa-cogs"></i> Сервер, SEO</a>
				<a href="#tab-telephony"><span style="color:#7F00FF;"><i class="fa fa-phone"></i> АТС, LDAP</span></a>
				<a href="#tab-google-ya-fb-vk"><i class="fa fa-google"></i> <span style="color:#57AC79;">Google</span>, <span style="color:red;">Ya</span>, <span style="color:#7F00FF;">FB</span>, <span style="color:#3F6AD8;">VK</span></a>
				<?php if ($config_country_id == 176) { ?>
					<a href="#tab-ya-market"><span style="color:red;"><i class="fa fa-yahoo"></i> Yandex.Market, Ozon.Seller</span></a>
				<? } ?>
				<a href="#tab-rainforest"><span style="color:#7F00FF;"><i class="fa fa-amazon"></i> Rainforest API</span></a>
				<a href="#tab-openai">🤖 <span style="color:#51A62D;">OpenAI</span></a>
				<a href="#tab-apis"><span style="color:#7F00FF;"><i class="fa fa-cogs"></i> Разные API</span></a>				
			<div class="clr"></div>
			</div>
			<div class="th_style"></div>
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
				<input type="hidden" name="store_id" value="0"/>
				<div id="tab-general">

					<h2>Основное</h2>
					<table class="form">
						<tr>
							<td style="width:25%">
								<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">Название</span></p>
								<input type="text" name="config_name" value="<?php echo $config_name; ?>" size="40" />							
							</td>
						
							<td style="width:25%">
								<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">HTTPS (для соместимости с хрефланг)</span></p>
								<input type="text" name="config_ssl" value="<?php echo $config_ssl; ?>" size="40" />
							</td>

							<td style="width:25%">
								<div>
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF"><?php echo $entry_owner; ?></span></p>
									<input type="text" name="config_owner" value="<?php echo $config_owner; ?>" size="40" />
								</div>

								<div>
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">Время работы</span></p>
									<input type="text" name="config_worktime" value="<?php echo $config_worktime; ?>" size="60" />
								</div>
							</td>

							<td style="width:25%">
								<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF"><?php echo $entry_address; ?></span></p>
								<textarea name="config_address" cols="40" rows="5"><?php echo $config_address; ?></textarea>
							</td>
						</tr>
					</table>

					<h2>Мейлы</h2>
					<table class="form">
						<tr>
							<td style="width:25%">
								<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF"><?php echo $entry_email; ?></span></p>
								<input type="text" name="config_email" value="<?php echo $config_email; ?>" size="40" />							
							</td>

							<td style="width:25%">
								<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">E-mail для отображения в контактах</span></p>
								<input type="text" name="config_display_email" value="<?php echo $config_display_email; ?>" size="40" />							
							</td>

							<td style="width:25%">
								<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">E-mail оптовый</span></p>
								<input type="text" name="config_opt_email" value="<?php echo $config_opt_email; ?>" size="40" /> 							
							</td>
		
						</tr>
					</table>

					<h2>Телефоны</h2>
					<table class="form">
						<tr>							
								<td style="width:25%">
									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">Текст над</span></p>
										<input type="text" name="config_t_tt" value="<?php echo $config_t_tt; ?>" size="40" />
									</div>

									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">Телефон - 1</span></p>
										<input type="text" name="config_telephone" value="<?php echo $config_telephone; ?>" size="40" />
									</div>

									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">Текст под</span></p>
										<input type="text" name="config_t_bt" value="<?php echo $config_t_bt; ?>" size="40" />
									</div>
								</td>

								<td style="width:25%">
									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">Текст над</span></p>
										<input type="text" name="config_t2_tt" value="<?php echo $config_t2_tt; ?>" size="40" />
									</div>

									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">Телефон - 2</span></p>
										<input type="text" name="config_telephone2" value="<?php echo $config_telephone2; ?>" size="40" />
									</div>

									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">Текст под</span></p>
										<input type="text" name="config_t2_bt" value="<?php echo $config_t2_bt; ?>" size="40" />
									</div>
								</td>

								<td style="width:25%">
									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">Телефон - 3</span></p>
										<input type="text" name="config_telephone3" value="<?php echo $config_telephone3; ?>" size="40" />
									</div>

									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">Телефон - 4</span></p>
										<input type="text" name="config_telephone4" value="<?php echo $config_telephone4; ?>" size="40" />
									</div>
								</td>

								<td style="width:25%">									

									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">Оптовый телефон - 1</span></p>
										<input type="text" name="config_opt_telephone" value="<?php echo $config_opt_telephone; ?>" size="40" />
									</div>

									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">Оптовый телефон - 2</span></p>
										<input type="text" name="config_opt_telephone2" value="<?php echo $config_opt_telephone2; ?>" size="40" />
									</div>

									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">Факс</span></p>
										<input type="text" name="config_fax" value="<?php echo $config_fax; ?>" size="40" />
									</div>
								</td>
							</tr>		
						</table>
					</div>

					<div id="tab-store">	
						<h2>Настройки режимов работы админки</h2>
						<table class="form">
							<tr>
								<td style="width:15%">
								<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Режим работы с Amazon</span></p>
										<select name="config_enable_amazon_specific_modes">
											<?php if ($config_enable_amazon_specific_modes) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
												<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
									<br />
									<span class="help">Если включено, то актуальны режимы ASIN, VAR и TRNSL. В настройках устанавливаются режимы по-умолчанию, далее каждый контент-менеджер переключает их для себя по мере необходимости</span>
								</td>

								<td style="width:15%">
									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Включить хранение данных в файлах</span></p>
										<select name="config_enable_amazon_asin_file_cache">
											<?php if ($config_enable_amazon_asin_file_cache) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
											<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
										<br />
										<span class="help">Большое количество данных (более 10-20к записей в базу) очень сильно тормозит БД, нужно использовать файловый кэш</span>
									</div>
									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Хайлоад режим</span></p>
										<select name="config_enable_highload_admin_mode">
											<?php if ($config_enable_highload_admin_mode) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
											<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
										<br />
										<span class="help">Если включено, то у всех, кроме суперадминистраторов, пропадает возможность сбрасывать кэши</span>
									</div>

									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">CSV PP Без брендов</span></p>
										<select name="config_csvprice_pro_disable_manufacturers">
											<?php if ($config_csvprice_pro_disable_manufacturers) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
											<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
										<br />
										<span class="help">Если производителей более 10к, CSVPP не работает корректно, нужно включить эту опцию</span>
									</div>
								</td>

								<td style="width:20%">
								<div>
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Режим удаления ASIN</span></p>
										<select name="config_rainforest_asin_deletion_mode">
											<?php if ($config_rainforest_asin_deletion_mode) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
												<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select> <a class="link_headr cache-button-good"><i class="fa fa-amazon" aria-hidden="true"></i> ASIN</a> <a class="link_headr cache-button-bad"><i class="fa fa-amazon" aria-hidden="true"></i> ASIN</a>
									<br />
									<span class="help">Если включено, при удалении товаров их ASIN запоминается и не будет больше добавлен. Переключается кнопкой в шапке.
									<a href="<?php echo $product_deletedasin; ?>">Посмотреть список удаленных<i class="fa fa-external-link"></i></a></span>
								</div>
								<div>
								<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Режим коррекции перевода</span></p>
										<select name="config_rainforest_translate_edition_mode">
											<?php if ($config_rainforest_translate_edition_mode) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
												<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select> <a class="link_headr cache-button-good"><i class="fa fa-refresh" aria-hidden="true"></i> TRNSL</a> <a class="link_headr cache-button-bad"><i class="fa fa-refresh" aria-hidden="true"></i> TRNSL</a>
									<br />
									<span class="help">Если включено, то при коррекции значений атрибутов одного товара заменяются значения атрибутов у всех товаров, имеющих равные значения на основном языке Amazon</span>
								</div>
								<div>
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Режим редактирования вариантов</span></p>
										<select name="config_rainforest_variant_edition_mode">
											<?php if ($config_rainforest_variant_edition_mode) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
												<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select><a class="link_headr cache-button-good"><i class="fa fa-amazon" aria-hidden="true"></i> VAR</a> <a class="link_headr cache-button-bad"><i class="fa fa-amazon" aria-hidden="true"></i> VAR</a>
									<br />
									<span class="help">Если включено, то описания вариантов будут отредактированы одновременно. Также при удалении товара будут удалены все его варианты</span>
								</div>
								</td>

								<td style="width:15%">
									<div>
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Статистика товаров и категорий в админке</span></p>
									<select name="config_amazon_product_stats_enable">
										<?php if ($config_amazon_product_stats_enable) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>
									<br />
									<span class="help">показать на главной странице в админке счетчики категорий, товаров и процесса обработки данных, загруженных из amazon</span>
									</div>
									<div>
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Монитор cron на главной</span></p>
									<select name="config_cron_stats_display_enable">
										<?php if ($config_cron_stats_display_enable) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>
									<br />
									<span class="help">показать на главной странице в админке монитор регулярных задач</span>
									</div>
									<div>
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Удалять картинки</span></p>
									<select name="config_delete_products_images_enable">
										<?php if ($config_delete_products_images_enable) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>
									<br />
									<span class="help">удалять ли файлы картинок при удалении товаров</span>
									</div>
								</td>

								<td style="width:20%">
									<div>
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Не удалять товары в заказах</span></p>
									<select name="config_never_delete_products_in_orders">
										<?php if ($config_never_delete_products_in_orders) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>
									<br />
									<span class="help">невозможно удалить даже вручную в админке</span>
									</div>

									<div>
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Не удалять товары на складе</span></p>
									<select name="config_never_delete_products_in_warehouse">
										<?php if ($config_never_delete_products_in_warehouse) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>
									<br />
									<span class="help">невозможно удалить даже вручную в админке</span>
									</div>
								</td>

							</tr>
						</table>
						<h2>Настройки режимов работы фронта</h2>
						<table class="form">
							<tr>	
							
								<td style="width:18%">
									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Single store mode</span></p>
										<select name="config_single_store_enable">
											<?php if ($config_single_store_enable) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
											<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
										<br />
										<span class="help">отключает привязки многих сущностей к табличкам *_to_store. включать только в случае 1 база = 1 магазин</span>
									</div>

									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF"><img src="<?php echo DIR_FLAGS_NAME; ?>de.png" title="de" />Flags in admin</span></p>
										<select name="config_admin_flags_enable">
											<?php if ($config_admin_flags_enable) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
											<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
										<br />
										<span class="help">отображать или нет флаги в админке</span>
									</div>

									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Логика цен B2B</span></p>
										<select name="config_group_price_enable">
											<?php if ($config_group_price_enable) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
											<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
										<br />
										<span class="help">логика нагружает магазин, если реально это не используется, пусть будет отключено</span>
									</div>
									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF;">Монобрендовый магазин</span></p>
										<select name="config_monobrand" style=" width:150px;">
											<option value="0">Нет</option>
										</select>	
										<br />
										<span class="help">настройка, позволяющая работать без списка брендов (не используется)</span>
									</div>
									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Логика значений атрибутов</span></p>
										<select name="config_enable_attributes_values_logic">
											<?php if ($config_enable_attributes_values_logic) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
											<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
										<br />
										<span class="help">Привязка статей и картинок к изображениям атрибутов. логика нагружает админку и магазин! если реально это не используется, пусть будет отключено</span>
									</div>
								</td>

								<td style="width:18%">
									<div>
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Логика товаров-опций</span></p>
									<select name="config_option_products_enable">
										<?php if ($config_option_products_enable) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>
									<br />
									<span class="help">логика нагружает магазин! включить только в случае если товары привязаны друг к другу как опции (не касается товаров с Amazon)</span>
									</div>

									<div>
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Логика HTML статусов</span></p>
									<select name="config_additional_html_status_enable">
										<?php if ($config_additional_html_status_enable) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>
									<br />
									<span class="help">логика нагружает магазин! включить только в случае настроен модуль Статусы товаров и это реально используется</span>
									</div>

									<div>
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Логика цен опций</span></p>
									<select name="config_option_price_enable">
										<?php if ($config_option_price_enable) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>
									<br />
									<span class="help">логика нагружает магазин! включить только в случае если товары привязаны друг к другу как опции и подсчёт цен в каталоге выполняется "от - до"</span>
									</div>

									<div>
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Логика цветовых групп</span></p>
									<select name="config_color_grouping_products_enable">
										<?php if ($config_color_grouping_products_enable) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>
									<br />
									<span class="help">логика нагружает магазин! включить только в случае если товары привязаны друг к другу как опции и разделяются по "цветовым группам"</span>
									</div>
								</td>

								<td style="width:18%">
									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Загрузки в товарах</span></p>
										<select type="select" name="config_product_downloads_enable">
											<? if ($config_product_downloads_enable) { ?>
												<option value="1" selected='selected' >Включить</option>
												<option value="0" >Отключить</option>
											<? } else { ?>
												<option value="1" >Включить</option>
												<option value="0"  selected='selected' >Отключить</option>
											<? } ?>       
										</select>
										<br />
										<span class="help">логика загрузки цифровых товаров</span>	
									</div>

									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Опции товаров</span></p>
										<select type="select" name="config_product_options_enable">
											<? if ($config_product_options_enable) { ?>
												<option value="1" selected='selected' >Включить</option>
												<option value="0" >Отключить</option>
											<? } else { ?>
												<option value="1" >Включить</option>
												<option value="0"  selected='selected' >Отключить</option>
											<? } ?>       
										</select>
										<br />
										<span class="help">штатная логика опций товаров</span>	
									</div>

									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Смотрели вместе</span></p>
										<select type="select" name="config_product_alsoviewed_enable">
											<? if ($config_product_alsoviewed_enable) { ?>
												<option value="1" selected='selected' >Включить</option>
												<option value="0" >Отключить</option>
											<? } else { ?>
												<option value="1" >Включить</option>
												<option value="0"  selected='selected' >Отключить</option>
											<? } ?>       
										</select>
										<br />
										<span class="help">логика нагружает магазин! если не используется - отключить!</span>	
									</div>
									
								</td>

								<td style="width:18%">
									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">В брендах только товары</span></p>
										<select type="select" name="config_show_goods_overload">
											<? if ($config_show_goods_overload) { ?>
												<option value="1" selected='selected' >Да</option>
												<option value="0" >Нет</option>
											<? } else { ?>
												<option value="1" >Да</option>
												<option value="0"  selected='selected' >Нет</option>
											<? } ?>       
										</select>
										<br />
										<span class="help">на странице брендов выводятся только товары, без списков коллекций, и.т.д.</span>	
									</div>

									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Обязательная цена</span></p>
										<select type="select" name="config_no_zeroprice">
											<? if ($config_no_zeroprice) { ?>
												<option value="1" selected='selected' >Да</option>
												<option value="0" >Нет</option>
											<? } else { ?>
												<option value="1" >Да</option>
												<option value="0"  selected='selected' >Нет</option>
											<? } ?>       
										</select>
										<br />
										<span class="help">Если включено, то из отборов фронта исключаются товары без заданной основной цены</span>										
									</div>

									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Режим изоляции локалей</span></p>
										<select type="select" name="config_warmode_enable">
											<? if ($config_warmode_enable) { ?>
												<option value="1" selected='selected' >Да</option>
												<option value="0" >Нет</option>
											<? } else { ?>
												<option value="1" >Да</option>
												<option value="0"  selected='selected' >Нет</option>
											<? } ?>       
										</select>
										<br />
										<span class="help">будет отключен переключатель стран, и некоторые другие моменты</span>	
									</div>

									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Специальный фильтр логистики</span></p>
										<select type="select" name="config_special_logistics_enable">
											<? if ($config_special_logistics_enable) { ?>
												<option value="1" selected='selected' >Да</option>
												<option value="0" >Нет</option>
											<? } else { ?>
												<option value="1" >Да</option>
												<option value="0"  selected='selected' >Нет</option>
											<? } ?>       
										</select>
									</div>

									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Режим разработки</span></p>
										<select type="select" name="config_no_access_enable">
											<? if ($config_no_access_enable) { ?>
												<option value="1" selected='selected' >Да</option>
												<option value="0" >Нет</option>
											<? } else { ?>
												<option value="1" >Да</option>
												<option value="0"  selected='selected' >Нет</option>
											<? } ?>       
										</select>
										<br />
										<span class="help">Если включено, фронт будет закрыт 403 кодом в случае, если сессия админки не определена</span>	
									</div>
								</td>

								<td style="width:20%">
									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Отключать пустые категории</span></p>
										<select type="select" name="config_disable_empty_categories">
											<? if ($config_disable_empty_categories) { ?>
												<option value="1" selected='selected' >Да</option>
												<option value="0" >Нет</option>
											<? } else { ?>
												<option value="1" >Да</option>
												<option value="0"  selected='selected' >Нет</option>
											<? } ?>       
										</select>										
									</div>
									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Включать не-пустые категории</span></p>
										<select type="select" name="config_enable_non_empty_categories">
											<? if ($config_enable_non_empty_categories) { ?>
												<option value="1" selected='selected' >Да</option>
												<option value="0" >Нет</option>
											<? } else { ?>
												<option value="1" >Да</option>
												<option value="0"  selected='selected' >Нет</option>
											<? } ?>       
										</select>										
									</div>
								</td>

								<td style="width:18%">
									
								</td>

							</tr>
						</table>

						<h2><?php echo $text_product; ?></h2>

						<table class="form">
							<tr>																
								<td style="width:15%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Счетчик количества</span></p>
									<select name="config_product_count">
										<?php if ($config_product_count) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>									
								</td>
								
								<td style="width:15%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Отдельная табличка нефильтруемых атрибутов</span></p>
									<select name="config_use_separate_table_for_features">
										<?php if ($config_use_separate_table_for_features) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>

									<br />
									<span class="help"><i class="fa fa-info-circle"></i> Если включено, то значения нефильтруемых атрибутов (особенности) записываются и считываются из отдельной таблички</span>
								</td>
								
								<td style="width:15%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Разрешить скачивание файлов</span></p>
									<select name="config_download">
										<?php if ($config_download) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>
								</td>

								<td style="width:15%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Прятать артикул в карте</span></p>
									<select name="config_product_hide_sku">
										<?php if ($config_product_hide_sku) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>

									<br />
									<span class="help">Отключает вывод артикула в карте товара</span>
								</td>

								<td style="width:15%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Подменять SKU/MODEL на код товара на выводе</span></p>
									<select name="config_product_replace_sku_with_product_id">
										<?php if ($config_product_replace_sku_with_product_id) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>

									<br />
									<span class="help"><i class="fa fa-info-circle"></i> Глобальная подмена на фронте артикула на внутренний код товара (целое число). Пожалуйста, используйте с большой осторожностью. Это заменит SKU везде, и в микроразметке в том числе. Поиск затронут не будет</span>
								</td>

								<td style="width:15%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Добавлять префикс к коду товара/SKU при использовании подмены</span></p>
									<input type="text" name="config_product_use_sku_prefix" value="<?php echo $config_product_use_sku_prefix; ?>" size="10" />

									<br />
									<span class="help"><i class="fa fa-info-circle"></i> Если включена предыдущая настройка, и задан этот префикс, то артикул будет равен префикса+код товара. Например, KP123646</span>
								</td>

							</tr>	

							<tr>
								<td style="width:15%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Группа атрибутов "особенности"</span></p>

									<select name="config_special_attr_id">
										<?php foreach ($attribute_groups as $attribute_group) { ?>
											<?php if ($attribute_group['attribute_group_id'] == $config_special_attr_id) { ?>
												<option value="<?php echo $attribute_group['attribute_group_id']; ?>" selected="selected"><?php echo $attribute_group['name']; ?></option>
											<?php } else { ?>
												<option value="<?php echo $attribute_group['attribute_group_id']; ?>"><?php echo $attribute_group['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select>
									<br />
									<span class="help">Эти атрибуты не фильтруются, а только показываются в отдельном блоке в карте товара</span>
								</td>


								<td style="width:15%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Группа атрибутов "Спецификации"</span></p>
									<select name="config_specifications_attr_id">
										<?php foreach ($attribute_groups as $attribute_group) { ?>
											<?php if ($attribute_group['attribute_group_id'] == $config_specifications_attr_id) { ?>
												<option value="<?php echo $attribute_group['attribute_group_id']; ?>" selected="selected"><?php echo $attribute_group['name']; ?></option>
											<?php } else { ?>
												<option value="<?php echo $attribute_group['attribute_group_id']; ?>"><?php echo $attribute_group['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select>
									<br />
									<span class="help">Эти атрибуты не фильтруются, а только показываются в отдельном блоке в карте товара</span>
								</td>

								<td style="width:15%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Группа атрибутов по-умолчанию</span></p>
									<select name="config_default_attr_id">
										<?php foreach ($attribute_groups as $attribute_group) { ?>
											<?php if ($attribute_group['attribute_group_id'] == $config_default_attr_id) { ?>
												<option value="<?php echo $attribute_group['attribute_group_id']; ?>" selected="selected"><?php echo $attribute_group['name']; ?></option>
											<?php } else { ?>
												<option value="<?php echo $attribute_group['attribute_group_id']; ?>"><?php echo $attribute_group['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select>
									<br />
									<span class="help">В эту группу добавляются атрибуты товара с Амазона</span>
								</td>

								<td style="width:15%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Группа атрибутов "Габариты"</span></p>
									<select name="config_dimensions_attr_id">
										<?php foreach ($attribute_groups as $attribute_group) { ?>
											<?php if ($attribute_group['attribute_group_id'] == $config_dimensions_attr_id) { ?>
												<option value="<?php echo $attribute_group['attribute_group_id']; ?>" selected="selected"><?php echo $attribute_group['name']; ?></option>
											<?php } else { ?>
												<option value="<?php echo $attribute_group['attribute_group_id']; ?>"><?php echo $attribute_group['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select>
									<br />
									<span class="help">В эту группу добавляются атрибуты товара с Амазона</span>
								</td>


								<td style="width:15%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Название атрибутов - особенностей</span></p>
									<input type="text" name="config_special_attr_name" value="<?php echo $config_special_attr_name; ?>" size="30" />										
								</td>

								<td style="width:15%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Название атрибутов - cпецификаций</span></p>
									<input type="text" name="config_specifications_attr_name" value="<?php echo $config_specifications_attr_name; ?>" size="30" />										
								</td>
							</tr>	
							<tr>

								<td style="width:15%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Второй уровень подкатегорий в категориях</span></p>
									<select name="config_second_level_subcategory_in_categories">
										<?php if ($config_second_level_subcategory_in_categories) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>
									<br />
									<span class="help">Если выключено - то выводится только один уровень и снижается нагрузка.</span>
								</td>

								<td style="width:15%">
									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Товары только в крайних категориях</span></p>
										<select name="config_disable_filter_subcategory">
											<?php if ($config_disable_filter_subcategory) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
											<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
										<br />
										<span class="help">Если включено - товары отображаются только в крайних по дереву</span>
									</div>
									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Убрать товары только с уровня 0</span></p>
										<select name="config_disable_filter_subcategory_only_for_main">
											<?php if ($config_disable_filter_subcategory_only_for_main) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
											<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
										<br />
										<span class="help">Если включена эта настройка и предыдущая, то товары будут показываться везде, кроме корневых категорий</span>
									</div>
								</td>

								<td style="width:15%">
									<div>
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Отображать подкатегории во всех категориях</span></p>
									<select name="config_display_subcategory_in_all_categories">
										<?php if ($config_display_subcategory_in_all_categories) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>
									<br />
									<span class="help">Если выключено - то подкатегории выводятся только в корневых</span>
									</div>

									<div>
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Лимит подкатегорий второго уровня</span></p>
									<input type="number" name="config_subcategories_limit" value="<?php echo $config_subcategories_limit; ?>" size="50" style="width:100px;">									
									</div>
								</td>

								<td style="width:15%">
									<div>
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Отображать только товары с полной инфой</span></p>
									<select name="config_rainforest_show_only_filled_products_in_catalog">
										<?php if ($config_rainforest_show_only_filled_products_in_catalog) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>
									<br />
									<span class="help">Если включены специфические режимы амазона - будут показаны только заполненные товары</span>
								</div>
								
								</td>

								<td style="width:15%">
									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Сортировка по-умолчанию</span></p>
										<select name="config_sort_default">
											<?php foreach ($this->registry->get('sorts_available') as $sort_name => $sort_sort) { ?>
												<?php if ($config_sort_default == $sort_sort) { ?>
													<option value="<?php echo $sort_sort; ?>" selected="selected"><?php echo $sort_name; ?></option>
												<?php } else { ?>
													<option value="<?php echo $sort_sort; ?>"><?php echo $sort_name; ?></option>
												<?php } ?>
											<?php } ?>
										</select>
										<br />
										<span class="help">Сортировка по-умолчанию в листингах</span>
									</div>
									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Порядок по-умолчанию</span></p>
										<select name="config_order_default">
										<?php if ($config_order_default == 'ASC') { ?>
											<option value="ASC" selected="selected">ASC</option>
											<option value="DESC">DESC</option>
										<?php } else { ?>													
											<option value="ASC">ASC</option>
											<option value="DESC"  selected="selected">DESC</option>
										<? } ?>
									</select>
									</div>									
								</td>
								<td style="width:15%">
									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Логика раздела "все скидки"</span></p>
										<select name="config_special_controller_logic">
											<?php if ($config_special_controller_logic == 'default') { ?>
												<option value="default" selected="selected">По-умолчанию</option>
												<option value="category">Товары из категории</option>
											<?php } else { ?>													
												<option value="default">По-умолчанию</option>
												<option value="category"  selected="selected">Товары из категории</option>
											<? } ?>
										</select>
										<br />
										<span class="help">В любом случае скидки - это категория. От выбора логики зависит, будет ли очищаться категория.</span>
									</div>
									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">ID категории товаров со скидками</span></p>
										<input type="number" name="config_special_category_id" value="<?php echo $config_special_category_id; ?>" size="50" style="width:90px;" />
									</div>

								</td>
							</tr>						
						</table>

						<h2>Новинки</h2>

						<table class="form">
							<tr>
								<td style="width:15%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Новинки без new = 1</span></p>
									<select name="config_ignore_manual_marker_productnews">
										<?php if ($config_ignore_manual_marker_productnews) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>
									<br />
									<span class="help">Если включено, то при отборе новинок игнорируется маркер new = 1, который ставится вручную</span>
								</td>

								<td style="width:15%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Новинки без Amazon</span></p>
									<select name="config_productnews_exclude_added_from_amazon">
										<?php if ($config_productnews_exclude_added_from_amazon) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>
									<br />
									<span class="help">Если включено, то при отборе новинок игнорируются добавленные с Amazon товары</span>
								</td>

								<td style="width:15%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Интервал добавления</span></p>
									<input type="number" name="config_new_days" value="<?php echo $config_new_days; ?>" size="10" style="width:100px" />
									<br />
									<span class="help">Товар считается новинкой, если он добавлен Х дней от сегодня</span>
								</td>

								<td style="width:15%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Интервал добавления длинный</span></p>
									<input type="number" name="config_newlong_days" value="<?php echo $config_newlong_days; ?>" size="10" style="width:100px" />
									<br />
									<span class="help">Товар считается новинкой, если он добавлен Х дней от сегодня. Логика длинного интервала используется в каких-то контроллерах</span>
								</td>
							</tr>
						</table>

						<h2>Отзывы</h2>

						<table class="form">
							<tr>
								<td style="width:15%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Разрешить отзывы</span></p>
									<select name="config_review_status">
										<?php if ($config_review_status) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>
								</td>

								<td style="width:15%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Количество "лучших отзывов" в карте товара</span></p>
									<input type="number" name="config_onereview_amount" value="<?php echo $config_onereview_amount; ?>" size="3" />
								</td>

								<td style="width:15%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Без модерации</span></p>
									<select name="config_review_statusp">
										<?php if ($config_review_statusp) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>
								</td>

								<td style="width:15%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Уведомление на мейл</span></p>
									<select name="config_review_email">
										<?php if ($config_review_email) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>
								</td>

								<td style="width:15%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Можно ли редактировать в ЛК</span></p>
									<select name="config_myreviews_edit">
										<?php if ($config_myreviews_edit) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>
								</td>

								<td style="width:15%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Модерация после редактирования</span></p>
									<select name="config_myreviews_moder">
										<?php if ($config_myreviews_moder) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>
								</td>
								
							</tr>
							<tr>
								<td style="width:15%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Поле "недостатки"</span></p>
									<select name="config_review_bad">
										<?php if ($config_review_bad) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>
								</td>

								<td style="width:15%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Поле "достоинства"</span></p>
									<select name="config_review_good">
										<?php if ($config_review_good) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>
								</td>

								<td style="width:15%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Добавлять вложения</span></p>
									<select name="config_review_addimage">
										<?php if ($config_review_addimage) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>
								</td>

								<td style="width:15%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Включить капчу</span></p>
									<select name="config_review_captcha">
										<?php if ($config_review_captcha) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>
								</td>
							</tr>

						</table>

						<h2>Другие настройки</h2>
						<table class="form">
							<tr>											
								<td style="width:18%">
									<p>
										<span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">META TITLE</span>
									</p>
									<textarea name="config_title" cols="40" rows="5"><?php echo $config_title; ?></textarea>
								</td>

								<td style="width:18%">
									<p>
										<span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">META DESCRIPTION</span>
									</p>
									<textarea name="config_meta_description" cols="40" rows="5"><?php echo $config_title; ?></textarea>
								</td>

								<td style="width:18%"> 
									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Шаблон</span></p>
										<select name="config_template">
											<?php foreach ($templates as $template) { ?>
												<?php if ($template == $config_template) { ?>
													<option value="<?php echo $template; ?>" selected="selected"><?php echo $template; ?></option>
												<?php } else { ?>
													<option value="<?php echo $template; ?>"><?php echo $template; ?></option>
												<?php } ?>
											<?php } ?>
										</select>
									</div>
									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF"><?php echo $entry_layout; ?><</span></p>
										<select name="config_layout_id">
											<?php foreach ($layouts as $layout) { ?>
												<?php if ($layout['layout_id'] == $config_layout_id) { ?>
													<option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
												<?php } else { ?>
													<option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
												<?php } ?>
											<?php } ?>
										</select>										
									</div>
								</td>

								<td style="width:18%">										
									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Добавить меню в homepage</span></p>
										<select type="select" name="config_mmenu_on_homepage">
											<? if ($config_mmenu_on_homepage) { ?>
												<option value="1" selected='selected' >Да</option>
												<option value="0" >Нет</option>
											<? } else { ?>
												<option value="1" >Да</option>
												<option value="0"  selected='selected' >Нет</option>
											<? } ?>       
										</select>
									</div>
									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Бренды в мегаменю</span></p>
										<select type="select" name="config_brands_in_mmenu">
											<? if ($config_brands_in_mmenu) { ?>
												<option value="1" selected='selected' >Да</option>
												<option value="0" >Нет</option>
											<? } else { ?>
												<option value="1" >Да</option>
												<option value="0"  selected='selected' >Нет</option>
											<? } ?>       
										</select>
									</div>
									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Бестселлеры в мегаменю</span></p>
										<select type="select" name="config_bestsellers_in_mmenu">
											<? if ($config_bestsellers_in_mmenu) { ?>
												<option value="1" selected='selected' >Да</option>
												<option value="0" >Нет</option>
											<? } else { ?>
												<option value="1" >Да</option>
												<option value="0"  selected='selected' >Нет</option>
											<? } ?>       
										</select>
									</div>
								</td>

								<td style="width:18%">
									
								</td>							

								<td style="width:18%">
									
								</td>
						</tr>
					</table>							
						</div>

					<div id="tab-terms">
						<h2>Сроки поставки. Задаются через дефис, цифрами, 15-30, 4-7, 1-2</h2>
						<table class="form">
							<tr>
								<td style="width:33%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Сроки поставки если есть в наличии в текущей стране</span></p>
									<input type="text" name="config_delivery_instock_term" value="<?php echo $config_delivery_instock_term; ?>" size="10" />
								</td>
	
								<td style="width:33%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Сроки поставки если нету в наличии в текущей стране, но есть в Германии</span></p>
									<input type="text" name="config_delivery_central_term" value="<?php echo $config_delivery_central_term; ?>" size="10" />
								</td>
							<?php if ($config_country_id == 176) { ?>		
								<td style="width:33%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Сроки поставки если есть в наличии на складе РФ</span></p>
									<input type="text" name="config_delivery_russia_term" value="<?php echo $config_delivery_russia_term; ?>" size="10" />
								</td>
							<?php } ?>
							</tr>

							<tr>
								<td style="width:33%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Сроки поставки если есть в наличии на складе в Украине</span></p>
									<input type="text" name="config_delivery_ukrainian_term" value="<?php echo $config_delivery_ukrainian_term; ?>" size="10" />
								</td>

								<td style="width:33%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Сроки поставки если нет в наличии в Германии</span></p>
									<input type="text" name="config_delivery_outstock_term" value="<?php echo $config_delivery_outstock_term; ?>" size="10" />
								</td>
							</tr>
							
							<tr>
								<td style="width:33%">
									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Отображать сроки, если нет в наличии на складе в стране</span></p>
										<select name="config_delivery_outstock_enable">
											<?php if ($config_delivery_outstock_enable) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
											<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
									</div>

									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Включить в заказах текст с информацией о доставке</span></p>
										<select name="config_order_bottom_text_enable">
											<?php if ($config_order_bottom_text_enable) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
											<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
									</div>
								</td>

								<td style="width:33%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Разделять корзину по наличию</span></p>
									<select name="config_divide_cart_by_stock">
										<?php if ($config_divide_cart_by_stock) { ?>
											<option value="1" selected="selected">Разделять</option>
											<option value="0">Не разделять</option>
										<?php } else { ?>													
											<option value="1">Разделять</option>
											<option value="0"  selected="selected">Не разделять</option>
										<? } ?>
									</select>
								</td>

								<td style="width:33%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Логика подсчёта сроков в карте товара</span></p>
									<select name="config_delivery_display_logic">
										<?php if ($config_delivery_display_logic == 'v1') { ?>
											<option value="v1" selected="selected">Логика v1, без блоков, разделять отправку и доставку</option>
											<option value="v2"></option>
										<?php } else { ?>													
											<option value="v1">Логика v1, без блоков, разделять отправку и доставку</option>
											<option value="v2"  selected="selected">Логика v2, блоками, даты в заголовке, не разделять отправку и доставку</option>
										<? } ?>
									</select>
								</td>
							</tr>
						</table>		
						
						<h2>Идентификаторы складов</h2>
						
						<table class="form">
							<tr>
								<td width="25%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Идентификатор склада</span></p>
									<input type="text" name="config_warehouse_identifier" value="<?php echo $config_warehouse_identifier; ?>" size="30" />
									<br />
									<span class="help">идентификатор склада, с которого выполняется отправка в эту страну, это обычная логика обработки наличия</span>
								</td>

								<td width="25%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Идентификатор реального склада</span></p>
									<input type="text" name="config_warehouse_identifier_local" value="<?php echo $config_warehouse_identifier_local; ?>" size="30" />
									<br />
									<span class="help">идентификатор локального склада, для совместимости с логикой вычисления сроков поставки</span>
								</td>

								<td width="25%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Работать только со складом</span></p>
									<select name="config_warehouse_only">
													<?php if ($config_warehouse_only) { ?>
														<option value="1" selected="selected">Включить</option>
														<option value="0">Отключить</option>
														<?php } else { ?>													
														<option value="1">Включить</option>
														<option value="0"  selected="selected">Отключить</option>
													<? } ?>
												</select>
									<br />
									<span class="help">всё чего нет на складе - на фронте отдается в ноль</span>
								</td>

								<td width="25%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Статус если нет на складе</span></p>
									<select name="config_overload_stock_status_id">
										<?php foreach ($stock_statuses as $stock_status) { ?>
											<?php if ($stock_status['stock_status_id'] == $config_overload_stock_status_id) { ?>
												<option value="<?php echo $stock_status['stock_status_id']; ?>" selected="selected"><?php echo $stock_status['name']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select>
									<br />
									<span class="help">всё чего нет на складе - отдается этот статус</span>
								</td>
							</tr>
							
						</table>
						
						<h2>Самовывоз</h2>
						
						<table class="form">
							<tr>
								<td>Возможность самовывоза</td>
								<td>
									<select name="config_pickup_enable">
										<?php if ($config_pickup_enable) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
											<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>
								</td>
							</tr>
							
							<tr>
								<td>Время работы пункта самовывоза</td>
								<td>
									<input type="text" name="config_pickup_times" value="<?php echo $config_pickup_times; ?>" size="50" />
									<br />
									<span class="help">Формат: 10:19;10:19;10:19;10:19;10:19;false;false;</span>
								</td>
							</tr>							
							
						</table>
						
						<?php setlocale(LC_ALL, 'ru_RU', 'ru_RU.UTF-8', 'ru', 'russian'); ?>
						<?php $monthes = array(
							1 => 'Январь', 2 => 'Февраль', 3 => 'Март', 4 => 'Апрель',
							5 => 'Май', 6 => 'Июнь', 7 => 'Июль', 8 => 'Август',
							9 => 'Сентябрь', 10 => 'Октябрь', 11 => 'Ноябрь', 12 => 'Декабрь'
						); ?>
						<?php 
							$colors = array(
							1 => '#7F00FF', 
							2 => '#7F00FF', 
							3 => '#00ad07', 
							4 => '#00ad07',
							5 => '#00ad07', 
							6 => '#cf4a61', 
							7 => '#cf4a61', 
							8 => '#cf4a61',
							9 => '#ff7815', 
							10 => '#ff7815', 
							11 => '#ff7815', 
							12 => '#7F00FF'
							);
						?>
						<h2>Выходные дни самовывоза в этом и следующем годах, <span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">если доживем</span>. 
							Сейчас <span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF"><?php echo $monthes[date('n')]; ?> <?php echo date('Y'); ?></span>. 
						Следующий <span class="status_color" style="display:inline-block; padding:3px 5px; background:#ff7815; color:#FFF"><?php echo $monthes[date('n', strtotime('+1 month'))]; ?> <?php echo date('Y', strtotime('+1 month')); ?></span></h2>
						<table class="form">
							<tr>
								<?php for ($i=1; $i<=12; $i++) { ?>
									<td width="8%" style="width:8%" class="text-left">
										<span class="status_color" style="display:inline-block; padding:3px 5px; background:<?php echo $colors[$i]; ?>; color:#FFF">
										<?php echo $i; ?></span>
										
										<span class="status_color" style="display:inline-block; padding:3px 5px; background:<?php echo $colors[$i]; ?>; color:#FFF">
										<?php echo $monthes[$i]; ?></span>
										
										<br />
										<textarea rows="10" cols="8" name="config_pickup_dayoff_<?php echo $i; ?>"><?php echo ${'config_pickup_dayoff_' . $i};?></textarea>
										
										<?php if (date('n') == $i) { ?>
											<br /><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">
												Текущий
											</span>
										<?php } ?>
										
										<?php if (date('n', strtotime('+1 month')) == $i) { ?>
											<br /><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ff7815; color:#FFF">
												Следующий
											</span>
										<?php } ?>
										
										<?php if (date('n', strtotime('+1 month')) != $i && date('n') != $i && date('n') > $i) { ?>
											<br />
											<span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF"><?php echo date('Y', strtotime('+1 year')); ?>
											</span>
										<? } ?>
										
										<?php if (date('n', strtotime('+1 month')) != $i && date('n') != $i && date('n') < $i) { ?>
											<br />
											<span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF"><?php echo date('Y'); ?>
											</span>
										<? } ?>
									</td>												
									<?php  if ($i==100) { ?></tr><tr><? } ?>
								<?php } ?>
							</tr>
						</table>
					</div>
					
					<div id="tab-app">
						<h2>Google Play Store</h2>
						<table class="form">
							<tr>
								<td>Включить линк на GPS</td>
								<td>
									<select name="config_android_playstore_enable">
										<?php if ($config_android_playstore_enable) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
											<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>
								</td>
							</tr>
							
							<tr>
								<td>Google Play Store ID</td>
								<td>
									<input type="text" name="config_android_playstore_code" value="<?php echo $config_android_playstore_code; ?>" size="20" />
									<br />
									<span class="help">ua.com.mywonderapp.twa</span>
								</td>
							</tr>
							
							<tr>
								<td>Ссылка на Google Play Store</td>
								<td>
									<input type="text" name="config_android_playstore_link" value="<?php echo $config_android_playstore_link; ?>" size="50" />
									<br />
									<span class="help">https://play.google.com/store/apps/details?id=ua.com.mywonderapp.twa</span>
								</td>
							</tr>

							<tr>
								<td>Ссылка на Андроид приложение админки</td>
								<td>
									<input type="text" name="config_android_application_link" value="<?php echo $config_android_application_link; ?>" size="50" />
									<br />
									<span class="help"><?php echo HTTPS_CATALOG; ?>admin/app/admin.application.twa.apk</span>
								</td>
							</tr>
							
							<tr>
								<td>Код FireBase (FCM)</td>
								<td><textarea name="config_firebase_code" cols="50" rows="10"><?php echo $config_firebase_code; ?></textarea></td>
							</tr>
						</table>	
						
						<h2>Microsoft Store</h2>
						<table class="form">
							<tr>
								<td>Включить линк на MSS</td>
								<td>
									<select name="config_microsoft_store_enable">
										<?php if ($config_microsoft_store_enable) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
											<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>
								</td>
							</tr>
							
							<tr>
								<td>Microsoft Store ID</td>
								<td>
									<input type="text" name="config_microsoft_store_code" value="<?php echo $config_microsoft_store_code; ?>" size="20" />
									<br />
									<span class="help"></span>
								</td>
							</tr>
							
							<tr>
								<td>Ссылка на Microsoft Store</td>
								<td>
									<input type="text" name="config_microsoft_store_link" value="<?php echo $config_microsoft_store_link; ?>" size="50" />
									<br />
									<span class="help"></span>
								</td>
							</tr>
						</table>	
					</div>
					
					<div id="tab-local">
						<table class="form">
							<tr>
								<td style="width:20%;">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Страна</span></p>

									<select name="config_country_id">
										<?php foreach ($countries as $country) { ?>
											<?php if ($country['country_id'] == $config_country_id) { ?>
												<option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
											<?php } else { ?>
												<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select>
								</td>

								<td style="width:20%;">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Страна текстом</span></p>
									<input type="text" name="config_countryname" value="<?php echo $config_countryname; ?>" size="30" />
								</td>

								<td style="width:20%;">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Режим одной страны</span></p>

									<select name="config_only_one_store_and_country">
											<?php if ($config_only_one_store_and_country) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
											<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
								</td>

								<td style="width:20%;">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Геозона</span></p>

									<select name="config_zone_id">
										<?php foreach ($zones as $zone) { ?>
											<?php if ($zone['zone_id'] == $config_zone_id) { ?>
												<option value="<?php echo $zone['zone_id']; ?>" selected="selected"><?php echo $zone['name']; ?></option>
											<?php } else { ?>
												<option value="<?php echo $zone['zone_id']; ?>"><?php echo $zone['name']; ?></option>
											<?php } ?>
										<?php } ?>

									</select>
								</td>

								<td style="width:20%;">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Google Merchant Local</span></p>
									<input type="text" name="config_googlelocal_code" value="<?php echo $config_googlelocal_code; ?>" size="6" />
									<span class="help">Шесть случайных цифр. При изменении сообщить @rayua</span>
								</td>
							</tr>

							<tr>
								<td style="width:20%;">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Cтолица</span></p>
									<input type="text" name="config_default_city" value="<?php echo $config_default_city; ?>" size="20" />
								</td>

								<?php foreach ($languages as $language) { ?>								
									<td style="width:20%;">	
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Столица <?php echo $language['code']; ?></span></p>
										<input type="text" name="config_default_city_<?php echo $language['code']; ?>" value="<?php echo ${'config_default_city_' . $language['code']}; ?>" size="20" />							
									</td>													
							<?php } ?>
							</tr>

							<tr>
								<td style="width:20%;">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Язык фронта</span></p>
									<select name="config_language">
										<?php foreach ($languages as $language) { ?>
											<?php if ($language['code'] == $config_language) { ?>
												<option value="<?php echo $language['code']; ?>" selected="selected"><?php echo $language['name']; ?></option>
											<?php } else { ?>
												<option value="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select>
								</td>

								<td style="width:20%;">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Второй язык фронта</span></p>
									<select name="config_second_language">
										<option value="" <?php if ($config_second_language == '') { ?>selected="selected"<?php } ?>>Не использовать</option>
										<?php foreach ($languages as $language) { ?>
											<?php if ($language['code'] == $config_second_language) { ?>
												<option value="<?php echo $language['code']; ?>" selected="selected"><?php echo $language['name']; ?></option>
											<?php } else { ?>
												<option value="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select>
								</td>

								<td style="width:20%;">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Язык админки</span></p>
									<select name="config_admin_language">
										<?php foreach ($languages as $language) { ?>
											<?php if ($language['code'] == $config_admin_language) { ?>
												<option value="<?php echo $language['code']; ?>" selected="selected"><?php echo $language['name']; ?></option>
											<?php } else { ?>
												<option value="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select>
								</td>

								<td style="width:20%;">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Язык поставщика</span></p>
									<select name="config_de_language">
										<?php foreach ($languages as $language) { ?>
											<?php if ($language['code'] == $config_de_language) { ?>
												<option value="<?php echo $language['code']; ?>" selected="selected"><?php echo $language['name']; ?></option>
											<?php } else { ?>
												<option value="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select>
								</td>

								<td style="width:20%;">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Активные способы оплаты</span></p>
									<textarea name="config_payment_list" cols="40" rows="8"><?php echo $config_payment_list; ?></textarea>
									<br /><span class="help">выводятся в карте товара, по одному в строке</span>
								</td>
							</tr>	
						</table>						

						<h2>Переводить или копировать</h2>
						<table>
							<tr>
								<td style="width:20%;">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Переводить эти языки с RU</span></p>
									<div class="scrollbox" style="height:100px; width:200px;">
									<?php $class = 'odd'; ?>
									<?php foreach ($languages as $language) { ?>
										<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
										<div class="<?php echo $class; ?>">
											<?php if (!empty($config_translate_from_ru) && in_array($language['code'], $config_translate_from_ru)) { ?>
												
												<input id="config_translate_from_ru_<?php echo $language['code']; ?>" class="checkbox" type="checkbox" name="config_translate_from_ru[]" value="<?php echo $language['code']; ?>" checked="checked" />
												<label for="config_translate_from_ru_<?php echo $language['code']; ?>"><?php echo $language['code']; ?></label>
												
												<?php } else { ?>
												
												<input id="config_translate_from_ru_<?php echo $language['code']; ?>" class="checkbox" type="checkbox" name="config_translate_from_ru[]" value="<?php echo $language['code']; ?>" />
												<label for="config_translate_from_ru_<?php echo $language['code']; ?>"><?php echo $language['code']; ?></label>
												
											<?php } ?>
										</div>
									<?php } ?>
								</div>
								<a class="select_all" onclick="$(this).parent().find(':checkbox').attr('checked', true);">Выделить всё</a><a class="remove_selection" onclick="$(this).parent().find(':checkbox').attr('checked', false);">Снять выделение</a>
								</td>

								<td style="width:20%;">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Переводить эти языки с DE</span></p>
									<div class="scrollbox" style="height:100px; width:200px;">
									<?php $class = 'odd'; ?>
									<?php foreach ($languages as $language) { ?>
										<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
										<div class="<?php echo $class; ?>">
											<?php if (!empty($config_translate_from_de) && in_array($language['code'], $config_translate_from_de)) { ?>
												
												<input id="config_translate_from_de_<?php echo $language['code']; ?>" class="checkbox" type="checkbox" name="config_translate_from_de[]" value="<?php echo $language['code']; ?>" checked="checked" />
												<label for="config_translate_from_de_<?php echo $language['code']; ?>"><?php echo $language['code']; ?></label>
												
												<?php } else { ?>
												
												<input id="config_translate_from_de_<?php echo $language['code']; ?>" class="checkbox" type="checkbox" name="config_translate_from_de[]" value="<?php echo $language['code']; ?>" />
												<label for="config_translate_from_de_<?php echo $language['code']; ?>"><?php echo $language['code']; ?></label>
												
											<?php } ?>
										</div>
									<?php } ?>
								</div>
								<a class="select_all" onclick="$(this).parent().find(':checkbox').attr('checked', true);">Выделить всё</a><a class="remove_selection" onclick="$(this).parent().find(':checkbox').attr('checked', false);">Снять выделение</a>
								</td>

								<td style="width:20%;">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Переводить эти языки с UK</span></p>
									<div class="scrollbox" style="height:100px; width:200px;">
									<?php $class = 'odd'; ?>
									<?php foreach ($languages as $language) { ?>
										<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
										<div class="<?php echo $class; ?>">
											<?php if (!empty($config_translate_from_uk) && in_array($language['code'], $config_translate_from_uk)) { ?>
												
												<input id="config_translate_from_uk_<?php echo $language['code']; ?>" class="checkbox" type="checkbox" name="config_translate_from_uk[]" value="<?php echo $language['code']; ?>" checked="checked" />
												<label for="config_translate_from_uk_<?php echo $language['code']; ?>"><?php echo $language['code']; ?></label>
												
												<?php } else { ?>
												
												<input id="config_translate_from_uk_<?php echo $language['code']; ?>" class="checkbox" type="checkbox" name="config_translate_from_uk[]" value="<?php echo $language['code']; ?>" />
												<label for="config_translate_from_uk_<?php echo $language['code']; ?>"><?php echo $language['code']; ?></label>
												
											<?php } ?>
										</div>
									<?php } ?>
								</div>
								<a class="select_all" onclick="$(this).parent().find(':checkbox').attr('checked', true);">Выделить всё</a><a class="remove_selection" onclick="$(this).parent().find(':checkbox').attr('checked', false);">Снять выделение</a>
								</td>

								<td style="width:20%;">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Изменять все эти языки вместе</span></p>
									<div class="scrollbox" style="height:100px; width:200px;">
									<?php $class = 'odd'; ?>
									<?php foreach ($languages as $language) { ?>
										<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
										<div class="<?php echo $class; ?>">
											<?php if (!empty($config_edit_simultaneously) && in_array($language['code'], $config_edit_simultaneously)) { ?>
												
												<input id="config_edit_simultaneously_<?php echo $language['code']; ?>" class="checkbox" type="checkbox" name="config_edit_simultaneously[]" value="<?php echo $language['code']; ?>" checked="checked" />
												<label for="config_edit_simultaneously_<?php echo $language['code']; ?>"><?php echo $language['code']; ?></label>
												
												<?php } else { ?>
												
												<input id="config_edit_simultaneously_<?php echo $language['code']; ?>" class="checkbox" type="checkbox" name="config_edit_simultaneously[]" value="<?php echo $language['code']; ?>" />
												<label for="config_edit_simultaneously_<?php echo $language['code']; ?>"><?php echo $language['code']; ?></label>
												
											<?php } ?>
										</div>
									<?php } ?>
								</div>
								<a class="select_all" onclick="$(this).parent().find(':checkbox').attr('checked', true);">Выделить всё</a><a class="remove_selection" onclick="$(this).parent().find(':checkbox').attr('checked', false);">Снять выделение</a>
								</td>
							</tr>

						</table>						

						<h2>Валюты</h2>
						<table>	
							<tr>
								<td style="width:30%;">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Основная валюта</span></p>
									<select name="config_currency">
										<?php foreach ($currencies as $currency) { ?>
											<?php if ($currency['code'] == $config_currency) { ?>
												<option value="<?php echo $currency['code']; ?>" selected="selected"><?php echo $currency['title']; ?></option>
											<?php } else { ?>
												<option value="<?php echo $currency['code']; ?>"><?php echo $currency['title']; ?></option>
											<?php } ?>
										<?php } ?>
									</select>
									<span class="help">основная валюта, в которой задаются цены</span>
								</td>

								<td style="width:30%;">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Валюта фронта</span></p>
									<select name="config_regional_currency">
										<?php foreach ($currencies as $currency) { ?>
											<?php if ($currency['code'] == $config_regional_currency) { ?>
												<option value="<?php echo $currency['code']; ?>" selected="selected"><?php echo $currency['title']; ?></option>
											<?php } else { ?>
												<option value="<?php echo $currency['code']; ?>"><?php echo $currency['title']; ?></option>
											<?php } ?>
										<?php } ?>
									</select>
									<span class="help">Валюта, в которой отображаются цены в региональном магазине</span>
								</td>

								<td style="width:30%;">
								
								</td>

							</tr>
						</table>						

						<h2>Единицы измерения</h2>
						<table>
							<tr>
								<td style="width:25%;">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Единица длины</span></p>
									<select name="config_length_class_id">
										<?php foreach ($length_classes as $length_class) { ?>
											<?php if ($length_class['length_class_id'] == $config_length_class_id) { ?>
												<option value="<?php echo $length_class['length_class_id']; ?>" selected="selected"><?php echo $length_class['title']; ?></option>
											<?php } else { ?>
												<option value="<?php echo $length_class['length_class_id']; ?>"><?php echo $length_class['title']; ?></option>
											<?php } ?>
										<?php } ?>
									</select>
								</td>

								<td style="width:30%;">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Конвертировать эти единицы на фронте</span></p>
									<div class="scrollbox" style="height:200px; width:200px;">
									<?php $class = 'odd'; ?>
									<?php foreach ($length_classes as $length_class) { ?>
										<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
										<div class="<?php echo $class; ?>">
											<?php if (!empty($config_convert_lengths_class_id) && in_array($length_class['length_class_id'], $config_convert_lengths_class_id)) { ?>
												
												<input id="config_convert_lengths_class_id_<?php echo $length_class['length_class_id']; ?>" class="checkbox" type="checkbox" name="config_convert_lengths_class_id[]" value="<?php echo $length_class['length_class_id']; ?>" checked="checked" />
												<label for="config_convert_lengths_class_id_<?php echo $length_class['length_class_id']; ?>"><?php echo $length_class['title']; ?></label>
												
												<?php } else { ?>
												
												<input id="config_convert_lengths_class_id_<?php echo $length_class['length_class_id']; ?>" class="checkbox" type="checkbox" name="config_convert_lengths_class_id[]" value="<?php echo $length_class['length_class_id']; ?>" />
												<label for="config_convert_lengths_class_id_<?php echo $length_class['length_class_id']; ?>"><?php echo $length_class['title']; ?></label>
												
											<?php } ?>
										</div>
									<?php } ?>
								</div>
								<a class="select_all" onclick="$(this).parent().find(':checkbox').attr('checked', true);">Выделить всё</a><a class="remove_selection" onclick="$(this).parent().find(':checkbox').attr('checked', false);">Снять выделение</a>
								</td>

								<td style="width:25%;">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Единица веса</span></p>
									<select name="config_weight_class_id">
										<?php foreach ($weight_classes as $weight_class) { ?>
											<?php if ($weight_class['weight_class_id'] == $config_weight_class_id) { ?>
												<option value="<?php echo $weight_class['weight_class_id']; ?>" selected="selected"><?php echo $weight_class['title']; ?></option>
											<?php } else { ?>
												<option value="<?php echo $weight_class['weight_class_id']; ?>"><?php echo $weight_class['title']; ?></option>
											<?php } ?>
										<?php } ?>
									</select>
								</td>

								<td style="width:30%;">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Конвертировать эти единицы на фронте</span></p>
									<div class="scrollbox" style="height:200px; width:200px;">
									<?php $class = 'odd'; ?>
									<?php foreach ($weight_classes as $weight_class) { ?>
										<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
										<div class="<?php echo $class; ?>">
											<?php if (!empty($config_convert_weights_class_id) && in_array($weight_class['weight_class_id'], $config_convert_weights_class_id)) { ?>
												
												<input id="config_convert_weights_class_id_<?php echo $weight_class['weight_class_id']; ?>" class="checkbox" type="checkbox" name="config_convert_weights_class_id[]" value="<?php echo $weight_class['weight_class_id']; ?>" checked="checked" />
												<label for="config_convert_weights_class_id_<?php echo $weight_class['weight_class_id']; ?>"><?php echo $weight_class['title']; ?></label>
												
												<?php } else { ?>
												
												<input id="config_convert_weights_class_id_<?php echo $weight_class['weight_class_id']; ?>" class="checkbox" type="checkbox" name="config_convert_weights_class_id[]" value="<?php echo $weight_class['weight_class_id']; ?>" />
												<label for="config_convert_weights_class_id_<?php echo $weight_class['weight_class_id']; ?>"><?php echo $weight_class['title']; ?></label>
												
											<?php } ?>
										</div>
									<?php } ?>
								</div>
								<a class="select_all" onclick="$(this).parent().find(':checkbox').attr('checked', true);">Выделить всё</a><a class="remove_selection" onclick="$(this).parent().find(':checkbox').attr('checked', false);">Снять выделение</a>
								</td>
							</tr>
						</table>
					</div>
					<div id="tab-option">
						<h2>Бонусная система</h2>
						
						<table class="form">								
							<tr>
								<td style="width:25%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Время жизни бонусов, дней</span></p>
									<input type="text" name="config_reward_lifetime" value="<?php echo $config_reward_lifetime; ?>" size="5" /> дней
								</td>

								<td style="width:25%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Максимальный процент</span></p>
									<input type="number" step="1" name="config_reward_maxsalepercent" value="<?php echo $config_reward_maxsalepercent; ?>" size="5" />%
									<span class="help">такое количество процентов от суммы заказа можно оплатить бонусами</span>
								</td>

								<td style="width:25%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Форматировать как валюту</span></p>
									<select name="rewardpoints_currency_mode">
										<?php if ($rewardpoints_currency_mode) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>	
									<span class="help">Да: 12 354.56 бонусов, Нет: 12454 бонуса</span>
								</td>

								<td style="width:25%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">SVG иконки бонусов</span></p>
									<input type="text" name="config_reward_logosvg" value="<?php echo $config_reward_logosvg; ?>" size="30" />
									<span class="help">/catalog/view/theme/kp/img/money.svg</span>
								</td>
							</tr>

							<tr>								
								<td style="width:25%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Префикс бонусов</span></p>
									<input type="text" name="rewardpoints_currency_prefix" value="<?php echo $rewardpoints_currency_prefix; ?>" size="5" />
									<span class="help">$ 100500</span>
								</td>

								<td style="width:25%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Суффикс бонусов</span></p>
									<input type="text" name="rewardpoints_currency_suffix" value="<?php echo $rewardpoints_currency_suffix; ?>" size="5" />
									<span class="help">100500 $</span>
								</td>
								
								<td style="width:25%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF"><b>Процент начисления бонусов</b></span></p>
									<input type="number" step=".1" name="rewardpoints_pointspercent" value="<?php echo $rewardpoints_pointspercent; ?>" size="5" />
									<span class="help">значение по умолчанию, которое будет назначаться товарам, если не переназначено далее, в категория, брендах и коллекциях</span>
								</td>
							</tr>														
						</table>

						<h2>Уведомление о сгорании</h2>

						<table class="form">
							<tr>
								<td style="width:200px;">
									<span class="status_color" style="text-align: left; background: #ef5e67; color: #FFF; ?>;">
										Уведомление о сгорании бонусов
									</span>
								</td>
								<td style="width:50px" class="center">
									<input class="checkbox" type="checkbox" name="rewardpoints_reminder_enable" id="rewardpoints_reminder_enable"<?php if ($rewardpoints_reminder_enable) { echo ' checked="checked"'; }?>/><label for="rewardpoints_reminder_enable"></label>
								</td>
								<td style="padding:5px;">
									<input type="text" size="200" style="width:90%; font-size:16px; padding:5px;" name="rewardpoints_reminder_sms_text" value="<?php echo $rewardpoints_reminder_sms_text; ?>" />
									<span class="help"><b>{FIRSTNAME}, {POINTS_AMOUNT}, {POINTS_DAYS_LEFT}</b></span>
								</td>
							</tr>
						</table>
						<table class="form">
							<tr>
								<td style="width:33%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Отправлять за Х дней до сгорания</span></p>
									<input type="number" step="1" name="rewardpoints_reminder_days_left" value="<?php echo $rewardpoints_reminder_days_left; ?>" size="20" />
								</td>

								<td style="width:33%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Мин. сумма бонусов на счету</span></p>
									<input type="number" step="1" name="rewardpoints_reminder_min_amount" value="<?php echo $rewardpoints_reminder_min_amount; ?>" size="20" />
								</td>

								<td style="width:33%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Неиспользование бонусов Х дней</span></p>
									<input type="number" step="1" name="rewardpoints_reminder_days_noactive" value="<?php echo $rewardpoints_reminder_days_noactive; ?>" size="20" />
								</td>
							</tr>
						</table>

						<h2>Логика бонусов</h2>
						<table class="form">														
							<tr>
								<td style="width:20%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Оверлоад товаров</span></p>
									<select name="config_reward_overload_product">
										<?php if ($config_reward_overload_product) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>	
								</td>

								<td style="width:20%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Оверлоад коллекций</span></p>
									<select name="config_reward_overload_collection">
										<?php if ($config_reward_overload_collection) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>	
								</td>


								<td style="width:20%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Оверлоад брендов</span></p>
									<select name="config_reward_overload_manufacturer">
										<?php if ($config_reward_overload_manufacturer) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>	
								</td>
	
								<td style="width:20%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Оверлоад категорий</span></p>
									<select name="config_reward_overload_category">
										<?php if ($config_reward_overload_category) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>	
								</td>

							</tr>
							<tr>
								<td colspan="4">
									<i class="fa fa-exclamation-circle"></i> если в магазине не планируется использовать переназначения бонусов на каком-либо из этих этапов - их нужно отключить, это значительно ускоряет магазин
								</td>
							</tr>
						</table>
						
						<h2>Начисление бонусов</h2>
						<table class="form">														
							<tr>
								<td style="width:50%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Бонусов за установку приложения</span></p>
									<input type="text" name="rewardpoints_appinstall" value="<?php echo $rewardpoints_appinstall; ?>" size="5" />
									<span class="help">количество бонусов в национальной валюте, начисляемое при установке приложения, код APPINSTALL_POINTS_ADD,бонусы с этим кодом могут быть начислены только один раз одному покупателю</span>
								</td>
	
								<td style="width:50%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Бонусов на день рождения</span></p>
									<input type="text" name="rewardpoints_birthday" value="<?php echo $rewardpoints_birthday; ?>" size="5" />
									<span class="help">количество бонусов в национальной валюте, начисляемое на день рождения, код BIRTHDAY_POINTS_ADD, бонусы с этим кодом могут быть начислены не чаще чем раз в 365 дней</span>
								</td>
							</tr>
						</table>

						<h2>Простое ценообразование</h2>
						<table class="form">			
							<tr>
								<td style="width:50%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Включить простое ценообразование</span></p>
									<select name="config_enable_overprice">
										<?php if ($config_enable_overprice) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>	
								</td>
								<td style="width:50%">
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Наценка</span></p>
									<textarea name="config_overprice" cols="40" rows="5"><?php echo $config_overprice; ?></textarea>
									<span class="help">Для подсчета и анализа</span>
								</td>
							</tr>
						</table>	
																		
						<h2><?php echo $text_items; ?></h2>
						<table class="form">
							<tr>
								<td><span class="required">*</span> <?php echo $entry_catalog_limit; ?></td>
								<td><input type="text" name="config_catalog_limit" value="<?php echo $config_catalog_limit; ?>" size="3" />
									<?php if ($error_catalog_limit) { ?>
										<span class="error"><?php echo $error_catalog_limit; ?></span>
									<?php } ?></td>
							</tr>
							<tr>
								<td><span class="required">*</span> <?php echo $entry_admin_limit; ?></td>
								<td><input type="text" name="config_admin_limit" value="<?php echo $config_admin_limit; ?>" size="3" />
									<?php if ($error_admin_limit) { ?>
										<span class="error"><?php echo $error_admin_limit; ?></span>
									<?php } ?></td>
							</tr>
						</table>

							<h2><?php echo $text_voucher; ?></h2>
							<table class="form">
								<tr>
									<td><span class="required">*</span> <?php echo $entry_voucher_min; ?></td>
									<td><input type="text" name="config_voucher_min" value="<?php echo $config_voucher_min; ?>" />
										<?php if ($error_voucher_min) { ?>
											<span class="error"><?php echo $error_voucher_min; ?></span>
										<?php } ?></td>
								</tr>
								<tr>
									<td><span class="required">*</span> <?php echo $entry_voucher_max; ?></td>
									<td><input type="text" name="config_voucher_max" value="<?php echo $config_voucher_max; ?>" />
										<?php if ($error_voucher_max) { ?>
											<span class="error"><?php echo $error_voucher_max; ?></span>
										<?php } ?></td>
								</tr>
							</table>
							<h2><?php echo $text_tax; ?></h2>
							<table class="form">
								<tr>
									<td><?php echo $entry_tax; ?></td>
									<td><?php if ($config_tax) { ?>
										<input type="radio" name="config_tax" value="1" checked="checked" />
										<?php echo $text_yes; ?>
										<input type="radio" name="config_tax" value="0" />
										<?php echo $text_no; ?>
										<?php } else { ?>
										<input type="radio" name="config_tax" value="1" />
										<?php echo $text_yes; ?>
										<input type="radio" name="config_tax" value="0" checked="checked" />
										<?php echo $text_no; ?>
									<?php } ?></td>
								</tr>
								<tr>
									<td><?php echo $entry_vat; ?></td>
									<td><?php if ($config_vat) { ?>
										<input type="radio" name="config_vat" value="1" checked="checked" />
										<?php echo $text_yes; ?>
										<input type="radio" name="config_vat" value="0" />
										<?php echo $text_no; ?>
										<?php } else { ?>
										<input type="radio" name="config_vat" value="1" />
										<?php echo $text_yes; ?>
										<input type="radio" name="config_vat" value="0" checked="checked" />
										<?php echo $text_no; ?>
									<?php } ?></td>
								</tr>
								<tr>
									<td><?php echo $entry_tax_default; ?></td>
									<td><select name="config_tax_default">
										<option value=""><?php echo $text_none; ?></option>
										<?php  if ($config_tax_default == 'shipping') { ?>
											<option value="shipping" selected="selected"><?php echo $text_shipping; ?></option>
											<?php } else { ?>
											<option value="shipping"><?php echo $text_shipping; ?></option>
										<?php } ?>
										<?php  if ($config_tax_default == 'payment') { ?>
											<option value="payment" selected="selected"><?php echo $text_payment; ?></option>
											<?php } else { ?>
											<option value="payment"><?php echo $text_payment; ?></option>
										<?php } ?>
									</select></td>
								</tr>
								<tr>
									<td><?php echo $entry_tax_customer; ?></td>
									<td><select name="config_tax_customer">
										<option value=""><?php echo $text_none; ?></option>
										<?php  if ($config_tax_customer == 'shipping') { ?>
											<option value="shipping" selected="selected"><?php echo $text_shipping; ?></option>
											<?php } else { ?>
											<option value="shipping"><?php echo $text_shipping; ?></option>
										<?php } ?>
										<?php  if ($config_tax_customer == 'payment') { ?>
											<option value="payment" selected="selected"><?php echo $text_payment; ?></option>
											<?php } else { ?>
											<option value="payment"><?php echo $text_payment; ?></option>
										<?php } ?>
									</select></td>
								</tr>
							</table>
							<h2><?php echo $text_account; ?></h2>
							<table class="form">
								<tr>
									<td><?php echo $entry_customer_online; ?></td>
									<td><?php if ($config_customer_online) { ?>
										<input type="radio" name="config_customer_online" value="1" checked="checked" />
										<?php echo $text_yes; ?>
										<input type="radio" name="config_customer_online" value="0" />
										<?php echo $text_no; ?>
										<?php } else { ?>
										<input type="radio" name="config_customer_online" value="1" />
										<?php echo $text_yes; ?>
										<input type="radio" name="config_customer_online" value="0" checked="checked" />
										<?php echo $text_no; ?>
									<?php } ?></td>
								</tr>
								<tr>
									<td><?php echo $entry_customer_group; ?></td>
									<td><select name="config_customer_group_id">
										<?php foreach ($customer_groups as $customer_group) { ?>
											<?php if ($customer_group['customer_group_id'] == $config_customer_group_id) { ?>
												<option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select></td>
								</tr>
								<tr>
									<td>Покупатели - мудаки<br /><span class='help'>Неблагонадежные покупатели</span></td>
									<td><select name="config_bad_customer_group_id">
										<?php foreach ($customer_groups as $customer_group) { ?>
											<?php if ($customer_group['customer_group_id'] == $config_bad_customer_group_id) { ?>
												<option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select></td>
								</tr>
								<tr>
									<td>Группа, в которую попадают оптовики при регистрации</td>
									<td><select name="config_opt_group_id">
										<?php foreach ($customer_groups as $customer_group) { ?>
											<?php if ($customer_group['customer_group_id'] == $config_opt_group_id) { ?>
												<option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select></td>
								</tr>
								<tr>
									<td><?php echo $entry_customer_group_display; ?></td>
									<td><div class="scrollbox">
										<?php $class = 'odd'; ?>
										<?php foreach ($customer_groups as $customer_group) { ?>
											<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
											<div class="<?php echo $class; ?>">
												<?php if (in_array($customer_group['customer_group_id'], $config_customer_group_display)) { ?>
													<input id="<?php echo $customer_group['customer_group_id']; ?>" class="checkbox" type="checkbox" name="config_customer_group_display[]" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
													<label for="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?>
													<?php } else { ?></label>
													<input id="<?php echo $customer_group['customer_group_id']; ?>" class="checkbox" type="checkbox" name="config_customer_group_display[]" value="<?php echo $customer_group['customer_group_id']; ?>" />
													<label for="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></label>
												<?php } ?>
											</div>
										<?php } ?>
									</div>
									<a class="select_all" onclick="$(this).parent().find(':checkbox').attr('checked', true);">Выделить всё</a><a class="remove_selection" onclick="$(this).parent().find(':checkbox').attr('checked', false);">Снять выделение</a>
									<?php if ($error_customer_group_display) { ?>
										<span class="error"><?php echo $error_customer_group_display; ?></span>
									<?php } ?></td>
								</tr>
								<tr>
									<td><?php echo $entry_customer_price; ?></td>
									<td><?php if ($config_customer_price) { ?>
										<input type="radio" name="config_customer_price" value="1" checked="checked" />
										<?php echo $text_yes; ?>
										<input type="radio" name="config_customer_price" value="0" />
										<?php echo $text_no; ?>
										<?php } else { ?>
										<input type="radio" name="config_customer_price" value="1" />
										<?php echo $text_yes; ?>
										<input type="radio" name="config_customer_price" value="0" checked="checked" />
										<?php echo $text_no; ?>
									<?php } ?></td>
								</tr>
								<tr>
									<td><?php echo $entry_account; ?></td>
									<td><select name="config_account_id">
										<option value="0"><?php echo $text_none; ?></option>
										<?php foreach ($informations as $information) { ?>
											<?php if ($information['information_id'] == $config_account_id) { ?>
												<option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
											<?php } ?>
										<?php } ?>
									</select></td>
								</tr>
							</table>
							<h2><?php echo $text_checkout; ?></h2>
							<table class="form">
								<tr>
									<td><?php echo $entry_cart_weight; ?></td>
									<td><?php if ($config_cart_weight) { ?>
										<input type="radio" name="config_cart_weight" value="1" checked="checked" />
										<?php echo $text_yes; ?>
										<input type="radio" name="config_cart_weight" value="0" />
										<?php echo $text_no; ?>
										<?php } else { ?>
										<input type="radio" name="config_cart_weight" value="1" />
										<?php echo $text_yes; ?>
										<input type="radio" name="config_cart_weight" value="0" checked="checked" />
										<?php echo $text_no; ?>
									<?php } ?></td>
								</tr>
								<tr>
									<td><?php echo $entry_guest_checkout; ?></td>
									<td><?php if ($config_guest_checkout) { ?>
										<input type="radio" name="config_guest_checkout" value="1" checked="checked" />
										<?php echo $text_yes; ?>
										<input type="radio" name="config_guest_checkout" value="0" />
										<?php echo $text_no; ?>
										<?php } else { ?>
										<input type="radio" name="config_guest_checkout" value="1" />
										<?php echo $text_yes; ?>
										<input type="radio" name="config_guest_checkout" value="0" checked="checked" />
										<?php echo $text_no; ?>
									<?php } ?></td>
								</tr>
								<tr>
									<td><?php echo $entry_checkout; ?></td>
									<td><select name="config_checkout_id">
										<option value="0"><?php echo $text_none; ?></option>
										<?php foreach ($informations as $information) { ?>
											<?php if ($information['information_id'] == $config_checkout_id) { ?>
												<option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
											<?php } ?>
										<?php } ?>
									</select></td>
								</tr>
								<tr>
									<td><?php echo $entry_order_edit; ?></td>
									<td><input type="text" name="config_order_edit" value="<?php echo $config_order_edit; ?>" size="3" /></td>
								</tr>
								<tr>
									<td><?php echo $entry_invoice_prefix; ?></td>
									<td><input type="text" name="config_invoice_prefix" value="<?php echo $config_invoice_prefix; ?>" /></td>
								</tr>
								<tr>
									<td><?php echo $entry_order_status; ?></td>
									<td><select name="config_order_status_id">
										<?php foreach ($order_statuses as $order_status) { ?>
											<?php if ($order_status['order_status_id'] == $config_order_status_id) { ?>
												<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select></td>
								</tr>
								<tr>
									<td>Статус "обработанного заказа"</td>
									<td><select name="config_treated_status_id">
										<?php foreach ($order_statuses as $order_status) { ?>
											<?php if ($order_status['order_status_id'] == $config_treated_status_id) { ?>
												<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select></td>
								</tr>
								<tr>
									<td>Статус "выполненного заказа"</td>
									<td><select name="config_complete_status_id">
										<?php foreach ($order_statuses as $order_status) { ?>
											<?php if ($order_status['order_status_id'] == $config_complete_status_id) { ?>
												<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select></td>
								</tr>
								<tr>
									<td>Статус "отмененного заказа"</td>
									<td><select name="config_cancelled_status_id">
										<?php foreach ($order_statuses as $order_status) { ?>
											<?php if ($order_status['order_status_id'] == $config_cancelled_status_id) { ?>
												<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select></td>
								</tr>
								<tr>
									<td>Статус "частично доставленного заказа"</td>
									<td><select name="config_partly_delivered_status_id">
										<?php foreach ($order_statuses as $order_status) { ?>
											<?php if ($order_status['order_status_id'] == $config_partly_delivered_status_id) { ?>
												<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select></td>
								</tr>
								<tr>
									<td>Статус "отмененного заказа" после отгрузки</td>
									<td><select name="config_cancelled_after_status_id">
										<?php foreach ($order_statuses as $order_status) { ?>
											<?php if ($order_status['order_status_id'] == $config_cancelled_after_status_id) { ?>
												<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select></td>
								</tr>
								
								<tr>
									<td>Статус заказа в пункте самовывоза<span class="help">для яндекс-маркета и уведомлений</span></td>
									<td><select name="config_in_pickup_status_id">
										<?php foreach ($order_statuses as $order_status) { ?>
											<?php if ($order_status['order_status_id'] == $config_in_pickup_status_id) { ?>
												<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select></td>
								</tr>
								
								<tr>
									<td>Статус заказа готовности к доставке<span class="help">для яндекс-маркета</span></td>
									<td><select name="config_ready_to_delivering_status_id">
										<?php foreach ($order_statuses as $order_status) { ?>
											<?php if ($order_status['order_status_id'] == $config_ready_to_delivering_status_id) { ?>
												<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select></td>
								</tr>
								<tr>
									<td>Статус заказа "доставляется"<span class="help">Для сканирования почты</span></td>
									<td><select name="config_delivering_status_id">
										<?php foreach ($order_statuses as $order_status) { ?>
											<?php if ($order_status['order_status_id'] == $config_delivering_status_id) { ?>
												<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select></td>
								</tr>
								<tr>
									<td>Статус после подверждения покупателем<span class="help">Статус, который будет установлен после подтверждения клиентом условий заказа по почте</span></td>
									<td><select name="config_confirmed_order_status_id">
										<?php foreach ($order_statuses as $order_status) { ?>
											<?php if ($order_status['order_status_id'] == $config_confirmed_order_status_id) { ?>
												<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select></td>
								</tr>
								<tr>
									<td>Статус после подверждения покупателем c оплатой<span class="help">Статус, который будет установлен после подтверждения клиентом условий заказа по почте при условии, что заказ необходимо оплачивать!</span></td>
									<td><select name="config_confirmed_nopaid_order_status_id">
										<?php foreach ($order_statuses as $order_status) { ?>
											<?php if ($order_status['order_status_id'] == $config_confirmed_nopaid_order_status_id) { ?>
												<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select></td>
								</tr>
								<tr>
									<td>Идентификаторы ОПЛАТЫ ПРИ ДОСТАВКЕ<span class="help">Идентификаторы способов оплат, при которых считается, что оплата будет произведена при доставке</span></td>
									<td><input name="config_confirmed_delivery_payment_ids" type="text" style="width:700px;" value="<? echo $config_confirmed_delivery_payment_ids; ?>"></td>
								</tr>
								<tr>
									<td>Оплаты - предоплаты!<span class="help">По этим идентификаторам определяется предоплата ли этот способ оплаты!</span></td>
									<td><textarea name="config_confirmed_prepay_payment_ids" style="width:700px;" rows="4"><? echo $config_confirmed_prepay_payment_ids; ?></textarea></td>
								</tr>
								<tr>
									<td>Статус после частичной оплаты<span class="help">Статус, который будет установлен после частичной оплаты</span></td>
									<td><select name="config_prepayment_paid_order_status_id">
										<?php foreach ($order_statuses as $order_status) { ?>
											<?php if ($order_status['order_status_id'] == $config_prepayment_paid_order_status_id) { ?>
												<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select></td>
								</tr>
								<tr>
									<td>Статус после полной оплаты<span class="help">Статус, который будет установлен после полной оплаты</span></td>
									<td><select name="config_total_paid_order_status_id">
										<?php foreach ($order_statuses as $order_status) { ?>
											<?php if ($order_status['order_status_id'] == $config_total_paid_order_status_id) { ?>
												<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select></td>
								</tr>
								
								<tr>
									<td>Фейловые причины отмены для бренд-менеджеров</td>
									<td><div class="scrollbox" style="height:300px;">
										<?php $class = 'odd'; ?>
										<?php foreach ($reject_reasons as $reject_reason) { ?>
											<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
											<div class="<?php echo $class; ?>">
												<?php if (in_array($reject_reason['reject_reason_id'], $config_brandmanager_fail_order_status_id)) { ?>
													<input id="config_manager_confirmed_<?php echo $reject_reason['reject_reason_id']; ?>" class="checkbox" type="checkbox" name="config_brandmanager_fail_order_status_id[]" value="<?php echo $reject_reason['reject_reason_id']; ?>" checked="checked" />
													<label for="config_manager_confirmed_<?php echo $reject_reason['reject_reason_id']; ?>"><?php echo $reject_reason['name']; ?></label>
													<?php } else { ?>
													<input id="config_manager_confirmed_<?php echo $reject_reason['reject_reason_id']; ?>" class="checkbox" type="checkbox" name="config_brandmanager_fail_order_status_id[]" value="<?php echo $reject_reason['reject_reason_id']; ?>" />
													<label for="config_manager_confirmed_<?php echo $reject_reason['reject_reason_id']; ?>"><?php echo $reject_reason['name']; ?></label>
												<?php } ?>
											</div>
										<?php } ?>
									</div>
									<a class="select_all" onclick="$(this).parent().find(':checkbox').attr('checked', true);">Выделить всё</a><a class="remove_selection" onclick="$(this).parent().find(':checkbox').attr('checked', false);">Снять выделение</a>
									</td>
								</tr>
								
								<tr>
									<td>"Подтвержденные статусы" для менеджера</td>
									<td><div class="scrollbox" style="height:300px;">
										<?php $class = 'odd'; ?>
										<?php foreach ($order_statuses as $order_status) { ?>
											<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
											<div class="<?php echo $class; ?>">
												<?php if (in_array($order_status['order_status_id'], $config_manager_confirmed_order_status_id)) { ?>
													<input id="config_manager_confirmed_<?php echo $order_status['order_status_id']; ?>" class="checkbox" type="checkbox" name="config_manager_confirmed_order_status_id[]" value="<?php echo $order_status['order_status_id']; ?>" checked="checked" />
													<label for="config_manager_confirmed_<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></label>
													<?php } else { ?>
													<input id="config_manager_confirmed_<?php echo $order_status['order_status_id']; ?>" class="checkbox" type="checkbox" name="config_manager_confirmed_order_status_id[]" value="<?php echo $order_status['order_status_id']; ?>" />
													<label for="config_manager_confirmed_<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></label>
												<?php } ?>
											</div>
										<?php } ?>
									</div>
									<a class="select_all" onclick="$(this).parent().find(':checkbox').attr('checked', true);">Выделить всё</a><a class="remove_selection" onclick="$(this).parent().find(':checkbox').attr('checked', false);">Снять выделение</a>
									</td>
								</tr>
								<tr>
									<td>"Проблемные статусы" для менеджера</td>
									<td><div class="scrollbox" style="height:300px;">
										<?php $class = 'odd'; ?>
										<?php foreach ($order_statuses as $order_status) { ?>
											<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
											<div class="<?php echo $class; ?>">
												<?php if (in_array($order_status['order_status_id'], $config_problem_order_status_id)) { ?>
													<input id="config_problem_<?php echo $order_status['order_status_id']; ?>" class="checkbox" type="checkbox" name="config_problem_order_status_id[]" value="<?php echo $order_status['order_status_id']; ?>" checked="checked" />
													<label for="config_problem_<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></label>
													<?php } else { ?>
													<input id="config_problem_<?php echo $order_status['order_status_id']; ?>" class="checkbox" type="checkbox" name="config_problem_order_status_id[]" value="<?php echo $order_status['order_status_id']; ?>" />
													<label for="config_problem_<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></label>
												<?php } ?>
											</div>
										<?php } ?>
									</div>
									<a class="select_all" onclick="$(this).parent().find(':checkbox').attr('checked', true);">Выделить всё</a><a class="remove_selection" onclick="$(this).parent().find(':checkbox').attr('checked', false);">Снять выделение</a>
									</td>
								</tr>
								<tr>
									<td>Статусы для учета работы менеджера</td>
									<td><div class="scrollbox" style="height:300px;">
										<?php $class = 'odd'; ?>
										<?php foreach ($order_statuses as $order_status) { ?>
											<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
											<div class="<?php echo $class; ?>">
												<?php if (in_array($order_status['order_status_id'], $config_problem_quality_order_status_id)) { ?>
													<input id="config_problem_quality_<?php echo $order_status['order_status_id']; ?>" class="checkbox" type="checkbox" name="config_problem_quality_order_status_id[]" value="<?php echo $order_status['order_status_id']; ?>" checked="checked" />
													<label for="config_problem_quality_<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></label>
													<?php } else { ?>
													<input id="config_problem_quality_<?php echo $order_status['order_status_id']; ?>" class="checkbox" type="checkbox" name="config_problem_quality_order_status_id[]" value="<?php echo $order_status['order_status_id']; ?>" />
													<label for="config_problem_quality_<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></label>
												<?php } ?>
											</div>
										<?php } ?>
									</div>
									<a class="select_all" onclick="$(this).parent().find(':checkbox').attr('checked', true);">Выделить всё</a><a class="remove_selection" onclick="$(this).parent().find(':checkbox').attr('checked', false);">Снять выделение</a>
									</td>
								</tr>
								<tr>
									<td>"Неподтвержденные статусы" для менеджера</td>
									<td><div class="scrollbox" style="height:300px;">
										<?php $class = 'odd'; ?>
										<?php foreach ($order_statuses as $order_status) { ?>
											<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
											<div class="<?php echo $class; ?>">
												<?php if (in_array($order_status['order_status_id'], $config_toapprove_order_status_id)) { ?>
													<input id="config_toapprove_<?php echo $order_status['order_status_id']; ?>" class="checkbox" type="checkbox" name="config_toapprove_order_status_id[]" value="<?php echo $order_status['order_status_id']; ?>" checked="checked" />
													<label for="config_toapprove_<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></label>
													<?php } else { ?>
													<input id="config_toapprove_<?php echo $order_status['order_status_id']; ?>" class="checkbox" type="checkbox" name="config_toapprove_order_status_id[]" value="<?php echo $order_status['order_status_id']; ?>" />
													<label for="config_toapprove_<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></label>
												<?php } ?>
											</div>
										<?php } ?>
									</div>
									<a class="select_all" onclick="$(this).parent().find(':checkbox').attr('checked', true);">Выделить всё</a><a class="remove_selection" onclick="$(this).parent().find(':checkbox').attr('checked', false);">Снять выделение</a>
									</td>
								</tr>
								<tr>
									<td>Выгрузка заказов в 1С. Только эти статусы</td>
									<td><div class="scrollbox" style="height:300px;">
										<?php $class = 'odd'; ?>
										<?php foreach ($order_statuses as $order_status) { ?>
											<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
											<div class="<?php echo $class; ?>">
												<?php if (in_array($order_status['order_status_id'], $config_odinass_order_status_id)) { ?>
													<input id="config_odinass_<?php echo $order_status['order_status_id']; ?>" class="checkbox" type="checkbox" name="config_odinass_order_status_id[]" value="<?php echo $order_status['order_status_id']; ?>" checked="checked" />
													<label for="config_odinass_<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></label>
													<?php } else { ?>
													<input id="config_odinass_<?php echo $order_status['order_status_id']; ?>" class="checkbox" type="checkbox" name="config_odinass_order_status_id[]" value="<?php echo $order_status['order_status_id']; ?>" />
													<label for="config_odinass_<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></label>
												<?php } ?>
											</div>
										<?php } ?>
									</div>
									<a class="select_all" onclick="$(this).parent().find(':checkbox').attr('checked', true);">Выделить всё</a><a class="remove_selection" onclick="$(this).parent().find(':checkbox').attr('checked', false);">Снять выделение</a>
									</td>
								</tr>
								<tr>
									<td>Статусы из которых нельзя удалять товар</td>
									<td><div class="scrollbox" style="height:300px;">
										<?php $class = 'odd'; ?>
										<?php foreach ($order_statuses as $order_status) { ?>
											<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
											<div class="<?php echo $class; ?>">
												<?php if (in_array($order_status['order_status_id'], $config_nodelete_order_status_id)) { ?>
													<input id="config_<?php echo $order_status['order_status_id']; ?>" class="checkbox" type="checkbox" name="config_nodelete_order_status_id[]" value="<?php echo $order_status['order_status_id']; ?>" checked="checked" />
													<label for="config_<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></label>
													<?php } else { ?>
													<input id="config_<?php echo $order_status['order_status_id']; ?>" class="checkbox" type="checkbox" name="config_nodelete_order_status_id[]" value="<?php echo $order_status['order_status_id']; ?>" />
													<label for="config_<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></label>
												<?php } ?>
											</div>
										<?php } ?>
									</div>
									<a class="select_all" onclick="$(this).parent().find(':checkbox').attr('checked', true);">Выделить всё</a><a class="remove_selection" onclick="$(this).parent().find(':checkbox').attr('checked', false);">Снять выделение</a>
									</td>
								</tr>
								<tr>
									<td>Статусы для подбора связки Amazon</td>
									<td><div class="scrollbox" style="height:300px;">
										<?php $class = 'odd'; ?>
										<?php foreach ($order_statuses as $order_status) { ?>
											<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
											<div class="<?php echo $class; ?>">
												<?php if (in_array($order_status['order_status_id'], $config_amazonlist_order_status_id)) { ?>
													<input id="config_amazonlist_<?php echo $order_status['order_status_id']; ?>" class="checkbox" type="checkbox" name="config_amazonlist_order_status_id[]" value="<?php echo $order_status['order_status_id']; ?>" checked="checked" />
													<label for="config_amazonlist_<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></label>
													<?php } else { ?>
													<input id="config_amazonlist_<?php echo $order_status['order_status_id']; ?>" class="checkbox" type="checkbox" name="config_amazonlist_order_status_id[]" value="<?php echo $order_status['order_status_id']; ?>" />
													<label for="config_amazonlist_<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></label>
												<?php } ?>
											</div>
										<?php } ?>
									</div>
									<a class="select_all" onclick="$(this).parent().find(':checkbox').attr('checked', true);">Выделить всё</a><a class="remove_selection" onclick="$(this).parent().find(':checkbox').attr('checked', false);">Снять выделение</a>
									</td>
								</tr>
							</table>
							<h2><?php echo $text_stock; ?></h2>
							<table class="form">
								<tr>
									<td><?php echo $entry_stock_display; ?></td>
									<td><?php if ($config_stock_display) { ?>
										<input type="radio" name="config_stock_display" value="1" checked="checked" />
										<?php echo $text_yes; ?>
										<input type="radio" name="config_stock_display" value="0" />
										<?php echo $text_no; ?>
										<?php } else { ?>
										<input type="radio" name="config_stock_display" value="1" />
										<?php echo $text_yes; ?>
										<input type="radio" name="config_stock_display" value="0" checked="checked" />
										<?php echo $text_no; ?>
									<?php } ?></td>
								</tr>
								<tr>
									<td><?php echo $entry_stock_warning; ?></td>
									<td><?php if ($config_stock_warning) { ?>
										<input type="radio" name="config_stock_warning" value="1" checked="checked" />
										<?php echo $text_yes; ?>
										<input type="radio" name="config_stock_warning" value="0" />
										<?php echo $text_no; ?>
										<?php } else { ?>
										<input type="radio" name="config_stock_warning" value="1" />
										<?php echo $text_yes; ?>
										<input type="radio" name="config_stock_warning" value="0" checked="checked" />
										<?php echo $text_no; ?>
									<?php } ?></td>
								</tr>
								<tr>
									<td><?php echo $entry_stock_checkout; ?></td>
									<td><?php if ($config_stock_checkout) { ?>
										<input type="radio" name="config_stock_checkout" value="1" checked="checked" />
										<?php echo $text_yes; ?>
										<input type="radio" name="config_stock_checkout" value="0" />
										<?php echo $text_no; ?>
										<?php } else { ?>
										<input type="radio" name="config_stock_checkout" value="1" />
										<?php echo $text_yes; ?>
										<input type="radio" name="config_stock_checkout" value="0" checked="checked" />
										<?php echo $text_no; ?>
									<?php } ?></td>
								</tr>
								<tr>
									<td>Статус по-умолчанию (есть на амазоне, или у поставщика)</td>
									<td><select name="config_stock_status_id">
										<?php foreach ($stock_statuses as $stock_status) { ?>
											<?php if ($stock_status['stock_status_id'] == $config_stock_status_id) { ?>
												<option value="<?php echo $stock_status['stock_status_id']; ?>" selected="selected"><?php echo $stock_status['name']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select></td>
								</tr>
								<tr>
									<td>Статус, "есть у нас на складе"</td>
									<td><select name="config_in_stock_status_id">
										<?php foreach ($stock_statuses as $stock_status) { ?>
											<?php if ($stock_status['stock_status_id'] == $config_in_stock_status_id) { ?>
												<option value="<?php echo $stock_status['stock_status_id']; ?>" selected="selected"><?php echo $stock_status['name']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select></td>
								</tr>
								<tr>
									<td>Статус, при котором нельзя купить</td>
									<td><select name="config_not_in_stock_status_id">
										<?php foreach ($stock_statuses as $stock_status) { ?>
											<?php if ($stock_status['stock_status_id'] == $config_not_in_stock_status_id) { ?>
												<option value="<?php echo $stock_status['stock_status_id']; ?>" selected="selected"><?php echo $stock_status['name']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select></td>
								</tr>
								<tr>
									<td>Статус, при котором надо уточнить наличие</td>
									<td><select name="config_partly_in_stock_status_id">
										<?php foreach ($stock_statuses as $stock_status) { ?>
											<?php if ($stock_status['stock_status_id'] == $config_partly_in_stock_status_id) { ?>
												<option value="<?php echo $stock_status['stock_status_id']; ?>" selected="selected"><?php echo $stock_status['name']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select></td>
								</tr>
							</table>
							<h2><?php echo $text_affiliate; ?></h2>
							<table class="form">
								<tr>
									<td><?php echo $entry_affiliate; ?></td>
									<td><select name="config_affiliate_id">
										<option value="0"><?php echo $text_none; ?></option>
										<?php foreach ($informations as $information) { ?>
											<?php if ($information['information_id'] == $config_affiliate_id) { ?>
												<option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
											<?php } ?>
										<?php } ?>
									</select></td>
								</tr>
								<tr>
									<td><?php echo $entry_commission; ?></td>
									<td><input type="text" name="config_commission" value="<?php echo $config_commission; ?>" size="3" /></td>
								</tr>
							</table>
							<h2><?php echo $text_return; ?></h2>
							<table class="form">
								<tr>
									<td><?php echo $entry_return; ?></td>
									<td>
										<select name="config_return_id">
											<option value="0"><?php echo $text_none; ?></option>
											<?php foreach ($informations as $information) { ?>
												<?php if ($information['information_id'] == $config_return_id) { ?>
													<option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
													<?php } else { ?>
													<option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
												<?php } ?>
											<?php } ?>
										</select>
									</td>
								</tr>
								<tr>
									<td><?php echo $entry_return_status; ?></td>
									<td><select name="config_return_status_id">
										<?php foreach ($return_statuses as $return_status) { ?>
											<?php if ($return_status['return_status_id'] == $config_return_status_id) { ?>
												<option value="<?php echo $return_status['return_status_id']; ?>" selected="selected"><?php echo $return_status['name']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $return_status['return_status_id']; ?>"><?php echo $return_status['name']; ?></option>
											<?php } ?>
										<?php } ?>
									</select></td>
								</tr>
							</table>

							<h2>Другие привязки статей</h2>
							<table class="form">
								<tr>
									<td>Информация о бонусах</td>
									<td>
										<select name="config_reward_article_id">
											<option value="0"><?php echo $text_none; ?></option>
											<?php foreach ($informations as $information) { ?>
												<?php if ($information['information_id'] == $config_reward_article_id) { ?>
													<option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
												<?php } else { ?>
													<option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
												<?php } ?>
											<?php } ?>
										</select>
									</td>
								</tr>

								<tr>
									<td>Статья "как заказать"</td>
									<td>
										<select name="config_how_order_article_id">
											<option value="0"><?php echo $text_none; ?></option>
											<?php foreach ($informations as $information) { ?>
												<?php if ($information['information_id'] == $config_how_order_article_id) { ?>
													<option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
												<?php } else { ?>
													<option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
												<?php } ?>
											<?php } ?>
										</select>
									</td>
								</tr>

								<tr>
									<td>Информация о доставке</td>
									<td>
										<select name="config_delivery_article_id">
											<option value="0"><?php echo $text_none; ?></option>
											<?php foreach ($informations as $information) { ?>
												<?php if ($information['information_id'] == $config_delivery_article_id) { ?>
													<option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
												<?php } else { ?>
													<option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
												<?php } ?>
											<?php } ?>
										</select>
									</td>
								</tr>

								<tr>
									<td>Информация о оплате</td>
									<td>
										<select name="config_payment_article_id">
											<option value="0"><?php echo $text_none; ?></option>
											<?php foreach ($informations as $information) { ?>
												<?php if ($information['information_id'] == $config_payment_article_id) { ?>
													<option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
												<?php } else { ?>
													<option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
												<?php } ?>
											<?php } ?>
										</select>
									</td>
								</tr>

								<tr>
									<td>Информация о возвратах</td>
									<td>
										<select name="config_return_article_id">
											<option value="0"><?php echo $text_none; ?></option>
											<?php foreach ($informations as $information) { ?>
												<?php if ($information['information_id'] == $config_return_article_id) { ?>
													<option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
												<?php } else { ?>
													<option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
												<?php } ?>
											<?php } ?>
										</select>
									</td>
								</tr>

								<tr>
									<td>Информация о дискаунтах/скидках</td>
									<td>
										<select name="config_discounts_article_id">
											<option value="0"><?php echo $text_none; ?></option>
											<?php foreach ($informations as $information) { ?>
												<?php if ($information['information_id'] == $config_discounts_article_id) { ?>
													<option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
												<?php } else { ?>
													<option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
												<?php } ?>
											<?php } ?>
										</select>
									</td>
								</tr>

								<tr>
									<td>Информация о подарочных сертификатах</td>
									<td>
										<select name="config_present_certificates_article_id">
											<option value="0"><?php echo $text_none; ?></option>
											<?php foreach ($informations as $information) { ?>
												<?php if ($information['information_id'] == $config_present_certificates_article_id) { ?>
													<option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
												<?php } else { ?>
													<option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
												<?php } ?>
											<?php } ?>
										</select>
									</td>
								</tr>

								<tr>
									<td>Информация о магазине (О нас)</td>
									<td>
										<select name="config_about_article_id">
											<option value="0"><?php echo $text_none; ?></option>
											<?php foreach ($informations as $information) { ?>
												<?php if ($information['information_id'] == $config_about_article_id) { ?>
													<option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
												<?php } else { ?>
													<option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
												<?php } ?>
											<?php } ?>
										</select>
									</td>
								</tr>

								<tr>
									<td>Информация поставщикам</td>
									<td>
										<select name="config_vendors_article_id">
											<option value="0"><?php echo $text_none; ?></option>
											<?php foreach ($informations as $information) { ?>
												<?php if ($information['information_id'] == $config_vendors_article_id) { ?>
													<option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
												<?php } else { ?>
													<option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
												<?php } ?>
											<?php } ?>
										</select>
									</td>
								</tr>

								<tr>
									<td>Пользовательское соглашение</td>
									<td>
										<select name="config_agreement_article_id">
											<option value="0"><?php echo $text_none; ?></option>
											<?php foreach ($informations as $information) { ?>
												<?php if ($information['information_id'] == $config_agreement_article_id) { ?>
													<option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
												<?php } else { ?>
													<option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
												<?php } ?>
											<?php } ?>
										</select>
									</td>
								</tr>

								<tr>
									<td>Персональные данные</td>
									<td>
										<select name="config_personaldata_article_id">
											<option value="0"><?php echo $text_none; ?></option>
											<?php foreach ($informations as $information) { ?>
												<?php if ($information['information_id'] == $config_personaldata_article_id) { ?>
													<option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
												<?php } else { ?>
													<option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
												<?php } ?>
											<?php } ?>
										</select>
									</td>
								</tr>
							</table>
						</div>
						<div id="tab-image">
							<table class="form">
								<tr>
									<td style="width:30%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Логотип</span></p>

										<div class="image">
											<img src="<?php echo $logo; ?>" alt="" id="thumb-logo" />
											<input type="hidden" name="config_logo" value="<?php echo $config_logo; ?>" id="logo" />
											<br />
											<a onclick="image_upload('logo', 'thumb-logo');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb-logo').attr('src', '<?php echo $no_image; ?>'); $('#logo').attr('value', '');"><?php echo $text_clear; ?></a>
										</div>
									</td>

									<td style="width:30%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Иконка (для совместимости)</span></p>

										<div class="image">
											<img src="<?php echo $icon; ?>" alt="" id="thumb-icon" />
											<input type="hidden" name="config_icon" value="<?php echo $config_icon; ?>" id="icon" />
											<br />
											<a onclick="image_upload('icon', 'thumb-icon');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb-icon').attr('src', '<?php echo $no_image; ?>'); $('#icon').attr('value', '');"><?php echo $text_clear; ?></a>
										</div>
									</td>

									<td style="width:30%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Заглушка No Image</span></p>

										<div class="image"><img src="<?php echo $noimage; ?>" alt="" id="thumb-noimage" />
											<input type="hidden" name="config_noimage" value="<?php echo $config_noimage; ?>" id="noimage" />
											<br />
											<a onclick="image_upload('noimage', 'thumb-noimage');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb-noimage').attr('src', '<?php echo $no_image; ?>'); $('#noimage').attr('value', '');"><?php echo $text_clear; ?></a>
										</div>
									</td>
								</tr>
							</table>
							<h2>Качество изображений</h2>

							<table class="form">
								<tr>
									<td style="width:30%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#57AC79; color:#FFF">Качество JPEG</span></p>

										<input type="number" name="config_image_jpeg_quality" value="<?php echo $config_image_jpeg_quality; ?>" size="50" style="width:100px;">										
									</td>

									<td style="width:30%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#57AC79; color:#FFF">Качество WEBP</span></p>

										<input type="number" name="config_image_jpeg_quality" value="<?php echo $config_image_jpeg_quality; ?>" size="50" style="width:100px;">										
									</td>

									<td style="width:30%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#57AC79; color:#FFF">Качество AVIF</span></p>

										<input type="number" name="config_image_avif_quality" value="<?php echo $config_image_avif_quality; ?>" size="50" style="width:100px;">										
									</td>
								</tr>
							</table>

							<h2>Размеры изображений</h2>
							<table class="form">
								<tr>
									<td style="width:15%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF"><?php echo $entry_image_category; ?></span></p>

										<input type="number" name="config_image_category_width" value="<?php echo $config_image_category_width; ?>" size="50" style="width:100px;" />
										x
										<input type="number" name="config_image_category_height" value="<?php echo $config_image_category_height; ?>" size="50" style="width:100px;" />
									</td>

									<td style="width:15%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Изображения подкатегорий</span></p>

										<input type="number" name="config_image_subcategory_width" value="<?php echo $config_image_subcategory_width; ?>" size="50" style="width:100px;" />
										x
										<input type="number" name="config_image_subcategory_height" value="<?php echo $config_image_subcategory_height; ?>" size="50" style="width:100px;" />
									</td>

									<td style="width:15%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF"><?php echo $entry_image_thumb; ?></span></p>

										<input type="number" name="config_image_thumb_width" value="<?php echo $config_image_thumb_width; ?>" size="50" style="width:100px;" />
										x
										<input type="number" name="config_image_thumb_height" value="<?php echo $config_image_thumb_height; ?>" size="50" style="width:100px;" />
									</td>

									<td style="width:15%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF"><?php echo $entry_image_popup; ?></span></p>

										<input type="number" name="config_image_popup_width" value="<?php echo $config_image_popup_width; ?>" size="50" style="width:100px;" />
										x
										<input type="number" name="config_image_popup_height" value="<?php echo $config_image_popup_height; ?>" size="50" style="width:100px;" />
									</td>

									<td style="width:15%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF"><?php echo $entry_image_product; ?></span></p>

										<input type="number" name="config_image_product_width" value="<?php echo $config_image_product_width; ?>" size="50" style="width:100px;" />
										x
										<input type="number" name="config_image_product_height" value="<?php echo $config_image_product_height; ?>" size="50" style="width:100px;" />
									</td>

									<td style="width:15%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF"><?php echo $entry_image_additional; ?></span></p>

										<input type="number" name="config_image_additional_width" value="<?php echo $config_image_additional_width; ?>" size="50" style="width:100px;" />
										x
										<input type="number" name="config_image_additional_height" value="<?php echo $config_image_additional_height; ?>" size="50" style="width:100px;" />
									</td>

								

								</tr>
								<tr>

									<td style="width:15%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF"><?php echo $entry_image_related; ?></span></p>

										<input type="number" name="config_image_related_width" value="<?php echo $config_image_related_width; ?>" size="50" style="width:100px;" />
										x
										<input type="number" name="config_image_related_height" value="<?php echo $config_image_related_height; ?>" size="50" style="width:100px;" />
									</td>

									<td style="width:15%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF"><?php echo $entry_image_compare; ?></span></p>

										<input type="number" name="config_image_compare_width" value="<?php echo $config_image_compare_width; ?>" size="50" style="width:100px;" />
										x
										<input type="number" name="config_image_compare_height" value="<?php echo $config_image_compare_height; ?>" size="50" style="width:100px;" />
									</td>

									<td style="width:15%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF"><?php echo $entry_image_wishlist; ?></span></p>

										<input type="number" name="config_image_wishlist_width" value="<?php echo $config_image_wishlist_width; ?>" size="50" style="width:100px;" />
										x
										<input type="number" name="config_image_wishlist_height" value="<?php echo $config_image_wishlist_height; ?>" size="50" style="width:100px;" />
									</td>


									<td style="width:15%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF"><?php echo $entry_image_wishlist; ?></span></p>

										<input type="number" name="config_image_cart_width" value="<?php echo $config_image_cart_width; ?>" size="50" style="width:100px;" />
										x
										<input type="number" name="config_image_cart_height" value="<?php echo $config_image_cart_height; ?>" size="50" style="width:100px;"  />
									</td>
								</tr>
							</table>
						</div>						
						<div id="tab-mail">
							<h2>Сервисные почтовые аккаунты и домены</h2>

							<table class="form">
								<tr>
									<td width="20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Payment Mail FROM</span></p>
										<input type="text" name="config_payment_mail_from" value="<?php echo $config_payment_mail_from; ?>" size="30" style="width:250px;" />										
										<span class="help">отправлять уведомления оплаты с этой почты</span>
									</td>

									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Payment Mail TO</span></p>
										<input type="text" name="config_payment_mail_to" value="<?php echo $config_payment_mail_to; ?>" size="30" style="width:250px;" />
										<span class="help">отправлять уведомления оплаты на эту почту</span>									
									</td>

									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Courier Mail TO</span></p>
										<input type="text" name="config_courier_mail_to" value="<?php echo $config_courier_mail_to; ?>" size="30" style="width:250px;" />
										<span class="help">отправлять уведомления курьеру на эту почту</span>									
									</td>

									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Центральный домен редиректов</span></p>
										<input type="text" name="config_main_redirect_domain" value="<?php echo $config_main_redirect_domain; ?>" size="30" style="width:250px;" />	
										<span class="help">с геолокацией, блекджеком и шлюхами</span>	
									</td>

									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">WP-блог, если есть</span></p>
										<input type="text" name="config_main_wp_blog_domain" value="<?php echo $config_main_wp_blog_domain; ?>" size="30" style="width:250px;" />
										<span class="help">солидный современный ресурс</span>		
									</td>
								</tr>
							</table>

							<h2>Отправка почты</h2>

							<table class="form">
								<tr>		
									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Протокол для транзакций</span></p>
										<select name="config_mail_protocol">
										<?php if ($config_mail_protocol == 'mail') { ?>
											<option value="mail" selected="selected"><?php echo $text_mail; ?></option>
											<?php } else { ?>
											<option value="mail"><?php echo $text_mail; ?></option>
										<?php } ?>
										<?php if ($config_mail_protocol == 'smtp') { ?>
											<option value="smtp" selected="selected"><?php echo $text_smtp; ?></option>
											<?php } else { ?>
											<option value="smtp"><?php echo $text_smtp; ?></option>
										<?php } ?>
										<?php if ($config_mail_protocol == 'sparkpost') { ?>
											<option value="sparkpost" selected="selected">СпаркПост веб апи</option>
											<?php } else { ?>
											<option value="sparkpost">СпаркПост веб апи</option>
										<?php } ?>
										<?php if ($config_mail_protocol == 'mailgun') { ?>
											<option value="mailgun" selected="selected">MailGun веб апи</option>
											<?php } else { ?>
											<option value="mailgun">MailGun веб апи</option>
										<?php } ?>
									</select>
									</td>

									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Протокол для триггеров</span></p>
										<select name="config_mail_trigger_protocol">
										<?php if ($config_mail_trigger_protocol == 'mail') { ?>
											<option value="mail" selected="selected"><?php echo $text_mail; ?></option>
										<?php } else { ?>
											<option value="mail"><?php echo $text_mail; ?></option>
										<?php } ?>
										<?php if ($config_mail_trigger_protocol == 'smtp') { ?>
											<option value="smtp" selected="selected"><?php echo $text_smtp; ?></option>
										<?php } else { ?>
											<option value="smtp"><?php echo $text_smtp; ?></option>
										<?php } ?>
										<?php if ($config_mail_trigger_protocol == 'sparkpost') { ?>
											<option value="sparkpost" selected="selected">СпаркПост веб апи</option>
										<?php } else { ?>
											<option value="sparkpost">СпаркПост веб апи</option>
										<?php } ?>
										<?php if ($config_mail_trigger_protocol == 'mailgun') { ?>
											<option value="mailgun" selected="selected">MailGun веб апи</option>
										<?php } else { ?>
											<option value="mailgun">MailGun веб апи</option>
										<?php } ?>
									</select></td>

									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Имя отправителя</span></p>
										<input type="text" name="config_mail_trigger_name_from" value="<?php echo $config_mail_trigger_name_from; ?>" size="50" />								
									</td>
									
									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Почта отправителя</span></p>
										<input type="text" name="config_mail_trigger_mail_from" value="<?php echo $config_mail_trigger_mail_from; ?>" size="50" />								
									</td>
								</tr>
							</table>


							<h2>Интерграция с SparkPost</h2>
							
							<table class="form">
								<tr>
									<td>Включить синхронизацию Suppression List из SparkPost</td>
									<td>
										<select name="config_sparkpost_bounce_enable">
											<?php if ($config_sparkpost_bounce_enable) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
												<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
									</td>

									<tr>
										<td>SparkPost API URL (EU/US)</td>
										<td>
											<input type="text" name="config_sparkpost_api_url" value="<?php echo $config_sparkpost_api_url; ?>" size="50" />								
										</td>
									</tr>
									
									<tr>
										<td>API Ключ SparkPost</td>
										<td>
											<input type="text" name="config_sparkpost_api_key" value="<?php echo $config_sparkpost_api_key; ?>" size="50" />								
										</td>
									</tr>

									<tr>
										<td>API USER SparkPost</td>
										<td>
											<input type="text" name="config_sparkpost_api_user" value="<?php echo $config_sparkpost_api_user; ?>" size="50" />								
										</td>
									</tr>
							</table>

							<h2>Интерграция с MailGun</h2>

							<table class="form">
									<td>Включить синхронизацию Suppression List из MailGun</td>
									<td>
										<select name="config_mailgun_bounce_enable">
											<?php if ($config_mailgun_bounce_enable) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
												<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
									</td>

									<tr>
										<td>Домен для транзакционных</td>
										<td>
											<input type="text" name="config_mailgun_api_transaction_domain" value="<?php echo $config_mailgun_api_transaction_domain; ?>" size="50" />								
										</td>
									</tr>

									<tr>
										<td>MailGun API URL (EU/US)</td>
										<td>
											<input type="text" name="config_mailgun_api_url" value="<?php echo $config_mailgun_api_url; ?>" size="50" />								
										</td>
									</tr>

									<tr>
										<td>Public API Ключ MailGun</td>
										<td>
											<input type="text" name="config_mailgun_api_public_key" value="<?php echo $config_mailgun_api_public_key; ?>" size="50" />								
										</td>
									</tr>

									<tr>
										<td>Private API Ключ MailGun</td>
										<td>
											<input type="text" name="config_mailgun_api_private_key" value="<?php echo $config_mailgun_api_private_key; ?>" size="50" />								
										</td>
									</tr>

									<tr>
										<td>Signing Ключ MailGun</td>
										<td>
											<input type="text" name="config_mailgun_api_signing_key" value="<?php echo $config_mailgun_api_signing_key; ?>" size="50" />								
										</td>
									</tr>

									<tr>
										<td>Лимит писем MailGun</td>
										<td>
											<input type="text" name="config_mailgun_mail_limit" value="<?php echo $config_mailgun_mail_limit; ?>" size="50" />								
										</td>
									</tr>
								</tr>
							</table>

							
							
							
							<h2>Интерграция с MailWizz EMA</h2>
							<table class="form">
								<tr>
									<td>Включить MailWizz EMA API</td>
									<td>
										<select name="config_mailwizz_enable">
											<?php if ($config_mailwizz_enable) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
												<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
									</td>
								</tr>
								
								<tr>
									<td>API URI</td>
									<td>
										<input type="text" name="config_mailwizz_api_uri" value="<?php echo $config_mailwizz_api_uri; ?>" size="50" />								
									</td>
								</tr>
								
								<tr>
									<td>API Ключ</td>
									<td>
										<input type="text" name="config_mailwizz_api_key" value="<?php echo $config_mailwizz_api_key; ?>" size="50" />								
									</td>
								</tr>
								
								<tr>
									<td>Лист - 1</td>
									<td>
										<input type="text" name="config_mailwizz_mapping_newsletter_news" value="<?php echo $config_mailwizz_mapping_newsletter_news; ?>" size="50" />
										<br />
										<span class="help">Новости, акции компании</span>								
									</td>
								</tr>
								
								<tr>
									<td>Лист - 2</td>
									<td>
										<input type="text" name="config_mailwizz_mapping_newsletter" value="<?php echo $config_mailwizz_mapping_newsletter; ?>" size="50" />
										<br />
										<span class="help">Информация об акциях, промокодах и скидках</span>								
									</td>
								</tr>
								
								<tr>
									<td>Лист - 3</td>
									<td>
										<input type="text" name="config_mailwizz_mapping_newsletter_personal" value="<?php echo $config_mailwizz_mapping_newsletter_personal; ?>" size="50" />
										<br />
										<span class="help">Персональные рекомендации</span>								
									</td>
								</tr>

								<tr>
									<td>Нативный домен</td>
									<td>
										<input type="text" name="config_mailwizz_exclude_native" value="<?php echo $config_mailwizz_exclude_native; ?>" size="50" />
										<br />
										<span class="help">исключать мейлы с вхождением</span>								
									</td>
								</tr>

								<tr>
									<td>Количество дней</td>
									<td>
										<input type="number" name="config_mailwizz_noorder_days" value="<?php echo $config_mailwizz_noorder_days; ?>" step="1" />
										<br />
										<span class="help">количество дней без заказов для рассылки с информацией о количестве бонусов</span>								
									</td>
								</tr>
							</table>
							
							<h2>Настройки SendMail</h2>
							<table class="form">
								<tr>
									<td>Параметры функции mail</td>
									<td><input type="text" name="config_mail_parameter" value="<?php echo $config_mail_parameter; ?>" style="width:300px;" /></td>
								</tr>
								<tr>
									<td><?php echo $entry_smtp_host; ?></td>
									<td><input type="text" name="config_smtp_host" value="<?php echo $config_smtp_host; ?>" style="width:300px;" /></td>
								</tr>
								<tr>
									<td><?php echo $entry_smtp_username; ?></td>
									<td><input type="text" name="config_smtp_username" value="<?php echo $config_smtp_username; ?>" style="width:300px;" /></td>
								</tr>
								<tr>
									<td><?php echo $entry_smtp_password; ?></td>
									<td><input type="text" name="config_smtp_password" value="<?php echo $config_smtp_password; ?>" style="width:300px;" /></td>
								</tr>
								<tr>
									<td><?php echo $entry_smtp_port; ?></td>
									<td><input type="text" name="config_smtp_port" value="<?php echo $config_smtp_port; ?>" /></td>
								</tr>
								<tr>
									<td><?php echo $entry_smtp_timeout; ?></td>
									<td><input type="text" name="config_smtp_timeout" value="<?php echo $config_smtp_timeout; ?>" /></td>
								</tr>
								<tr>
									<td><?php echo $entry_alert_mail; ?></td>
									<td><?php if ($config_alert_mail) { ?>
										<input type="radio" name="config_alert_mail" value="1" checked="checked" />
										<?php echo $text_yes; ?>
										<input type="radio" name="config_alert_mail" value="0" />
										<?php echo $text_no; ?>
										<?php } else { ?>
										<input type="radio" name="config_alert_mail" value="1" />
										<?php echo $text_yes; ?>
										<input type="radio" name="config_alert_mail" value="0" checked="checked" />
										<?php echo $text_no; ?>
									<?php } ?></td>
								</tr>
								<tr>
									<td><?php echo $entry_account_mail; ?></td>
									<td><?php if ($config_account_mail) { ?>
										<input type="radio" name="config_account_mail" value="1" checked="checked" />
										<?php echo $text_yes; ?>
										<input type="radio" name="config_account_mail" value="0" />
										<?php echo $text_no; ?>
										<?php } else { ?>
										<input type="radio" name="config_account_mail" value="1" />
										<?php echo $text_yes; ?>
										<input type="radio" name="config_account_mail" value="0" checked="checked" />
										<?php echo $text_no; ?>
									<?php } ?></td>
								</tr>
								<tr>
									<td><?php echo $entry_alert_emails; ?></td>
									<td><textarea name="config_alert_emails" cols="40" rows="5"><?php echo $config_alert_emails; ?></textarea></td>
								</tr>
							</table>
						</div>

						<div id="tab-viber" <?php if (!$config_smsgate_library_enable_viber) { ?>style="display:none;"<?php } ?>>
							<table class="list">
								<tr>
									<td style="width:200px;">
										<span class="status_color" style="text-align: left; background: #43B02A; color:#fff">
											Уведомление о новом заказе
										</span>
									</td>
									<td style="width:50px" class="center">
										<input class="checkbox" type="checkbox" name="config_viber_send_new_order" id="config_viber_send_new_order" <?php if ($config_viber_send_new_order) { echo ' checked="checked"'; }?> />
										<label for="config_viber_send_new_order"></label>
									</td>
									<td style="width:300px;">
										<p>
											<span class="status_color" style="display:inline-block; padding:3px 5px; text-align: left; background: #43B02A; color:#fff">
												Текст
											</span>
										</p>

										<textarea name="config_viber_new_order_message" cols="50" rows="7"><?php echo $config_viber_new_order_message; ?></textarea>
									</td>
									<td style="width:250px;">
										<div class="image">
											<img src="<?php echo $viber_new_order_image; ?>" alt="" id="thumb-viber_new_order_image" height="150px" />
											<input type="text" style="font-size:10px; width:150px;" class="image-ajax" name="config_viber_new_order_image" value="<?php echo $config_viber_new_order_image; ?>" id="viber_new_order_image" />
											<br />
											<a onclick="image_upload('viber_new_order_image', 'thumb-viber_new_order_image');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb-viber_new_order_image').attr('src', '<?php echo $no_image; ?>'); $('#viber_new_order_image').attr('value', ''); $('#viber_new_order_image').trigger('change');"><?php echo $text_clear; ?></a>
										</div>
									</td>
									<td style="width:200px;">
										<p>
											<span class="status_color" style="display:inline-block; padding:3px 5px; text-align: left; background: #43B02A; color:#fff">
												Текст кнопки
											</span>
										</p>

										<textarea name="config_viber_new_order_button_text" cols="50" rows="7"><?php echo $config_viber_new_order_button_text; ?></textarea>
									</td>
									<td style="width:200px;">
										<p>
											<span class="status_color" style="display:inline-block; padding:3px 5px; text-align: left; background: #43B02A; color:#fff">
												URL кнопки
											</span>
										</p>

										<textarea name="config_viber_new_order_button_url" cols="50" rows="7"><?php echo $config_viber_new_order_button_url; ?></textarea>
									</td>
								</tr>

								<?php foreach ($order_statuses as $order_status) { ?>
									<?php 
										$viber_status_message = [];
										if (isset($config_viber_order_status_message[$order_status['order_status_id']])) {
											$viber_status_message = $config_viber_order_status_message[$order_status['order_status_id']];
										} 
									?>
									<tr>
										<td style="width:200px;">
											<span class="status_color" style="text-align: left; background: #<?php echo !empty($order_status['status_bg_color']) ? $order_status['status_bg_color'] : ''; ?>; color: #<?php echo !empty($order_status['status_txt_color']) ? $order_status['status_txt_color'] : ''; ?>;">
												<?php echo $order_status['name']; ?>
											</span>
										</td>

										<td style="width:50px" class="center">
											<input data-key="config_viber_order_status_message" data-id="<?php echo $order_status['order_status_id']; ?>" data-name="enabled" class="checkbox" type="checkbox" name="config_viber_order_status_message[<?php echo $order_status['order_status_id']; ?>][enabled]" id="config_viber_order_status_message[<?php echo $order_status['order_status_id']; ?>][enabled]" <?php if (isset($viber_status_message['enabled']) && $viber_status_message['enabled']) { echo ' checked="checked"'; }?>/>
											<label for="config_viber_order_status_message[<?php echo $order_status['order_status_id']; ?>][enabled]"></label>
										</td>
										<td style="width:300px;">
											<textarea data-key="config_viber_order_status_message" data-id="<?php echo $order_status['order_status_id']; ?>" data-name="message" name="config_viber_order_status_message[<?php echo $order_status['order_status_id']; ?>][message]" cols="50" rows="7"><?php echo isset($viber_status_message['message']) ? $viber_status_message['message'] : ""; ?></textarea>
										</td>

										<td>

											<div class="image">
												<img src="<?php echo $viber_order_status_message_image[$order_status['order_status_id']]; ?>" alt="" id="thumb-viber_order_status_message_image_<?php echo $order_status['order_status_id']; ?>" height="150px" />

												<input data-key="config_viber_order_status_message" data-id="<?php echo $order_status['order_status_id']; ?>" data-name="image" type="text" style="font-size:10px; width:150;" class="image-ajax" name="config_viber_order_status_message[<?php echo $order_status['order_status_id']; ?>][image]" value="<?php echo isset($viber_status_message['image']) ? $viber_status_message['image'] : ""; ?>" id="viber_order_status_message_image_<?php echo $order_status['order_status_id']; ?>" />
												<br />

												<a onclick="image_upload('viber_order_status_message_image_<?php echo $order_status['order_status_id']; ?>', 'thumb-viber_order_status_message_image_<?php echo $order_status['order_status_id']; ?>');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;
												<a onclick="$('#thumb-viber_order_status_message_image_<?php echo $order_status['order_status_id']; ?>').attr('src', '<?php echo $no_image; ?>'); $('#viber_order_status_message_image_<?php echo $order_status['order_status_id']; ?>').attr('value', ''); $('#viber_order_status_message_image_<?php echo $order_status['order_status_id']; ?>').trigger('change');"><?php echo $text_clear; ?></a>
											</div>

										</td>

										<td style="width:200px;">
											<p>
												<span class="status_color" style="display:inline-block; padding:3px 5px; text-align: left; background: #43B02A; color:#fff">
													Текст кнопки
												</span>
											</p>

											<textarea data-key="config_viber_order_status_message" data-id="<?php echo $order_status['order_status_id']; ?>" data-name="button_text" name="config_viber_order_status_message[<?php echo $order_status['order_status_id']; ?>][button_text]" cols="50" rows="7"><?php echo isset($viber_status_message['button_text']) ? $viber_status_message['button_text'] : ""; ?></textarea>
										</td>
										<td style="width:200px;">
											<p>
												<span class="status_color" style="display:inline-block; padding:3px 5px; text-align: left; background: #43B02A; color:#fff">
													URL кнопки
												</span>
											</p>

											<textarea data-key="config_viber_order_status_message" data-id="<?php echo $order_status['order_status_id']; ?>" data-name="button_url" name="config_viber_order_status_message[<?php echo $order_status['order_status_id']; ?>][button_url]" cols="50" rows="7"><?php echo isset($viber_status_message['button_url']) ? $viber_status_message['button_url'] : ""; ?></textarea>
										</td>
									</tr>										
								<?php } ?>


								<tr>
									<td style="width:200px;">
										<span class="status_color" style="text-align: left; background: #43B02A; color:#fff">
											Трекинг отправки со склада 
										</span>
									</td>
									<td style="width:50px" class="center">
										<input class="checkbox" type="checkbox" name="config_viber_tracker_leave_main_warehouse_enabled" id="config_viber_tracker_leave_main_warehouse_enabled" <?php if ($config_viber_tracker_leave_main_warehouse_enabled) { echo ' checked="checked"'; }?> />
										<label for="config_viber_tracker_leave_main_warehouse_enabled"></label>
									</td>
									<td style="width:300px;">
										<p>
											<span class="status_color" style="display:inline-block; padding:3px 5px; text-align: left; background: #43B02A; color:#fff">
												Текст
											</span>
										</p>

										<textarea name="config_viber_tracker_leave_main_warehouse" cols="50" rows="7"><?php echo $config_viber_tracker_leave_main_warehouse; ?></textarea>
									</td>
									<td style="width:250px;">
										<div class="image">
											<img src="<?php echo $viber_tracker_leave_main_warehouse_image; ?>" alt="" id="thumb-viber_tracker_leave_main_warehouse_image" height="150px" />
											<input type="text" style="font-size:10px; width:150;" class="image-ajax" name="config_viber_tracker_leave_main_warehouse_image" value="<?php echo $config_viber_tracker_leave_main_warehouse_image; ?>" id="viber_tracker_leave_main_warehouse_image" />
											<br />
											<a onclick="image_upload('viber_tracker_leave_main_warehouse_image', 'thumb-viber_tracker_leave_main_warehouse_image');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb-viber_tracker_leave_main_warehouse_image').attr('src', '<?php echo $no_image; ?>'); $('#viber_tracker_leave_main_warehouse_image').attr('value', ''); $('#viber_tracker_leave_main_warehouse_image').trigger('change');"><?php echo $text_clear; ?></a>
										</div>
									</td>
									<td style="width:200px;">
										<p>
											<span class="status_color" style="display:inline-block; padding:3px 5px; text-align: left; background: #43B02A; color:#fff">
												Текст кнопки
											</span>
										</p>

										<textarea name="config_viber_tracker_leave_main_warehouse_button_text" cols="50" rows="7"><?php echo $config_viber_tracker_leave_main_warehouse_button_text; ?></textarea>
									</td>
									<td style="width:200px;">
										<p>
											<span class="status_color" style="display:inline-block; padding:3px 5px; text-align: left; background: #43B02A; color:#fff">
												URL кнопки
											</span>
										</p>

										<textarea name="config_viber_tracker_leave_main_warehouse_button_url" cols="50" rows="7"><?php echo $config_viber_tracker_leave_main_warehouse_button_url; ?></textarea>
									</td>
								</tr>

								<tr>
									<td style="width:200px;">
										<span class="status_color" style="text-align: left; background: #000; color:#fff">
											Успешная оплата
										</span>
									</td>
									<td style="width:50px" class="center">
										<input class="checkbox" type="checkbox" name="config_viber_payment_recieved_enabled" id="config_viber_payment_recieved_enabled" <?php if ($config_viber_payment_recieved_enabled) { echo ' checked="checked"'; }?> />
										<label for="config_viber_payment_recieved_enabled"></label>
									</td>
									<td style="width:300px;">
										<p>
											<span class="status_color" style="display:inline-block; padding:3px 5px; text-align: left; background: #43B02A; color:#fff">
												Текст
											</span>
										</p>

										<textarea name="config_viber_payment_recieved" cols="50" rows="7"><?php echo $config_viber_payment_recieved; ?></textarea>
									</td>
									<td style="width:250px;">
										<div class="image">
											<img src="<?php echo $viber_payment_recieved_image; ?>" alt="" id="thumb-viber_payment_recieved_image" height="150px" />
											<input type="text" style="font-size:10px; width:150px;" class="image-ajax" name="config_viber_payment_recieved_image" value="<?php echo $config_viber_payment_recieved_image; ?>" id="viber_payment_recieved_image" />
											<br />
											<a onclick="image_upload('viber_payment_recieved_image', 'thumb-viber_payment_recieved_image');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb-viber_payment_recieved_image').attr('src', '<?php echo $no_image; ?>'); $('#viber_payment_recieved_image').attr('value', ''); $('#viber_payment_recieved_image').trigger('change');"><?php echo $text_clear; ?></a>
										</div>
									</td>
									<td style="width:200px;">
										<p>
											<span class="status_color" style="display:inline-block; padding:3px 5px; text-align: left; background: #43B02A; color:#fff">
												Текст кнопки
											</span>
										</p>

										<textarea name="config_viber_payment_recieved_button_text" cols="50" rows="7"><?php echo $config_viber_payment_recieved_button_text; ?></textarea>
									</td>
									<td style="width:200px;">
										<p>
											<span class="status_color" style="display:inline-block; padding:3px 5px; text-align: left; background: #43B02A; color:#fff">
												URL кнопки
											</span>
										</p>

										<textarea name="config_viber_payment_recieved_button_url" cols="50" rows="7"><?php echo $config_viber_payment_recieved_button_url; ?></textarea>
									</td>
								</tr>

								<tr>
									<td style="width:200px;">
										<span class="status_color" style="text-align: left; background: #ef5e67; color:#fff">
											ТТН службы доставки: отправка 
										</span>
									</td>
									<td style="width:50px" class="center">
										<input class="checkbox" type="checkbox" name="config_viber_ttn_sent_enabled" id="config_viber_ttn_sent_enabled" <?php if ($config_viber_ttn_sent_enabled) { echo ' checked="checked"'; }?> />
										<label for="config_viber_ttn_sent_enabled"></label>
									</td>
									<td style="width:300px;">
										<p>
											<span class="status_color" style="display:inline-block; padding:3px 5px; text-align: left; background: #43B02A; color:#fff">
												Текст
											</span>
										</p>

										<textarea name="config_viber_ttn_sent" cols="50" rows="7"><?php echo $config_viber_ttn_sent; ?></textarea>
									</td>
									<td style="width:250px;">
										<div class="image">
											<img src="<?php echo $viber_ttn_sent_image; ?>" alt="" id="thumb-viber_ttn_sent_image" height="150px" />
											<input type="text" style="font-size:10px; width:150px;" class="image-ajax" name="config_viber_ttn_sent_image" value="<?php echo $config_viber_ttn_sent_image; ?>" id="viber_ttn_sent_image" />
											<br />
											<a onclick="image_upload('viber_ttn_sent_image', 'thumb-viber_ttn_sent_image');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb-viber_ttn_sent_image').attr('src', '<?php echo $no_image; ?>'); $('#viber_ttn_sent_image').attr('value', ''); $('#viber_ttn_sent_image').trigger('change');"><?php echo $text_clear; ?></a>
										</div>
									</td>
									<td style="width:200px;">
										<p>
											<span class="status_color" style="display:inline-block; padding:3px 5px; text-align: left; background: #43B02A; color:#fff">
												Текст кнопки
											</span>
										</p>

										<textarea name="config_viber_ttn_sent_button_text" cols="50" rows="7"><?php echo $config_viber_ttn_sent_button_text; ?></textarea>
									</td>
									<td style="width:200px;">
										<p>
											<span class="status_color" style="display:inline-block; padding:3px 5px; text-align: left; background: #43B02A; color:#fff">
												URL кнопки
											</span>
										</p>

										<textarea name="config_viber_ttn_sent_button_url" cols="50" rows="7"><?php echo $config_viber_ttn_sent_button_url; ?></textarea>
									</td>
								</tr>

								<tr>
									<td style="width:200px;">
										<span class="status_color" style="text-align: left; background: #43B02A; color:#fff">
											ТТН службы доставки: доставлено
										</span>
									</td>
									<td style="width:50px" class="center">
										<input class="checkbox" type="checkbox" name="config_viber_ttn_ready_enabled" id="config_viber_ttn_ready_enabled" <?php if ($config_viber_ttn_ready_enabled) { echo ' checked="checked"'; }?> />
										<label for="config_viber_ttn_ready_enabled"></label>
									</td>
									<td style="width:300px;">
										<p>
											<span class="status_color" style="display:inline-block; padding:3px 5px; text-align: left; background: #43B02A; color:#fff">
												Текст
											</span>
										</p>

										<textarea name="config_viber_ttn_ready" cols="50" rows="7"><?php echo $config_viber_ttn_ready; ?></textarea>
									</td>
									<td style="width:250px;">
										<div class="image">
											<img src="<?php echo $viber_ttn_ready_image; ?>" alt="" id="thumb-viber_ttn_ready_image" height="150px" />
											<input type="text" style="font-size:10px; width:150px;" class="image-ajax" name="config_viber_ttn_ready_image" value="<?php echo $config_viber_ttn_ready_image; ?>" id="viber_ttn_ready_image" />
											<br />
											<a onclick="image_upload('viber_ttn_ready_image', 'thumb-viber_ttn_ready_image');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb-viber_ttn_ready_image').attr('src', '<?php echo $no_image; ?>'); $('#viber_ttn_ready_image').attr('value', ''); $('#viber_ttn_ready_image').trigger('change');"><?php echo $text_clear; ?></a>
										</div>
									</td>
									<td style="width:200px;">
										<p>
											<span class="status_color" style="display:inline-block; padding:3px 5px; text-align: left; background: #43B02A; color:#fff">
												Текст кнопки
											</span>
										</p>

										<textarea name="config_viber_ttn_ready_button_text" cols="50" rows="7"><?php echo $config_viber_ttn_ready_button_text; ?></textarea>
									</td>
									<td style="width:200px;">
										<p>
											<span class="status_color" style="display:inline-block; padding:3px 5px; text-align: left; background: #43B02A; color:#fff">
												URL кнопки
											</span>
										</p>

										<textarea name="config_viber_ttn_ready_button_url" cols="50" rows="7"><?php echo $config_viber_ttn_ready_button_url; ?></textarea>
									</td>
								</tr>

								<tr>
									<td style="width:200px;">
										<span class="status_color" style="text-align: left; background: #ef5e67; color:#fff">
											Уведомление о сгорании бонусов  
										</span>
									</td>
									<td style="width:50px" class="center">
										<input class="checkbox" type="checkbox" name="config_viber_rewardpoints_reminder_enabled" id="config_viber_rewardpoints_reminder_enabled" <?php if ($config_viber_rewardpoints_reminder_enabled) { echo ' checked="checked"'; }?> />
										<label for="config_viber_rewardpoints_reminder_enabled"></label>
									</td>
									<td style="width:300px;">
										<p>
											<span class="status_color" style="display:inline-block; padding:3px 5px; text-align: left; background: #43B02A; color:#fff">
												Текст
											</span>
										</p>

										<textarea name="config_viber_rewardpoints_reminder" cols="50" rows="7"><?php echo $config_viber_rewardpoints_reminder; ?></textarea>
									</td>
									<td style="width:250px;">
										<div class="image">
											<img src="<?php echo $viber_rewardpoints_reminder_image; ?>" alt="" id="thumb-viber_rewardpoints_reminder_image" height="150px" />
											<input type="text" style="font-size:10px; width:150px;" class="image-ajax" name="config_viber_rewardpoints_reminder_image" value="<?php echo $config_viber_rewardpoints_reminder_image; ?>" id="viber_rewardpoints_reminder_image" />
											<br />
											<a onclick="image_upload('viber_rewardpoints_reminder_image', 'thumb-viber_rewardpoints_reminder_image');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb-viber_rewardpoints_reminder_image').attr('src', '<?php echo $no_image; ?>'); $('#viber_rewardpoints_reminder_image').attr('value', ''); $('#viber_rewardpoints_reminder_image').trigger('change');"><?php echo $text_clear; ?></a>
										</div>
									</td>
									<td style="width:200px;">
										<p>
											<span class="status_color" style="display:inline-block; padding:3px 5px; text-align: left; background: #43B02A; color:#fff">
												Текст кнопки
											</span>
										</p>

										<textarea name="config_viber_rewardpoints_reminder_button_text" cols="50" rows="7"><?php echo $config_viber_rewardpoints_reminder_button_text; ?></textarea>
									</td>
									<td style="width:200px;">
										<p>
											<span class="status_color" style="display:inline-block; padding:3px 5px; text-align: left; background: #43B02A; color:#fff">
												URL кнопки
											</span>
										</p>

										<textarea name="config_viber_rewardpoints_reminder_button_url" cols="50" rows="7"><?php echo $config_viber_rewardpoints_reminder_button_url; ?></textarea>
									</td>
								</tr>

								<tr>
                                    <td style="width:200px;">
                                        <span class="status_color" style="text-align: left; background: #ff7f00; color:#fff">
                                            SMS о ручной транзакции. Успешная оплата.
                                        </span>
                                    </td>
                                    <td style="width:50px" class="center">                                      
                                    </td>
                                    <td style="width:300px;">
                                        <p>
                                            <span class="status_color" style="display:inline-block; padding:3px 5px; text-align: left; background: #43B02A; color:#fff">
                                                Текст
                                            </span>
                                        </p>

                                        <textarea name="config_viber_transaction_text_type_1" cols="50" rows="7"><?php echo $config_viber_transaction_text_type_1; ?></textarea>
                                    </td>
                                    <td style="width:250px;">
                                        <div class="image">
                                            <img src="<?php echo $viber_transaction_text_type_1_image; ?>" alt="" id="thumb-viber_transaction_text_type_1_image" height="150px" />
                                            <input type="text" style="font-size:10px; width:150px;" class="image-ajax" name="config_viber_transaction_text_type_1_image" value="<?php echo $config_viber_transaction_text_type_1_image; ?>" id="viber_transaction_text_type_1_image" />
                                            <br />
                                            <a onclick="image_upload('viber_transaction_text_type_1_image', 'thumb-viber_transaction_text_type_1_image');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb-viber_transaction_text_type_1_image').attr('src', '<?php echo $no_image; ?>'); $('#viber_transaction_text_type_1_image').attr('value', ''); $('#viber_transaction_text_type_1_image').trigger('change');"><?php echo $text_clear; ?></a>
                                        </div>
                                    </td>
                                    <td style="width:200px;">
                                        <p>
                                            <span class="status_color" style="display:inline-block; padding:3px 5px; text-align: left; background: #43B02A; color:#fff">
                                                Текст кнопки
                                            </span>
                                        </p>

                                        <textarea name="config_viber_transaction_text_type_1_button_text" cols="50" rows="7"><?php echo $config_viber_transaction_text_type_1_button_text; ?></textarea>
                                    </td>
                                    <td style="width:200px;">
                                        <p>
                                            <span class="status_color" style="display:inline-block; padding:3px 5px; text-align: left; background: #43B02A; color:#fff">
                                                URL кнопки
                                            </span>
                                        </p>

                                        <textarea name="config_viber_transaction_text_type_1_button_url" cols="50" rows="7"><?php echo $config_viber_transaction_text_type_1_button_url; ?></textarea>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="width:200px;">
                                        <span class="status_color" style="text-align: left; background: #ff7f00; color:#fff">
                                            SMS о ручной транзакции. Возврат безналичный
                                        </span>
                                    </td>
                                    <td style="width:50px" class="center">                                      
                                    </td>
                                    <td style="width:300px;">
                                        <p>
                                            <span class="status_color" style="display:inline-block; padding:3px 5px; text-align: left; background: #43B02A; color:#fff">
                                                Текст
                                            </span>
                                        </p>

                                        <textarea name="config_viber_transaction_text_type_2" cols="50" rows="7"><?php echo $config_viber_transaction_text_type_2; ?></textarea>
                                    </td>
                                    <td style="width:250px;">
                                        <div class="image">
                                            <img src="<?php echo $viber_transaction_text_type_2_image; ?>" alt="" id="thumb-viber_transaction_text_type_2_image" height="150px" />
                                            <input type="text" style="font-size:10px; width:150px;" class="image-ajax" name="config_viber_transaction_text_type_2_image" value="<?php echo $config_viber_transaction_text_type_2_image; ?>" id="viber_transaction_text_type_2_image" />
                                            <br />
                                            <a onclick="image_upload('viber_transaction_text_type_2_image', 'thumb-viber_transaction_text_type_2_image');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb-viber_transaction_text_type_2_image').attr('src', '<?php echo $no_image; ?>'); $('#viber_transaction_text_type_2_image').attr('value', ''); $('#viber_transaction_text_type_2_image').trigger('change');"><?php echo $text_clear; ?></a>
                                        </div>
                                    </td>
                                    <td style="width:200px;">
                                        <p>
                                            <span class="status_color" style="display:inline-block; padding:3px 5px; text-align: left; background: #43B02A; color:#fff">
                                                Текст кнопки
                                            </span>
                                        </p>

                                        <textarea name="config_viber_transaction_text_type_2_button_text" cols="50" rows="7"><?php echo $config_viber_transaction_text_type_2_button_text; ?></textarea>
                                    </td>
                                    <td style="width:200px;">
                                        <p>
                                            <span class="status_color" style="display:inline-block; padding:3px 5px; text-align: left; background: #43B02A; color:#fff">
                                                URL кнопки
                                            </span>
                                        </p>

                                        <textarea name="config_viber_transaction_text_type_2_button_url" cols="50" rows="7"><?php echo $config_viber_transaction_text_type_2_button_url; ?></textarea>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="width:200px;">
                                        <span class="status_color" style="text-align: left; background: #ff7f00; color:#fff">
                                            SMS о ручной транзакции. Возврат остальное 
                                        </span>
                                    </td>
                                    <td style="width:50px" class="center">                                      
                                    </td>
                                    <td style="width:300px;">
                                        <p>
                                            <span class="status_color" style="display:inline-block; padding:3px 5px; text-align: left; background: #43B02A; color:#fff">
                                                Текст
                                            </span>
                                        </p>

                                        <textarea name="config_viber_transaction_text_type_3" cols="50" rows="7"><?php echo $config_viber_transaction_text_type_3; ?></textarea>
                                    </td>
                                    <td style="width:250px;">
                                        <div class="image">
                                            <img src="<?php echo $viber_transaction_text_type_3_image; ?>" alt="" id="thumb-viber_transaction_text_type_3_image" height="150px" />
                                            <input type="text" style="font-size:10px; width:150px;" class="image-ajax" name="config_viber_transaction_text_type_3_image" value="<?php echo $config_viber_transaction_text_type_3_image; ?>" id="viber_transaction_text_type_3_image" />
                                            <br />
                                            <a onclick="image_upload('viber_transaction_text_type_3_image', 'thumb-viber_transaction_text_type_3_image');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb-viber_transaction_text_type_3_image').attr('src', '<?php echo $no_image; ?>'); $('#viber_transaction_text_type_3_image').attr('value', ''); $('#viber_transaction_text_type_3_image').trigger('change');"><?php echo $text_clear; ?></a>
                                        </div>
                                    </td>
                                    <td style="width:200px;">
                                        <p>
                                            <span class="status_color" style="display:inline-block; padding:3px 5px; text-align: left; background: #43B02A; color:#fff">
                                                Текст кнопки
                                            </span>
                                        </p>

                                        <textarea name="config_viber_transaction_text_type_3_button_text" cols="50" rows="7"><?php echo $config_viber_transaction_text_type_3_button_text; ?></textarea>
                                    </td>
                                    <td style="width:200px;">
                                        <p>
                                            <span class="status_color" style="display:inline-block; padding:3px 5px; text-align: left; background: #43B02A; color:#fff">
                                                URL кнопки
                                            </span>
                                        </p>

                                        <textarea name="config_viber_transaction_text_type_3_button_url" cols="50" rows="7"><?php echo $config_viber_transaction_text_type_3_button_url; ?></textarea>
                                    </td>
                                </tr>

                                <tr>
									<td style="width:200px;">
										<span class="status_color" style="text-align: left; background: #43B02A; color:#fff">
											Отправка ссылки на оплату
										</span>
									</td>
									<td style="width:50px" class="center">
										<input class="checkbox" type="checkbox" name="config_viber_payment_link_enabled" id="config_viber_payment_link_enabled" <?php if ($config_viber_payment_link_enabled) { echo ' checked="checked"'; }?> />
										<label for="config_viber_payment_link_enabled"></label>
									</td>
									<td style="width:300px;">
										<p>
											<span class="status_color" style="display:inline-block; padding:3px 5px; text-align: left; background: #43B02A; color:#fff">
												Текст
											</span>
										</p>

										<textarea name="config_viber_payment_link" cols="50" rows="7"><?php echo $config_viber_payment_link; ?></textarea>
									</td>
									<td style="width:250px;">
										<div class="image">
											<img src="<?php echo $viber_payment_link_image; ?>" alt="" id="thumb-viber_payment_link_image" height="150px" />
											<input type="text" style="font-size:10px; width:150px;" class="image-ajax" name="config_viber_payment_link_image" value="<?php echo $config_viber_payment_link_image; ?>" id="viber_payment_link_image" />
											<br />
											<a onclick="image_upload('viber_payment_link_image', 'thumb-viber_payment_link_image');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb-viber_payment_link_image').attr('src', '<?php echo $no_image; ?>'); $('#viber_payment_link_image').attr('value', ''); $('#viber_payment_link_image').trigger('change');"><?php echo $text_clear; ?></a>
										</div>
									</td>
									<td style="width:200px;">
										<p>
											<span class="status_color" style="display:inline-block; padding:3px 5px; text-align: left; background: #43B02A; color:#fff">
												Текст кнопки
											</span>
										</p>

										<textarea name="config_viber_payment_link_button_text" cols="50" rows="7"><?php echo $config_viber_payment_link_button_text; ?></textarea>
									</td>
									<td style="width:200px;">
										<p>
											<span class="status_color" style="display:inline-block; padding:3px 5px; text-align: left; background: #43B02A; color:#fff">
												URL кнопки
											</span>
										</p>

										<textarea name="config_viber_payment_link_button_url" cols="50" rows="7"><?php echo $config_viber_payment_link_button_url; ?></textarea>
									</td>
								</tr>

							</table>
						</div>

						<div id="tab-sms">
							<h2><i class="fa fa-cogs"></i> Настройки воркеров и очередей</h2>
							<table class="form">
								<tr>
									<td style="width:20%">
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Воркер очереди SMS</span></p>
											<select name="config_sms_enable_queue_worker">
												<?php if ($config_sms_enable_queue_worker) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>
										</div>
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF"><i class="fa fa-clock-o"></i> Время работы</span></p>

											<input type="time" name="config_sms_enable_queue_worker_time_start" value="<?php echo $config_sms_enable_queue_worker_time_start; ?>" size="50" style="width:70px;" /> - 
											<input type="time" name="config_sms_enable_queue_worker_time_end" value="<?php echo $config_sms_enable_queue_worker_time_end; ?>" size="50" style="width:70px;" />
										</div>										
									</td>	

									<td style="width:20%">
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Библиотека SMS</span></p>
											<select name="config_smsgate_library">
												<?php foreach ($smsgates as $smsgate) { ?>
													<?php if ($smsgate == $config_smsgate_library) { ?>
														<option value="<?php echo $smsgate; ?>" selected="selected"><?php echo $smsgate; ?></option>
													<?php } else { ?>
														<option value="<?php echo $smsgate; ?>"><?php echo $smsgate; ?></option>
													<?php } ?>
												<?php } ?>				
											</select>
										</div>									
									</td>	

									<td style="width:20%">
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Приоритет общей настройки смены статусов</span></p>
											<select name="config_sms_status_use_only_settings">
												<?php if ($config_sms_status_use_only_settings) { ?>
													<option value="1" selected="selected">Да</option>
													<option value="0">Нет</option>
												<?php } else { ?>													
													<option value="1">Да</option>
													<option value="0"  selected="selected">Нет</option>
												<? } ?>
											</select>
											<span class="help">Если включено, то режим отправки коротких уведомлений зависит от общей настройки статусов</span>
										</div>		
									</td>

									<td style="width:20%">
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Библиотека поддерживает Viber</span></p>
											<select name="config_smsgate_library_enable_viber">
												<?php if ($config_smsgate_library_enable_viber) { ?>
													<option value="1" selected="selected">Да</option>
													<option value="0">Нет</option>
												<?php } else { ?>													
													<option value="1">Да</option>
													<option value="0"  selected="selected">Нет</option>
												<? } ?>
											</select>
										</div>	
									</td>	

									<td style="width:20%">
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Отправлять всё через Viber + SMS</span></p>
											<select name="config_smsgate_library_enable_viber_fallback">
												<?php if ($config_smsgate_library_enable_viber_fallback) { ?>
													<option value="1" selected="selected">Да</option>
													<option value="0">Нет</option>
												<?php } else { ?>													
													<option value="1">Да</option>
													<option value="0"  selected="selected">Нет</option>
												<? } ?>
											</select>
										</div>	
									</td>						
								</tr>

							</table>

							<h2><i class="fa fa-search"></i> Аккаунт сервиса отправки SMS</h2>
							<table class="form">
								<tr>
									<td width="25%">
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ef5e67; color:#FFF">Private Key</span></p>
											<input type="text" name="config_smsgate_api_key" value="<?php echo $config_smsgate_api_key; ?>" size="40" style="width:200px;" />	
										</div>
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ef5e67; color:#FFF">Public Key</span></p>
											<input type="text" name="config_smsgate_secret_key" value="<?php echo $config_smsgate_secret_key; ?>" size="40" style="width:200px;" />	
										</div>
									</td>
									<td width="25%">
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ef5e67; color:#FFF">USER</span></p>
											<input type="text" name="config_smsgate_user" value="<?php echo $config_smsgate_user; ?>" size="40" style="width:200px;" />	
										</div>
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ef5e67; color:#FFF">PASSWD</span></p>
											<input type="text" name="config_smsgate_passwd" value="<?php echo $config_smsgate_passwd; ?>" size="40" style="width:200px;" />	
										</div>
									</td>
									<td width="25%">
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ef5e67; color:#FFF">VIBER USER</span></p>
											<input type="text" name="config_smsgate_viber_auth_login" value="<?php echo $config_smsgate_viber_auth_login; ?>" size="40" style="width:200px;" />	
										</div>
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ef5e67; color:#FFF">VIBER PWD</span></p>
											<input type="text" name="config_smsgate_viber_auth_pwd" value="<?php echo $config_smsgate_viber_auth_pwd; ?>" size="40" style="width:200px;" />	
										</div>
									</td>
									<td width="25%">
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ef5e67; color:#FFF">SMS Альфа-имя</span></p>
											<input type="text" name="config_sms_from" value="<?php echo $config_sms_from; ?>" maxlength="15" style="width:200px;" />
										</div>
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ef5e67; color:#FFF">SMS Альфа-имя (совместимость)</span></p>
											<input type="text" name="config_sms_sign" value="<?php echo $config_sms_sign; ?>"  maxlength="15" style="width:200px;" />
										</div>
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ef5e67; color:#FFF">Viber Альфа-имя</span></p>
											<input type="text" name="config_viber_from" value="<?php echo $config_viber_from; ?>" maxlength="20" style="width:200px;" />
										</div>										
									</td>
								</tr>
							</table>

							<h2>Уведомления клиента</h2>
							<table class="form">
								<tr>									
									<td style="width:15%">
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ef5e67; color:#FFF">Уведомлять клиента о смене статуса</span></p>

											<select name="config_sms_send_new_order_status">
												<?php if ($config_sms_send_new_order_status) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>
										</div>
									</td>

									<td style="width:25%" class="left">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ef5e67; color:#FFF">Шаблонизация</span></p>
										<span class="help">											
											<b>{SNAME}</b> - название магазина<br />
											<b>{ID}</b> - номер заказа<br />
											<b>{DATE}</b> - дата заказа<br />
											<b>{TIME}</b> - время заказа<br />
											<b>{SUM}</b> - сумма заказа<br />
											<b>{STATUS}</b> - новый статус заказа<br />
											<b>{PHONE}</b> - телефон клиента<br />
											<b>{FIRSTNAME}</b> - имя клиента<br />
											<b>{LASTNAME}</b> - фамилия клиента<br />
											<b>{TTN}</b> - ТТН службы доставки<br />
											<b>{PAYMENT_INFO}</b> - данные платежа<br />
											<b>{PAYMENT_LINK}</b> - ссылка на оплату<br />
											<b>{PARTLY}</b> - инфо о частичной оплате<br />
											<b>{DELIVERY_SERVICE}</b> - служба доставки<br />
											<b>{POINTS_AMOUNT}</b> - количество бонусов на счету<br />
											<b>{POINTS_DAYS_LEFT}</b> - осталось дней до сгорания бонусов
										</span>
									</td>

									<td style="width:25%" class="left">
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ef5e67; color:#FFF">Маска телефона</span></p>
											<input type="text" name="config_phonemask" value="<?php echo $config_phonemask; ?>" size="20" />
										</div>
									</td>
								</tr>	
								</table>
								
									<table class="list">
										<tr>
											<td style="width:200px;">
												<span class="status_color" style="text-align: left; background: #43B02A; color:#fff">
													Уведомление о новом заказе
												</span>
											</td>
											<td style="width:50px" class="center">
												<input class="checkbox" type="checkbox" name="config_sms_send_new_order" id="config_sms_send_new_order" <?php if ($config_sms_send_new_order) { echo ' checked="checked"'; }?> />
												<label for="config_sms_send_new_order"></label>

											</td>
											<td style="padding:5px;">
												<input type="text" size="200" style="width:90%; font-size:16px; padding:5px;" name="config_sms_new_order_message" value="<?php echo $config_sms_new_order_message; ?>" />
											</td>
										</tr>

										<?php foreach ($order_statuses as $order_status) { ?>
											<?php $status_message = '';
											if (isset($config_sms_new_order_status_message[$order_status['order_status_id']])) {
												$status_message = $config_sms_new_order_status_message[$order_status['order_status_id']];
											} ?>
											<tr>
												<td style="width:200px;">
													<span class="status_color" style="text-align: left; background: #<?php echo !empty($order_status['status_bg_color']) ? $order_status['status_bg_color'] : ''; ?>; color: #<?php echo !empty($order_status['status_txt_color']) ? $order_status['status_txt_color'] : ''; ?>;">
														<?php echo $order_status['name']; ?>
													</span>
												</td>
												<td style="width:50px" class="center">
													<input data-key="config_sms_new_order_status_message" data-id="<?php echo $order_status['order_status_id']; ?>" data-name="enabled" class="checkbox" type="checkbox" name="config_sms_new_order_status_message[<?php echo $order_status['order_status_id']; ?>][enabled]" id="config_sms_new_order_status_message[<?php echo $order_status['order_status_id']; ?>][enabled]" <?php if (isset($status_message['enabled']) && $status_message['enabled']) { echo ' checked="checked"'; }?>/>

													<label for="config_sms_new_order_status_message[<?php echo $order_status['order_status_id']; ?>][enabled]"></label>

												</td>
												<td style="padding:5px;">
													<input data-key="config_sms_new_order_status_message" data-id="<?php echo $order_status['order_status_id']; ?>" data-name="message" type="text" size="200" style="width:90%; font-size:16px; padding:5px;" name="config_sms_new_order_status_message[<?php echo $order_status['order_status_id']; ?>][message]" value="<?php echo isset($status_message['message']) ? $status_message['message'] : ""; ?>" />
												</td>
											</tr>										
										<?php } ?>
										<tr>
											<td style="width:200px;">
												<span class="status_color" style="text-align: left; background: #43B02A; color: #FFF; ?>;">
													Трекинг отправки со склада
												</span>
											</td>
											<td style="width:50px" class="center">
												<input class="checkbox" type="checkbox" name="config_sms_tracker_leave_main_warehouse_enabled" id="config_sms_tracker_leave_main_warehouse_enabled"<?php if ($config_sms_tracker_leave_main_warehouse_enabled) { echo ' checked="checked"'; }?>/><label for="config_sms_tracker_leave_main_warehouse_enabled"></label>
											</td>
											<td style="padding:5px;">
												<input type="text" size="200" style="width:90%; font-size:16px; padding:5px;" name="config_sms_tracker_leave_main_warehouse" value="<?php echo $config_sms_tracker_leave_main_warehouse; ?>" />
											</td>
										</tr>

										<tr>
											<td style="width:200px;">
												<span class="status_color" style="text-align: left; background: #000; color: #FFF; ?>;">
													Успешная оплата
												</span>
											</td>
											<td style="width:50px" class="center">
												<input class="checkbox" type="checkbox" name="config_sms_payment_recieved_enabled" id="config_sms_payment_recieved_enabled"<?php if ($config_sms_payment_recieved_enabled) { echo ' checked="checked"'; }?>/><label for="config_sms_payment_recieved_enabled"></label>
											</td>
											<td style="padding:5px;">
												<input type="text" size="200" style="width:90%; font-size:16px; padding:5px;" name="config_sms_payment_recieved" value="<?php echo $config_sms_payment_recieved; ?>" />
											</td>
										</tr>
										
										<tr>
											<td style="width:200px;">
												<span class="status_color" style="text-align: left; background: #ef5e67; color: #FFF; ?>;">
													ТТН службы доставки: отправка
												</span>
											</td>
											<td style="width:50px" class="center">
												<input class="checkbox" type="checkbox" name="config_sms_ttn_sent_enabled" id="config_sms_ttn_sent_enabled"<?php if ($config_sms_ttn_sent_enabled) { echo ' checked="checked"'; }?>/><label for="config_sms_ttn_sent_enabled"></label>
											</td>
											<td style="padding:5px;">
												<input type="text" size="200" style="width:90%; font-size:16px; padding:5px;" name="config_sms_ttn_sent" value="<?php echo $config_sms_ttn_sent; ?>" />
											</td>
										</tr>

										<tr>
											<td style="width:200px;">
												<span class="status_color" style="text-align: left; background: #43B02A; color: #FFF; ?>;">
													ТТН службы доставки: доставлено
												</span>
											</td>
											<td style="width:50px" class="center">
												<input class="checkbox" type="checkbox" name="config_sms_ttn_ready_enabled" id="config_sms_ttn_ready_enabled"<?php if ($config_sms_ttn_ready_enabled) { echo ' checked="checked"'; }?>/><label for="config_sms_ttn_ready_enabled"></label>
											</td>
											<td style="padding:5px;">
												<input type="text" size="200" style="width:90%; font-size:16px; padding:5px;" name="config_sms_ttn_ready" value="<?php echo $config_sms_ttn_ready; ?>" />
											</td>
										</tr>

										<tr>

											<td style="width:200px;">
												<span class="status_color" style="text-align: left; background: #ef5e67; color: #FFF; ?>;">
													Уведомление о сгорании бонусов
												</span>
											</td>
											<td style="width:50px" class="center">
												<input class="checkbox" type="checkbox" name="rewardpoints_reminder_enable" id="rewardpoints_reminder_enable"<?php if ($rewardpoints_reminder_enable) { echo ' checked="checked"'; }?>/><label for="rewardpoints_reminder_enable"></label>
											</td>
											<td style="padding:5px;">
												<input type="text" size="200" style="width:90%; font-size:16px; padding:5px;" name="rewardpoints_reminder_sms_text" value="<?php echo $rewardpoints_reminder_sms_text; ?>" />
											</td>
										</tr>

										<tr>
											<td style="width:200px;">
												<span class="status_color" style="text-align: left; background: #ff7f00; color: #FFF; ?>;">
													SMS о ручной транзакции. Успешная оплата.
												</span>
											</td>
											<td style="width:50px" class="center">												
											</td>
											<td style="padding:5px;">
												<input type="text" size="200" style="width:90%; font-size:16px; padding:5px;" name="config_sms_transaction_text_type_1" value="<?php echo $config_sms_transaction_text_type_1; ?>" />
											</td>
										</tr>

										<tr>
											<td style="width:200px;">
												<span class="status_color" style="text-align: left; background: #ff7f00; color: #FFF; ?>;">
													SMS о ручной транзакции. Возврат безналичный
												</span>
											</td>
											<td style="width:50px" class="center">												
											</td>
											<td style="padding:5px;">
												<input type="text" size="200" style="width:90%; font-size:16px; padding:5px;" name="config_sms_transaction_text_type_2" value="<?php echo $config_sms_transaction_text_type_2; ?>" />
											</td>
										</tr>

										<tr>
											<td style="width:200px;">
												<span class="status_color" style="text-align: left; background: #ff7f00; color: #FFF; ?>;">
													SMS о ручной транзакции. Возврат остальное
												</span>
											</td>
											<td style="width:50px" class="center">												
											</td>
											<td style="padding:5px;">
												<input type="text" size="200" style="width:90%; font-size:16px; padding:5px;" name="config_sms_transaction_text_type_3" value="<?php echo $config_sms_transaction_text_type_3; ?>" />
											</td>
										</tr>

										<tr>
											<td style="width:200px;">
												<span class="status_color" style="text-align: left; background: #43B02A; color: #FFF; ?>;">
													Линк на оплату
												</span>
											</td>
											<td style="width:50px" class="center">
												<input class="checkbox" type="checkbox" name="config_sms_payment_link_enabled" id="config_sms_payment_link_enabled"<?php if ($config_sms_payment_link_enabled) { echo ' checked="checked"'; }?>/><label for="config_sms_payment_link_enabled"></label>
											</td>
											<td style="padding:5px;">
												<input type="text" size="200" style="width:90%; font-size:16px; padding:5px;" name="config_sms_payment_link" value="<?php echo $config_sms_payment_link; ?>" />
											</td>
										</tr>
									</table>
						</div>
						<div id="tab-server">
							<h2>Базовые настройки SEO</h2>

							<table class="form">
								<input type="hidden" name="config_secure" value="1" />
								<input type="hidden" name="config_shared" value="0" />
								<input type="hidden" name="config_robots" value="" />
								<tr>
									<td width="20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#57AC79; color:#FFF">Использовать ЧПУ</span></p>
										<select name="config_seo_url">
											<?php if ($config_seo_url) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
											<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
										<span class="help">Настройка только для совместимости, никогда не отключать</span>
									</td>
									<td width="20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Логика ЧПУ</span></p>
										<select name="config_seo_url_type">
											<?php foreach ($seo_types as $seo_type) { ?>
												<?php if ($seo_type['type'] == $config_seo_url_type) { ?>
													<option value="<?php echo $seo_type['type']; ?>" selected="selected"><?php echo $seo_type['name']; ?></option>
												<?php } else { ?>
													<option value="<?php echo $seo_type['type']; ?>"><?php echo $seo_type['name']; ?></option>
												<?php } ?>
											<?php } ?>
										</select>
										<span class="help">Настройка только для совместимости, нужно использовать seo_pro</span>
									</td>

									<td width="20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">ЧПУ = идентификатор</span></p>
										<select name="config_seo_url_from_id">
											<?php if ($config_seo_url_from_id) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
											<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
										<span class="help">Товары p12345, категории c12345</span>
									</td>

									<td width="20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">ЧПУ товаров с категориями</span></p>
										<select name="config_seo_url_include_path">
											<?php if ($config_seo_url_include_path) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
											<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
										<span class="help">/category/subcategory/product (только для seo_pro)</span>
									</td>

									<td width="20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Постфикс ЧПУ</span></p>
										<input type="text" name="config_seo_url_postfix" value="<?php echo $config_seo_url_postfix; ?>" size="10" />
										<span class="help">Например .html, (только для seo_pro)</span>
									</td>
								</tr>

								<tr>
									<td width="20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Генерировать ЧПУ (Highload опция)</span></p>
										<select name="config_seo_url_do_generate">
											<?php if ($config_seo_url_do_generate) { ?>
												<option value="1" selected="selected">Генерировать</option>
												<option value="0">Не генерировать</option>
											<?php } else { ?>													
												<option value="1">Генерировать</option>
												<option value="0"  selected="selected">Не генерировать</option>
											<? } ?>
										</select>
										<span class="help">Только для ЧПУ = идентификатор, позволяет значительно разгрузить базу. используется конфиг shorturlmap.json</span>										
									</td>

									<td width="20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">301 Редирект ЧПУ</span></p>
										<select name="config_seo_url_do_redirect_to_new">
											<?php if ($config_seo_url_do_redirect_to_new) { ?>
												<option value="1" selected="selected">Переадресация</option>
												<option value="0">Нет переадресации</option>
											<?php } else { ?>													
												<option value="1">Переадресация</option>
												<option value="0"  selected="selected">Нет переадресации</option>
											<? } ?>
										</select>
										<span class="help">Делать редирект при переходе на новую логику. Нужна табличка url_alias_old</span>										
									</td>

									<td width="20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Индексировать пагинацию категорий</span></p>
										<select name="config_index_category_pages">
											<?php if ($config_index_category_pages) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
											<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
										<span class="help">Если выключено, то page>1 закрыто noindex</span>										
									</td>

									<td width="20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Индексировать пагинацию брендов</span></p>
										<select name="config_index_manufacturer_pages">
											<?php if ($config_index_manufacturer_pages) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
											<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
										<span class="help">Если выключено, то page>1 закрыто noindex</span>										
									</td>

									<td width="20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Формировать сайтмапы</span></p>
										<select name="google_sitemap_status">
											<?php if ($google_sitemap_status) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
											<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
										<span class="help">Настройка только для совместимости, либо для магазина в разработке</span>										
									</td>

								</tr>
							</table>

							<h2>Минификатор - продакшн</h2>
							<table class="form">
								<tr>
									<td width="50%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Preload Links (от статик-субдомена)</span></p>
										<textarea name="config_preload_links" cols="100" rows="5"><?php echo $config_preload_links; ?></textarea>
									</td>
									<td width="50%">
									</td>
								</tr>
								<tr>
									<td width="50%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#57AC79; color:#FFF">Список скриптов в хедер</span></p>
										<textarea name="config_header_min_scripts" cols="100" rows="5"><?php echo $config_header_min_scripts; ?></textarea>
										<span class="help">будут использоваться на всех страницах</span>
									</td>
									<td width="50%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Исключить скрипты из хедера</span></p>
										<textarea name="config_header_excluded_scripts" cols="100" rows="5"><?php echo $config_header_excluded_scripts; ?></textarea>
										<span class="help">в случае если они добавлены фреймворком, $document->addScript();</span>
									</td>									
								</tr>
								<tr>
									<td width="50%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#57AC79; color:#FFF">Список стилей в хедер</span></p>
										<textarea name="config_header_min_styles" cols="100" rows="5"><?php echo $config_header_min_styles; ?></textarea>
										<span class="help">будут использоваться на всех страницах</span>
									</td>
									<td width="50%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Исключить стили из хедера</span></p>
										<textarea name="config_header_excluded_styles" cols="100" rows="5"><?php echo $config_header_excluded_styles; ?></textarea>
										<span class="help">в случае если они добавлены фреймворком, $document->addStyle();</span>
									</td>
								</tr>
								<tr>
									<td width="50%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#57AC79; color:#FFF">Список скриптов в футер</span></p>
										<textarea name="config_footer_min_scripts" cols="100" rows="5"><?php echo $config_footer_min_scripts; ?></textarea>
										<span class="help">будут использоваться на всех страницах</span>
									</td>
									<td width="50%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Исключить скрипты из футера</span></p>
										<textarea name="config_footer_excluded_scripts" cols="100" rows="5"><?php echo $config_footer_excluded_scripts; ?></textarea>
										<span class="help">в случае если они добавлены фреймворком, $document->addScript();</span>
									</td>
								</tr>
								<tr>
									<td width="50%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#57AC79; color:#FFF">Список стилей в футер</span></p>
										<textarea name="config_footer_min_styles" cols="100" rows="5"><?php echo $config_footer_min_styles; ?></textarea>
										<span class="help">будут использоваться на всех страницах</span>
									</td>
									<td width="50%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Исключить стили из футера</span></p>
										<textarea name="config_footer_excluded_styles" cols="100" rows="5"><?php echo $config_footer_excluded_styles; ?></textarea>
										<span class="help">в случае если они добавлены фреймворком, $document->addStyle();</span>
									</td>
								</tr>
							</table>

							<h2 style="color:#FF7815">Минификатор - режим разработки</h2>
							<table class="form">
								<tr>
									<td width="50%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#FF7815; color:#FFF">Preload Links (от статик-субдомена)</span></p>
										<textarea name="config_preload_links_dev" cols="100" rows="5"><?php echo $config_preload_links_dev; ?></textarea>
									</td>
									<td width="50%">
									</td>
								</tr>
								<tr>
									<td width="50%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#FF7815; color:#FFF">Список скриптов в хедер</span></p>
										<textarea name="config_header_min_scripts_dev" cols="100" rows="5"><?php echo $config_header_min_scripts_dev; ?></textarea>
										<span class="help">будут использоваться на всех страницах</span>
									</td>
									<td width="50%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Исключить скрипты из хедера</span></p>
										<textarea name="config_header_excluded_scripts_dev" cols="100" rows="5"><?php echo $config_header_excluded_scripts_dev; ?></textarea>
										<span class="help">в случае если они добавлены фреймворком, $document->addScript();</span>
									</td>									
								</tr>
								<tr>
									<td width="50%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#FF7815; color:#FFF">Список стилей в хедер</span></p>
										<textarea name="config_header_min_styles_dev" cols="100" rows="5"><?php echo $config_header_min_styles_dev; ?></textarea>
										<span class="help">будут использоваться на всех страницах</span>
									</td>
									<td width="50%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Исключить стили из хедера</span></p>
										<textarea name="config_header_excluded_styles_dev" cols="100" rows="5"><?php echo $config_header_excluded_styles_dev; ?></textarea>
										<span class="help">в случае если они добавлены фреймворком, $document->addStyle();</span>
									</td>
								</tr>
								<tr>
									<td width="50%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#FF7815; color:#FFF">Список скриптов в футер</span></p>
										<textarea name="config_footer_min_scripts_dev" cols="100" rows="5"><?php echo $config_footer_min_scripts_dev; ?></textarea>
										<span class="help">будут использоваться на всех страницах</span>
									</td>
									<td width="50%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Исключить скрипты из футера</span></p>
										<textarea name="config_footer_excluded_scripts_dev" cols="100" rows="5"><?php echo $config_footer_excluded_scripts_dev; ?></textarea>
										<span class="help">в случае если они добавлены фреймворком, $document->addScript();</span>
									</td>
								</tr>
								<tr>
									<td width="50%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#FF7815; color:#FFF">Список стилей в футер</span></p>
										<textarea name="config_footer_min_styles_dev" cols="100" rows="5"><?php echo $config_footer_min_styles_dev; ?></textarea>
										<span class="help">будут использоваться на всех страницах</span>
									</td>
									<td width="50%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Исключить стили из футера</span></p>
										<textarea name="config_footer_excluded_styles_dev" cols="100" rows="5"><?php echo $config_footer_excluded_styles_dev; ?></textarea>
										<span class="help">в случае если они добавлены фреймворком, $document->addStyle();</span>
									</td>
								</tr>
							</table>


							<h2>Сервер</h2>
							<table class="form">								
								<tr>
									<td><?php echo $entry_file_extension_allowed; ?></td>
									<td><textarea name="config_file_extension_allowed" cols="40" rows="5"><?php echo $config_file_extension_allowed; ?></textarea></td>
								</tr>
								<tr>
									<td><?php echo $entry_file_mime_allowed; ?></td>
									<td><textarea name="config_file_mime_allowed" cols="60" rows="5"><?php echo $config_file_mime_allowed; ?></textarea></td>
								</tr>              
								<tr>
									<td><?php echo $entry_maintenance; ?></td>
									<td>
										<select name="config_maintenance">
											<?php if ($config_maintenance) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
											<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>

									</td>
								</tr>
								<tr>
									<td><?php echo $entry_password; ?></td>
									<td>
										<select name="config_password">
											<?php if ($config_password) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
											<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
									</td>
								</tr>            
								<tr>
									<td><?php echo $entry_encryption; ?></td>
									<td><input type="text" name="config_encryption" value="<?php echo $config_encryption; ?>" />
										<?php if ($error_encryption) { ?>
											<span class="error"><?php echo $error_encryption; ?></span>
											<?php } ?></td>
										</tr>
										<tr>
											<td><?php echo $entry_compression; ?></td>
											<td><input type="text" name="config_compression" value="<?php echo $config_compression; ?>" size="3" /></td>
										</tr>
										<tr>
											<td><?php echo $entry_error_display; ?></td>
											<td>
												<select name="config_error_display">
													<?php if ($config_error_display) { ?>
														<option value="1" selected="selected">Включить</option>
														<option value="0">Отключить</option>
													<?php } else { ?>													
														<option value="1">Включить</option>
														<option value="0"  selected="selected">Отключить</option>
													<? } ?>
												</select>
											</td>
										</tr>
										<tr>
											<td><?php echo $entry_error_log; ?></td>
											<td>
												<select name="config_error_log">
													<?php if ($config_error_log) { ?>
														<option value="1" selected="selected">Включить</option>
														<option value="0">Отключить</option>
													<?php } else { ?>													
														<option value="1">Включить</option>
														<option value="0"  selected="selected">Отключить</option>
													<? } ?>
												</select>
											</td>
										</tr>
										<tr>
											<td><span class="required">*</span> <?php echo $entry_error_filename; ?></td>
											<td><input type="text" name="config_error_filename" value="<?php echo $config_error_filename; ?>" />
												<?php if ($error_error_filename) { ?>
													<span class="error"><?php echo $error_error_filename; ?></span>
													<?php } ?></td>
												</tr>											
											</table>
						</div>
						
						<div id="tab-telephony">

							<h2>Очереди</h2>
							<table class="form">
								<tr>
									<td width="33%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Обслуживающая очередь</span></p>
										<select name="config_default_queue">
											<option value="">Не назначать</option>											
											<? foreach ($user_groups as $user_group) { ?>
												<?php if ($user_group['sip_queue']) { ?>	
													<?php if ($user_group['sip_queue'] == $config_default_queue) { ?>
														<option value="<?php echo $user_group['sip_queue'] ?>" selected="selected"><?php echo $user_group['sip_queue']; ?> (<?php echo $user_group['name']; ?>)</option>
													<?php } else { ?>
														<option value="<?php echo $user_group['sip_queue'] ?>"><?php echo $user_group['sip_queue']; ?> (<?php echo $user_group['name']; ?>)</option>
													<? } ?>
												<? } ?>
											<? } ?>
										</select>

									</td>

									<td width="33%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Очередь уведомлений менеджеров</span></p>
										<select name="config_default_alert_queue">
											<option value="">Не назначать</option>											
											<? foreach ($user_groups as $user_group) { ?>
												<?php if ($user_group['alert_namespace']) { ?>	
													<?php if ($user_group['alert_namespace'] == $config_default_alert_queue) { ?>
														<option value="<?php echo $user_group['alert_namespace'] ?>" selected="selected"><?php echo $user_group['alert_namespace']; ?> (<?php echo $user_group['name']; ?>)</option>
													<?php } else { ?>
														<option value="<?php echo $user_group['alert_namespace'] ?>"><?php echo $user_group['alert_namespace']; ?> (<?php echo $user_group['name']; ?>)</option>
													<? } ?>
												<? } ?>
											<? } ?>
										</select>

									</td>

									<td width="33%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Назначенная группа менеджеров</span></p>
										<select name="config_default_manager_group">
											<option value="0">Не назначать</option>											
											<? foreach ($user_groups as $user_group) { ?>
												<?php if ($user_group['user_group_id'] == $config_default_manager_group) { ?>
													<option value="<?php echo $user_group['user_group_id'] ?>" selected="selected"><?php echo $user_group['name']; ?></option>
													<?php } else { ?>
													<option value="<?php echo $user_group['user_group_id'] ?>"><?php echo $user_group['name']; ?></option>
												<? } ?>
											<? } ?>
										</select>
									</td>
								</tr>
							</table>

							<h2>Binotel (телефония)</h2>
							<table class="form">
								<tr>
									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Движок телефонии</span></p>
										<select name="config_telephony_engine">
											<?php if ($config_telephony_engine == 'asterisk') { ?>
												<option value="asterisk" selected="selected">Asterisk AMI</option>
												<option value="binotel">Binotel API</option>
												<?php } else { ?>													
												<option value="asterisk">Asterisk AMI</option>
												<option value="binotel"  selected="selected">Binotel API</option>
											<? } ?>
										</select>										
									</td>

									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Binotel API KEY</span></p>
										<input type="text" name="config_binotel_api_key" value="<?php echo $config_binotel_api_key; ?>" size="30" style="width:300px;" />										
									</td>

									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Binotel API SECRET</span></p>
										<input type="text" name="config_binotel_api_secret" value="<?php echo $config_binotel_api_secret; ?>" size="30" style="width:300px;" />		
									</td>

									<td width="25%">		
									</td>
								</tr>
							</table>

							<h2>ASTERISK AMI (телефония)</h2>
							<table class="form">
								<tr>
									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">AMI USER</span></p>
										<input type="text" name="config_asterisk_ami_user" value="<?php echo $config_asterisk_ami_user; ?>" size="30" style="width:300px;" />										
									</td>

									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">AMI PASSWD</span></p>
										<input type="text" name="config_asterisk_ami_pass" value="<?php echo $config_asterisk_ami_pass; ?>" size="30" style="width:300px;" />										
									</td>

									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">AMI HOST</span></p>
										<input type="text" name="config_asterisk_ami_host" value="<?php echo $config_asterisk_ami_host; ?>" size="30" style="width:300px;" />		
									</td>

									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">AMI WORKTIME</span></p>
										<input type="text" name="config_asterisk_ami_worktime" value="<?php echo $config_asterisk_ami_worktime; ?>" size="30" style="width:300px;" />		
									</td>
								</tr>
							</table>

							<h2>GOIP4 (телефония, для балансов и мониторинга)</h2>
							<table class="form">
								<tr>
									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">GOIP4 USER</span></p>
										<input type="text" name="config_goip4_user" value="<?php echo $config_goip4_user; ?>" size="30" style="width:300px;" />									
									</td>

									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">GOIP4 PASSWD</span></p>
										<input type="text" name="config_goip4_passwd" value="<?php echo $config_goip4_passwd; ?>" size="30" style="width:300px;" />										
									</td>

									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">GOIP4 HOST</span></p>
										<input type="text" name="config_goip4_uri" value="<?php echo $config_goip4_uri; ?>" size="30" style="width:300px;" />		
									</td>

									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Количество SIM</span></p>
										<input type="number" step="1" name="config_goip4_simnumber" value="<?php echo $config_goip4_simnumber; ?>" size="2" style="width:100px;" />		
									</td>
								</tr>

								<tr>
									<?php for ($i=1; $i<=$config_goip4_simnumber; $i++) { ?>
										<td width="25%">
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">GOIP4 <?php echo $i; ?> линия</span></p>
											<input type="text" name="config_goip4_simnumber_<?php echo $i; ?>" value="<?php echo ${'config_goip4_simnumber_' . $i}; ?>" size="30" style="width:300px;" />		
										</td>
									<?php } ?>
								</tr>


								<tr>
									<?php for ($i=1; $i<=$config_goip4_simnumber; $i++) { ?>
										<td width="25%">
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Функция проверки баланса <?php echo $i; ?></span></p>
											<input type="text" name="config_goip4_simnumber_checkfunction_<?php echo $i; ?>" value="<?php echo ${'config_goip4_simnumber_checkfunction_' . $i}; ?>" size="30" style="width:300px;" />		
										</td>
									<?php } ?>
								</tr>

							</table>

							<h2>Авторизация пользователей на сервере LDAP (Active Directory)</h2>
							<table class="form">
								<tr>
									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Включить</span></p>
										<select name="config_ldap_auth_enable">
											<?php if ($config_ldap_auth_enable) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
												<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>										
									</td>

									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">LDAP Distinguished Name</span></p>
										<input type="text" name="config_ldap_dn" value="<?php echo $config_ldap_dn; ?>" size="30" style="width:250px;" />										
									</td>

									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">LDAP HOST</span></p>
										<input type="text" name="config_ldap_host" value="<?php echo $config_ldap_host; ?>" size="30" style="width:250px;" />		
									</td>

									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">LDAP DOMAIN</span></p>
										<input type="text" name="config_ldap_domain" value="<?php echo $config_ldap_domain; ?>" size="30" style="width:250px;" />		
									</td>

									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Членство в группе</span></p>
										<input type="text" name="config_ldap_group" value="<?php echo $config_ldap_group; ?>" size="2" style="width:250px;" />		
									</td>
								</tr>
							</table>


						</div>
						
						

						<div id="tab-ya-market" <?php if ($config_country_id != 176) { ?>style="display: none;"<?php } ?>>
							<h2>Настройки Ozon Seller + исключение брендов</h2>

							<table class="form">
								<tr>		
									<td width="20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">OZON ценообразование так же как в Yandex</span></p>
										<select name="config_ozon_enable_price_yam">
											<?php if ($config_ozon_enable_price_yam) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
												<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
										<br />
										<span class="help">если включено, то в Ozon пойдет та же цена, что и в Яндекс.Маркет. Иначе - цена фронта</span>
									</td>	

									<td width="20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Название склада в ЛК Ozon Seller</span></p>
										<input type="text" name="config_ozon_warehouse_0" value="<?php echo $config_ozon_warehouse_0; ?>" size="30" style="width:200px;" />
										<br />
										<span class="help">Обязательное требование, нужно скопировать из личного кабинета Озона</span>
									</td>

									<td width="30%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Исключить бренды из фида Ozon</span></p>
										<div class="scrollbox" style="height:250px;">
										<?php $class = 'odd'; ?>
										<?php if ($config_ozon_warehouse_0) { ?>
											<?php foreach ($manufacturers as $manufacturer) { ?>
												<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
												<div class="<?php echo $class; ?>">
													<?php if (in_array($manufacturer['manufacturer_id'], $config_ozon_exclude_manufacturers)) { ?>
														<input id="config_ozon_exclude_manufacturers_<?php echo $manufacturer['manufacturer_id']; ?>" class="checkbox" type="checkbox" name="config_ozon_exclude_manufacturers[]" value="<?php echo $manufacturer['manufacturer_id']; ?>" checked="checked" />
														<label for="config_yandex_exclude_manufacturers_<?php echo $manufacturer['manufacturer_id']; ?>"><?php echo $manufacturer['name']; ?></label>
													<?php } else { ?>
														<input id="config_ozon_exclude_manufacturers_<?php echo $manufacturer['manufacturer_id']; ?>" class="checkbox" type="checkbox" name="config_ozon_exclude_manufacturers[]" value="<?php echo $manufacturer['manufacturer_id']; ?>" />
														<label for="config_ozon_exclude_manufacturers_<?php echo $manufacturer['manufacturer_id']; ?>"><?php echo $manufacturer['name']; ?></label>
													<?php } ?>
												</div>
											<?php } ?>
										<?php } ?>
									</div>
									</td>

									<td width="30%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Исключить бренды из фида Yandex Market</span></p>
										<div class="scrollbox" style="height:250px;">
										<?php $class = 'odd'; ?>
										<?php if ($config_yam_fbs_campaign_id) { ?>
											<?php foreach ($manufacturers as $manufacturer) { ?>
												<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
												<div class="<?php echo $class; ?>">
													<?php if (in_array($manufacturer['manufacturer_id'], $config_yandex_exclude_manufacturers)) { ?>
														<input id="config_yandex_exclude_manufacturers_<?php echo $manufacturer['manufacturer_id']; ?>" class="checkbox" type="checkbox" name="config_yandex_exclude_manufacturers[]" value="<?php echo $manufacturer['manufacturer_id']; ?>" checked="checked" />
														<label for="config_yandex_exclude_manufacturers_<?php echo $manufacturer['manufacturer_id']; ?>"><?php echo $manufacturer['name']; ?></label>
													<?php } else { ?>
														<input id="config_yandex_exclude_manufacturers_<?php echo $manufacturer['manufacturer_id']; ?>" class="checkbox" type="checkbox" name="config_yandex_exclude_manufacturers[]" value="<?php echo $manufacturer['manufacturer_id']; ?>" />
														<label for="config_yandex_exclude_manufacturers_<?php echo $manufacturer['manufacturer_id']; ?>"><?php echo $manufacturer['name']; ?></label>
													<?php } ?>
												</div>
											<?php } ?>
										<?php } ?>
									</div>

									</td>

								</tr>
							</table>


							<h2>Yandex Market Ценообразование</h2>
							<table class="form">
								<tr>		
									<td width="50%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Yandex Market использовать логику "своей цены"</span></p>
										<select name="config_yam_offer_id_price_enable">
											<?php if ($config_yam_offer_id_price_enable) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
												<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
										<br />
										<span class="help">товары в фиде маркета будут подаваться с переназначенными ценами</span>
									</td>	

									<td width="50%">
										<a href="<?php echo $deprecated_yam_module; ?>">[Deprecated] Модуль Яндекс-маркета</a><br />
										<a href="<?php echo $deprecated_hotline_module; ?>">[Deprecated] Модуль Hotline</a><br />
									</td>	
									
								</tr>
								
								<tr>		
									<td width="50%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Yandex Market включить автоматическое назначение наценки в фиде</span></p>
										<select name="config_yam_enable_plus_percent">
											<?php if ($config_yam_enable_plus_percent) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
												<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
										<br />
										<span class="help">если включено, то ручные цены будут задаваться при формировании фида автоматически</span>
									</td>
									
									<td width="50%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Yandex Market процент наценки или скидки</span></p>
										<input type="text" name="config_yam_plus_percent" value="<?php echo $config_yam_plus_percent; ?>" size="30" style="width:150px;" />%
										<br />
										<span class="help">20 для наценки, -20 для скидки. высчитывается исходя из финальной цены товара (если нет РРЦ, но есть скидка - то из нее, если нет - то из регулярной цены</span>
									</td>
									
								</tr>
								
								<tr>
									
									<td width="50%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">Yandex Market ебануть скидку на все товары маркета</span></p>
										<select name="config_yam_enable_plus_for_main_price">
											<?php if ($config_yam_plus_for_main_price) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
												<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
										<br />
										<span class="help">если включено, то на все товары маркета в фиде будет ебнута скидка от основной цены Маркета (цена фронта 1000, цена маркета (+20%) = 1200, скидка будет отправлена 1200 - 10% = 1080. Будет использовано две цены, PRICE, OLDPRICE. В случае если не включено, используется исключительно одна цена, price</span>
									</td>
									
									<td width="50%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">Yandex Market процент ебнутой наценки или скидки</span></p>
										<input type="text" name="config_yam_plus_for_main_price" value="<?php echo $config_yam_plus_for_main_price; ?>" size="30" style="width:150px;" />%
										<br />
										<span class="help">20 для наценки, -20 для скидки. высчитывается исходя из финальной цены товара (если нет РРЦ, но есть скидка - то из нее, если нет - то из регулярной цены</span>
									</td>
									
								</tr>
								
								<tr>								
									<td width="50%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">Yandex Market нахуй скидки каталога</span></p>
										<select name="config_yam_fuck_specials">
											<?php if ($config_yam_fuck_specials) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
												<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
										<br />
										<span class="help">Если включено, то скидки для ЯМ не учитывают скидки магазина и всегда считаются от основной цены</span>
									</td>


									<td width="50%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">Yandex Market процент комиссии </span></p>
										<input type="text" name="config_yam_default_comission" value="<?php echo $config_yam_default_comission; ?>" size="30" style="width:150px;" />%
										<br />
										<span class="help">Средняя по больнице комиссия ЯМ для подсчетов</span>
									</td>
									
								</tr>
								
							</table>
							
							
							<h2>Yandex Market НАСТРОЙКИ</h2>
							<table class="form">
								<tr>		
									
									<td width="33%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Yandex Market Идентификатор FBS кампании</span></p>
										<input type="text" name="config_yam_fbs_campaign_id" value="<?php echo $config_yam_fbs_campaign_id; ?>" size="30" style="width:150px;" />
									</td>
									
									<td width="33%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Yandex Market Идентификатор основного склада</span></p>
										<input type="text" name="config_yam_fbs_warehouse_id" value="<?php echo $config_yam_fbs_warehouse_id; ?>" size="30" style="width:150px;" />
									</td>
									
									<td width="33%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Yandex Market поле для синхронизации количества</span></p>
										<input type="text" name="config_yam_stock_field" value="<?php echo $config_yam_stock_field; ?>" size="30" style="width:150px;" />
									</td>
									
								</tr>
								
								<tr>		
									
									
									<td width="33%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">Yandex Market yaMarketToken</span></p>
										<input type="text" name="config_yam_yaMarketToken" value="<?php echo $config_yam_yaMarketToken; ?>" size="30" style="width:250px;" />
										
										<br />
										<span class="help">Нужно получать токены каждый раз при сбое авторизации, потому как их сбрасывает Яндекс</span>	
									</td>
									
									<td width="33%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">Yandex Market yandexOauthID</span></p>
										<input type="text" name="config_yam_yandexOauthID" value="<?php echo $config_yam_yandexOauthID; ?>" size="30" style="width:250px;" />
										
										<br />
										<span class="help">Нужно получать токены каждый раз при сбое авторизации, потому как их сбрасывает Яндекс</span>	
									</td>
									
									<td width="33%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">Yandex Market yandexOauthSecret</span></p>
										<input type="text" name="config_yam_yandexOauthSecret" value="<?php echo $config_yam_yandexOauthSecret; ?>" size="30" style="width:250px;" />
										
										<br />
										<span class="help">Нужно получать токены каждый раз при сбое авторизации, потому как их сбрасывает Яндекс</span>	
									</td>
								</tr>
								
								<tr>		
									<td width="33%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">Yandex Market yandexAccessToken</span></p>
										<input type="text" name="config_yam_yandexAccessToken" value="<?php echo $config_yam_yandexAccessToken; ?>" size="30" style="width:250px;" />
										
										<br />
										<span class="help">Нужно получать токены каждый раз при сбое авторизации, потому как их сбрасывает Яндекс</span>	
									</td>
									
								</tr>
								
								<tr>		
									<td width="33%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Yandex Market шаблон названия фида</span></p>
										<input type="text" name="config_yam_offer_feed_template" value="<?php echo $config_yam_offer_feed_template; ?>" size="40" style="width:300px;" />
										<br />
										<span class="help">используй шорткод {store_id} для подстановки идентификатора магазина, {yam_prefix} для подстановки префикса</span>
									</td>
									
									<td width="33%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Yandex Market включить свои идентификаторы</span></p>
										<select name="config_yam_offer_id_prefix_enable">
											<?php if ($config_yam_offer_id_prefix_enable) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
												<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
										<br />
										<span class="help">товары в фиде маркета будут подаваться с идентификаторами вида <?php echo $config_yam_offer_id_prefix; ?>КОД_ТОВАРА</span>
									</td>
									
									<td width="33%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">Yandex Market префикс</span></p>
										<input type="text" name="config_yam_offer_id_prefix" value="<?php echo $config_yam_offer_id_prefix; ?>" size="30" style="width:250px;" />
										
										<br />
										<span class="help">товары в фиде маркета будут подаваться с идентификаторами вида <?php echo $config_yam_offer_id_prefix; ?>КОД_ТОВАРА</span>	
									</td>
								</tr>
								
								<tr>		
									<td width="33%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Yandex Market использовать категории Яндекса</span></p>
										<select name="config_yam_enable_category_tree">
											<?php if ($config_yam_enable_category_tree) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
												<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
										<br />
										<span class="help">Добавлять в наше дерево категорий также дерево категорий Яндекса и пытаться сопоставить категории при формировании фидов</span>
									</td>
								
								
									<td width="33%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Не включать ссылку на товар в маркете</span></p>
										<select name="config_yam_offer_id_link_disable">
											<?php if ($config_yam_offer_id_link_disable) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
												<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
										<br />
										<span class="help">товары в фиде маркета будут подаваться без ссылки, для отвязки товаров от магазина</span>
									</td>
									
									<td width="33%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Исключать товары с похожими названиями</span></p>
										<textarea cols="20" rows="5" name="config_yam_excludewords"><?php echo $config_yam_excludewords; ?></textarea>
										<br />
										<span class="help">каждое с новой строки, например, "пепельниц зажигалк" для исключения товаров связанных с курением</span>

										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Дефолтная категория Yandex</span></p>
										<input type="text" name="config_yam_default_category_id" value="<?php echo $config_yam_default_category_id; ?>" size="30" style="width:250px;" />
										<br />
										<span class="help">в случае если не получилось никак определить</span>
									</td>
								</tr>
								
							</table>
						</div>

						<div id="tab-deliveryapis">

							<h2>Настройки воркеров служб доставки</h2>
							<table>
								<tr>
								<td style="width:20%">
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Трекер накладных</span></p>
											<select name="config_shipping_enable_tracker_worker">
												<?php if ($config_shipping_enable_tracker_worker) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>
										</div>
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF"><i class="fa fa-clock-o"></i> Время работы</span></p>

											<input type="time" name="config_shipping_enable_tracker_worker_time_start" value="<?php echo $config_shipping_enable_tracker_worker_time_start; ?>" size="50" style="width:70px;" /> - 
											<input type="time" name="config_shipping_enable_tracker_worker_time_end" value="<?php echo $config_shipping_enable_tracker_worker_time_end; ?>" size="50" style="width:70px;" />
										</div>										
									</td>
								</tr>
							</table>


							<h2>Новая Почта API</h2>
							<table class="form">
								<tr>
									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ffcc00; color:#FFF">API KEY</span></p>
										<input type="text" name="config_novaposhta_api_key" value="<?php echo $config_novaposhta_api_key; ?>" size="50" style="width:300px;" />
									</td>
									
									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ffcc00; color:#FFF">GUID По-умолчанию</span></p>
										<input type="text" name="config_novaposhta_default_city_guid" value="<?php echo $config_novaposhta_default_city_guid; ?>" size="50" style="width:300px;" />
									</td>

									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">UA Язык для Новой Почты</span></p>
										<select name="config_novaposhta_ua_language">
										<?php foreach ($languages as $language) { ?>
											<?php if ($language['code'] == $config_novaposhta_ua_language) { ?>
												<option value="<?php echo $language['code']; ?>" selected="selected"><?php echo $language['name']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></option>
											<?php } ?>
										<?php } ?>
										</select>
									</td>

									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">RU Язык для Новой Почты</span></p>
										<select name="config_novaposhta_ru_language">
										<?php foreach ($languages as $language) { ?>
											<?php if ($language['code'] == $config_novaposhta_ru_language) { ?>
												<option value="<?php echo $language['code']; ?>" selected="selected"><?php echo $language['name']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></option>
											<?php } ?>
										<?php } ?>
										</select>
									</td>

									
								</tr>
							</table>


							<h2>JUSTIN API</h2>
							<table class="form">
								<tr>
									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ffcc00; color:#FFF">API KEY</span></p>
										<input type="text" name="config_justin_api_key" value="<?php echo $config_justin_api_key; ?>" size="50" style="width:300px;" />
									</td>
									
									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ffcc00; color:#FFF">API USER</span></p>
										<input type="text" name="config_justin_api_login" value="<?php echo $config_justin_api_login; ?>" size="50" style="width:300px;" />
									</td>

									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">UA Язык для Justin</span></p>
										<select name="config_justin_ua_language">
										<?php foreach ($languages as $language) { ?>
											<?php if ($language['code'] == $config_justin_ua_language) { ?>
												<option value="<?php echo $language['code']; ?>" selected="selected"><?php echo $language['name']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></option>
											<?php } ?>
										<?php } ?>
										</select>
									</td>

									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">RU Язык для Justin</span></p>
										<select name="config_justin_ru_language">
										<?php foreach ($languages as $language) { ?>
											<?php if ($language['code'] == $config_justin_ru_language) { ?>
												<option value="<?php echo $language['code']; ?>" selected="selected"><?php echo $language['name']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></option>
											<?php } ?>
										<?php } ?>
										</select>
									</td>
								</tr>
							</table>

							<h2>Укрпочта API</h2>
							<table class="form">
								<tr>
									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ffcc00; color:#FFF">API BEARER</span></p>
										<input type="text" name="config_ukrposhta_api_bearer" value="<?php echo $config_ukrposhta_api_bearer; ?>" size="50" style="width:300px;" />
									</td>
									
									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ffcc00; color:#FFF">API TOKEN</span></p>
										<input type="text" name="config_ukrposhta_api_token" value="<?php echo $config_ukrposhta_api_token; ?>" size="50" style="width:300px;" />
									</td>

									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">UA Язык для УкрПочты</span></p>
										<select name="config_ukrposhta_ua_language">
										<?php foreach ($languages as $language) { ?>
											<?php if ($language['code'] == $config_ukrposhta_ua_language) { ?>
												<option value="<?php echo $language['code']; ?>" selected="selected"><?php echo $language['name']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></option>
											<?php } ?>
										<?php } ?>
										</select>
									</td>

									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">RU Язык для УкрПочты</span></p>
										<select name="config_ukrposhta_ru_language">
										<?php foreach ($languages as $language) { ?>
											<?php if ($language['code'] == $config_ukrposhta_ru_language) { ?>
												<option value="<?php echo $language['code']; ?>" selected="selected"><?php echo $language['name']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></option>
											<?php } ?>
										<?php } ?>
										</select>
									</td>
								</tr>
							</table>


							<h2>СДЭК API</h2>
							<table class="form">
								<tr>
									<td width="15%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ffcc00; color:#FFF">API LOGIN</span></p>
										<input type="text" name="config_cdek_api_login" value="<?php echo $config_cdek_api_login; ?>" size="50" style="width:90%;" />
									</td>
									
									<td width="15%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ffcc00; color:#FFF">API KEY</span></p>
										<input type="text" name="config_cdek_api_key" value="<?php echo $config_cdek_api_key; ?>" size="50" style="width:90%;" />
									</td>

									<td width="15%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Стоимость на чекауте</span></p>
										<select name="config_cdek_calculate_on_checkout">
												<?php if ($config_cdek_calculate_on_checkout) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>										
									</td>

									<td width="15%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Тариф по-умолчанию склад-склад</span></p>
										<select name="config_cdek_api_default_tariff_warehouse">
										<?php foreach ($cdek_tariffs as $cdek_tariff) { ?>
											<?php if ($cdek_tariff['code'] == $config_cdek_api_default_tariff_warehouse) { ?>
												<option value="<?php echo $cdek_tariff['code']; ?>" selected="selected"><?php echo $cdek_tariff['name']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $cdek_tariff['code']; ?>"><?php echo $cdek_tariff['name']; ?></option>
											<?php } ?>
										<?php } ?>
										</select>
									</td>

									<td width="15%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Тариф по-умолчанию склад-двери</span></p>
										<select name="config_cdek_api_default_tariff_doors">
										<?php foreach ($cdek_tariffs as $cdek_tariff) { ?>
											<?php if ($cdek_tariff['code'] == $config_cdek_api_default_tariff_doors) { ?>
												<option value="<?php echo $cdek_tariff['code']; ?>" selected="selected"><?php echo $cdek_tariff['name']; ?></option>
												<?php } else { ?>
												<option value="<?php echo $cdek_tariff['code']; ?>"><?php echo $cdek_tariff['name']; ?></option>
											<?php } ?>
										<?php } ?>
										</select>
									</td>

									<td width="15%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">ID города-отправителя</span></p>
										<input type="text" name="config_cdek_api_city_sender_id" value="<?php echo $config_cdek_api_city_sender_id; ?>" size="50" style="width:300px;" />										
									</td>


								</tr>							
							</table>

						</div>

						<div id="tab-rainforest">
							<h2>Настройки воркеров Rainforest API</h2>

							<table class="form">
								<tr>
									<td style="width:20%">
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Парсер новых товаров Amazon</span></p>
											<select name="config_rainforest_enable_new_parser">
												<?php if ($config_rainforest_enable_new_parser) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>
										</div>
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF"><i class="fa fa-clock-o"></i> Время работы</span></p>

											<input type="time" name="config_rainforest_new_parser_time_start" value="<?php echo $config_rainforest_new_parser_time_start; ?>" size="50" style="width:70px;" /> - 
											<input type="time" name="config_rainforest_new_parser_time_end" value="<?php echo $config_rainforest_new_parser_time_end; ?>" size="50" style="width:70px;" />
										</div>

									</td>

									<td style="width:20%">
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Парсер данных о товарах Amazon</span></p>
											<select name="config_rainforest_enable_data_parser">
												<?php if ($config_rainforest_enable_data_parser) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>
										</div>
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF"><i class="fa fa-clock-o"></i> Время работы</span></p>

											<input type="time" name="config_rainforest_data_parser_time_start" value="<?php echo $config_rainforest_data_parser_time_start; ?>" size="50" style="width:70px;" /> - 
											<input type="time" name="config_rainforest_data_parser_time_end" value="<?php echo $config_rainforest_data_parser_time_end; ?>" size="50" style="width:70px;" />
										</div>
										
									</td>

									<td style="width:20%">
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Разгребатель технической категории</span></p>
											<select name="config_rainforest_enable_tech_category_parser">
												<?php if ($config_rainforest_enable_tech_category_parser) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>
										</div>
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF"><i class="fa fa-clock-o"></i> Время работы</span></p>

											<input type="time" name="config_rainforest_tech_category_parser_time_start" value="<?php echo $config_rainforest_tech_category_parser_time_start; ?>" size="50" style="width:70px;" /> - 
											<input type="time" name="config_rainforest_tech_category_parser_time_end" value="<?php echo $config_rainforest_tech_category_parser_time_end; ?>" size="50" style="width:70px;" />
										</div>
									</td>

									<td style="width:20%">
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Парсер данных о товарах Amazon L2</span></p>
											<select name="config_rainforest_enable_data_l2_parser">
												<?php if ($config_rainforest_enable_data_l2_parser) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>
										</div>
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF"><i class="fa fa-clock-o"></i> Время работы</span></p>

											<input type="time" name="config_rainforest_data_l2_parser_time_start" value="<?php echo $config_rainforest_data_l2_parser_time_start; ?>" size="50" style="width:70px;" /> - 
											<input type="time" name="config_rainforest_data_l2_parser_time_end" value="<?php echo $config_rainforest_data_l2_parser_time_end; ?>" size="50" style="width:70px;" />
										</div>
									</td>

									<td style="width:20%">
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Получение офферов с Amazon</span></p>
											<select name="config_rainforest_enable_offers_parser">
												<?php if ($config_rainforest_enable_offers_parser) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>
										</div>
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF"><i class="fa fa-clock-o"></i> Время работы</span></p>

											<input type="time" name="config_rainforest_offers_parser_time_start" value="<?php echo $config_rainforest_offers_parser_time_start; ?>" size="50" style="width:70px;" /> - 
											<input type="time" name="config_rainforest_offers_parser_time_end" value="<?php echo $config_rainforest_offers_parser_time_end; ?>" size="50" style="width:70px;" />
										</div>
									</td>
								</tr>
							</tr>

							<tr>
								<td style="width:20%">
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Очередь ручного добавления</span></p>
											<select name="config_rainforest_enable_add_queue_parser">
												<?php if ($config_rainforest_enable_add_queue_parser) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>
										</div>
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF"><i class="fa fa-clock-o"></i> Время работы</span></p>

											<input type="time" name="config_rainforest_add_queue_parser_time_start" value="<?php echo $config_rainforest_add_queue_parser_time_start; ?>" size="50" style="width:70px;" /> - 
											<input type="time" name="config_rainforest_add_queue_parser_time_end" value="<?php echo $config_rainforest_add_queue_parser_time_end; ?>" size="50" style="width:70px;" />
										</div>
									</td>


								<td style="width:20%">
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Поиск и обновление ASIN</span></p>
											<select name="config_rainforest_enable_recoverasins_parser">
												<?php if ($config_rainforest_enable_recoverasins_parser) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>
										</div>
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF"><i class="fa fa-clock-o"></i> Время работы</span></p>

											<input type="time" name="config_rainforest_recoverasins_parser_time_start" value="<?php echo $config_rainforest_recoverasins_parser_time_start; ?>" size="50" style="width:70px;" /> - 
											<input type="time" name="config_rainforest_recoverasins_parser_time_end" value="<?php echo $config_rainforest_recoverasins_parser_time_end; ?>" size="50" style="width:70px;" />
										</div>
								</td>

								<td style="width:20%">
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Очередь добавления вариантов</span></p>
											<select name="config_rainforest_enable_add_variants_queue_parser">
												<?php if ($config_rainforest_enable_add_variants_queue_parser) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>
										</div>
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF"><i class="fa fa-clock-o"></i> Время работы</span></p>

											<input type="time" name="config_rainforest_add_variants_queue_parser_time_start" value="<?php echo $config_rainforest_add_variants_queue_parser_time_start; ?>" size="50" style="width:70px;" /> - 
											<input type="time" name="config_rainforest_add_variants_queue_parser_time_end" value="<?php echo $config_rainforest_add_variants_queue_parser_time_end; ?>" size="50" style="width:70px;" />
										</div>
								</td>

								<td style="width:20%">
									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Отложить изменение цен</span></p>
										<select name="config_rainforest_delay_price_setting">
											<?php if ($config_rainforest_delay_price_setting) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
											<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
									</div>

									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Отложить изменение наличия</span></p>
										<select name="config_rainforest_delay_stock_setting">
											<?php if ($config_rainforest_delay_stock_setting) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
											<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
									</div>

									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Ручное исправление</span></p>
										<select name="config_rainforest_enable_nooffers_parser">
											<?php if ($config_rainforest_enable_nooffers_parser) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
											<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
									</div>

								</td>

								<td style="width:20%">
									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Отложить офферы для очереди</span></p>
										<select name="config_rainforest_delay_queue_offers">
											<?php if ($config_rainforest_delay_queue_offers) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
											<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
									</div>

									<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Отложить варианты для очереди</span></p>
										<select name="config_rainforest_delay_queue_variants">
											<?php if ($config_rainforest_delay_queue_variants) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
											<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
									</div>

								</td>


							</tr>

							<td style="width:20%">
								<div>
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Парсер дерева категорий</span></p>
									<select name="config_rainforest_enable_category_tree_parser">
										<?php if ($config_rainforest_enable_category_tree_parser) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>
								</div>

							</td>

							<td style="width:20%">
								<div>
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Валидация ASIN</span></p>
									<select name="config_rainforest_enable_asins_parser">
										<?php if ($config_rainforest_enable_asins_parser) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>
								</div>

							</td>

							<td style="width:20%">
								<div>
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Валидация EAN/GTIN</span></p>
									<select name="config_rainforest_enable_eans_parser">
										<?php if ($config_rainforest_enable_eans_parser) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>
								</div>

							</td>

							<td style="width:20%">
								<div>
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Паралельная очередь офферов</span></p>
									<select name="config_rainforest_enable_offersqueue_parser">
										<?php if ($config_rainforest_enable_offersqueue_parser) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>
								</div>

								<div>
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF"><i class="fa fa-clock-o"></i> Время работы</span></p>

									<input type="time" name="config_rainforest_offersqueue_parser_time_start" value="<?php echo $config_rainforest_offersqueue_parser_time_start; ?>" size="50" style="width:70px;" /> - 
									<input type="time" name="config_rainforest_offersqueue_parser_time_end" value="<?php echo $config_rainforest_offersqueue_parser_time_end; ?>" size="50" style="width:70px;" />
								</div>

							</td>

							<td style="width:20%">
								<div>
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Генератор SEO-данных</span></p>
									<select name="config_enable_seogen_cron">
										<?php if ($config_enable_seogen_cron) { ?>
											<option value="1" selected="selected">Включить</option>
											<option value="0">Отключить</option>
										<?php } else { ?>													
											<option value="1">Включить</option>
											<option value="0"  selected="selected">Отключить</option>
										<? } ?>
									</select>
								</div>

							</td>
						</tr>
					</table>


							<h2>Rainforest API (получение цен и прочей шляпы из Amazon)</h2>
							<table class="form">
								<tr>
									<td style="width:20%">
										<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Включить rfAPI</span></p>
										<select name="config_rainforest_enable_api">
											<?php if ($config_rainforest_enable_api) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
												<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
										</div>
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Ключ rfAPI</span></p>
											<input type="text" name="config_rainforest_api_key" value="<?php echo $config_rainforest_api_key; ?>" size="50" style="width:150px;" />
											<br/>
											<span class="help" style="display:inline-block;border-bottom:1px dashed black; cursor:pointer;" onclick="getZipRNFcodes();">получить zipcodes</span>
											<script>
												function getZipRNFcodes(){
													var zipCodeFields = [];
													for (var i = 1; i <= 5; i++) {
														var field = $('input[name=config_rainforest_api_zipcode_' + i + ']');
														zipCodeFields.push(field);
													}

													$.ajax({
														url: 'index.php?route=setting/rnf/getZipCodes&token=<?php echo $token; ?>',
														method: 'GET',
														dataType: 'json',
														success: function (ajaxResponse) {
															for (var i = 0; i < zipCodeFields.length; i++) {
																if (i < ajaxResponse.length) {
																	console.log(ajaxResponse[i]);
																	zipCodeFields[i].val(ajaxResponse[i]);
																	zipCodeFields[i].trigger('change');
																} else {
																	zipCodeFields[i].val('');
																	zipCodeFields[i].trigger('change');
																}
															}
														},
														error: function () {
															console.error('AJAX request failed');
														}
													});
												}
											</script>
										</div>
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Домен rfAPI - 1</span></p>
											<select name="config_rainforest_api_domain_1">
												<?php foreach ($amazon_domains as $amazon_domain) { ?>
													<option value="<?php echo $amazon_domain?>" <?php if ($config_rainforest_api_domain_1 == $amazon_domain) { ?>selected="selected"<?php }?>><?php echo $amazon_domain?></option>

												<?php } ?>
											</select>
										</div>
									</td>									
									
									<td style="width:20%">				
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">ZipCode rfAPI - 1</span></p>
											<input type="text" name="config_rainforest_api_zipcode_1" value="<?php echo $config_rainforest_api_zipcode_1; ?>" size="50" style="width:100px;" />
										</div>

										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">ZipCode rfAPI - 2</span></p>
											<input type="text" name="config_rainforest_api_zipcode_2" value="<?php echo $config_rainforest_api_zipcode_2; ?>" size="50" style="width:100px;" />
										</div>

										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">ZipCode rfAPI - 3</span></p>
											<input type="text" name="config_rainforest_api_zipcode_3" value="<?php echo $config_rainforest_api_zipcode_3; ?>" size="50" style="width:100px;" />
										</div>

										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">ZipCode rfAPI - 4</span></p>
											<input type="text" name="config_rainforest_api_zipcode_4" value="<?php echo $config_rainforest_api_zipcode_4; ?>" size="50" style="width:100px;" />
										</div>

										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">ZipCode rfAPI - 5</span></p>
											<input type="text" name="config_rainforest_api_zipcode_5" value="<?php echo $config_rainforest_api_zipcode_5; ?>" size="50" style="width:100px;" />
										</div>
									</td>
									
									<td style="width:20%">
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Модель работы</span></p>
											<select name="config_rainforest_category_model">

												<?php foreach (['standard', 'bestsellers', 'deals'] as $rainforest_model) { ?>
													<option value="<?php echo $rainforest_model; ?>" <?php if ($rainforest_model == $config_rainforest_category_model) { ?> selected="selected"<?php } ?>><?php echo $rainforest_model; ?></option>
												<?php } ?>
											</select>
										</div>

										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Рекурсивно добавлять товар</span></p>
											<select name="config_rainforest_enable_recursive_adding">
												<?php if ($config_rainforest_enable_recursive_adding) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>
										</div>	

										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Периодически чистить INVALID ASIN</span></p>
											<select name="config_rainforest_delete_invalid_asins">
												<?php if ($config_rainforest_delete_invalid_asins) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>
										</div>	

										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Автоматически создавать бренды</span></p>
											<select name="config_rainforest_auto_create_manufacturers">
												<?php if ($config_rainforest_auto_create_manufacturers) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>
										</div>									
									</td>

									<td style="width:20%">

										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">ID технической категории</span></p>
											<input type="number" name="config_rainforest_default_technical_category_id" value="<?php echo $config_rainforest_default_technical_category_id; ?>" size="50" style="width:90px;" />
										</div>

										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">ID неопределенной категории</span></p>
											<input type="number" name="config_rainforest_default_unknown_category_id" value="<?php echo $config_rainforest_default_unknown_category_id; ?>" size="50" style="width:90px;" />
										</div>

										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Наполнять AlsoBought товары</span></p>
											<select name="config_also_bought_auto_enable">
												<?php if ($config_also_bought_auto_enable) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>
										</div>

										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Наполнять Related категории</span></p>
											<select name="config_related_categories_auto_enable">
												<?php if ($config_related_categories_auto_enable) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>
										</div>
									</td>

									<td style="width:20%">
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Загружать макс вариантов</span></p>
											=<input type="number" name="config_rainforest_max_variants" value="<?php echo $config_rainforest_max_variants; ?>" size="50" style="width:100px;" />
										</div>
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Пропускать товары с вариантами</span></p>
											><input type="number" name="config_rainforest_skip_variants" value="<?php echo $config_rainforest_skip_variants; ?>" size="50" style="width:100px;" />
										</div>

										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Не добавлять товары с ценой меньше</span></p>
											<input type="number" name="config_rainforest_skip_low_price_products" value="<?php echo $config_rainforest_skip_low_price_products; ?>" size="50" style="width:100px;" /> <i class="fa fa-eur"></i>
										</div>

										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Удалять товары с ценой меньше</span></p>
											<select name="config_rainforest_drop_low_price_products">
												<?php if ($config_rainforest_drop_low_price_products) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>	
										</div>
									</td>
									
									
									<td style="width:20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Фильтры rfAPI - 1</span></p>
										<div class="scrollbox" style="height:200px;">
											<?php $class = 'odd'; ?>
											<?php foreach ($amazon_filters as $amazon_filter) { ?>
												<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
												<div class="<?php echo $class; ?>">
													<?php if (!empty($config_rainforest_amazon_filters_1) && in_array($amazon_filter, $config_rainforest_amazon_filters_1)) { ?>
														<input id="config_rainforest_amazon_filters_1<?php echo $amazon_filter; ?>" class="checkbox" type="checkbox" name="config_rainforest_amazon_filters_1[]" value="<?php echo $amazon_filter; ?>" checked="checked" />
														<label for="config_rainforest_amazon_filters_1<?php echo $amazon_filter; ?>"><?php echo $amazon_filter; ?></label>
														<?php } else { ?>
														<input id="config_rainforest_amazon_filters_1<?php echo $amazon_filter; ?>" class="checkbox" type="checkbox" name="config_rainforest_amazon_filters_1[]" value="<?php echo $amazon_filter; ?>" />
														<label for="config_rainforest_amazon_filters_1<?php echo $amazon_filter; ?>"><?php echo $amazon_filter; ?></label>
													<?php } ?>
												</div>
											<?php } ?>
										</div>
										<a class="select_all" onclick="$(this).parent().find(':checkbox').attr('checked', true);">Выделить всё</a><a class="remove_selection" onclick="$(this).parent().find(':checkbox').attr('checked', false);">Снять выделение</a>
									</td>									
								</tr>

								<tr>
									<td style="width:20%">
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Обрабатывать compare_with_similar</span></p>
											<select name="config_rainforest_enable_compare_with_similar_parsing">
												<?php if ($config_rainforest_enable_compare_with_similar_parsing) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>										
										</div>
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Обрабатывать frequently_bought_together</span></p>
											<select name="config_rainforest_enable_related_parsing">
												<?php if ($config_rainforest_enable_related_parsing) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>	
										</div>
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Обрабатывать sponsored_products</span></p>
											<select name="config_rainforest_enable_sponsored_parsing">
												<?php if ($config_rainforest_enable_sponsored_parsing) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>
										</div>

										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Обрабатывать similar_to_consider</span></p>
											<select name="config_rainforest_enable_similar_to_consider_parsing">
												<?php if ($config_rainforest_enable_similar_to_consider_parsing) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>
										</div>
									</td>

									<td style="width:20%">
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Обрабатывать view_to_purchase</span></p>
											<select name="config_rainforest_enable_view_to_purchase_parsing">
												<?php if ($config_rainforest_enable_view_to_purchase_parsing) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>
										</div>

										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Обрабатывать also_viewed</span></p>
											<select name="config_rainforest_enable_also_viewed_parsing">
												<?php if ($config_rainforest_enable_also_viewed_parsing) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>
										</div>

										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Обрабатывать also_bought</span></p>
											<select name="config_rainforest_enable_also_bought_parsing">
												<?php if ($config_rainforest_enable_also_bought_parsing) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>
										</div>

										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Обрабатывать shop_by_look</span></p>
											<select name="config_rainforest_enable_shop_by_look_parsing">
												<?php if ($config_rainforest_enable_shop_by_look_parsing) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>
										</div>
									</td>

									<td style="width:20%">
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">Добавлять compare_with_similar</span></p>
											<select name="config_rainforest_enable_compare_with_similar_adding">
												<?php if ($config_rainforest_enable_compare_with_similar_adding) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>										
										</div>
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">Добавлять frequently_bought_together</span></p>
											<select name="config_rainforest_enable_related_adding">
												<?php if ($config_rainforest_enable_related_adding) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>	
										</div>
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">Добавлять sponsored_products</span></p>
											<select name="config_rainforest_enable_sponsored_adding">
												<?php if ($config_rainforest_enable_sponsored_adding) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>
										</div>

										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">Добавлять similar_to_consider</span></p>
											<select name="config_rainforest_enable_similar_to_consider_adding">
												<?php if ($config_rainforest_enable_similar_to_consider_adding) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>
										</div>
									</td>

									<td style="width:20%">
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">Добавлять view_to_purchase</span></p>
											<select name="config_rainforest_enable_view_to_purchase_adding">
												<?php if ($config_rainforest_enable_view_to_purchase_adding) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>
										</div>

										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">Добавлять also_viewed</span></p>
											<select name="config_rainforest_enable_also_viewed_adding">
												<?php if ($config_rainforest_enable_also_viewed_adding) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>
										</div>

										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">Добавлять also_bought</span></p>
											<select name="config_rainforest_enable_also_bought_adding">
												<?php if ($config_rainforest_enable_also_bought_adding) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>
										</div>

										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">Добавлять shop_by_look</span></p>
											<select name="config_rainforest_enable_shop_by_look_adding">
												<?php if ($config_rainforest_enable_shop_by_look_adding) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>
										</div>
									</td>

									<td style="width:20%">
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Добавлять отзывы из top_reviews</span></p>
											<select name="config_rainforest_enable_review_adding">
												<?php if ($config_rainforest_enable_review_adding) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>
										</div>

										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Мин. рейтинг (1-5)</span></p>
											<input type="number" name="config_rainforest_min_review_rating" value="<?php echo $config_rainforest_min_review_rating; ?>" size="50" style="width:100px;" />
										</div>

										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Макс на товар</span></p>
											<input type="number" name="config_rainforest_max_review_per_product" value="<?php echo $config_rainforest_max_review_per_product; ?>" size="50" style="width:100px;" />
										</div>

										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Макс символов</span></p>
											<input type="number" name="config_rainforest_max_review_length" value="<?php echo $config_rainforest_max_review_length; ?>" size="50" style="width:100px;" />
										</div>

									</td>

									<td style="width:20%">
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">🤖 Экспортные названия с OpenAI</span></p>
											<select name="config_rainforest_export_names_with_openai">
												<?php if ($config_rainforest_export_names_with_openai) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>
										</div>

										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">🤖 Адекватные названия с OpenAI</span></p>
											<select name="config_rainforest_short_names_with_openai">
												<?php if ($config_rainforest_short_names_with_openai) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>
										</div>
									</td>
								</tr>

								<tr>
									<td style="width:20%">
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Переводить</span></p>
											<select name="config_rainforest_enable_translation">
												<?php if ($config_rainforest_enable_translation) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>
										</div>
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Язык Amazon</span></p>
											<select name="config_rainforest_source_language">
												<?php foreach ($languages as $language) { ?>
													<?php if ($language['code'] == $config_rainforest_source_language) { ?>
														<option value="<?php echo $language['code']; ?>" selected="selected"><?php echo $language['name']; ?></option>
													<?php } else { ?>
														<option value="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></option>
													<?php } ?>
												<?php } ?>
											</select>
										</div>
									</td>
										

									<td style="width:20%">
									<?php foreach ($languages as $language) { ?>
										<?php if ($language['code'] != $config_rainforest_source_language) { ?>
											<div>
												<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Переводить на <?php echo $language['code']; ?></span></p>
												<select name="config_rainforest_enable_language_<?php echo $language['code']; ?>">
													<?php if (${'config_rainforest_enable_language_' . $language['code']}) { ?>
														<option value="1" selected="selected">Включить</option>
														<option value="0">Отключить</option>
													<?php } else { ?>													
														<option value="1">Включить</option>
														<option value="0"  selected="selected">Отключить</option>
													<? } ?>
												</select>											
											</div>
										<?php } ?>
									<?php } ?>
									</td>


									<td style="width:20%">
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Обновлять кат. раз в Х дней</span></p>
											<input type="number" name="config_rainforest_category_update_period" value="<?php echo $config_rainforest_category_update_period; ?>" size="50" style="width:100px;" />
										</div>
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Обновлять цену раз в Х дней</span></p>
											<input type="number" name="config_rainforest_update_period" value="<?php echo $config_rainforest_update_period; ?>" size="50" style="width:100px;" />
										</div>
									</td>

									<td style="width:20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">TG группа уведомлений</span></p>
										<input type="text" name="config_rainforest_tg_alert_group_id" value="<?php echo $config_rainforest_tg_alert_group_id; ?>" size="50" style="width:250px;" />
									</td>

									<td style="width:20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Автоматическое дерево</span></p>
										<select name="config_rainforest_enable_auto_tree">
											<?php if ($config_rainforest_enable_auto_tree) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
												<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
									</td>

									<td style="width:20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Корневые категории Amazon</span></p>
										<textarea name="config_rainforest_root_categories" rows="3"><?php echo $config_rainforest_root_categories; ?></textarea>
									</td>

								</tr>
							</table>

							<h2><i class="fa fa-search"></i> Ценообразование Amazon + RainForest API Основная формула ЦО</h2>

							<table class="form">
								<tr>
									<td width="60%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Формула подсчета цены по умолчанию</span></p>
										<input type="text" name="config_rainforest_main_formula" value="<?php echo $config_rainforest_main_formula; ?>" style="width:90%;" />
									</td>

									<td width="10%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Шагов</span></p>
										<input type="number" step="1" name="config_rainforest_main_formula_count" value="<?php echo $config_rainforest_main_formula_count; ?>" size="50" style="width:100px;" />
									</td>

									<td width="30%">
										<span class="help">
											<i class="fa fa-info"></i> <b>PRICE</b>  = цена товара у поставщика<br />
											<i class="fa fa-info"></i> <b>WEIGHT</b> = подсчитанный вес товара<br />
											<i class="fa fa-info"></i> <b>KG_LOGISTIC</b> = стоимость логистики одного килограмма<br />
											<i class="fa fa-info"></i> <b>VAT_SRC</b> = VAT/НДС страны - поставщика<br />
											<i class="fa fa-info"></i> <b>VAT_DST</b> = VAT/НДС страны - получателя<br />
											<i class="fa fa-info"></i> <b>TAX</b> = дополнительный налог<br />
											<i class="fa fa-info"></i> <b>SUPPLIER</b> = процент поставщика<br />
											<i class="fa fa-info"></i> <b>INVOICE</b> = коэффициент инвойса<br />
											
											<i class="fa fa-info"></i> <b>PLUS</b> = знак + нужно заменять на слово, в силу технических ограничений<br />
											<i class="fa fa-info"></i> <b>MULTIPLY</b> = знак * нужно заменять на слово, в силу технических ограничений<br />
											<i class="fa fa-info"></i> <b>DIVIDE</b> = знак / нужно заменять на слово, в силу технических ограничений<br />
										</span>
									</td>
								</tr>								
							</table>

							<table class="form">
								<tr>
									<td width="1%">										
									</td>
									<td width="10%">
										<span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">Цена закупки от, <?php echo $config_currency; ?></span>
									</td>
									<td width="10%">
										<span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Цена закупки до, <?php echo $config_currency; ?></span>
									</td>
									<td width="10%">
										<span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Если нет веса</span>
									</td>
									<td width="69%">
										<span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Формула</span>
									</td>
								</tr>
								<?php for ($crmfc = 1; $crmfc <= $config_rainforest_main_formula_count; $crmfc++){ ?>
									<tr>
										<td width="10%">
											<b><?php echo $crmfc; ?></b>
										</td>
										<td width="10%">
											<input type="number" step="1" name="config_rainforest_main_formula_min_<?php echo $crmfc; ?>" value="<?php echo ${'config_rainforest_main_formula_min_' . $crmfc}; ?>" size="50" style="width:100px; border-color:#00ad07;" />
										</td>
										<td width="10%">
											<input type="number" step="1" name="config_rainforest_main_formula_max_<?php echo $crmfc; ?>" value="<?php echo ${'config_rainforest_main_formula_max_' . $crmfc}; ?>" size="50" style="width:100px; border-color:#cf4a61;" />
										</td>
										<td width="10%">
											<input type="number" step=".1" name="config_rainforest_main_formula_default_<?php echo $crmfc; ?>" value="<?php echo ${'config_rainforest_main_formula_default_' . $crmfc}; ?>" size="50" style="width:100px; border-color:#D69241;" />
										</td>
										<td width="79%">
											<input type="text" name="config_rainforest_main_formula_overload_<?php echo $crmfc; ?>" value="<?php echo ${'config_rainforest_main_formula_overload_' . $crmfc}; ?>" style="width:90%;  border-color:#7F00FF;" />
										</td>
									</tr>
								<?php } ?>
							</table>


							<h2><i class="fa fa-search"></i> Ценообразование Amazon + RainForest API</h2>

							<table class="form">
								<tr>
									<td style="width:15%">
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Включить ценообразование A+rfAPI</span></p>
											<select name="config_rainforest_enable_pricing">
												<?php if ($config_rainforest_enable_pricing) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>
											<br />
											<span class="help"><i class="fa fa-exclamation-circle"></i> в случае неоплаты - лучше отключить</span>
										</div>
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Цена для этой страны ставится по-умолчанию</span></p>
											<select name="config_rainforest_default_store_id">
												<option value="-1" <?php if (-1 == $config_rainforest_default_store_id) { ?>selected="selected"<? } ?>>Переназначать все страны</option>
												<?php foreach ($stores as $store) { ?>
													<option value="<?php echo $store['store_id']; ?>" <?php if ($store['store_id'] == $config_rainforest_default_store_id) { ?>selected="selected"<? } ?>><?php echo $store['name']; ?></option>
												<?php } ?>
											</select>
										<br />
										<span class="help"><i class="fa fa-info"></i> если задано, то цена для этого магазина будет ценой по-умолчанию</span>
										</div>
									</td>
		

									<td style="width:15%">
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Если нет офферов</span></p>
											<select name="config_rainforest_nooffers_action">
												<?php if ($config_rainforest_nooffers_action) { ?>
													<option value="1" selected="selected">Менять статус</option>
													<option value="0">Ничего не делать</option>
												<?php } else { ?>													
													<option value="1">Менять статус</option>
													<option value="0"  selected="selected">Ничего не делать</option>
												<? } ?>
											</select>
											<br />
											<span class="help"><i class="fa fa-exclamation-circle"></i> что делать при обновлении, если на амазоне нет предложений</span>
										</div>
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Статус, если нет офферов</span></p>
											<select name="config_rainforest_nooffers_status_id">
												<?php foreach ($stock_statuses as $stock_status) { ?>
													<?php if ($stock_status['stock_status_id'] == $config_rainforest_nooffers_status_id) { ?>
														<option value="<?php echo $stock_status['stock_status_id']; ?>" selected="selected"><?php echo $stock_status['name']; ?></option>
													<?php } else { ?>
														<option value="<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></option>
													<?php } ?>
												<?php } ?>
											</select>
											<br />
											<span class="help"><i class="fa fa-exclamation-circle"></i> установить этот статус товару, если на амазоне нет предложений</span>	
										</div>
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Макс. дней доставки</span></p>
											<input type="number" name="config_rainforest_max_delivery_days_for_offer" value="<?php echo $config_rainforest_max_delivery_days_for_offer; ?>" size="50" style="width:100px;" />
											<br />
											<span class="help"><i class="fa fa-exclamation-circle"></i> оффер будет проигнорирован, если доставка занимает больше дней</span>
										</div>

										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Макс. цена доставки</span></p>
											<input type="number" name="config_rainforest_max_delivery_price" value="<?php echo $config_rainforest_max_delivery_price; ?>" size="50" style="width:100px;" /> EUR
											<br />
											<span class="help"><i class="fa fa-exclamation-circle"></i> оффер будет проигнорирован, если доставка стоит больше</span>
										</div>

										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Макс. цена доставки Х</span></p>
											<input type="number" name="config_rainforest_max_delivery_price_multiplier" value="<?php echo $config_rainforest_max_delivery_price_multiplier; ?>" size="50" style="width:100px;" />
											<br />
											<span class="help"><i class="fa fa-exclamation-circle"></i> оффер будет проигнорирован, если доставка больше цены в Х раз</span>
										</div>
									</td>

									<td style="width:15%">
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Удалять если нет офферов</span></p>
											<select name="config_rainforest_delete_no_offers">
												<?php if ($config_rainforest_delete_no_offers) { ?>
													<option value="1" selected="selected">Удалять</option>
													<option value="0">Ничего не делать</option>
												<?php } else { ?>													
													<option value="1">Удалять</option>
													<option value="0"  selected="selected">Ничего не делать</option>
												<? } ?>
											</select>
											<br />
											<span class="help"><i class="fa fa-exclamation-circle"></i> если офферов нету, удалять товар</span>	
										</div>
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Порог "нет офферов"</span></p>
											<input type="number" name="config_rainforest_delete_no_offers_counter" value="<?php echo $config_rainforest_delete_no_offers_counter; ?>" size="50" style="width:100px;" />
											<br />
											<span class="help"><i class="fa fa-exclamation-circle"></i> если включено удаление то удаляются товары у которых не было офферов Х раз</span>
										</div>
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Также изменять количество</span></p>
											<select name="config_rainforest_nooffers_quantity">
												<?php if ($config_rainforest_nooffers_quantity) { ?>
													<option value="1" selected="selected">Менять количество</option>
													<option value="0">Ничего не делать</option>
												<?php } else { ?>													
													<option value="1">Менять количество</option>
													<option value="0"  selected="selected">Ничего не делать</option>
												<? } ?>
											</select>
											<br />
											<span class="help"><i class="fa fa-exclamation-circle"></i> количество будет изменяться 0-9999</span>
										</div>

										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Пропускать с скидкой</span></p>
											<select name="config_rainforest_disable_offers_if_has_special">
												<?php if ($config_rainforest_disable_offers_if_has_special) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Выключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Выключить</option>
												<? } ?>
											</select>
											<br />
											<span class="help"><i class="fa fa-exclamation-circle"></i> пропускать товары с актуальной скидкой</span>	
										</div>

										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Использовать логику парсера</span></p>
											<select name="config_rainforest_disable_offers_use_field_ignore_parse">
												<?php if ($config_rainforest_disable_offers_use_field_ignore_parse) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Выключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Выключить</option>
												<? } ?>
											</select>
											<br />
											<span class="help"><i class="fa fa-exclamation-circle"></i> пропускать товары с "Не обновлять цены"</span>	
										</div>

									</td>

									<td style="width:15%">
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Пропускать товары, которые были закуплены</span></p>
											<select name="config_rainforest_pass_offers_for_ordered">
												<?php if ($config_rainforest_pass_offers_for_ordered) { ?>
													<option value="1" selected="selected">Да</option>
													<option value="0">Нет</option>
												<?php } else { ?>													
													<option value="1">Да</option>
													<option value="0"  selected="selected">Нет</option>
												<? } ?>
											</select>
										</div>
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Х дней от последней закупки</span></p>
											<input type="number" step="1" name="config_rainforest_pass_offers_for_ordered_days" value="<?php echo $config_rainforest_pass_offers_for_ordered_days; ?>" style="width:100px;" />
											<br />
											<span class="help"><i class="fa fa-exclamation-circle"></i> если пропускать товары, которые были закуплены, то как давно</span>
										</div>

										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Объемный вес макс Х</span></p>
											<input type="number" step="0.1" name="config_rainforest_volumetric_max_wc_multiplier" value="<?php echo $config_rainforest_volumetric_max_wc_multiplier; ?>" style="width:100px;" />
											<br />
											<span class="help"><i class="fa fa-exclamation-circle"></i> не учитывать объемный вес, если он больше в Х раз</span>
										</div>
									</td>

									<td style="width:15%">
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Получать офферы только для полностью загруженных</span></p>
											<select name="config_rainforest_enable_offers_only_for_filled">
												<?php if ($config_rainforest_enable_offers_only_for_filled) { ?>
													<option value="1" selected="selected">Да</option>
													<option value="0">Нет, для всех</option>
												<?php } else { ?>													
													<option value="1">Да</option>
													<option value="0"  selected="selected">Нет, для всех</option>
												<? } ?>
											</select>
											<br />
											<span class="help"><i class="fa fa-exclamation-circle"></i> в противном случае - для всех асинов.</span>
										</div>
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Получать офферы для товаров на складе</span></p>
											<select name="config_rainforest_enable_offers_for_stock">
												<?php if ($config_rainforest_enable_offers_for_stock) { ?>
													<option value="1" selected="selected">Да</option>
													<option value="0">Нет</option>
												<?php } else { ?>													
													<option value="1">Да</option>
													<option value="0"  selected="selected">Нет</option>
												<? } ?>
											</select>	
											<br />
											<span class="help"><i class="fa fa-exclamation-circle"></i> если эта настройка выключена, также не будут изменяться статусы</span>									
										</div>
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Получать офферы сразу после заказа</span></p>
											<select name="config_rainforest_enable_offers_after_order">
												<?php if ($config_rainforest_enable_offers_after_order) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>
										</div>
									</td>
								</tr>
							</table>
							<table class="form">
								<tr>									
									<?php foreach ($stores as $store) { ?>
										<td width="<?php echo (int)(100/count($stores))?>%">
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF"><i class="fa fa-eur"></i> Стоимость логистики 1 кг: <?php echo $store['name']; ?></span></p>
											<input type="number" step="0.1" name="config_rainforest_kg_price_<?php echo $store['store_id']?>" value="<?php echo ${'config_rainforest_kg_price_' . $store['store_id']}; ?>" style="width:200px;" />

											<br />
											<span class="help"><i class="fa fa-eur"></i> стоимость килограмма для доставки в страну (если 0 - цена не пересчитывается)</span>
										</td>
									<?php } ?>
								</tr>
							</table>

							<table class="form">
								<tr>									
									<?php foreach ($stores as $store) { ?>
										<td width="<?php echo (int)(100/count($stores))?>%">
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF"><i class="fa fa-eur"></i> Использовать объемный вес: <?php echo $store['name']; ?></span></p>
											<select name="config_rainforest_use_volumetric_weight_<?php echo $store['store_id']; ?>">
												<?php if (${'config_rainforest_use_volumetric_weight_' . $store['store_id']}) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>
											<br />
											<span class="help"><i class="fa fa-eur"></i> стоимость килограмма для доставки в страну (если 0 - цена не пересчитывается)</span>
										</td>
									<?php } ?>
								</tr>
							</table>

							<table class="form">
								<tr>									
									<?php foreach ($stores as $store) { ?>
										<td width="<?php echo (int)(100/count($stores))?>%">
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF"><i class="fa fa-eur"></i> Коэффициент объемного веса <?php echo $store['name']; ?></span></p>
											<input type="number" step="100" name="config_rainforest_volumetric_weight_coefficient_<?php echo $store['store_id']?>" value="<?php echo ${'config_rainforest_volumetric_weight_coefficient_' . $store['store_id']}; ?>" style="width:200px;" />									
										</td>
									<?php } ?>
								</tr>
							</table>

							<table class="form">
								<tr>									
									<?php foreach ($stores as $store) { ?>
										<td width="<?php echo (int)(100/count($stores))?>%">
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF"><i class="fa fa-eur"></i> Умножать если нет веса: <?php echo $store['name']; ?></span></p>
											<input type="number" step="0.1" name="config_rainforest_default_multiplier_<?php echo $store['store_id']?>" value="<?php echo ${'config_rainforest_default_multiplier_' . $store['store_id']}; ?>" style="width:200px;" />
										</td>
									<?php } ?>
								</tr>
							</table>

							<table class="form">
								<tr>									
									<?php foreach ($stores as $store) { ?>
										<td width="<?php echo (int)(100/count($stores))?>%">
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF"><i class="fa fa-eur"></i> Максимально Х <?php echo $store['name']; ?></span></p>
											<input type="number" step="0.1" name="config_rainforest_max_multiplier_<?php echo $store['store_id']?>" value="<?php echo ${'config_rainforest_max_multiplier_' . $store['store_id']}; ?>" style="width:200px;" />
										</td>
									<?php } ?>
								</tr>
							</table>

							<table>
								<tr>									
										<td width="20%">
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Мин. внутр. рейтинг</span></p>
											<input type="number" step="1" name="config_rainforest_supplierminrating_inner" value="<?php echo $config_rainforest_supplierminrating_inner; ?>" style="width:200px;" />

											<br />
											<span class="help"><i class="fa fa-info"></i> если внутренний рейтинг поставщика (задан в справочнике) менее этой цифры, то оффер исключается из подсчетов</span>
										</td>

										<td width="20%">
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Мин. рейтинг Amazon</span></p>
											<input type="number" step="0.1" name="config_rainforest_supplierminrating" value="<?php echo $config_rainforest_supplierminrating; ?>" style="width:200px;" />

											<br />
											<span class="help"><i class="fa fa-info"></i> если рейтинг на основании отзывов на Amazon менее этой цифры, то оффер исключается из подсчетов</span>
										</td>
								</tr>
							</table>
						</div>


						<div id="tab-openai">
							<h2>🤖 Общие настройки</h2>
							<table class="form">
								<tr>
									<td width="33%">	
									<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Включить OpenAI</span></p>
										<select name="config_openai_enable">
											<?php if ($config_openai_enable) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
												<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>									
									</td>
									
									<td width="33%">
										<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">API KEY</span></p>
										<input type="text" name="config_openai_api_key" value="<?php echo $config_openai_api_key; ?>" size="50" style="width:250px;" />
									</td>	

									<td width="33%">
										<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Модель по-умолчанию</span></p>
										<select name="config_openai_default_model">
											<?php foreach ($openai_models_list as $openai_model) { ?>
												<?php if ($config_openai_default_model == $openai_model['id']) { ?>
													<option value="<?php echo $openai_model['id']; ?>" selected="selected"><?php echo $openai_model['id']; ?></option>												
												<?php } else { ?>													
													<option value="<?php echo $openai_model['id']; ?>"><?php echo $openai_model['id']; ?></option>
												<? } ?>
											<?php } ?>
										</select>	
									</td>
								</tr>
							</table>

							<table class="list">
								<tr>
									<td>
										<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Max tokens</span></p>
									</td>
									<td>
										<span class="help">
											Запросы могут использовать до 2048 или 4000 токенов, разделенных между подсказкой и завершением. Точный предел зависит от модели. (Один токен составляет примерно 4 символа для обычного английского текста)
										</span>
									</td>
								</tr>
								<tr>
									<td>
										<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Temperature</span></p>
									</td>
									<td>
										<span class="help">
											Управляет случайностью: понижение приводит к меньшему количеству случайных завершений. Когда температура приближается к нулю, модель становится детерминированной и повторяющейся.
										</span>
									</td>
								</tr>
								<tr>
									<td>
										<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Top P</span></p>
									</td>
									<td>
										<span class="help">
											Контролирует разнообразие посредством выборки ядра: 0,5 означает, что рассматривается половина всех вариантов, взвешенных по правдоподобию.
										</span>
									</td>
								</tr>
								<tr>
									<td>
										<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Frequency penalty</span></p>
									</td>
									<td>
										<span class="help">
											Насколько штрафовать новые токены на основе их существующей частоты в тексте на данный момент. Уменьшает вероятность того, что модель дословно повторит одну и ту же строку.
										</span>
									</td>
								</tr>
								<tr>
									<td>
										<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Presence penalty</span></p>
									</td>
									<td>
										<span class="help">
											Насколько штрафовать новые токены в зависимости от того, появляются ли они в тексте до сих пор. Увеличивает вероятность того, что модель заговорит на новые темы.
										</span>
									</td>
								</tr>
							</table>

							<h2>🤖 Альтернативные названия категорий для поиска</h2>
							<table class="form">
								<tr>
									<td style="width:15%">	
										<div>
											<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Включить</span></p>
											<select name="config_openai_enable_category_alternatenames">
												<?php if ($config_openai_enable_category_alternatenames) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>									
										</div>

										<div>
											<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Точка входа</span></p>
											<select name="config_openai_category_alternatenames_endpoint">
												<?php foreach ($openai_endpoints as $openai_endpoint) { ?>
													<?php if ($config_openai_category_alternatenames_endpoint == $openai_endpoint) { ?>
														<option value="<?php echo $openai_endpoint; ?>" selected="selected"><?php echo $openai_endpoint; ?></option>												
													<?php } else { ?>													
														<option value="<?php echo $openai_endpoint; ?>"><?php echo $openai_endpoint; ?></option>
													<? } ?>
												<?php } ?>
											</select>											
										</div>

										<div>
											<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Модель</span></p>
											<select name="config_openai_category_alternatenames_model">
												<?php foreach ($openai_models_list as $openai_model) { ?>
													<?php if ($config_openai_category_alternatenames_model == $openai_model['id']) { ?>
														<option value="<?php echo $openai_model['id']; ?>" selected="selected"><?php echo $openai_model['id']; ?></option>												
													<?php } else { ?>													
														<option value="<?php echo $openai_model['id']; ?>"><?php echo $openai_model['id']; ?></option>
													<? } ?>
												<?php } ?>
											</select>											
										</div>
									</td>

									<td style="width:15%">
										<div>
											<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Max tokens</span></p>
											<input type="number" step="10" min="100" max="4000" name="config_openai_category_alternatenames_maxtokens" value="<?php echo $config_openai_category_alternatenames_maxtokens; ?>" size="50" style="width:60px;" />										
										</div>
										<div>
											<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Temperature</span></p>
											<input type="number" step="0.1" min="0" max="1" name="config_openai_category_alternatenames_temperature" value="<?php echo $config_openai_category_alternatenames_temperature; ?>" size="50" style="width:60px;" />	
										</div>
									</td>

									<td style="width:15%">
										<div>
											<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Top P</span></p>
											<input type="number" step="0.1" min="0" max="1" name="config_openai_category_alternatenames_top_p" value="<?php echo $config_openai_category_alternatenames_top_p; ?>" size="50" style="width:60px;" />
										</div>
										<div>
											<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Frequency penalty</span></p>
											<input type="number" step="0.1" min="0" max="2" name="config_openai_category_alternatenames_freq_penalty" value="<?php echo $config_openai_category_alternatenames_freq_penalty; ?>" size="50" style="width:60px;" />
										</div>
										<div>
											<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Presence penalty</span></p>
											<input type="number" step="0.1" min="0" max="2" name="config_openai_category_alternatenames_presence_penalty" value="<?php echo $config_openai_category_alternatenames_presence_penalty; ?>" size="50" style="width:60px;" />
										</div>
									</td>

									<td style="width:55%">
										<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Запрос к AI</span></p>	
										<?php foreach ($languages as $language) { ?>											
											<div style="margin-bottom: 10px;">											
												<img src="<?php echo DIR_FLAGS_NAME; ?><?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> 
												<textarea style="width:80%" name="config_openai_category_alternatenames_query_<?php echo $language['code']; ?>" rows="4"><?php echo ${'config_openai_category_alternatenames_query_' . $language['code']}; ?></textarea>
											</div>
										<?php } ?>
									</td>						
								</tr>
							</table>

							<h2>🤖 Описания категорий</h2>
							<table class="form">
								<tr>
									<td style="width:15%">	
										<div>
											<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Включить</span></p>
											<select name="config_openai_enable_category_descriptions">
												<?php if ($config_openai_enable_category_descriptions) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>									
										</div>
										<div>
											<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Точка входа</span></p>
											<select name="config_openai_category_descriptions_endpoint">
												<?php foreach ($openai_endpoints as $openai_endpoint) { ?>
													<?php if ($config_openai_category_descriptions_endpoint == $openai_endpoint) { ?>
														<option value="<?php echo $openai_endpoint; ?>" selected="selected"><?php echo $openai_endpoint; ?></option>												
													<?php } else { ?>													
														<option value="<?php echo $openai_endpoint; ?>"><?php echo $openai_endpoint; ?></option>
													<? } ?>
												<?php } ?>
											</select>											
										</div>
										<div>
											<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Модель</span></p>
											<select name="config_openai_category_descriptions_model">
												<?php foreach ($openai_models_list as $openai_model) { ?>
													<?php if ($config_openai_category_descriptions_model == $openai_model['id']) { ?>
														<option value="<?php echo $openai_model['id']; ?>" selected="selected"><?php echo $openai_model['id']; ?></option>												
													<?php } else { ?>													
														<option value="<?php echo $openai_model['id']; ?>"><?php echo $openai_model['id']; ?></option>
													<? } ?>
												<?php } ?>
											</select>											
										</div>
									</td>

									<td style="width:15%">
										<div>
											<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Max tokens</span></p>
											<input type="number" step="10" min="100" max="4000" name="config_openai_category_descriptions_maxtokens" value="<?php echo $config_openai_category_descriptions_maxtokens; ?>" size="50" style="width:60px;" />										
										</div>
										<div>
											<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Temperature</span></p>
											<input type="number" step="0.1" min="0" max="1" name="config_openai_category_descriptions_temperature" value="<?php echo $config_openai_category_descriptions_temperature; ?>" size="50" style="width:60px;" />	
										</div>
									</td>

									<td style="width:15%">
										<div>
											<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Top P</span></p>
											<input type="number" step="0.1" min="0" max="1" name="config_openai_category_descriptions_top_p" value="<?php echo $config_openai_category_descriptions_top_p; ?>" size="50" style="width:60px;" />
										</div>
										<div>
											<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Frequency penalty</span></p>
											<input type="number" step="0.1" min="0" max="2" name="config_openai_category_descriptions_freq_penalty" value="<?php echo $config_openai_category_descriptions_freq_penalty; ?>" size="50" style="width:60px;" />
										</div>
										<div>
											<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Presence penalty</span></p>
											<input type="number" step="0.1" min="0" max="2" name="config_openai_category_descriptions_presence_penalty" value="<?php echo $config_openai_category_descriptions_presence_penalty; ?>" size="50" style="width:60px;" />
										</div>
									</td>

									<td style="width:55%">
										<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Запрос к AI</span></p>	
										<?php foreach ($languages as $language) { ?>											
											<div style="margin-bottom: 10px;">											
												<img src="<?php echo DIR_FLAGS_NAME; ?><?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
												<textarea style="width:80%" name="config_openai_category_descriptions_query_<?php echo $language['code']; ?>" rows="4"><?php echo ${'config_openai_category_descriptions_query_' . $language['code']}; ?></textarea>
											</div>
										<?php } ?>
									</td>						
								</tr>
							</table>

							<h2>🤖 Адекватные названия</h2>
							<table class="form">
								<tr>
									<td style="width:15%">
										<div>		
											<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Включить</span></p>
											<select name="config_openai_enable_shorten_names">
												<?php if ($config_openai_enable_shorten_names) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>									
										</div>
										<div>
											<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Точка входа</span></p>
											<select name="config_openai_shortennames_endpoint">
												<?php foreach ($openai_endpoints as $openai_endpoint) { ?>
													<?php if ($config_openai_shortennames_endpoint == $openai_endpoint) { ?>
														<option value="<?php echo $openai_endpoint; ?>" selected="selected"><?php echo $openai_endpoint; ?></option>												
													<?php } else { ?>													
														<option value="<?php echo $openai_endpoint; ?>"><?php echo $openai_endpoint; ?></option>
													<? } ?>
												<?php } ?>
											</select>											
										</div>
										<div>	
											<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Модель</span></p>
											<select name="config_openai_shortennames_model">
												<?php foreach ($openai_models_list as $openai_model) { ?>
													<?php if ($config_openai_shortennames_model == $openai_model['id']) { ?>
														<option value="<?php echo $openai_model['id']; ?>" selected="selected"><?php echo $openai_model['id']; ?></option>												
													<?php } else { ?>													
														<option value="<?php echo $openai_model['id']; ?>"><?php echo $openai_model['id']; ?></option>
													<? } ?>
												<?php } ?>
											</select>
										</div>
									</td>

									<td style="width:15%">
										<div>
											<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Длина</span></p>
											<input type="number" step="1" min="10" max="100" name="config_openai_shortennames_length" value="<?php echo $config_openai_shortennames_length; ?>" size="50" style="width:60px;" />
										</div>
										<div>
											<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Max tokens</span></p>
											<input type="number" step="10" min="100" max="4000" name="config_openai_shortennames_maxtokens" value="<?php echo $config_openai_shortennames_maxtokens; ?>" size="50" style="width:60px;" />
										</div>
										<div>
											<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Temperature</span></p>
											<input type="number" step="0.1" min="0" max="1" name="config_openai_shortennames_temperature" value="<?php echo $config_openai_shortennames_temperature; ?>" size="50" style="width:60px;" />
										</div>
									</td>

									<td style="width:15%">
										<div>
											<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Top P</span></p>
											<input type="number" step="0.1" min="0" max="1" name="config_openai_shortennames_top_p" value="<?php echo $config_openai_shortennames_top_p; ?>" size="50" style="width:60px;" />
										</div>
										<div>
											<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Frequency penalty</span></p>
											<input type="number" step="0.1" min="0" max="2" name="config_openai_shortennames_freq_penalty" value="<?php echo $config_openai_shortennames_freq_penalty; ?>" size="50" style="width:60px;" />
										</div>
										<div>
											<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Presence penalty</span></p>
											<input type="number" step="0.1" min="0" max="2" name="config_openai_shortennames_presence_penalty" value="<?php echo $config_openai_shortennames_presence_penalty; ?>" size="50" style="width:60px;" />
										</div>
									</td>


									<td style="width:55%">
										<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Запрос к AI</span></p>	
										<?php foreach ($languages as $language) { ?>											
											<div style="margin-bottom: 10px;">											
												<img src="<?php echo DIR_FLAGS_NAME; ?><?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <input type="text" name="config_openai_shortennames_query_<?php echo $language['code']; ?>" value="<?php echo ${'config_openai_shortennames_query_' . $language['code']}; ?>" style="width:80%" />
											</div>
										<?php } ?>
									</td>
								</tr>
							</table>

							<h2>🤖 Экспортные названия</h2>
							<table class="form">
								<tr>
									<td style="width:15%">	
										<div>
											<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Включить</span></p>
											<select name="config_openai_enable_export_names">
												<?php if ($config_openai_enable_export_names) { ?>
													<option value="1" selected="selected">Включить</option>
													<option value="0">Отключить</option>
												<?php } else { ?>													
													<option value="1">Включить</option>
													<option value="0"  selected="selected">Отключить</option>
												<? } ?>
											</select>									
										</div>
										<div>
											<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Точка входа</span></p>
											<select name="config_openai_exportnames_endpoint">
												<?php foreach ($openai_endpoints as $openai_endpoint) { ?>
													<?php if ($config_openai_exportnames_endpoint == $openai_endpoint) { ?>
														<option value="<?php echo $openai_endpoint; ?>" selected="selected"><?php echo $openai_endpoint; ?></option>												
													<?php } else { ?>													
														<option value="<?php echo $openai_endpoint; ?>"><?php echo $openai_endpoint; ?></option>
													<? } ?>
												<?php } ?>
											</select>											
										</div>
										<div>	
											<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Модель</span></p>
											<select name="config_openai_exportnames_model">
												<?php foreach ($openai_models_list as $openai_model) { ?>
													<?php if ($config_openai_exportnames_model == $openai_model['id']) { ?>
														<option value="<?php echo $openai_model['id']; ?>" selected="selected"><?php echo $openai_model['id']; ?></option>												
													<?php } else { ?>													
														<option value="<?php echo $openai_model['id']; ?>"><?php echo $openai_model['id']; ?></option>
													<? } ?>
												<?php } ?>
											</select>	
										</div>									
									</td>

									<td style="width:15%">
										<div>
											<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Длина</span></p>
											<input type="number" step="1" min="10" max="100" name="config_openai_exportnames_length" value="<?php echo $config_openai_exportnames_length; ?>" size="50" style="width:60px;" />
										</div>
										<div>
											<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Max tokens</span></p>
											<input type="number" step="10" min="100" max="4000" name="config_openai_exportnames_maxtokens" value="<?php echo $config_openai_exportnames_maxtokens; ?>" size="50" style="width:60px;" />
										</div>
										<div>
											<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Temperature</span></p>
											<input type="number" step="0.1" min="0" max="1" name="config_openai_exportnames_temperature" value="<?php echo $config_openai_exportnames_temperature; ?>" size="50" style="width:60px;" />
										</div>
									</td>

									<td style="width:15%">
										<div>
											<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Top P</span></p>
											<input type="number" step="0.1" min="0" max="1" name="config_openai_exportnames_top_p" value="<?php echo $config_openai_exportnames_top_p; ?>" size="50" style="width:60px;" />
										</div>
										<div>
											<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Frequency penalty</span></p>
											<input type="number" step="0.1" min="0" max="2" name="config_openai_exportnames_freq_penalty" value="<?php echo $config_openai_exportnames_freq_penalty; ?>" size="50" style="width:60px;" />
										</div>
										<div>
											<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Presence penalty</span></p>
											<input type="number" step="0.1" min="0" max="2" name="config_openai_exportnames_presence_penalty" value="<?php echo $config_openai_exportnames_presence_penalty; ?>" size="50" style="width:60px;" />
										</div>
									</td>

									<td style="width:55%">
										<p>🤖 <span class="status_color" style="display:inline-block; padding:3px 5px; background:#353740; color:#FFF">Запрос к AI</span></p>	
										<?php foreach ($languages as $language) { ?>											
											<div style="margin-bottom: 10px;">											
												<img src="<?php echo DIR_FLAGS_NAME; ?><?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <input type="text" name="config_openai_exportnames_query_<?php echo $language['code']; ?>" value="<?php echo ${'config_openai_exportnames_query_' . $language['code']}; ?>" style="width:80%" />
											</div>
										<?php } ?>
									</td>
								</tr>
							</table>
						</div>
						
						<div id="tab-apis">
							<h2>HelpCrunch чат</h2>
							<table class="form">
								<tr>
									<td width="25%">	
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">Включить HelpCrunch</span></p>
										<select name="config_helpcrunch_enable">
											<?php if ($config_helpcrunch_enable) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
												<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>									
									</td>
									
									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">APP ID</span></p>
										<input type="text" name="config_helpcrunch_app_id" value="<?php echo $config_helpcrunch_app_id; ?>" size="50" style="width:300px;" />
									</td>
									
									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">API organisation</span></p>
										<input type="text" name="config_helpcrunch_app_organisation" value="<?php echo $config_helpcrunch_app_organisation; ?>" size="50" style="width:200px;" />
									</td>

									<td width="25%">	
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF">Передавать пользователя</span></p>
										<select name="config_helpcrunch_send_auth_data">
											<?php if ($config_helpcrunch_send_auth_data) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
												<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>									
									</td>
									
								</tr>
							</table>

							<h2> Translate API</h2>
							<table class="form">
								<tr>
									<td width="33%">	
										<div>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#D69241; color:#FFF">Библиотека Translate</span></p>
											<select name="config_translation_library">
												<?php foreach ($translategates as $translategate) { ?>
													<?php if ($translategate == $config_translation_library) { ?>
														<option value="<?php echo $translategate; ?>" selected="selected"><?php echo $translategate; ?></option>
													<?php } else { ?>
														<option value="<?php echo $translategate; ?>"><?php echo $translategate; ?></option>
													<?php } ?>
												<?php } ?>				
											</select>
										</div>
									</td>	

									<td width="33%">	
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Включить Translate API</span></p>
										<select name="config_translate_api_enable">
											<?php if ($config_translate_api_enable) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
												<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>									
									</td>							
								</tr>
							</table>

							<h2> Microsoft Azure Cloud API</h2>
							<table class="form">
								<tr>
									<td width="33%">	
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Включить Microsoft Azure Cloud API</span></p>
										<select name="config_azure_translate_api_enable">
											<?php if ($config_azure_translate_api_enable) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
												<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>									
									</td>

									<td width="33%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ffcc00; color:#FFF">API REGION</span></p>
										<input type="text" name="config_azure_translate_api_region" value="<?php echo $config_azure_translate_api_region; ?>" size="50" style="width:250px;" />
									</td>	
									
									<td width="33%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ffcc00; color:#FFF">API KEY</span></p>
										<input type="text" name="config_azure_translate_api_key" value="<?php echo $config_azure_translate_api_key; ?>" size="50" style="width:250px;" />
									</td>									
								</tr>
							</table>

							<h2>Yandex Translate (Cloud) API</h2>
							<table class="form">
								<tr>
									<td width="33%">	
									<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Включить Yandex Translate</span></p>
										<select name="config_yandex_translate_api_enable">
											<?php if ($config_yandex_translate_api_enable) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
												<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>									
									</td>
									
									<td width="33%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ffcc00; color:#FFF">API KEY</span></p>
										<input type="text" name="config_yandex_translate_api_key" value="<?php echo $config_yandex_translate_api_key; ?>" size="50" style="width:250px;" />
									</td>
									
									<td width="33%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ffcc00; color:#FFF">API ID</span></p>
										<input type="text" name="config_yandex_translate_api_id" value="<?php echo $config_yandex_translate_api_id; ?>" size="50" style="width:250px;" />
									</td>

									
								</tr>
							</table>

							<h2>Подключение к 1С (SOAP API)</h2>
							<table class="form">
								<tr>
									
									<td width="40%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ffcc00; color:#FFF">SOAP URI</span></p>
										<input type="text" name="config_odinass_soap_uri" value="<?php echo $config_odinass_soap_uri; ?>" size="50" style="width:250px;" />
									</td>
									
									<td width="20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ffcc00; color:#FFF">SOAP USER</span></p>
										<input type="text" name="config_odinass_soap_user" value="<?php echo $config_odinass_soap_user; ?>" size="50" style="width:250px;" />
									</td>

									<td width="20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ffcc00; color:#FFF">SOAP PASSWD</span></p>
										<input type="text" name="config_odinass_soap_passwd" value="<?php echo $config_odinass_soap_passwd; ?>" size="50" style="width:250px;" />
									</td>

									<td width="10%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ffcc00; color:#FFF">Загружать РРЦ</span></p>
										<select name="config_odinass_update_local_prices">
											<?php if ($config_odinass_update_local_prices) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
												<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
									</td>

									<td width="10%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ffcc00; color:#FFF">Остатки в пути</span></p>
										<select name="config_odinass_update_stockwaits">
											<?php if ($config_odinass_update_stockwaits) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
												<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
									</td>
								</tr>
							</table>

							<h2>Автообновление курсов валют</h2>
							<table class="form">
								<tr>
									<td style="width:20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ffcc00; color:#FFF">Fixer.io token</span></p>
										<input type="text" name="config_fixer_io_token" value="<?php echo $config_fixer_io_token; ?>" size="50" style="width:250px;" />
									</td>

									<td style="width:20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Автоматическое обновление валют</span></p>
										<select name="config_currency_auto">
											<?php if ($config_currency_auto) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
											<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
									</td>

									<td style="width:20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Порог обновления</span></p>
										<input type="number" step="1" name="config_currency_auto_threshold" value="<?php echo $config_currency_auto_threshold; ?>" size="2" style="width:100px;" />%
									</td>
								</tr>
							</table>

							<h2>Bitrix24 BOT API (Чудо-бот)</h2>
							<table class="form">
								<tr>
									<td width="20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Включить Bitrix24 BOT API</span></p>
										<select name="config_bitrix_bot_enable">
											<?php if ($config_bitrix_bot_enable) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
												<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
									</td>
									
									<td width="20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Bitrix24 Домен</span></p>
										<input type="text" name="config_bitrix_bot_domain" value="<?php echo $config_bitrix_bot_domain; ?>" size="50" style="width:250px;" />
									</td>
									
									<td width="20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Bitrix24 Scope</span></p>
										<input type="text" name="config_bitrix_bot_scope" value="<?php echo $config_bitrix_bot_scope; ?>" size="50" style="width:250px;" />
									</td>

									<td width="20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Bitrix24 Client ID</span></p>
										<input type="text" name="config_bitrix_bot_client_id" value="<?php echo $config_bitrix_bot_client_id; ?>" size="50" style="width:250px;" />
									</td>

									<td width="20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Bitrix24 Secret</span></p>
										<input type="text" name="config_bitrix_bot_client_secret" value="<?php echo $config_bitrix_bot_client_secret; ?>" size="50" style="width:250px;" />
									</td>
								</tr>
							</table>



							<h2>Telegram BOT API (уведомления)</h2>

							<table class="form">
								<tr>
									<td width="33%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Включить TG Bot API</span></p>
										<select name="config_telegram_bot_enable_alerts">
											<?php if ($config_telegram_bot_enable_alerts) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
												<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
									</td>
									
									<td width="33%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Ключ TG Bot API</span></p>
										<input type="text" name="config_telegram_bot_token" value="<?php echo $config_telegram_bot_token; ?>" size="50" style="width:250px;" />
									</td>
									
									<td width="33%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">Имя бота</span></p>
										<input type="text" name="config_telegram_bot_name" value="<?php echo $config_telegram_bot_name; ?>" size="50" style="width:250px;" />
									</td>
								</tr>
							</table>
							
							
							<h2><i class="fa fa-search"></i> Priceva / PriceControl API (подбор и мониторинг цен конкурентов)</h2>
							
							<table class="form">
								<tr>
									<td width="20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#3f6ad8; color:#FFF">Включить Priceva</span></p>
										<select name="config_priceva_enable_api">
											<?php if ($config_priceva_enable_api) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
												<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
									</td>

									<td width="20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#3f6ad8; color:#FFF">Включить PriceControl</span></p>
										<select name="config_pricecontrol_enable_api">
											<?php if ($config_pricecontrol_enable_api) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
												<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
									</td>

									<td width="20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ef5e67; color:#FFF">Директория с фидами</span></p>
										<input type="text" name="config_priceva_directory_name" value="<?php echo $config_priceva_directory_name; ?>" size="40" style="width:300px;" />	
									</td>

									<td width="20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ef5e67; color:#FFF">Поле с ссылками конкурентов</span></p>
										<input type="text" name="config_priceva_competitor_field_mapping" value="<?php echo $config_priceva_competitor_field_mapping; ?>" size="40" style="width:300px;" />	
									</td>
								</tr>
							
								<tr>
									<?php foreach ($stores as $store) { ?>
									<td width="<?php echo (int)(100/count($stores))?>%">
									
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#3f6ad8; color:#FFF"><i class="fa fa-search"></i> API ключ: <?php echo $store['name']; ?></span></p>
										<input type="text" step="0.1" name="config_priceva_api_key_<?php echo $store['store_id']?>" value="<?php echo ${'config_priceva_api_key_' . $store['store_id']}; ?>" style="width:200px;" />
										
										<br />
										<span class="help"><i class="fa fa-search"></i> кампании будут загружаться только в случае, если ключ будет задан</span>
									</td>
									<?php } ?>
								</tr>
							</table>

							<h2><i class="fa fa-search"></i> Сервис Zadarma (телефония)</h2>

							<table class="form">
								<tr>
									<td width="33%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ef5e67; color:#FFF">Ключ API</span></p>
										<input type="text" name="config_zadarma_api_key" value="<?php echo $config_zadarma_api_key; ?>" size="40" style="width:300px;" />	
									</td>
									<td width="33%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ef5e67; color:#FFF">Секрет API</span></p>
										<input type="text" name="config_zadarma_secret_key" value="<?php echo $config_zadarma_secret_key; ?>" size="40" style="width:300px;" />	
									</td>
									<td width="33%">
									</td>
								</tr>
							</table>							

							<h2><i class="fa fa-search"></i> Сервис DADATA (получение списка адресов)</h2>

							<table class="form">
								<tr>
									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ef5e67; color:#FFF">Режим работы API</span></p>
										<select name="config_dadata">
											<option value="0" <?php if ($config_dadata == 0) { ?>selected="selected"<?php } ?>>Отключить вообще</option>
											<option value="city" <?php if ($config_dadata == 'city') { ?>selected="selected"<?php } ?>>Подбор города</option>
											<option value="address" <?php if ($config_dadata == 'address') { ?>selected="selected"<?php } ?>>Подбор адреса</option>
										</select>	
									</td>

									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ef5e67; color:#FFF">Ключ API</span></p>
										<input type="text" name="config_dadata_api_key" value="<?php echo $config_dadata_api_key; ?>" size="40" style="width:300px;" />	
									</td>
									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ef5e67; color:#FFF">Секрет API</span></p>
										<input type="text" name="config_dadata_secret_key" value="<?php echo $config_dadata_secret_key; ?>" size="40" style="width:300px;" />	
									</td>

									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ef5e67; color:#FFF">Ключ IP - API</span></p>
										<input type="text" name="config_ip_api_key" value="<?php echo $config_ip_api_key; ?>" size="40" style="width:300px;" />	
									</td>
								</tr>
							</table>
							
							<h2><i class="fa fa-search"></i> ElasticSearch API (умный поиск на нашем сервере)</h2>
							<table class="form">
								<tr>
									<td width="20%">									
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF"><i class="fa fa-search"></i> FUZZY параметр для подбора товаров</span></p>
										<input type="number" step="0.1" name="config_elasticsearch_fuzziness_product" value="<?php echo $config_elasticsearch_fuzziness_product; ?>" size="3" style="width:100px;" />
										
										<br />
										<span class="help"><i class="fa fa-search"></i> чем это значение больше, тем больше будет нечетких результатов подбора, при этом поиск будет более широкий, но возможны неверные срабатывания</span>
									</td>
									
									<td width="20%">									
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF"><i class="fa fa-search"></i> FUZZY параметр для подбора категорий</span></p>
										<input type="number" step="0.1" name="config_elasticsearch_fuzziness_category" value="<?php echo $config_elasticsearch_fuzziness_category; ?>" size="3" style="width:100px;" />
										
										<br />
										<span class="help"><i class="fa fa-search"></i> чем это значение больше, тем больше будет нечетких результатов подбора, при этом поиск будет более широкий, но возможны неверные срабатывания</span>
									</td>
									
									<td width="20%">									
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF"><i class="fa fa-search"></i> FUZZY параметр для автокомплита</span></p>
										<input type="number" step="0.1" name="config_elasticsearch_fuzziness_autcocomplete" value="<?php echo $config_elasticsearch_fuzziness_autcocomplete; ?>" size="3" style="width:100px;" />
										
										<br />
										<span class="help"><i class="fa fa-search"></i> чем это значение больше, тем больше будет нечетких результатов подбора, при этом поиск будет более широкий, но возможны неверные срабатывания</span>										
									</td>

									<td width="20%">									
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF"><i class="fa fa-search"></i> Суффикс именования индексов</span></p>
										<input type="text" name="config_elasticsearch_index_suffix" value="<?php echo $config_elasticsearch_index_suffix; ?>" size="20" style="width:100px;" />
										
										<br />
										<span class="help"><i class="fa fa-search"></i> в случае работы нескольки магазинов на одном движке</span>										
									</td>

									<td width="20%">									
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#00ad07; color:#FFF"><i class="fa fa-search"></i> Использовать свои склады</span></p>
										<select name="config_elasticsearch_use_local_stock">
											<?php if ($config_elasticsearch_use_local_stock) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
												<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
										
										<br />
										<span class="help"><i class="fa fa-search"></i> Если включено, товары, которые есть на локальном складе - всегда будут вверху любых результатов поиска. При этом товары, которых нет на складе - значительно пессимизируются в выдаче</span>										
									</td>>


								</tr>
							</table>

							<h2><i class="fa fa-search"></i> Reacher API (валидация мейлов)</h2>
							
							<table class="form">
								<tr>
									<td style="width:15%">
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#3f6ad8; color:#FFF">Включить Reacher API</span></p>
										<select name="config_reacher_enable">
											<?php if ($config_reacher_enable) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
												<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>

									</td>
									<td style="width:15%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ef5e67; color:#FFF">Reacher URL</span></p>
										<input type="text" name="config_reacher_uri" value="<?php echo $config_reacher_uri; ?>" size="40" style="width:90%;" />	
									</td>
									
									<td style="width:15%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ef5e67; color:#FFF">Reacher AUTH</span></p>
										<input type="text" name="config_reacher_auth" value="<?php echo $config_reacher_auth; ?>" size="40" style="width:90%;" />											
									</td>

									<td style="width:15%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ef5e67; color:#FFF">Reacher KEY</span></p>
										<input type="text" name="config_reacher_key" value="<?php echo $config_reacher_key; ?>" size="40" style="width:90%" />											
									</td>

									<td style="width:15%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ef5e67; color:#FFF">Reacher FROM</span></p>
										<input type="text" name="config_reacher_from" value="<?php echo $config_reacher_from; ?>" size="40" style="width:90%" />											
									</td>

									<td style="width:15%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ef5e67; color:#FFF">Reacher HELO</span></p>
										<input type="text" name="config_reacher_helo" value="<?php echo $config_reacher_helo; ?>" size="40" style="width:90%;" />											
									</td>
								</tr>
							</table>
							
						</div>
						
						<div id="tab-google-ya-fb-vk">
							<h2 style="color:#57AC79">Соцсети и мессенджеры</h2>
							<table class="form">
								<tr>		
									<td width="20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ef5e67; color:#FFF">Ссылка на Facebook</span></p>
										<input type="text" name="social_link_facebook" value="<?php echo $social_link_facebook; ?>" size="30" style="width:150px;" />
									</td>
									
									<td width="20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ef5e67; color:#FFF">Ссылка на VK</span></p>
										<input type="text" name="social_link_vkontakte" value="<?php echo $social_link_vkontakte; ?>" size="30" style="width:150px;" />
									</td>	

									<td width="20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ef5e67; color:#FFF">Ссылка на Instagram</span></p>
										<input type="text" name="social_link_instagram" value="<?php echo $social_link_instagram; ?>" size="30" style="width:150px;" />
									</td>

									<td width="20%">
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ef5e67; color:#FFF">Ссылка на Youtube</span></p>
											<input type="text" name="social_link_youtube" value="<?php echo $social_link_youtube; ?>" size="30" style="width:150px;" />
									</td>

									<td width="20%">
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ef5e67; color:#FFF">Ссылка на Twitter</span></p>
											<input type="text" name="social_link_twitter" value="<?php echo $social_link_twitter; ?>" size="30" style="width:150px;" />
									</td>
								</tr>

								<tr>		
									<td width="20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ef5e67; color:#FFF">Messenger BOT</span></p>
										<input type="text" name="social_link_messenger_bot" value="<?php echo $social_link_messenger_bot; ?>" size="30" style="width:150px;" />
									</td>
									
									<td width="20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ef5e67; color:#FFF">Viber BOT</span></p>
										<input type="text" name="social_link_viber_bot" value="<?php echo $social_link_viber_bot; ?>" size="30" style="width:150px;" />
									</td>	

									<td width="20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ef5e67; color:#FFF">Telegram BOT</span></p>
										<input type="text" name="social_link_telegram_bot" value="<?php echo $social_link_telegram_bot; ?>" size="30" style="width:150px;" />
									</td>

									<td width="20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ef5e67; color:#FFF">Vkontakte BOT</span></p>
										<input type="text" name="social_link_vkontakte_bot" value="<?php echo $social_link_vkontakte_bot; ?>" size="30" style="width:150px;" />
									</td>

									<td width="20%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ef5e67; color:#FFF">Whatsapp BOT</span></p>
										<input type="text" name="social_link_whatsapp_bot" value="<?php echo $social_link_whatsapp_bot; ?>" size="30" style="width:150px;" />
									</td>
								</tr>
							</table>


							<h2 style="color:#57AC79">Авторизация Google + Facebook APP</h2>
							<table class="form">
								<tr>		
									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ef5e67; color:#FFF">Google APP ID</span></p>
										<input type="text" name="social_auth_google_app_id" value="<?php echo $social_auth_google_app_id; ?>" size="30" style="width:150px;" />
									</td>
									
									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#ef5e67; color:#FFF">Google Secret Key</span></p>
										<input type="text" name="social_auth_google_secret_key" value="<?php echo $social_auth_google_secret_key; ?>" size="30" style="width:150px;" />
									</td>	
									
										<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">FB APP ID</span></p>
										<input type="text" name="social_auth_facebook_app_id" value="<?php echo $social_auth_facebook_app_id; ?>" size="30" style="width:150px;" />
									</td>
									
									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">FB APP Secret Key</span></p>
										<input type="text" name="social_auth_facebook_secret_key" value="<?php echo $social_auth_facebook_secret_key; ?>" size="30" style="width:150px;" />
									</td>	
								</tr>
							</table>


							<h2 style="color:#57AC79">Google Tag Manager (GTM) + Custom JS code</h2>
							<table class="form">
								<tr>		
									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#57AC79; color:#FFF">GTM Javascript (header)</span></p>
										<textarea name="config_gtm_header" cols="40" rows="10"><?php echo $config_gtm_header; ?></textarea>
									</td>
									
									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#57AC79; color:#FFF">GTM NoScript (body)</span></p>
										<textarea name="config_gtm_body" cols="40" rows="10"><?php echo $config_gtm_body; ?></textarea>
									</td>	

									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#57AC79; color:#FFF">Custom JS-код в футер</span></p>
										<textarea name="config_google_analytics" cols="40" rows="10"><?php echo $config_google_analytics; ?></textarea>
									</td>
									
									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#57AC79; color:#FFF">Custom JS-код в хедер</span></p>
										<textarea name="config_google_analytics_header" cols="40" rows="10"><?php echo $config_google_analytics_header; ?></textarea>
									</td>
								</tr>
							</table>

							<h2 style="color:#57AC79">Google Analitycs, Merchant</h2>	
							<table class="form">
								<tr>
									
									<td width="15%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#57AC79; color:#FFF">Идентификатор Google Analitycs</span></p>
										<input type="text" name="config_google_analitycs_id" value="<?php echo $config_google_analitycs_id; ?>" size="30" style="width:150px;" />
									</td>
									<td width="15%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#57AC79; color:#FFF">Google Conversion ID</span></p>
										<input type="text" name="config_google_conversion_id" value="<?php echo $config_google_conversion_id; ?>" size="30" style="width:150px;" />
									</td>
									<td width="15%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#57AC79; color:#FFF">Google Merchant ID</span></p>
										<input type="text" name="config_google_merchant_id" value="<?php echo $config_google_merchant_id; ?>" size="30" style="width:150px;" />								
									</td>
									<td width="15%">
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#57AC79; color:#FFF">Лимит товаров на фид</span></p>
											<input type="number" step="1000" name="config_google_merchant_feed_limit" value="<?php echo $config_google_merchant_feed_limit; ?>" size="30" style="width:150px;" />	
										</div>
										<div>
											<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#57AC79; color:#FFF">Лимит товаров на выборку</span></p>
											<input type="number" step="100" name="config_google_merchant_one_iteration_limit" value="<?php echo $config_google_merchant_one_iteration_limit; ?>" size="30" style="width:150px;" />	
										</div>									
									</td>
									<td width="15%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#57AC79; color:#FFF">Тип Google remarketing</span></p>
										<select name="config_google_remarketing_type">
											<?php if ($config_google_remarketing_type == 'ecomm') { ?>
												<option value="ecomm" selected="selected">E-commerce ecomm_</option>
											<?php } else { ?>
												<option value="ecomm">E-commerce ecomm_</option>
											<?php } ?>
											<?php if ($config_google_remarketing_type == 'dynx') { ?>
												<option value="dynx" selected="selected">Универсальный dynx_</option>
											<?php } else { ?>
												<option value="dynx">Универсальный dynx_</option>
											<?php } ?>
										</select>
									</td>
									<td width="15%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#57AC79; color:#FFF">Передача данных Ecommerce</span></p>
										<select name="config_google_ecommerce_enable">
											<?php if ($config_google_ecommerce_enable) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
											<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
									</td>
								</tr>
							</table>

							
							<h2 style="color:#57AC79">Google ReCaptcha</h2>	
							<table class="form">
								<tr>		
									<td style="width:33%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#57AC79; color:#FFF">Включить ReCaptcha</span></p>
										<select name="config_google_recaptcha_contact_enable">
											<?php if ($config_google_recaptcha_contact_enable) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
												<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>									
									</td>		
									<td style="width:33%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#57AC79; color:#FFF">ReCaptcha key</span></p>
										<input type="text" name="config_google_recaptcha_contact_key" value="<?php echo $config_google_recaptcha_contact_key; ?>" size="40" style="width:300px;" />
									</td>		
									<td style="width:33%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#57AC79; color:#FFF">ReCaptcha Secret</span></p>
										<input type="text" name="config_google_recaptcha_contact_secret" value="<?php echo $config_google_recaptcha_contact_secret; ?>" size="40" style="width:300px;" />
										
									</td>
								</tr>
							</table>

							<h2 style="color:#7F00FF">Facebook пиксель</h2>
							<table class="form">
								<tr>		
									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">FB пиксель (header)</span></p>
										<textarea name="config_fb_pixel_header" cols="40" rows="10"><?php echo $config_fb_pixel_header; ?></textarea>
									</td>
									
									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#7F00FF; color:#FFF">FB пиксель (body)</span></p>
										<textarea name="config_fb_pixel_body" cols="40" rows="10"><?php echo $config_fb_pixel_body; ?></textarea>
									</td>	
									<td width="25%"></td>
									<td width="25%"></td>
								</tr>
							</table>

							<h2 style="color:#3F6AD8">VK пиксель / ремаркетинг / ретаргетинг</h2>
							<table class="form">
								<tr>		
									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#3F6AD8; color:#FFF">VK пиксель (header)</span></p>
										<textarea name="config_vk_pixel_header" cols="40" rows="10"><?php echo $config_vk_pixel_header; ?></textarea>
									</td>
									
									<td width="25%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#3F6AD8; color:#FFF">VK пиксель (body)</span></p>
										<textarea name="config_vk_pixel_body" cols="40" rows="10"><?php echo $config_vk_pixel_body; ?></textarea>
									</td>	
									<td width="50%">

										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#3F6AD8; color:#FFF">Включить пиксель</span></p>
										<select name="config_vk_enable_pixel">
											<?php if ($config_vk_enable_pixel) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
												<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>

										<br />
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#3F6AD8; color:#FFF">VK пиксель ID</span></p>
										<input type="text" name="config_vk_pixel_id" value="<?php echo $config_vk_pixel_id; ?>" size="40" />

										<br />
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#3F6AD8; color:#FFF">VK прайслист ID</span></p>
										<input type="text" name="config_vk_pricelist_id" value="<?php echo $config_vk_pricelist_id; ?>" size="40" />

									</td>
								</tr>
							</table>


							
							<h2 style="color:#cf4a61">Yandex Metrika</h2>
							<table class="form">
								<tr>		
									<td style="width:33%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Yandex Metrika идентификатор</span></p>
										<input type="text" name="config_metrika_counter" value="<?php echo $config_metrika_counter; ?>" size="30" style="width:150px;" />
									</td>
									<td>
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Yandex WebVisor</span></p>
										<select name="config_webvisor_enable">
											<?php if ($config_webvisor_enable) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
											<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
									</td>
									<td style="width:33%">
										<p><span class="status_color" style="display:inline-block; padding:3px 5px; background:#cf4a61; color:#FFF">Включить accurateTrackBounce, trackLinks, clickmap</span></p>
										<select name="config_clickmap_enable">
											<?php if ($config_clickmap_enable) { ?>
												<option value="1" selected="selected">Включить</option>
												<option value="0">Отключить</option>
											<?php } else { ?>													
												<option value="1">Включить</option>
												<option value="0"  selected="selected">Отключить</option>
											<? } ?>
										</select>
									</td>
								</tr>	
							</table>
						</div>
					</form>
				</div>
			</div>
		</div>
		<script type="text/javascript"><!--

			$('select, textarea, input[type=text], input[type=number], input[type=time], input[type=checkbox], input[type=hidden]').bind('change', function() {
				console.log('Change triggered on ' + $(this).attr('name'));

				var key  			= $(this).attr('name');
				var elem 			= $(this);
				var value 			= $(this).val();
				var store_id 		= $('input[name=store_id]').val();
				var js_serialized 	= 0;

				if (elem.attr('data-key') != null){
					console.log('multi setting, get all keys for ' + elem.attr('data-key'));
					
					key   			= elem.attr('data-key');					
					value 			= $('input[data-key=\'' + elem.attr('data-key') + '\'], textarea[data-key=\'' + elem.attr('data-key') + '\']').serialize();
					js_serialized 	= 1;		
				} else {
					if (elem.attr('type') == 'checkbox'){
						value = [];
						if (key.indexOf('[]') > 0){
							var allboxes = $('input[name=\''+ key +'\']');

							allboxes.each(function(i){
								if ($(this).attr('checked')){
									value.push($(this).val());
								}
							});
						} else {
							if (elem.attr('checked')){
								value = elem.val();
							} else {
								value = 0;
							}
						}
					}
				}

				$.ajax({
					type: 'POST',
					url: 'index.php?route=setting/setting/editSettingAjax&store_id=' + store_id + '&token=<?php echo $token; ?>',
					data: {						
						key: key,
						value: value,
						js_serialized: js_serialized
					},
					beforeSend: function(){
						elem.css('border-color', 'yellow');
						elem.css('border-width', '2px');						
					},
					success: function(){
						elem.css('border-color', 'green');
						elem.css('border-width', '2px');
					}
				});

			});

			$('select[name=\'config_country_id\']').bind('change', function() {
				$.ajax({
					url: 'index.php?route=setting/setting/country&token=<?php echo $token; ?>&country_id=' + this.value,
					dataType: 'json',
					beforeSend: function() {
						$('select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="view/image/loading.gif" alt="" /></span>');
					},		
					complete: function() {
						$('.wait').remove();
					},			
					success: function(json) {
						if (json['postcode_required'] == '1') {
							$('#postcode-required').show();
							} else {
							$('#postcode-required').hide();
						}
						
						html = '<option value=""><?php echo $text_select; ?></option>';
						
						if (json['zone'] != '') {
							for (i = 0; i < json['zone'].length; i++) {
								html += '<option value="' + json['zone'][i]['zone_id'] + '"';
								
								if (json['zone'][i]['zone_id'] == '<?php echo $config_zone_id; ?>') {
									html += ' selected="selected"';
								}
								
								html += '>' + json['zone'][i]['name'] + '</option>';
							}
							} else {
							html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
						}
						
						$('select[name=\'config_zone_id\']').html(html);
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});
			});
			
		//	$('select[name=\'config_country_id\']').trigger('change');
		//--></script> 
		<script type="text/javascript"><!--
			function image_upload(field, thumb) {
				$('#dialog').remove();
				
				$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
				
				$('#dialog').dialog({
					title: '<?php echo $text_image_manager; ?>',
					close: function (event, ui) {
						if ($('#' + field).attr('value')) {
							$.ajax({
								url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).val()),
								dataType: 'text',
								success: function(data) {
									$('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '" />');
									$('#' + field).trigger('change');
								}
							});
						}
					},	
					bgiframe: false,
					width: 1000,
					height: 800,
					resizable: true,
					modal: false
				});
			};
		//--></script> 
		<script type="text/javascript">
			$('#tabs a').tabs();
		</script> 
		<script type="text/javascript">
			$('#vstabs a').tabs();
		</script> 
	<?php echo $footer; ?>																																																																											