        </section>
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-9 col-xs-12 foot-menu">
                        <?php if ($main_categories) { ?>
                        <ul class="menu">
                            <?php foreach($main_categories as $main){ ?>
                                <li><a href="<?php echo $main['href']; ?>"><?php echo $main['name']; ?></a></li>
                            <?php } ?>
                        </ul>
                        <?php } ?>
                    </div>
                    <div class="col-md-3 col-xs-12">
                        <?php echo $callback_link; ?>
                    </div>
                    <div class="col-md-8 col-xs-12">
                        <?php if ($categories) { ?>
                        <ul class="submenu">
                            <?php foreach($categories as $category){ ?>
                                <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                            <?php } ?>
                        </ul>
                        <?php } ?>
                        <?php echo $descr_agency; ?>
                    </div>
                    <div class="col-md-3 col-xs-12 pull-right">
                        <div class="addres">
                            <?php echo $address; ?>
                        </div>
                        <div class="cont-phones">
                            <a href="tel:<?php echo $first_telephone; ?>"><?php echo $first_telephone; ?></a><br>
                            <a href="tel:<?php echo $second_telephone; ?>"><?php echo $second_telephone; ?></a>
                        </div>
                        
                        <?php echo $social; ?>
                        
                        <?php echo $descr_agency; ?>
                    </div>
                    <div class="col-md-12 col-xs-12 bot-line">
                        <?php echo $powered; ?>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</body>

</html>