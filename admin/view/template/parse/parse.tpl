<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
			<div class="pull-right">
			<button type="submit" form="form-product" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
			<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
		<?php if ($success && !$message) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
		<?php if ($message) { ?>
		<div class="alert alert-success">
			<table border="1">
				<tr>
					<th colspan="2"><?php echo $text_table; ?></th>
				</tr>
			<?php foreach($message as $import){ ?>
				<tr>
					<td><?php echo $import['id']; ?></td>
					<td><?php echo $import['title']; ?></td>
				</tr>
			<?php } ?>
			</table>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php } ?>
		<div class="panel panel-default">
			<div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
			<div class="panel-body">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-product" class="form-horizontal">
					<!--<div class="form-group">
						<label class="col-sm-2 control-label" for="input-sitemap"><?php echo $text_sitemap; ?></label>
						<div class="col-sm-10">
							<input type="hidden" name="MAX_FILE_SIZE" value="3000000" />
							<input name="userfile" type="file" />
							<input type="text" value="" name="sitemap" placeholder="<?php echo $text_sitemap; ?>" id="input-sitemap" class="form-control" />
						</div>
					</div>
					<div class="panel-heading">
						<h3 class="panel-title"><i class="fa fa-pencil"></i>Индиго</h3>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-select"><?php echo $text_category_import; ?></label>
						<div class="col-sm-10">
							<select name="data_category" id="input-category" class="form-control">
							<?php foreach ($data_category as $value => $name) { ?>
							<option value="<?php echo $value; ?>"><?php echo $name; ?></option>
							<?php } ?>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-category"><?php echo $text_category; ?></label>
						<div class="col-sm-10">
							<input type="text" value="" name="category" placeholder="<?php echo $text_category; ?>" id="input-category" class="form-control" />
						</div>
					</div>-->
				</form>
			</div>	
		</div>		
  </div>
</div>
<?php echo $footer; ?>