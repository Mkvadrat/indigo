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

        <div class="custom-flex">
            <div class="sort">
                <label>
                    <span>Сортировка:</span>
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
                    <span>На странице:</span>
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
            <div class="change_view">
                <span>Вид:</span>
                <button id="grid-view" class="btn tab_veiw"><img src="/catalog/view/theme/indigo/image/grid.svg"/></button>
                <button id="list-view" class="btn list_veiw active"><img src="/catalog/view/theme/indigo/image/list.svg"/></button>
            </div>
            <?php echo $search; ?>
            <a href="<?php echo $request; ?>" class="round-button toAdd">Добавить объявление</a>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="category-list product-list">
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

                        <?php if($product['uniq_options']){ ?>
                        <?php if($product['slider_filter_options']){ ?>
                        <?php foreach($product['slider_filter_options'] as $slider_option){ ?>
                        <p class="square"><?php echo $slider_option['name']; ?>: <span><?php echo $slider_option['value']; ?> <?php echo $slider_option['postfix']; ?></span></p>
                        <?php } ?>
                        <?php } ?>
                        <?php if($product['filter_options']){ ?>
                        <?php $i = 0; ?>
                        <?php foreach($product['filter_options'] as $option){ ?>
                        <p class="square"><?php echo $option['name']; ?>: <span><?php echo $option['value']; ?></span></p>
                        <?php $i++; ?>
                        <?php if($i > 12) break; ?>
                        <?php } ?>
                        <?php } ?>
                        <?php }else{ ?>
                        <div class="description"><?php echo $product['description']; ?></div>
                        <?php } ?>
                        <div class="podrobnee-grid">
                            <a href="<?php echo $product['href']; ?>" class="podrobnee">Подробнее</a>
                            <?php if ($product['price'] || $product['rub']) { ?>
                            <?php if (!$product['special']) { ?>
                            <p class="price"><?php echo $product['rub']; ?> / <?php echo $product['price']; ?></p>
                            <?php } else { ?>
                            <p class="price"><?php echo $product['special']; ?> <sup><strike><?php echo $product['price']; ?></strike></sup></p>
                            <?php } ?>
                            <?php } ?></div>
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
<script>
    // Product List
    $('#list-view').click(function() {
        $('.container .product-grid > .clearfix').remove();

        $('.container .product-grid').attr('class', 'category-list product-layout product-list col-xs-12');
        $('#grid-view').removeClass('active');
        $('#list-view').addClass('active');

        localStorage.setItem('display', 'list');
    });

    // Product Grid
    $('#grid-view').click(function() {
        // What a shame bootstrap does not take into account dynamically loaded columns
        var cols = $('#column-right, #column-left').length;

        if (cols == 2) {
            $('.container .product-list').attr('class', 'category-list product-layout product-grid col-lg-6 col-md-6 col-sm-12 col-xs-12');
        } else if (cols == 1) {
            $('.container .product-list').attr('class', 'category-list product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-xs-12');
        } else {
            $('.container .product-list').attr('class', 'category-list product-layout product-grid col-xs-12');
        }

        $('#list-view').removeClass('active');
        $('#grid-view').addClass('active');

        localStorage.setItem('display', 'list');
    });

    if (localStorage.getItem('display') == 'list') {
        $('#list-view').trigger('click');
        $('#list-view').addClass('active');
    } else {
        $('#grid-view').trigger('click');
        $('#grid-view').addClass('active');
    }

</script>
<?php echo $footer; ?>
