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
			<div class="col-md-7 article-l">
				<div class="article">
					<p class="date"><?php echo $posted; ?></p>
					<?php if($heading_title) {?>
					<h1 class="title"><?php echo $heading_title; ?></h1>
					<?php } ?>
					
					<p><img src="<?php echo $popup; ?>" alt="<?php echo $heading_title; ?>"></p>
					
					<?php echo $description; ?>
				</div>
			</div>
			
			<?php echo $column_right; ?>
		</div>
	</div>
	
<?php echo $footer; ?>