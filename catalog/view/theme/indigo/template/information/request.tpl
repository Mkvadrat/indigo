<?php echo $header; ?>
  
	<?php echo $content_top; ?>
	
	<div class="container">
		<div class="row">
			<div class="col-md-7 request-l">
				<div class="article form">
					<p class="title">Заявка</p>
					<p>* - поля обязательные для заполнения</p>
					<form>
						<label>Имя*:<input type="text"></label>
						<label>Email:<input type="text"></label>
						<label>Ваш телефон*:<input type="text"></label>
						<label>Ваш город:<input type="text"></label>
						<label for='left'><span class="textarea">Что желаете*:</span>
							<div class="radio">
								<label><input type="radio" name="wishes" value="buy" checked>Купить</label>
								<label><input type="radio" name="wishes" value="sel">Продать</label>
								<label><input type="radio" name="wishes" value="change">Обменять</label>
								<label><input type="radio" name="wishes" value="change">Обменять</label>
								<label><input type="radio" name="wishes" value="gift">Сдать</label>
							</div>
						</label>
						<label>Тип недвижимости:
							<select id="chose-type">
								<option value="empty" checked>Выберите тип</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
							</select>
						</label>
						<label>Номер объекта:<input type="text"></label>
						<label><span class="textarea">Описание заявки:</span><textarea rows="3"></textarea></label>


<?php var_dump($images)?>
						<label for="left"><span class="textarea">Фотографии:</span>
							<div id="dZUpload" class="dropzone">
								<div class="dz-default dz-message">
									<p>Перетащите сюда необходимые изображения<br>или<br><span class="round-button dz-clickable">Кликние для выбора</span></p>
								</div>
							</div>
						</label>


						
						<label class="check"><input type="checkbox" name="" id="">Я согласен (согласна) на
							обработку персональных данных.</label>
						<div class="capcha"></div>
						<a href="#" class="round-button">Отправить</a>
					</form>
				</div>
			</div>
			
			<?php echo $column_right; ?>
		</div>
	</div>
 
<?php echo $footer; ?>
