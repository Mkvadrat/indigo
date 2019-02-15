<?php if($categories){ ?>
<div class="container">
    <div class="row">
        <div class="col-md-12 text-row">
          <?php echo $description; ?>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="category-section">
              <?php foreach ($categories as $category) { ?>
              <?php if ($category['children']) { ?>
              <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
              <?php foreach ($children as $child) { ?>
                <a href="<?php echo $child['href']; ?>" class="item">
                    <span class="icon" style="background-image: url('<?php echo $child['image']; ?>')"></span>
                    <span class="text"><?php echo $child['name']; ?></span>
                </a>
              <?php } ?>
              <?php } ?>
              <?php } ?>
              <?php } ?>
            </div>
        </div>
    </div>
</div>
<?php } ?>