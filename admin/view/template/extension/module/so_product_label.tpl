<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  	<div class="page-header">
    	<div class="container-fluid">
      		<div class="pull-right">
        		<button type="submit" form="form-so-productlabel" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i> <?php echo $button_save; ?></button>
        		<a class="btn btn-success1" style="background-color: #8fbb6c; color: #fff;" onclick="$('#action').val('save_edit');$('#form-so-productlabel').submit();" data-toggle="tooltip" title="<?php echo $objlang->get('entry_button_save_and_edit'); ?>" ><i class="fa fa-pencil-square-o"></i> <?php echo $objlang->get('entry_button_save_and_edit')?></a>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-danger"><i class="fa fa-reply"></i> <?php echo $button_cancel; ?></a>
        	</div>
			<h1><?php echo $heading_title_so; ?></h1>
      		<ul class="breadcrumb">
        		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
        			<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        		<?php } ?>
      		</ul>
    	</div>
  	</div>
  	<div class="container-fluid">
    	<?php if ($error_warning) { ?>
    		<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      			<button type="button" class="close" data-dismiss="alert">&times;</button>
    		</div>
    	<?php } ?>
    	<?php if ($success) { ?>
    		<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      			<button type="button" class="close" data-dismiss="alert">&times;</button>
    		</div>
    	<?php } ?>
    	<div class="panel panel-default">
      		<div class="panel-heading">
        		<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      		</div>
      		<div class="panel-body">
	   			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-so-productlabel" class="form-horizontal">
    				<input type="hidden" name="action" id="action" value=""/>        
					<div class="form-group">
						<label class="col-sm-3 control-label" for="input-status"><span data-toggle="tooltip" title="" data-original-title="<?php echo $help_status; ?>"><?php echo $entry_status; ?></span></label>
						<div class="col-sm-3">
							<select name="so_product_label[so_product_label_enabled]" class="form-control">
								<?php if (isset($so_product_label_enabled) && $so_product_label_enabled == 1) {?>
								<option value="1" selected="selected"><?php echo $text_enabled?></option>
								<option value="0"><?php echo $text_disabled?></option>
								<?php }else{?>
								<option value="1"><?php echo $text_enabled?></option>
								<option value="0" selected="selected"><?php echo $text_disabled?></option>
								<?php }?>
							</select>
		  				</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="input-category"><span data-toggle="tooltip" title="" data-original-title="<?php echo $help_show_category; ?>"><?php echo $entry_show_category; ?></span></label>
						<div class="col-sm-3">
							<select name="so_product_label[so_product_label_showing_category]" class="form-control">
								<?php if (isset($so_product_label_showing_category) && $so_product_label_showing_category == 1) {?>
								<option value="1" selected="selected"><?php echo $text_enabled?></option>
								<option value="0"><?php echo $text_disabled?></option>
								<?php }else{?>
								<option value="1"><?php echo $text_enabled?></option>
								<option value="0" selected="selected"><?php echo $text_disabled?></option>
								<?php }?>
							</select>
		  				</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="input-product"><span data-toggle="tooltip" title="" data-original-title="<?php echo $help_show_product; ?>"><?php echo $entry_show_product; ?></span></label>
						<div class="col-sm-3">
							<select name="so_product_label[so_product_label_showing_product]" class="form-control">
								<?php if (isset($so_product_label_showing_product) && $so_product_label_showing_product == 1) {?>
								<option value="1" selected="selected"><?php echo $text_enabled?></option>
								<option value="0"><?php echo $text_disabled?></option>
								<?php }else{?>
								<option value="1"><?php echo $text_enabled?></option>
								<option value="0" selected="selected"><?php echo $text_disabled?></option>
								<?php }?>
							</select>
		  				</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="input-search"><span data-toggle="tooltip" title="" data-original-title="<?php echo $help_show_search; ?>"><?php echo $entry_show_search; ?></span></label>
						<div class="col-sm-3">
							<select name="so_product_label[so_product_label_showing_search]" class="form-control">
								<?php if (isset($so_product_label_showing_search) && $so_product_label_showing_search == 1) {?>
								<option value="1" selected="selected"><?php echo $text_enabled?></option>
								<option value="0"><?php echo $text_disabled?></option>
								<?php }else{?>
								<option value="1"><?php echo $text_enabled?></option>
								<option value="0" selected="selected"><?php echo $text_disabled?></option>
								<?php }?>
							</select>
		  				</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="input-special"><span data-toggle="tooltip" title="" data-original-title="<?php echo $help_show_special; ?>"><?php echo $entry_show_special; ?></span></label>
						<div class="col-sm-3">
							<select name="so_product_label[so_product_label_showing_special]" class="form-control">
								<?php if (isset($so_product_label_showing_special) && $so_product_label_showing_special == 1) {?>
								<option value="1" selected="selected"><?php echo $text_enabled?></option>
								<option value="0"><?php echo $text_disabled?></option>
								<?php }else{?>
								<option value="1"><?php echo $text_enabled?></option>
								<option value="0" selected="selected"><?php echo $text_disabled?></option>
								<?php }?>
							</select>
		  				</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="input-manufacturer"><span data-toggle="tooltip" title="" data-original-title="<?php echo $help_show_mannufacturer; ?>"><?php echo $entry_show_manufacturer; ?></span></label>
						<div class="col-sm-3">
							<select name="so_product_label[so_product_label_showing_manufacturer]" class="form-control">
								<?php if (isset($so_product_label_showing_manufacturer) && $so_product_label_showing_manufacturer == 1) {?>
								<option value="1" selected="selected"><?php echo $text_enabled?></option>
								<option value="0"><?php echo $text_disabled?></option>
								<?php }else{?>
								<option value="1"><?php echo $text_enabled?></option>
								<option value="0" selected="selected"><?php echo $text_disabled?></option>
								<?php }?>
							</select>
		  				</div>
					</div>
					<?php /*
					<div class="form-group">
						<label class="col-sm-3 control-label" for="input-compare"><span data-toggle="tooltip" title="" data-original-title="<?php echo $help_show_compare; ?>"><?php echo $entry_show_compare; ?></span></label>
						<div class="col-sm-3">
							<select name="so_product_label[so_product_label_showing_compare]" class="form-control">
								<?php if (isset($so_product_label_showing_compare) && $so_product_label_showing_compare == 1) {?>
								<option value="1" selected="selected"><?php echo $text_enabled?></option>
								<option value="0"><?php echo $text_disabled?></option>
								<?php }else{?>
								<option value="1"><?php echo $text_enabled?></option>
								<option value="0" selected="selected"><?php echo $text_disabled?></option>
								<?php }?>
							</select>
		  				</div>
					</div>
					*/?>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="input-featured"><span data-toggle="tooltip" title="" data-original-title="<?php echo $help_show_featured; ?>"><?php echo $entry_show_featured; ?></span></label>
						<div class="col-sm-3">
							<select name="so_product_label[so_product_label_showing_featured]" class="form-control">
								<?php if (isset($so_product_label_showing_featured) && $so_product_label_showing_featured == 1) {?>
								<option value="1" selected="selected"><?php echo $text_enabled?></option>
								<option value="0"><?php echo $text_disabled?></option>
								<?php }else{?>
								<option value="1"><?php echo $text_enabled?></option>
								<option value="0" selected="selected"><?php echo $text_disabled?></option>
								<?php }?>
							</select>
		  				</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="input-bestseller"><span data-toggle="tooltip" title="" data-original-title="<?php echo $help_show_bestseller; ?>"><?php echo $entry_show_bestseller; ?></span></label>
						<div class="col-sm-3">
							<select name="so_product_label[so_product_label_showing_bestseller]" class="form-control">
								<?php if (isset($so_product_label_showing_bestseller) && $so_product_label_showing_bestseller == 1) {?>
								<option value="1" selected="selected"><?php echo $text_enabled?></option>
								<option value="0"><?php echo $text_disabled?></option>
								<?php }else{?>
								<option value="1"><?php echo $text_enabled?></option>
								<option value="0" selected="selected"><?php echo $text_disabled?></option>
								<?php }?>
							</select>
		  				</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="input-lastest"><span data-toggle="tooltip" title="" data-original-title="<?php echo $help_show_lastest; ?>"><?php echo $entry_show_lastest; ?></span></label>
						<div class="col-sm-3">
							<select name="so_product_label[so_product_label_showing_lastest]" class="form-control">
								<?php if (isset($so_product_label_showing_lastest) && $so_product_label_showing_lastest == 1) {?>
								<option value="1" selected="selected"><?php echo $text_enabled?></option>
								<option value="0"><?php echo $text_disabled?></option>
								<?php }else{?>
								<option value="1"><?php echo $text_enabled?></option>
								<option value="0" selected="selected"><?php echo $text_disabled?></option>
								<?php }?>
							</select>
		  				</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="input-mod_special"><span data-toggle="tooltip" title="" data-original-title="<?php echo $help_show_special_mod; ?>"><?php echo $entry_show_special_mod; ?></span></label>
						<div class="col-sm-3">
							<select name="so_product_label[so_product_label_showing_special_mod]" class="form-control">
								<?php if (isset($so_product_label_showing_special_mod) && $so_product_label_showing_special_mod == 1) {?>
								<option value="1" selected="selected"><?php echo $text_enabled?></option>
								<option value="0"><?php echo $text_disabled?></option>
								<?php }else{?>
								<option value="1"><?php echo $text_enabled?></option>
								<option value="0" selected="selected"><?php echo $text_disabled?></option>
								<?php }?>
							</select>
		  				</div>
					</div>
				</form>
			</div>
      	</div>
	</div>
</div>
<?php echo $footer; ?>