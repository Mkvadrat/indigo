<?php echo $header; ?>

	<div class="container">
		<div class="row contacts-row">
			<div class="col-md-6 col-sm-12 col-xs-12 contacts-l">
				<div class="cont">
					<p class="title"><?php echo $heading_title; ?></p>
					<div class="cont-block">
						<?php echo $contacts_address; ?>
					</div>
					<div class="cont-block">
						<?php echo $contacts_working; ?>
					</div>
					<div class="cont-block">
						<p class="yell">Отдел продаж:</p>
						<div>
							<?php echo $contacts_sales_tel; ?>
						</div>
						<div>
							<?php echo $contacts_sales_emails; ?>
						</div>
					</div>
					<div class="cont-block">
						<p class="yell">Отдел аренды:</p>
						<div>
							<?php echo $contacts_rents_tel; ?>
						</div>
						<div>
							<?php echo $contacts_rents_emails; ?>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-sm-12 col-xs-12 contacts-r">
				<div class="conacts-img" style="background-image: url('<?php echo $image; ?>');"></div>
			</div>
			<div class="col-md-6 col-sm-12 col-xs-12 contacts-l">
				<div class="cont form">
					<p>* - поля обязательные для заполнения</p>
					<form>
						<label>Имя*:<input id="name" type="text"></label>
						<label>Email:<input id="email" type="text"></label>
						<label>Ваш телефон*:<input id="phone" type="text"></label>
						<label><span class="textarea">Отзыв:</span><textarea id="message" rows="3"></textarea></label>
						<label class="check"><input type="checkbox" name="" id="">Я согласен (согласна) на обработку персональных данных.</label>
						<div class="capcha"></div>
						<a onclick="sendContactsForm();" class="round-button disabled">Отправить</a>
					</form>
				</div>
			</div>
			<div class="col-md-6 col-sm-12 col-xs-12 contacts-r">
				<div class="cont-map">
					<div id="map-contacts" style="width:100%; height:100%; position: absolute;"></div>
					<?php if($geocode){ ?>
					  <script type="text/javascript">
						var myMap;
						ymaps.ready(init);
						
						function init(){
						  var myCoords = [<?php echo $geocode; ?>];  
						  var myGeocoder = ymaps.geocode(myCoords);
						  myGeocoder.then(
						  function (res){
							var firstGeoObject = res.geoObjects.get(0),
							myMap = new ymaps.Map
							("map-contacts",{
							  center: firstGeoObject.geometry.getCoordinates(),
							  zoom: 17
							});
							var myPlacemark = new ymaps.Placemark(
							firstGeoObject.geometry.getCoordinates(),
							{
							  iconContent: ''
							},
							{
							  preset: 'twirl#blueStretchyIcon'
							});
							  myMap.geoObjects.add(myPlacemark);
							  myMap.behaviors.disable('scrollZoom');
							  myMap.controls.add(new ymaps.control.ScaleLine()).add('typeSelector');
						  },
						  function (err){
							alert(err.message);
						  });
						}
					  </script>
					<?php } ?>
				</div>
			</div>
			<div class="col-md-12 col-sm-12 col-xs-12 contacts-text">
				<div>
					<div>
						<?php echo $contacts_certificate; ?>
					</div>
					<div>
						<?php echo $contacts_requisite; ?>
					</div>
					<div>
						<?php echo $contacts_bank_card; ?>
					</div>
				</div>
			</div>
		</div>
	</div>
  
<?php echo $footer; ?>
