<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
   <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-authorizenet-aim" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
  <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
   <div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
    </div>
   <div class="panel-body">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-authorizenet-aim" class="form-horizontal">
		<div class="form-group required">
            <label class="col-sm-2 control-label" for="input-Merchant_Id"><?php echo $entry_Merchant_Id; ?></label>
            <div class="col-sm-10">
              <input type="text" name="ccavenue_Merchant_Id" value="<?php echo $ccavenue_Merchant_Id; ?>" id="input-Merchant_Id" class="form-control" />
              <?php if ($error_Merchant_Id) { ?>
              <div class="text-danger"><?php echo $error_Merchant_Id; ?></div>
              <?php } ?>
            </div>
          </div>
		  
		  <div class="form-group required">
			<label class="col-sm-2 control-label" for="input-total"><span data-toggle="tooltip"  title="<?php echo $help_total; ?>"><?php echo $entry_total; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="ccavenue_total" value="<?php echo $ccavenue_total; ?>" id="input-total" class="form-control" />
              <?php if ($error_total) { ?>
              <div class="text-danger"><?php echo $error_total; ?></div>
              <?php } ?>
            </div>
          </div>
		  
		  <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-workingkey"><span data-toggle="tooltip"  title="<?php echo $help_workingkey; ?>"><?php echo $entry_workingkey; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="ccavenue_workingkey" value="<?php echo $ccavenue_workingkey; ?>" id="input-workingkey" class="form-control" />
              <?php if ($error_workingkey) { ?>
              <div class="text-danger"><?php echo $error_workingkey; ?></div>
              <?php } ?>
            </div>
          </div>
		  
		  <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-access_code"><?php echo $entry_access_code; ?></label>
            <div class="col-sm-10">
              <input type="text" name="ccavenue_access_code" value="<?php echo $ccavenue_access_code; ?>" id="input-access_code" class="form-control" />
              <?php if ($error_access_code) { ?>
              <div class="text-danger"><?php echo $error_access_code; ?></div>
              <?php } ?>
            </div>
          </div>
		  
		  
		  <div class="form-group">
				<label class="col-sm-2 control-label" for="input-completed_status_id"><?php echo $entry_completed_status; ?></label>
				<div class="col-sm-10">
				  <select name="ccavenue_completed_status_id" id="input-completed_status_id" class="form-control">
					<?php foreach ($order_statuses as $order_status) { ?>
					<?php if ($order_status['order_status_id'] == $ccavenue_completed_status_id) { ?>
					<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
					<?php } ?>
					<?php } ?>
				  </select>
				</div>
			</div>
			
			<div class="form-group">
            <label class="col-sm-2 control-label" for="input-failed_status_id"><?php echo $entry_failed_status; ?></label>
            <div class="col-sm-10">
              <select name="ccavenue_failed_status_id" id="input-failed_status_id" class="form-control">
                <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $ccavenue_failed_status_id) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
			</div>
			</div>
			
			
			<div class="form-group">
            <label class="col-sm-2 control-label" for="input-pending_status_id"><?php echo $entry_pending_status; ?></label>
            <div class="col-sm-10">
              <select name="ccavenue_pending_status_id" id="input-pending_status_id" class="form-control">
                 <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $ccavenue_pending_status_id) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
			</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-geo_zone_id"><?php echo $entry_geo_zone; ?></label>
				<div class="col-sm-10">
				  <select name="ccavenue_geo_zone_id" id="input-geo_zone_id" class="form-control">
					<option value="0"><?php echo $text_all_zones; ?></option>
					<?php foreach ($geo_zones as $geo_zone) { ?>
					<?php if ($geo_zone['geo_zone_id'] == $ccavenue_geo_zone_id) { ?>
					<option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
					<?php } ?>
					<?php } ?>
				  </select>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-checkout_method"><?php echo $entry_checkout_method; ?></label>
				<div class="col-sm-10">
				  <select name="ccavenue_checkout_method" id="input-checkout_method" class="form-control">
					<?php if ($ccavenue_checkout_method == 'iframe'){ ?>									
					<option value="iframe" selected="selected"><?php echo $text_iframe ?></option>
					<option value="redirect"><?php echo $text_redirect ?></option>									
					<?php }else{ ?>
					<option value="iframe"><?php echo $text_iframe ?></option>
					<option value="redirect" selected="selected"><?php echo $text_redirect ?></option>									
					<?php } ?>
				  </select>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
				<div class="col-sm-10">
				  <select name="ccavenue_status" id="input-status" class="form-control">
					<?php if ($ccavenue_status) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0"><?php echo $text_disabled; ?></option>
					<?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
					<?php } ?>
				  </select>
				</div>
			</div>
			
			<div class="form-group">
            <label class="col-sm-2 control-label" for="input-sort_order"><?php echo $entry_sort_order; ?></label>
            <div class="col-sm-10">
              <input type="text" name="ccavenue_sort_order" value="<?php echo $ccavenue_sort_order; ?>" id="input-sort_order" class="form-control" />
            </div>
          </div>
      </form>
    </div>
  </div>
</div>
</div>
<?php echo $footer; ?> 