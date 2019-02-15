<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="best-proposes">
                <?php echo $html; ?>
                
                <?php if($products){ ?>
                <div class="owl-carousel">
                    <?php foreach ($products as $product) { ?>
                    <a class="item" href="<?php echo $product['href']; ?>" style="background-image: url('<?php echo $product['thumb']; ?>')">
                        <?php if($product['sticker']){ ?>
                        <div class="labels">
                            <?php foreach ($product['sticker'] as $sticker) { ?>
                                <span class="label"><img src="<?php echo $sticker['image']; ?>"></span>
                            <?php } ?>
                        </div>
                         <?php } ?>
                        <div class="text">
                            <span class="object-id">№ <?php echo $product['model']; ?></span>
                            <p class="description"><?php echo $product['name']; ?></p>
                            <?php if ($product['price'] || $product['rub']) { ?>
                            <?php if (!$product['special']) { ?>
                            <p class="prices"><?php echo $product['rub']; ?> / <?php echo $product['price']; ?></p>
                            <?php } else { ?>
                            <p class="prices"><?php echo $product['special']; ?> <sup><strike><?php echo $product['price']; ?></strike></sup></p>
                            <?php } ?>
                            <?php } ?>
                        </div>
                    </a>
                    <?php } ?>
                </div>
                <?php } ?>
            </div>
        </div>
    </div>
</div>