<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary disabled"><i class="fa fa-plus"></i></a>
      </div>
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
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
        <div class="well">
          <div class="row">
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
                <input type="text" name="filter_email" value="<?php echo $filter_email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
              </div>
            </div>
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="input-status"><?php echo $entry_status; ?></label>
                <select name="filter_status" id="input-status" class="form-control">
                  <option value="*">Please Select</option>
                  <?php if ($filter_status) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <?php } ?>
                  <?php if (!$filter_status && !is_null($filter_status)) { ?>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
              </div>
            </div>
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="input-seller_type"><?php echo $entry_seller_type; ?></label>
                <select name="filter_seller_type" id="input-seller_type" class="form-control">
                  <option value="*">Please Select</option>
                  <?php foreach ($seller_types as $s_type) { ?>
                    <?php if ($filter_seller_type == $s_type['id']) { ?>
                        <option value="<?php echo $s_type['id']; ?>" selected="selected"><?php echo $s_type['name']; ?></option>
                    <?php } else { ?>
                        <option value="<?php echo $s_type['id']; ?>"><?php echo $s_type['name']; ?></option>
                    <?php } ?>
                  <?php } ?>
                </select>
              </div>
            </div>
            <div class="col-sm-3">
              <div class="form-group">
                <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
              </div>
            </div>
          </div>
        </div>
        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-user">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td style="width: 1px;" class="text-center hidden"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                  <td class="text-left"><?php echo $column_email; ?></td>
                  <td class="text-left"><?php echo $column_status; ?></td>
                  <td class="text-left"><?php echo $column_seller_type; ?></td>
                  <td class="text-left"><?php echo $column_date_added; ?></td>
                  <td class="text-right"><?php echo $column_action; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php if ($sellers) { ?>
                <?php foreach ($sellers as $seller) { ?>
                <tr>
                  <td class="text-center hidden"><?php if (in_array($seller['user_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $seller['user_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $seller['user_id']; ?>" />
                    <?php } ?></td>
                  <td class="text-left"><?php echo $seller['email']; ?></td>
                  <td class="text-left"><?php echo $seller['status']; ?></td>
                  <td class="text-left"><?php echo $seller['seller_type']; ?></td>
                  <td class="text-left"><?php echo $seller['date_added']; ?></td>
                  <td class="text-right">
                    <a href="<?php echo $seller['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a>
                    <?php if ($seller['seller_enabled']) { ?>
                    <a href="<?php echo $seller['lock']; ?>" data-toggle="tooltip" title="<?php echo $button_lock; ?>" class="btn btn-warning"><i class="fa fa-lock"></i></a>
                    <?php } else { ?>
                    <a href="<?php echo $seller['unlock']; ?>" data-toggle="tooltip" title="<?php echo $button_unlock; ?>" class="btn btn-success"><i class="fa fa-unlock"></i></a>
                    <?php } ?>
                  </td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="5"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        </form>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$('#button-filter').on('click', function() {
url = 'index.php?route=seller/seller&token=<?php echo $token; ?>';

var filter_email = $('input[name=\'filter_email\']').val();

if (filter_email) {
  url += '&filter_email=' + encodeURIComponent(filter_email);
}

var filter_status = $('select[name=\'filter_status\']').val();

if (filter_status != '*') {
  url += '&filter_status=' + encodeURIComponent(filter_status);
}

var filter_seller_type = $('select[name=\'filter_seller_type\']').val();

if (filter_seller_type != '*') {
  url += '&filter_seller_type=' + encodeURIComponent(filter_seller_type);
}

location = url;
});
//--></script>
<?php echo $footer; ?>
