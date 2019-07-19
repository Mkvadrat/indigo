<style>
    * {
        all: initial;
        padding: 0;
        margin: 0;
    }

    body {
        font-family: "GothamPro";
        font-size: 20px;
        color: #000;
        padding: 40px;
    }

    .title {
        font-size: 26px;
        font-weight: normal;
    }

    p {
        font-size: 14px;
        margin: 0;
    }

    p span {
        font-family: "GothamPro_Med";
    }

    table {
        width: 100%;
        margin: 0;
        padding: 0;
    }

    table, tbody, tr, td {
        padding: 0;
        margin: 0;
    }
    td {
        vertical-align: top;
        text-align:left;
    }
    table, tbody, tr {
        width: 100%;
    }

    table td {
        padding: 0;
    }

    .red {
        color: red;
        font-size: 20px;
        font-weight: bold;
    }

    .grey {
        color: #7d7d7d;
    }

    .price {
        font-size: 18px;
    }

    img {
        max-width: 100%;
    }

    .object_description p {
        margin: 0;
    }

    .name {
        text-align: center;
    }

    .name a {
        display: block;
        text-align: center;
    }
</style>
<table cellpadding="8" cellspacing="0">
    <tbody>
    <tr>
        <td>
            <table cellpadding="6" cellspacing="8">
                <tbody>
                <tr>
                    <td align="left" rowspan="3" class="title" colspan="2"><?php echo $heading_title; ?></td>
                </tr>
                </tbody>
            </table>
            <table cellpadding="6" cellspacing="6">
                <tbody>
                <tr>
                    <td width="400" align="top">
                        <img src="<?php echo $thumb; ?>" class="pop__img"
                             style="width: 440px; padding: 0; margin: 0; display: block;">
                    </td>
                    <td width="400" align="top">
                        <table cellpadding="0" cellspacing="0">
                            <tbody>
                            <tr>
                                <td width="150" align="top">ID:</td>
                                <td width="150" align="top"><?php echo $model; ?></td>
                            </tr>
                            <?php if ($price || $rub) { ?>
                            <?php if (!$special) { ?>
                            <tr>
                                <td width="300" align="top" colspan="2"><p class="price">Цена:</p></td>
                            </tr>
                            <tr>
                                <td class="red" width="250" align="top" colspan="2"><?php echo $rub; ?>
                                    <br/><?php echo $price; ?></td>
                            </tr>
                            <?php } else { ?>
                            <tr>
                                <td width="150" align="top"><p class="price">Цена:</p></td>
                                <td width="150" align="top" class="red"><?php echo $special; ?>
                                    <sup><strike><?php echo $price; ?></strike></sup></td>
                            </tr>
                            <?php } ?>
                            <?php } ?>
                            </tbody>
                        </table>
                        <table cellpadding="0" cellspacing="0">
                            <tbody>

                            <?php if($uniq_options){ ?>

                            <?php if($product_options){ ?>

                            <?php foreach($product_options as $option){ ?>

                            <tr>

                                <?php if($option['product_option_value']){ ?>
                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                <td width="150" align="top" class="grey">
                                    <?php echo $option['name']; ?>:
                                </td>
                                <td width="150" align="top">
                                    <?php echo $option_value['name']; ?>
                                </td>

                                <?php } ?>
                                <?php }else{ ?>
                                <td width="150" align="top" class="grey">
                                    <?php echo $option['name']; ?>:
                                </td>
                                <td width="150" align="top">
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
                                <td width="150" align="top" class="grey"><?php echo $slider_option['name']; ?>:</td>
                                <td width="150"
                                    align="top"><?php echo $slider_option['value']; ?> <?php echo $slider_option['postfix']; ?></td>
                            </tr>


                            <?php } ?>

                            <?php } ?>

                            <?php } ?>

                            <?php if($filter_options){ ?>

                            <?php foreach($filter_options as $option){ ?>

                            <tr>
                                <td width="150" align="top" class="grey"><?php echo $option['name']; ?>:</td>
                                <td width="150" align="top"><?php echo $option['value']; ?></td>
                            </tr>

                            <?php } ?>

                            <?php } ?>

                            </tbody>
                        </table>
                    </td>
                </tr>
                </tbody>
            </table>
            <table cellpadding="0" cellspacing="0">
                <tbody>
                <tr>
                    <td width="300" align="top">
                        <table cellpadding="4" cellspacing="0">
                            <tbody>
                            <tr>
                                <td align="top">
                            <?php if($images){ ?>
                            <?php $i = 0; ?>
                            <?php if(count($images) > 2){ ?>
                            <?php $slices = array_slice($images, 2); ?>
                            <?php foreach($slices as $image){ ?>
                            <?php $i++; ?>
                            <?php if($i > 2) break; ?>

                            <img src="<?php echo $image['popup']; ?>" class="add__img" align="top" style="margin: 0; padding: 0; display: block">

                            <?php } ?>
                            <?php } ?>
                            <?php } ?>
                            </td>
                            </tr>
                            </tbody>
                        </table>
                    </td>
                    <td width="400" align="top">
                        <table cellpadding="0" cellspacing="0">
                            <tbody>
                            <tr>
                                <td align="top">
                                    <div class="object_description">
                                        <?php echo $description; ?>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                </tbody>
            </table>
            <table cellpadding="0" cellspacing="0">
                <tbody>

                <tr>
                    <td align="bottom"></td>
                    <td align="top">
                        <table cellpadding="0" cellspacing="0">
                            <tbody>
                            <tr>
                                <td width="100"><a href="http://indigo.streetmoda-opt.com/"><img
                                                src="http://indigo.streetmoda-opt.com/image/catalog/indigo/mob-logo.png"
                                                title="<?php echo $name; ?>" alt="<?php echo $name; ?>"/></a></td>
                                <td class="name">
                                    <div><?php echo $agent_name; ?></div>
                                    <?php if($specialization){ ?>
                                    <?php echo $specialization; ?>
                                    <?php } ?>
                                    <?php if($phone){ ?>
                                    <a href="tel:<?php echo $phone; ?>"><?php echo $phone; ?></a>
                                    <?php } ?>
                                    <a href="mailto:<?php echo $email; ?>"><?php echo $email; ?></a>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                </tbody>
            </table>
            <table cellpadding="4" cellspacing="0">
                <tbody>
                <tr>
                    <td><?php echo $current_date; ?></td>
                </tr>
                </tbody>
            </table>
        </td>
    </tr>
    </tbody>
</table>