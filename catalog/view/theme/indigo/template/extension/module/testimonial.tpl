<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="review-main">
                <?php if($heading_title){ ?>
                    <p class="title"><a href="<?php echo $keyword; ?>"><?php echo $heading_title; ?></a></p>
                <?php }else{ ?>
                    <p class="title"><a href="<?php echo $keyword; ?>">Отзывы</a></p>
                <?php } ?>
                
                <?php if($reviews){ ?>
                <div class="owl-carousel">
                    <?php foreach ($reviews as $review) { ?>
                    <div class="item">
                        <div class="text">
                            <p class="name"><b><?php echo $review['author']; ?> <?php echo $review['city'] ? '('.$review['city'].')' : ''; ?></b><span class="date"><i><?php echo $review['date_added']; ?></i></span></p>
                            <p class="actual-review"><?php echo $review['text']; ?></p>
                            <p><a href="<?php echo $keyword; ?>">Читать отзывы</a></p>
                        </div>
                    </div>
                    <?php } ?>
                </div>
                <?php } ?>
            </div>
        </div>
    </div>
</div>