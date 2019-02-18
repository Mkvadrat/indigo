<?php echo $header; ?>
 
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
              <div class="object-top">
                  <p class="title"><?php echo $heading_title; ?></p>
                  <?php if ($images) { ?>
                  <div class="imgs">
                      <div class="owl-carousel">
                        <?php $i = 0; ?>
                        <?php foreach ($images as $image) { ?>
                          <a href="<?php echo $image['popup']; ?>" data-fancybox="gallery"><img src="<?php echo $image['popup']; ?>" alt="<?php echo $heading_title; ?>" data-hash="<?php echo $i; ?>"></a>
                          <?php $i++; ?>
                        <?php } ?>
                      </div>
                      <?php $i = 0; ?>
                      <?php foreach ($images as $image) { ?>
                        <a href="#<?php echo $i; ?>"><img src="<?php echo $image['thumb']; ?>" alt="<?php echo $heading_title; ?>"></a>
                        <?php $i++; ?>
                      <?php } ?>
                  </div>
                  <?php }else{ ?>
                  <div class="imgs">
                      <div class="owl-carousel">
                        <a href="<?php echo $thumb; ?>" data-fancybox="gallery"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>"></a>
                      </div>
                  </div>
                  <?php } ?>
                  
              </div>
              <div class="object-bot">
                  <p class="title">Описание</p>
                  <p><?php echo $description; ?></p>
                  <p class="title">Объекты рядом</p>
                  <div class="obj-map">
                      <iframe src="https://yandex.ua/map-widget/v1/-/CBVEaUCHOA" frameborder="0"></iframe>
                  </div>
              </div>
          </div>
          <div class="col-md-5 object-r">
              <div class="print-download">
                  <a href="#"><img src="catalog/view/theme/indigo/image/save.png" alt="Сохранить PDF">Сохранить PDF</a>
                  <a href="#"><img src="catalog/view/theme/indigo/image/print.png" alt="Напечатать страницу">Напечатать страницу</a>
              </div>
              <div class="info">
                  <div class="labels">
                      <span class="label necessary-label">Срочно</span>
                      <span class="label newhouse-label">В новом доме</span>
                  </div>
                  <span class="id">№ <?php echo $model; ?></span>
                  <p class="subtitle">Дополнительная информация</p>
                  <p><i>Общая площадь: 128 м²</i></p>
                  <p><i>Этаж: 4</i></p>
                  <p><i>Этажность: 14</i></p>
              </div>
              <div class="obj-price">
                  <p>Цена: 7 500 000 руб. / $ 113 636</p>
              </div>
              <div class="info">
                  <p><i>ЖК "Семейный"</i></p>
                  <p><i>Первая очередь</i></p>
                  <p><i>Дата сдачи - I кв. 2019г.</i></p>
              </div>
              <div class="rieltor">
                  <div class="img" style="background-image:url('catalog/view/theme/indigo/image/tatiana.jpg')"></div>
                  <p class="name">Андрей Веретенников</p>
                  <p><i>Специалист по продажам</i></p>
                  <a href="#" class="watch-objs"><img src="catalog/view/theme/indigo/image/house.png" alt="Посмотреть все объекты агента">Посмотреть все объекты агента</a>
                  <p class="rieltor-cont"><i>Телефон:</i> <a href="tel:+79787047888">+7(978) 70-47-888</a></p>
                  <p class="rieltor-cont"><i>E-mail:</i> <a href="mailto:estate-crimea@mail.ru">estate-crimea@mail.ru</a></p>
                  <a href="#" class="round-button">Написать сообщение</a>
              </div>
          </div>
      </div>
  </div>
  
  <?php echo $content_bottom; ?>
  
<?php echo $footer; ?>
