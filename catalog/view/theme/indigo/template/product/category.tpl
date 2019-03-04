<?php echo $header; ?>

  <div class="container">
      <div class="row">
          <div class="col-md-12 text-row">
              <h2 class="title"><?php echo $heading_title; ?></h2>
          </div>
      </div>
  </div>
  
  <?php echo $content_top; ?>
  
  <?php if ($categories) { ?>
  <div class="container">
      <div class="row">
          <div class="col-md-12">
              <div class="category-section">
                <?php foreach ($categories as $category) { ?>
                  <a href="<?php echo $category['href']; ?>" class="item">
                      <span class="icon" style="background-image: url('<?php echo $category['image']; ?>')"></span>
                      <span class="text"><?php echo $category['name']; ?></span>
                  </a>
                <?php } ?>
              </div>
          </div>
      </div>
  </div>
  <?php } ?>
  
  <?php if($products) { ?>
  <div class="container">
      <div class="row sort-view">
          <div class="col-lg-6 col-md-8 col-sm-12">
              <div class="sort">
                  <label>
                      Сортировка:
                      <select id="sort-items" onchange="location = this.value;">
                        <?php foreach ($sorts as $sorts) { ?>
                        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                        <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                        <?php } ?>
                        <?php } ?>
                      </select>
                  </label>
              </div>
              <div class="view">
                  <label>
                      На странице:
                      <select id="view-items">
                        <?php foreach ($limits as $limits) { ?>
                        <?php if ($limits['value'] == $limit) { ?>
                        <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                        <?php } ?>
                        <?php } ?>
                      </select>
                  </label>
              </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-12 pull-right-lg-md">
              <a href="#" class="round-button toAdd">Добавить объявление</a>
          </div>
      </div>
  </div>
  <div class="container">
      <div class="row">
          <div class="col-md-12">
              <div class="category-list">
                <?php foreach ($products as $product) { ?>
                  <div class="item">
                      <a href="<?php echo $product['href']; ?>" class="img">
                          <img src="<?php echo $product['thumb']; ?>" alt="">
                          
                          <?php if($product['sticker']){ ?>
                          <div class="labels">
                              <?php foreach ($product['sticker'] as $sticker) { ?>
                                <span class="label"><img src="<?php echo $sticker['image']; ?>"></span>
                              <?php } ?>
                          </div>
                          <?php } ?>
                      </a>
                      <div class="text">
                          <p class="id">№ <?php echo $product['model']; ?></p>
                          <a href="<?php echo $product['href']; ?>" class="name"><?php echo $product['name']; ?></a>
                          <p class="descr"><?php echo $product['description']; ?></p>
                          
                          <?php if($product['filter_options']){ ?>
                          <?php foreach($product['slider_filter_options'] as $option){ ?>
                            <p class="square"><?php echo $option['name']; ?> <span><?php echo $option['value'] . ' ' . $option['postfix']; ?></span></p>
                          <?php } ?>
                          <?php $i = 0; ?>
                          <?php foreach($product['filter_options'] as $option){ ?>
                            <p class="square"><?php echo $option['name']; ?> <span><?php echo $option['value'] . $option['postfix']; ?></span></p>
                            <?php $i++; ?>
                            <?php if($i > 12) break; ?>
                          <?php } ?>
                          <?php } ?>
                          
                          <?php if ($product['price'] || $product['rub']) { ?>
                          <?php if (!$product['special']) { ?>
                            <p class="price"><?php echo $product['rub']; ?> / <?php echo $product['price']; ?></p>
                          <?php } else { ?>
                            <p class="price"><?php echo $product['special']; ?> <sup><strike><?php echo $product['price']; ?></strike></sup></p>
                          <?php } ?>
                          <?php } ?>
                      </div>
                  </div>
              <?php } ?>  
              </div>
          </div>
      </div>
  </div>
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <?php echo $pagination; ?>
      </div>
    </div>
  </div>
  <?php }else{ ?>
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="category-empty-list">
          <p><?php echo $text_empty; ?></p>
          <a href="<?php echo $continue; ?>" class="round-button"><?php echo $button_continue; ?></a>    
        </div>
      </div>
    </div>
  </div>
  <?php } ?>

  <?php echo $content_bottom; ?>
  
  <?php if ($description) { ?>
  <div class="container">
      <div class="row">
          <div class="col-md-12 catalog-text-row">
              <div class="text-row">
                <?php echo $description; ?>
              </div>
          </div>
      </div>
  </div>
  <?php } ?>
  
<?php echo $footer; ?>
