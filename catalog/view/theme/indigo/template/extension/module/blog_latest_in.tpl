<?php if($articles) { ?>
<div class="col-md-5 article-r">
	<p class="title"><?php echo $heading_title; ?></p>
	<div class="article">
		<ul class="hot-news">
			<?php foreach ($articles as $news_item) { ?>
				<li>
					<!--<span class="date"><?php echo $news_item['date_added']; ?></span>-->
					<a href="<?php echo $news_item['href']; ?>"><?php echo $news_item['name']; ?></a>
				</li>
			<?php } ?>
		</ul>
	</div>
</div>
<?php } ?>