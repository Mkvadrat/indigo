<?php echo $header; ?>
  
	<?php echo $content_top; ?>
	
	<div class="container">
		<div class="row">
			<div class="col-md-7 request-l">
				<div class="article form">
					<p class="title">Заявка</p>
					<p>* - поля обязательные для заполнения</p>
					<div>
						<label>Имя*:<input id="name" type="text"></label>
						<label>Email:<input id="email" type="text"></label>
						<label>Ваш телефон*:<input id="phone" type="text"></label>
						<label>Ваш город:<input id="city" type="text"></label>
						<label for='left'><span class="textarea">Что желаете*:</span>
							<div class="radio">
								<label><input type="radio" name="wishes" value="1" checked>Купить</label>
								<label><input type="radio" name="wishes" value="2">Продать</label>
								<label><input type="radio" name="wishes" value="3">Обменять</label>
								<label><input type="radio" name="wishes" value="4">Снять</label>
								<label><input type="radio" name="wishes" value="5">Сдать</label>
							</div>
						</label>
						<label>Тип недвижимости:
							<select id="chose-type">
								<option value="empty">Выберите тип</option>
								<option value="1">Квартира</option>
								<option value="2">Земельный участок</option>
								<option value="3">Коммерческую недвижимость</option>
								<option value="4">Другую недвижимость</option>
							</select>
						</label>
						<label>Номер объекта:<input id="object-id" type="text"></label>
						<label><span class="textarea">Описание заявки:</span><textarea id="description" rows="3"></textarea></label>

						<label for="left"><span class="textarea">Фотографии:</span>
							<div id="dZUpload" class="dropzone">
								<div class="dz-default dz-message">
									<p>Перетащите сюда необходимые изображения<br>или<br><span class="round-button dz-clickable">Кликние для выбора</span></p>
								</div>
							</div>
						</label>
						
						<input type="hidden" class="attach" id="attach" value="">

						<label class="check"><input type="checkbox" name="" id="">Я согласен (согласна) на
							обработку персональных данных.</label>
						<div class="capcha"></div>
						<a onclick="sendRequest();" class="round-button disabled">Отправить</a>
					</div>
				</div>
			</div>
			
			<?php echo $column_right; ?>
		</div>
	</div>
 
<?php echo $footer; ?>
