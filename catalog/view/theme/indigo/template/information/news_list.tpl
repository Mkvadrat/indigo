<?php echo $header; ?>
	
	<?php echo $content_top; ?>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="news-list">
					<?php if($news_list){ ?>
					<?php foreach($news_list as $news){ ?>
					<div class="item">
						<a href="<?php echo $news['href']; ?>" class="img">
							<img src="<?php echo $news['thumb']; ?>" alt="<?php echo $news['title']; ?>">
						</a>
						<div class="text">
							<p class="date"><?php echo $news['posted']; ?></p>
							<a href="<?php echo $news['href']; ?>" class="name"<?php echo $news['title']; ?><</a>
							<p class="descr"><?php echo $news['description']; ?></p>
							<a href="<?php echo $news['href']; ?>" class="round-button">Подробнее</a>
						</div>
					</div>
					<?php } ?>
					<?php }else{ ?>
					<p><?php echo $text_empty; ?></p>
					<div class="buttons">
						<div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
					</div>
					<?php } ?>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<?php echo $pagination; ?>
			</div>
		</div>
	</div>
	
<?php echo $footer; ?>