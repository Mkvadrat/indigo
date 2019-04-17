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

    table, tbody, tr {
        width: 100%;
    }

    table td {
        padding: 0;
        /*vertical-align: top;*/
    }

    .red {
        color: red;
        font-size: 20px;
        font-weight: bold;
    }

    .grey{
        color: #7d7d7d;
    }
    .price{
        font-size: 18px;
    }
    img{
        max-width: 100%;
    }
    .object_description p{
        margin: 0;
    }
    .name{
        text-align: center;
    }
    .name a {
        display: block;
        text-align: center;
    }
</style>
<table style="padding: 20px 40px 0">
    <tbody>
    <tr>
        <td class="title" colspan="2"><?php echo $heading_title; ?></td>
    </tr>
    </tbody>
</table>
<table style="padding: 0 80px; width: 100%;">
    <tbody>
    <tr>
        <td style="text-align: center; width: 440px; height: 265px; vertical-align: top;">
            <img src="<?php echo $thumb; ?>" class="pop__img"  style="width: 400px; height: 265px; padding: 0; margin: 0; display: block;">
        </td>
        <td style="text-align: left; width: 400px; height: 265px; vertical-align: top;">
            <table style="width: 400px; padding: 0; margin: 0">
                <tbody>
                <tr>
                    <td>ID:</td>
                    <td><?php echo $model; ?></td>
                </tr>
                <?php if ($price || $rub) { ?>
                <?php if (!$special) { ?>
                <tr>
                    <td colspan="2"><p class="price">Цена:</p></td>
                </tr>
                <tr>
                    <td class="red" colspan="2"><?php echo $rub; ?><br/><?php echo $price; ?></td>
                </tr>
                <?php } else { ?>
                <tr>
                    <td><p class="price">Цена:</p></td>
                    <td class="red"><?php echo $special; ?><sup><strike><?php echo $price; ?></strike></sup></td>
                </tr>
                <?php } ?>
                <?php } ?>
                </tbody>
            </table>
            <table style="padding: 0; margin: 0">
                <tbody style="padding: 0; margin: 0">

                <?php if($uniq_options){ ?>

                <?php if($product_options){ ?>

                <?php foreach($product_options as $option){ ?>

                <tr>

                    <?php if($option['product_option_value']){ ?>
                    <?php foreach ($option['product_option_value'] as $option_value) { ?>
                    <td class="grey">
                        <?php echo $option['name']; ?>:
                    </td>
                    <td>
                        <?php echo $option_value['name']; ?>
                    </td>

                    <?php } ?>
                    <?php }else{ ?>
                    <td class="grey">
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
                    <td class="grey"><?php echo $slider_option['name']; ?>:</td>
                    <td><?php echo $slider_option['value']; ?> <?php echo $slider_option['postfix']; ?></td>
                </tr>


                <?php } ?>

                <?php } ?>

                <?php } ?>

                <?php if($filter_options){ ?>

                <?php foreach($filter_options as $option){ ?>

                <tr>
                    <td class="grey"><?php echo $option['name']; ?>:</td>
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
<table style="padding: 0 40px">
    <tbody>
    <tr>
        <td width="50%">
            <?php if($images){ ?>
            <?php $i = 0; ?>
            <?php if(count($images) > 2){ ?>
            <?php $slices = array_slice($images, 1); ?>
            <?php foreach($slices as $image){ ?>
            <?php $i++; ?>
            <?php if($i > 3) break; ?>
            <img src="<?php echo $image['popup']; ?>" class="add__img">
            <?php } ?>
            <?php } ?>
            <?php } ?>
        </td>
        <td width="50%">
            <div class="object_description" id="print8">
                <?php echo $description; ?>
            </div>
        </td>
    </tr>
    <tr>
        <td><?php var_dump($current_date); ?></td>
        <td>
            <table>
                <tbody>
                <tr>
                    <td><a href="http://indigo.streetmoda-opt.com/"><img
                                    src="http://indigo.streetmoda-opt.com/image/catalog/indigo/mob-logo.png"
                                    title="<?php echo $name; ?>" alt="<?php echo $name; ?>" width="100"/></a></td>
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