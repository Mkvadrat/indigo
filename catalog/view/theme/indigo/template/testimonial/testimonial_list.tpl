<?php if ($reviews) { ?>
<?php foreach ($reviews as $review) { ?>
<div class="article">
    <p class="name"><?php echo $review['author']; ?>
    <?php if($review['city']){ ?>
      <span class="city">(<?php echo $review['city']; ?>)</span>
    <?php } ?>
      <span class="date"><?php echo $review['date_added']; ?></span>
    </p>
    <p><?php echo $review['text']; ?></p>
</div>
<?php } ?>
<?php echo $pagination; ?>
<?php } else { ?>
<p><?php echo $text_no_reviews; ?></p>
<?php } ?>
