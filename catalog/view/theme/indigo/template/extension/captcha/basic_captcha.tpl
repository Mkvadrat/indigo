<?php if (substr($route, 0, 9) == 'checkout/') { ?>
<label><?php echo $entry_captcha; ?>
<input type="text" name="captcha" autocomplete="off" /></label>
<img src="index.php?route=extension/captcha/basic_captcha/captcha" alt="" />
<?php } else { ?>
<label><?php echo $entry_captcha; ?>
  <input type="text" name="captcha" /></label>
  <img src="index.php?route=extension/captcha/basic_captcha/captcha" alt="" />
  <?php if ($error_captcha) { ?>
  <div class="text-danger"><?php echo $error_captcha; ?></div>
  <?php } ?>
<?php } ?>

