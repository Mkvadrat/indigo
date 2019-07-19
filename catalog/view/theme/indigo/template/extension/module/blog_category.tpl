<div class="list-group btn__group">
  <?php foreach ($categories as $category) { ?>
  <?php if ($category['blog_category_id'] == $blog_category_id) { ?>
  <a href="<?php echo $category['href']; ?>" class="active round-button"><?php echo $category['name']; ?></a>
  <?php if ($category['children']) { ?>
  <?php foreach ($category['children'] as $child) { ?>
  <?php if ($child['blog_category_id'] == $child_id) { ?>
  <a href="<?php echo $child['href']; ?>" class="active round-button">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a>
  <?php } else { ?>
  <a href="<?php echo $child['href']; ?>" class="round-button">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a>
  <?php } ?>
  <?php } ?>
  <?php } ?>
  <?php } else { ?>
  <a href="<?php echo $category['href']; ?>" class="round-button"><?php echo $category['name']; ?></a>
  <?php } ?>
  <?php } ?>
</div>
