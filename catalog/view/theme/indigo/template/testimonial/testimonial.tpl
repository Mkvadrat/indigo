<?php echo $header; ?>

    <?php echo $content_top; ?>
    
    <div class="container">
        <div class="row">
            <div class="col-md-7 news-l">
                <div id="review"></div>
                
                <?php if ($review_status) { ?>
                <div class="article form" id="anchor">
                    <p class="title">Оставить отзыв</p>
                    <p>* - поля обязательные для заполнения</p>
                    <form id="form-review">
                        <label>Имя*:<input name="name" type="text"></label>
                        <label>Email:<input name="email" type="text"></label>
                        <label>Ваш город:<input name="city" type="text"></label>
                        <label><span class="textarea">Отзыв*:</span><textarea name="text" rows="3"></textarea></label>
                        <?php if (isset($site_key) && $site_key) { ?>
                        <div class="form-group">
                            <div class="col-sm-8">
                                <div class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
                            </div>
                        </div>
                        <?php } elseif(isset($captcha) && $captcha){ ?>
                        <?php echo $captcha; ?>
                        <?php } ?>
                        <label class="check"><input type="checkbox" name="" id="">Я согласен (согласна) на обработку персональных данных.</label>
                        <div class="capcha"></div>
                        <a id="button-review" class="round-button">Отправить</a>
                    </form>
                </div>
                <?php } ?>
            </div>
            
            <?php echo $column_right; ?>
            </div>
        </div>
    </div>
    
    <script type="text/javascript"><!--
    $('#review').delegate('.paggination li a', 'click', function (e) {
        e.preventDefault();
        $('#review').load(this.href);
    });

    $('#review').load('<?php echo html_entity_decode($review); ?>');

    $('#button-review').on('click', function () {
        $.ajax({
            url: '<?php echo html_entity_decode($write); ?>',
            type: 'post',
            dataType: 'json',
            data:  $("#form-review").serialize(),
            beforeSend: function () {
                if ($("textarea").is("#g-recaptcha-response")) {
                    grecaptcha.reset();
                }
                $('#button-review').button('loading');
            },
            complete: function () {
                $('#button-review').button('reset');
            },
            success: function (json) {
                $('.alert-success, .alert-danger').remove();
                if (json['error']) {
                    $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                }
                if (json['success']) {
                    $('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                    $('input[name=\'name\']').val('');
                    $('input[name=\'email\']').val('');
                    $('input[name=\'city\']').val('');
                    $('textarea[name=\'text\']').val('');
                }
            }
        });
    });
    //--></script>
    
<?php echo $footer; ?>