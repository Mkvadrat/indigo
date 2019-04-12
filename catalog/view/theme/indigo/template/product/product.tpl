<?php echo $header; ?>
<link  href="catalog/view/javascript/jquery/fotorama/fotorama.css" rel="stylesheet">
<script src="catalog/view/javascript/jquery/fotorama/fotorama.js"></script>
	<div class="container">
		<div class="row">
			<div class="col-md-12 breadcrumbs">
				<ul>
				<?php			
					$count = count($breadcrumbs);
					$i=1;
					foreach ($breadcrumbs as $breadcrumb) {
						if($i!=$count){
                ?>
						<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php echo ' ' . $breadcrumb['separator']; ?></li>
                <?php
						}else{
							echo '<li><span> '.$breadcrumb['text'] . '</span></li>'; 
						}		
						$i++;
					} 
                ?>
				</ul>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-7 object-l">

				<div class="fotorama" data-navposition="bottom" data-nav="thumbs" data-thumbwidth="80" data-allowfullscreen="true" data-loop="true">
					<?php if ($images) { ?>
							<?php $i = 0; ?>
							<?php foreach ($images as $image) { ?>
							<a href="<?php echo $image['popup']; ?>"><img src="<?php echo $image['popup']; ?>" data-hash="<?php echo $i; ?>" alt="<?php echo $heading_title; ?>"></a>
							<?php $i++; ?>
							<?php } ?>
					<?php }else{ ?>
							<a href="<?php echo $thumb; ?>"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>"></a>
					<?php } ?>
				</div>

				<div class="object-bot">
					<p class="title">Описание</p>
					<p id="print3"><?php echo $description; ?></p>
					<p class="title">Объекты рядом</p>
					<div class="obj-map">
						<?php if($maps){ ?>
							<div id="map-products" style="width:100%; height:404px"></div>

							<script type="text/javascript">
								ymaps.ready(function () {
								var myMap = new ymaps.Map('map-products', {
								<?php foreach($maps as $product){ ?>
								<?php if($product_id == $product['product_id']){ ?>
								center: [<?php echo $product['lat_lng']; ?>],
								<?php } ?>
								<?php } ?>
								zoom: 17,
								behaviors: ['default', 'scrollZoom']
								}, {
								searchControlProvider: 'yandex#search'
								}),
								/**
								* Создадим кластеризатор, вызвав функцию-конструктор.
								* Список всех опций доступен в документации.
								* @see https://api.yandex.ru/maps/doc/jsapi/2.1/ref/reference/Clusterer.xml#constructor-summary
								*/
								clusterer = new ymaps.Clusterer({
								/**
								* Через кластеризатор можно указать только стили кластеров,
								* стили для меток нужно назначать каждой метке отдельно.
								* @see https://api.yandex.ru/maps/doc/jsapi/2.1/ref/reference/option.presetStorage.xml
								*/
								preset: 'islands#invertedVioletClusterIcons',
								/**
								* Ставим true, если хотим кластеризовать только точки с одинаковыми координатами.
								*/
								groupByCoordinates: false,
								/**
								* Опции кластеров указываем в кластеризаторе с префиксом "cluster".
								* @see https://api.yandex.ru/maps/doc/jsapi/2.1/ref/reference/ClusterPlacemark.xml
								*/
								clusterDisableClickZoom: true,
								clusterHideIconOnBalloonOpen: false,
								geoObjectHideIconOnBalloonOpen: false
								}),
								/**
								* Функция возвращает объект, содержащий данные метки.
								* Поле данных clusterCaption будет отображено в списке геообъектов в балуне кластера.
								* Поле balloonContentBody - источник данных для контента балуна.
								* Оба поля поддерживают HTML-разметку.
								* Список полей данных, которые используют стандартные макеты содержимого иконки метки
								* и балуна геообъектов, можно посмотреть в документации.
								* @see https://api.yandex.ru/maps/doc/jsapi/2.1/ref/reference/GeoObject.xml
								*/
								<?php $i = 0; ?>
								<?php foreach($maps as $product){ ?>
								getPointData<?php echo $i; ?> = function () {
								return {
								balloonContentHeader: 'Объект №' + <?php echo $product['model']; ?>,
								balloonContent: '<div class="ballon"><img src="<?php echo $product['image']; ?>" class="ll"/><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a><br/><a href="<?php echo $product['href']; ?>"><span>Подробнее</span></a></div>',
								balloonContentFooter: '',
								};
								},
								<?php $i++; ?>
								<?php } ?>

								/**
								* Функция возвращает объект, содержащий опции метки.
								* Все опции, которые поддерживают геообъекты, можно посмотреть в документации.
								* @see https://api.yandex.ru/maps/doc/jsapi/2.1/ref/reference/GeoObject.xml
								*/
								<?php $i = 0; ?>
								<?php foreach($maps as $product){ ?> 
								getPointOptions<?php echo $i; ?> = function () {
								return {
								iconLayout : 'default#image',
								<?php if($product_id == $product['product_id']){ ?>
								iconImageHref: 'catalog/view/theme/indigo/image/maps/icon-main.png', // картинка иконки
								<?php }else{ ?>
								iconImageHref: 'catalog/view/theme/indigo/image/maps/icon.png', // картинка иконки
								<?php } ?>
								iconImageSize : [64, 64],
								preset: 'islands#violetIcon'
								};
								},
								<?php $i++; ?>
								<?php } ?>
								points = [
								<?php foreach($maps as $product){ ?>
								[<?php echo $product['lat_lng']; ?>], 
								<?php } ?>
								],
								geoObjects = [];

								/**
								* Данные передаются вторым параметром в конструктор метки, опции - третьим.
								* @see https://api.yandex.ru/maps/doc/jsapi/2.1/ref/reference/Placemark.xml#constructor-summary
								*/
								var placemarks = [];
								<?php $i = 0; ?>
								<?php foreach($maps as $product){ ?>
								geoObjects[<?php echo $i; ?>] = new ymaps.Placemark(points[<?php echo $i; ?>], getPointData<?php echo $i; ?>(), getPointOptions<?php echo $i; ?>());
								placemarks.push(geoObjects[<?php echo $i; ?>]);
								<?php $i++; ?>
								<?php } ?>

								/**
								* Можно менять опции кластеризатора после создания.
								*/
								clusterer.options.set({
								gridSize: 80,
								clusterDisableClickZoom: true,

								});

								/**
								* В кластеризатор можно добавить javascript-массив меток (не геоколлекцию) или одну метку.
								* @see https://api.yandex.ru/maps/doc/jsapi/2.1/ref/reference/Clusterer.xml#add
								*/
								myMap.behaviors.disable('scrollZoom');
								clusterer.add(placemarks);
								myMap.geoObjects.add(clusterer);             
								/**
								* Спозиционируем карту так, чтобы на ней были видны все объекты.
								*/
								/*myMap.setBounds(clusterer.getBounds(), {
								checkZoomRange: false
								});*/
								});
							</script>
						<?php } ?>
					</div>
				</div>
			</div>
			<div class="col-md-5 object-r">
				<div class="print-download">
					<a href="<?php echo $action_pdf; ?>"><img src="catalog/view/theme/indigo/image/save.png" alt="Сохранить PDF">Сохранить PDF</a>
					<a id="print"><img src="catalog/view/theme/indigo/image/print.png" alt="Напечатать">Напечатать</a>
				</div>
				<div class="info">
					<?php if($stickers){ ?>
						<div class="labels">
							<?php foreach ($stickers as $sticker) { ?>
								<span class="label"><img src="<?php echo $sticker['image']; ?>"></span>
							<?php } ?>
						</div>
					<?php } ?>
					
					<span class="id" id="print4">№ <?php echo $model; ?></span>
					
					<p class="subtitle">Дополнительная информация</p>

					<div id="print11">
						<?php if($uniq_options){ ?>
							<?php if($product_options){ ?>
								<?php foreach($product_options as $option){ ?>
									<?php if($option['product_option_value']){ ?>
									<?php foreach ($option['product_option_value'] as $option_value) { ?>
										<p><i><?php echo $option['name']; ?>: <span><?php echo $option_value['name']; ?></span></i></p>
									<?php } ?>
									<?php }else{ ?>
										<p><i><?php echo $option['name']; ?>: <span><?php echo $option['value']; ?></span></i></p>
									<?php } ?>
								<?php } ?>
							<?php } ?>	
						<?php }else{ ?>
							<?php if($slider_filter_options){ ?>
								<?php foreach($slider_filter_options as $slider_option){ ?>
									<p><i><?php echo $slider_option['name']; ?>: <span><?php echo $slider_option['value']; ?> <?php echo $slider_option['postfix']; ?></span></i></p>
								<?php } ?>
							<?php } ?>
							<?php if($filter_options){ ?>
								<?php foreach($filter_options as $option){ ?>
									<p><i><?php echo $option['name']; ?>: <span><?php echo $option['value']; ?></span> <?php echo $option['postfix']; ?></i></p>
								<?php } ?>
							<?php } ?>
						<?php } ?>
					</div>
				</div>
				<div class="obj-price" id="print5">
					<?php if ($price || $rub) { ?>
						<?php if (!$special) { ?>
							<p>Цена: <?php echo $rub; ?> / <?php echo $price; ?></p>
						<?php } else { ?>
							<p>Цена: <?php echo $special; ?> <sup><strike><?php echo $price; ?></strike></sup></p>
						<?php } ?>
					<?php } ?>
				</div>
				
				<?php if($features){ ?>
					<div class="info" id="print6"><?php echo $features; ?></div>
				<?php } ?>

				<div class="rieltor">
					<div class="img" style="background-image:url('<?php echo $image_agent; ?>')"></div>
					
					<p class="name" id="print7"><?php echo $agent_name; ?></p>
					
					<?php if($specialization){ ?>
						<p id="print8"><i><?php echo $specialization; ?></i></p>
					<?php } ?>
					
					<a href="<?php echo $view_all_object; ?>" class="watch-objs"><img src="catalog/view/theme/indigo/image/house.png" alt="Посмотреть все объекты агента">Посмотреть все объекты агента</a>
					
					<p class="rieltor-cont" id="print9"><i>Телефон:</i><a href="tel:<?php echo $phone; ?>"><?php echo $phone; ?></a></p>
					
					<p class="rieltor-cont" id="print10"><i>E-mail:</i><a href="mailto:<?php echo $email; ?>"><?php echo $email; ?></a></p>
					
					<a href="#callback_agent" class="round-button callback">Написать сообщение</a>
					    
					<div id="callback_agent" style="display: none;">
						<button data-fancybox-close="" class="fancybox-close-small" title="Close"><span>X</span></button>
						<p>* - поля обязательные для заполнения</p>
						<div>
							<label>Имя*:<input type="text" id="name_agent" placeholder="Имя*"></label>
							<label>Телефон*:<input type="text" id="phone_agent" placeholder="Телефон*"></label>
							<label>Email:<input type="text" id="email_agent" placeholder="E-mail"></label>
							<label><span class="textarea">Сообщение*:</span><textarea id="message_agent" placeholder="Сообщение"></textarea></label>
							<input type="hidden" value="<?php echo $email; ?>" id="hidden_email">
							<input type="hidden" value="<?php echo $product_id; ?>" id="hidden_product_id">
							<label class="check"><input type="checkbox" name="" id="">Я согласен (согласна) на обработку персональных данных.</label>
							<a onclick="sendFormAgent();" class="round-button disabled">Отправить</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<?php if($products){ ?>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="best-proposes">
					<p class="title">Похожие варианты</p>
					
					<div class="owl-carousel">
						<?php foreach ($products as $product) { ?>
						<a class="item" href="<?php echo $product['href']; ?>" style="background-image: url('<?php echo $product['thumb']; ?>')">
							<?php if($product['sticker']){ ?>
							<div class="labels">
								<?php foreach ($product['sticker'] as $sticker) { ?>
									<span class="label"><img src="<?php echo $sticker['image']; ?>"></span>
								<?php } ?>
							</div>
							 <?php } ?>
							<div class="text">
								<span class="object-id">№ <?php echo $product['model']; ?></span>
								<p class="description"><?php echo $product['name']; ?></p>
								<?php if ($product['price'] || $product['rub']) { ?>
								<?php if (!$product['special']) { ?>
								<p class="prices"><?php echo $product['rub']; ?> / <?php echo $product['price']; ?></p>
								<?php } else { ?>
								<p class="prices"><?php echo $product['special']; ?> <sup><strike><?php echo $product['price']; ?></strike></sup></p>
								<?php } ?>
								<?php } ?>
							</div>
						</a>
						<?php } ?>
					</div>
				</div>
			</div>
		</div>
	</div>
	<?php } ?>

<?php echo $footer; ?>