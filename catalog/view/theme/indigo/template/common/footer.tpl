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
                            <?php echo $first_telephone; ?><br>
                            <?php echo $second_telephone; ?>
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
    
<!-- Yandex.Metrika counter -->
<script type="text/javascript">
    (function (d, w, c) {
        (w[c] = w[c] || []).push(function() {
            try {
                w.yaCounter30988071 = new Ya.Metrika({id:30988071,
                    webvisor:true,
                    clickmap:true,
                    trackLinks:true,
                accurateTrackBounce:true});
            } catch(e) { }
        });

        var n = d.getElementsByTagName("script")[0],
        s = d.createElement("script"),
        f = function () { n.parentNode.insertBefore(s, n); };
        s.type = "text/javascript";
        s.async = true;
        s.src = (d.location.protocol == "https:" ? "https:" : "http:") + "//mc.yandex.ru/metrika/watch.js";

        if (w.opera == "[object Opera]") {
            d.addEventListener("DOMContentLoaded", f, false);
        } else { f(); }
    })(document, window, "yandex_metrika_callbacks");
</script>
<noscript><div><img src="//mc.yandex.ru/watch/30988071" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->
</body>

</html>