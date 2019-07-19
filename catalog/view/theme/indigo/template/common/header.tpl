<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title;  ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta property="og:title" content="<?php echo $title; ?>" />
<meta property="og:type" content="website" />
<meta property="og:url" content="<?php echo $og_url; ?>" />
<?php if ($og_image) { ?>
<meta property="og:image" content="<?php echo $og_image; ?>" />
<?php } else { ?>
<meta property="og:image" content="<?php echo $logo; ?>" />
<?php } ?>
<meta property="og:site_name" content="<?php echo $name; ?>" />

<!-- STYLESHEET -->
<link rel="stylesheet" href="catalog/view/theme/indigo/stylesheet/jquery-ui.min.css">
<link rel="stylesheet" href="catalog/view/javascript/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="catalog/view/theme/indigo/stylesheet/jquery.mmenu.all.css">
<link rel="stylesheet" href="catalog/view/theme/indigo/stylesheet/jquery.fancybox.min.css">
<link rel="stylesheet" href="catalog/view/theme/indigo/stylesheet/dropzone.css">
<link rel="stylesheet" href="catalog/view/theme/indigo/stylesheet/owl.carousel.min.css">
<link rel="stylesheet" href="catalog/view/theme/indigo/stylesheet/owl.theme.default.min.css">
<link rel="stylesheet" href="catalog/view/theme/indigo/stylesheet/nomalize.css">
<link rel="stylesheet" href="catalog/view/theme/indigo/stylesheet/stylesheet.css">
<link rel="stylesheet" href="catalog/view/theme/indigo/stylesheet/media.css">
<link rel="stylesheet" href="catalog/view/theme/indigo/stylesheet/sweetalert.css">

<!-- JS -->
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js"></script>
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js"></script>
<script src="catalog/view/theme/indigo/js/dropzone.js"></script>
<script src="catalog/view/theme/indigo/js/jquery-ui.min.js"></script>
<script src="catalog/view/theme/indigo/js/jquery.mmenu.all.js"></script>
<script src="catalog/view/theme/indigo/js/jquery.fancybox.min.js"></script>
<script src="catalog/view/theme/indigo/js/owl.carousel.min.js"></script>
<script src="catalog/view/theme/indigo/js/sweetalert.min.js"></script>
<script src="catalog/view/theme/indigo/js/printThis.js"></script>
<script src="http://api-maps.yandex.ru/2.1/?lang=ru_RU" type="text/javascript"></script>

<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/theme/indigo/js/custom.js"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>

</head>
<body>
  <div class="page">
      <header>
          <div class="container">
              <div class="row">
                  <div class="col-md-12">
                      <div class="logo-line">
                          <div class="logo">
                              <?php if ($logo) { ?>
                                <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
                              <?php } else { ?>
                                <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
                              <?php } ?>
                              <?php if ($mobile_logo) { ?>
                                <a class="mob-logo" href="<?php echo $home; ?>"><img src="<?php echo $mobile_logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /><img src="/catalog/view/theme/indigo/image/mob-mob-logo.svg" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive mob-mob-logo" /></a>
                              <?php } else { ?>
                                <h1><a class="mob-logo" href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
                              <?php } ?>
                          </div>
                          <div class="addres">
                            <?php echo $address; ?>
                          </div>
                          <div class="query">
                              <div class="link-group">
                                  <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseSubMenu" aria-expanded="false" aria-controls="collapseSubMenu">Продажа недвижимости</button>
                                  <div class="collapse-block collapse" id="collapseSubMenu">
                                      <div class="well">
                                          <a href="/sale/kvartiry/kvartiry-v-yalte-odnokomnatnye/">1 комн. квартиры</a>
                                          <a href="/sale/kvartiry/dvuhkomnatnye-kvartiry-v-yalte/">2-х комн. квартиры</a>
                                          <a href="/sale/kvartiry/trehkomnatnaja-kvartira-yalta/">3-х комн. и более</a>
                                          <a href="/sale/novostrojki/">Новостройки</a>
                                          <a href="/sale/elitnye-kvartiry/">Элитные квартиры</a>
                                          <a href="/sale/doma-garazhi/">Дома, коттеджи</a>
                                          <a href="/sale/uchastki/">Участки</a>
                                          <a href="/sale/kommercheskaja-nedvizhimost/">Коммерческая недвижимость</a>
                                      </div>
                                  </div>
                                  <a href="/uslugi" class="half">Услуги</a>
                                  <a href="/contact-us" class="half">Контакты</a>
                              </div>
                            <?php echo $callback_link; ?>
                          </div>
                          <div class="cont-phones">
                              <div>
                                  <div class="messengers">
                                    <?php echo $messenger; ?>
                                  </div>
                                  <?php echo $first_telephone; ?>
                              </div>
                              <div>
                                  <?php echo $second_telephone; ?>
                              </div>
                          </div>
                      </div>
                      
                      <?php if ($categories) { ?>
                      <div class="menu">
                          <ul>
                            <?php foreach ($categories as $category) { ?>
                            <?php if ($category['children']) { ?>
                              <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                              <?php foreach (array_chunk($category['children'], ceil(count($category['children']))) as $children) { ?>
                                <ul>
                                  <?php foreach ($children as $child) { ?>
                                    <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                                  <?php } ?>
                                </ul>
                              <?php } ?>
                              </li>
                            <?php } else { ?>
                              <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                            <?php } ?>
                            <?php } ?>
                          </ul>
                      </div>
                      <?php } ?>
                  </div>
              </div>
          </div>
          <?php if ($categories) { ?>
          <div class="mob-menu">
              <a href="#menu"></a>
          </div>
          
          <nav id="menu">
              <ul>
                <?php foreach ($categories as $category) { ?>
                <?php if ($category['children']) { ?>
                  <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                  <?php foreach (array_chunk($category['children'], ceil(count($category['children']))) as $children) { ?>
                    <ul>
                      <?php foreach ($children as $child) { ?>
                        <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                      <?php } ?>
                    </ul>
                  <?php } ?>
                  </li>
                <?php } else { ?>
                  <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                <?php } ?>
                <?php } ?>
              </ul>
          </nav>
          <?php } ?>
      </header>
    <section>  