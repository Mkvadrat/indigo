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
<link rel="stylesheet" href="catalog/view/theme/indigo/stylesheet/bootstrap.min.css">
<link rel="stylesheet" href="catalog/view/theme/indigo/stylesheet/jquery.mmenu.all.css">
<link rel="stylesheet" href="catalog/view/theme/indigo/stylesheet/jquery.fancybox.min.css">
<link rel="stylesheet" href="catalog/view/theme/indigo/stylesheet/dropzone.css">
<link rel="stylesheet" href="catalog/view/theme/indigo/stylesheet/owl.carousel.min.css">
<link rel="stylesheet" href="catalog/view/theme/indigo/stylesheet/owl.theme.default.min.css">
<link rel="stylesheet" href="catalog/view/theme/indigo/stylesheet/nomalize.css">
<link rel="stylesheet" href="catalog/view/theme/indigo/stylesheet/stylesheet.css">
<link rel="stylesheet" href="catalog/view/theme/indigo/stylesheet/media.css">

<!-- JS -->
<script src="catalog/view/theme/indigo/js/jquery-2.1.1.min.js"></script>
<script src="catalog/view/theme/indigo/js/dropzone.js"></script>
<script src="catalog/view/theme/indigo/js/jquery-ui.min.js"></script>
<script src="catalog/view/theme/indigo/js/jquery.mmenu.all.js"></script>
<script src="catalog/view/theme/indigo/js/jquery.fancybox.min.js"></script>
<script src="catalog/view/theme/indigo/js/owl.carousel.min.js"></script>

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
                                <a class="mob-logo" href="<?php echo $home; ?>"><img src="<?php echo $mobile_logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
                              <?php } else { ?>
                                <h1><a class="mob-logo" href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
                              <?php } ?>
                          </div>
                          <div class="addres">
                            <?php echo $address; ?>
                          </div>
                          <div class="query">
                            <?php echo $callback_link; ?>
                          </div>
                          <div class="cont-phones">
                              <div>
                                  <div class="messengers">
                                    <?php echo $messenger; ?>
                                  </div>
                                  <a href="tel:<?php echo $first_header_telephone; ?>"><?php echo $first_header_telephone; ?></a>
                              </div>
                              <div>
                                  <a href="tel:<?php echo $second_header_telephone; ?>"><?php echo $second_header_telephone; ?></a>
                              </div>
                          </div>
                      </div>
                      <div class="menu">
                          <ul>
                              <li><a href="#">Продажа</a>
                                  <ul>
                                      <li><a href="#">Купить 1ком. квартиру в Ялте</a></li>
                                      <li><a href="#">2-х комн. квартиры</a></li>
                                      <li><a href="#">3-х комн. и более</a></li>
                                      <li><a href="#">Новостройки</a></li>
                                      <li><a href="#">Элитные квартиры</a></li>
                                      <li><a href="#">Дома, коттеджи</a></li>
                                      <li><a href="#">Участки</a></li>
                                      <li><a href="#">Коммерческая недвижимость</a></li>
                                  </ul>
                              </li>
                              <li><a href="#">Квартиры</a></li>
                              <li><a href="#">Информация</a></li>
                              <li><a href="#">Услуги</a></li>
                              <li><a href="#">Контакты</a></li>
                              <li><a href="#">Срочный выкуп</a></li>
                          </ul>
                      </div>
                  </div>
              </div>
          </div>
          <div class="mob-menu">
              <a href="#menu"></a>
          </div>
      </header>