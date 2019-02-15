<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="news-main">
				<p class="title"><a href="<?php echo $news_list; ?>"><?php echo $heading_title; ?></a></p>
				
				<?php echo $html; ?>
				
				<?php if($news) { ?>
				<div class="news-main-list">
					<?php foreach ($news as $news_item) { ?>
					<a href="<?php echo $news_item['href']; ?>" class="item">
						<span class="img" style="background-image: url('<?php echo $news_item['thumb']; ?>')"></span>
						<span class="date"><i><?php echo $news_item['posted']; ?></i></span>
						<span class="description"><?php echo $news_item['description']; ?></span>
					</a>
					<?php } ?>
				</div>
				<?php } ?>
			</div>
		</div>
	</div>
</div>