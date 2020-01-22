<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
    <link rel="STYLESHEET" href="catalog/view/theme/indigo/stylesheet/pdf/styles.css" type="text/css"/>
    <title>PDF-1</title>
    <link href="https://fonts.googleapis.com/css?family=PT+Serif:700&display=swap&subset=cyrillic" rel="stylesheet">
</head>
<body>
<div id="body">
    <div id="content">
        <div class="page">
            <table class="main-table">
                <tbody>
                <tr>
                    <td>
                        <div class="man-info">
                            <img src="<?php echo $image_agent; ?>">
                            <div class="name"><?php echo $agent_name; ?></div>
                            <?php if($specialization){ ?>
                            <div class="spec"><?php echo $specialization; ?></div>
                            <?php } ?>
                            <?php if($phone){ ?>
                            <div class="phone"><?php echo $phone; ?></div>
                            <?php } ?>
                            <div class="mail"><?php echo $email; ?></div>
                        </div>
                        <div class="hotel-info">
                            <img src="catalog/view/theme/indigo/image/pdf/logo.png"/>
                            <div class="address">ул. Московская, д.43, Крым, г.Ялта<br>indigo-yalta @mail.ru<br>+7 (978) 704-78-88 (Viber, WhatsApp)<br>www.indigo-yalta.com<br>indigo-yalta@mail.ru</div>
                        </div>
                    </td>
                    <td>
                        <div class="top-info">
                            <table>
                                <tbody>
                                <tr>
                                    <td>
                                        <div class="code">№ <?php echo $model; ?></div>
                                        <div class="title"><?php echo $heading_title; ?></div>
                                        <?php if ($price || $rub) { ?>
                                        <?php if (!$special) { ?>
                                        <div class="price-rub"><?php echo $rub; ?></div>
                                        <div class="price-doll"><?php echo $price; ?></div>
                                        <?php } else { ?>
                                        <div class="price-rub"><?php echo $rub; ?></div>
                                        <div class="price-doll"><sup><strike><?php echo $price; ?></strike></sup></div>
                                        <?php } ?>
                                        <?php } ?> 
                                    </td>
                                    <td>
                                        <table class="table-info">
                                            <tbody>
                                                <?php if($uniq_options){ ?>
                                                    <?php if($product_options){ ?>
                                                        <?php foreach($product_options as $option){ ?>
                                                            <tr>
                                                                <?php if($option['product_option_value']){ ?>
                                                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                                <td>
                                                                    <?php echo $option['name']; ?>:
                                                                </td>
                                                                <td>
                                                                    <?php echo $option_value['name']; ?>
                                                                </td>
                                                                <?php } ?>
                                                                <?php }else{ ?>
                                                                <td>
                                                                    <?php echo $option['name']; ?>:
                                                                </td>
                                                                <td>
                                                                    <?php echo $option['value']; ?>
                                                                </td>
                                                                <?php } ?>
                                                            </tr>
                                                        <?php } ?>
                                                    <?php } ?>
                                                <?php }else{ ?>
                                                    <?php if($slider_filter_options){ ?>
                                                        <?php foreach($slider_filter_options as $slider_option){ ?>
                                                            <tr>
                                                                <td><?php echo $slider_option['name']; ?>:</td>
                                                                <td><?php echo $slider_option['value']; ?> <?php echo $slider_option['postfix']; ?></td>
                                                            </tr>
                                                        <?php } ?>
                                                    <?php } ?>
                                                <?php } ?>
                                                <?php if($filter_options){ ?>
                                                    <?php foreach($filter_options as $option){ ?>
                                                        <tr>
                                                            <td><?php echo $option['name']; ?>:</td>
                                                            <td><?php echo $option['value']; ?></td>
                                                        </tr>
                                                    <?php } ?>
                                                <?php } ?>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="image-info">
                            <img src="<?php echo $thumb; ?>"/>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
            
            <table class="main-table">
                <tbody>
                <tr>
                    <td>
                        <div class="man-info">
                            <img src="<?php echo $image_agent; ?>">
                            <div class="name"><?php echo $agent_name; ?></div>
                            <?php if($specialization){ ?>
                            <div class="spec"><?php echo $specialization; ?></div>
                            <?php } ?>
                            <?php if($phone){ ?>
                            <div class="phone"><?php echo $phone; ?></div>
                            <?php } ?>
                            <div class="mail"><?php echo $email; ?></div>
                        </div>
                        <div class="hotel-info">
                            <img src="catalog/view/theme/indigo/image/pdf/logo.png"/>
                            <div class="address">ул. Московская, д.43, Крым, г.Ялта<br>indigo-yalta @mail.ru<br>+7 (978) 704-78-88 (Viber, WhatsApp)<br>www.indigo-yalta.com<br>indigo-yalta@mail.ru
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="top-info top-info-2">
                            <table>
                                <tbody>
                                <tr>
                                    <td>
                                        <div class="code">№ <?php echo $model; ?></div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <table style="width: 100%">
                                <tbody>
                                <tr>
                                    <td style="width: 50%">
                                        <div class="title"><?php echo $heading_title; ?></div>
                                    </td>
                                    <td style="width: 50%">
                                        <?php if ($price || $rub) { ?>
                                        <?php if (!$special) { ?>
                                        <div class="price-rub"><?php echo $rub; ?></div>
                                        <div class="price-doll"><?php echo $price; ?></div>
                                        <?php } else { ?>
                                        <div class="price-rub"><?php echo $rub; ?></div>
                                        <div class="price-doll"><sup><strike><?php echo $price; ?></strike></sup></div>
                                        <?php } ?>
                                        <?php } ?> 
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <table>
                                <tbody>
                                <tr>
                                    <td>
                                        <div class="link">
                                            <?php echo $href; ?>
                                        </div>
                                        <div class="tags"><?php echo $features; ?></div>
                                        <div class="description"><?php echo $description; ?></div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="image-gallery">
                            <?php if($images){ ?>
                            <?php $i = 0; ?>
                            <?php if(count($images) > 2){ ?>
                            <?php $slices = array_slice($images, 2); ?>
                            <?php foreach($slices as $image){ ?>
                            <?php $i++; ?>
                            <?php if($i > 6) break; ?>
                                <img src="<?php echo $image['popup']; ?>">
                            <?php } ?>
                            <?php } ?>
                            <?php } ?>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>