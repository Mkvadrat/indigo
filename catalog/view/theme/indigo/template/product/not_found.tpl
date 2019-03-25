<?php echo $header; ?>

  <div class="container">
		<div class="row">
			<div class="col-md-12 breadcrumbs">
				<ul>
				<?php			
					$count = count($breadcrumbs);
					$i=1;
					foreach ($breadcrumbs as $breadcrumb) {
						if($i!=$count){
                ?>
						<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php echo ' ' . $breadcrumb['separator']; ?></li>
                <?php
						}else{
							echo '<li><span> '.$breadcrumb['text'] . '</span></li>'; 
						}		
						$i++;
					} 
                ?>
				</ul>
			</div>
		</div>
	</div>

  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div id="content" class="not-found">
          <h1><?php echo $heading_title; ?></h1>
          <div class="border">
          <div class="content"><?php echo $text_empty; ?></div>
          </div>
          <?php echo $content_bottom; ?>
        </div>
      </div>
    </div>
  </div>

<?php echo $footer; ?>