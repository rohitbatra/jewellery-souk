<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
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
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="control-label" for="input-product"><?php echo $entry_product; ?></label>
                                <input type="text" name="filter_product" value="<?php echo $filter_product; ?>" placeholder="<?php echo $entry_product; ?>" id="input-product" class="form-control" />
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group">
                                <label class="control-label" for="input-enquiry-status"><?php echo $entry_status; ?></label>
                                <select name="filter_enquiry_status" id="input-enquiry-status" class="form-control">
                                    <option value="*"></option>
                                    <?php if (trim($filter_enquiry_status) == '0') { ?>
                                    <option value="0" selected="selected"><?php echo $text_unread; ?></option>
                                    <?php } else { ?>
                                    <option value="0"><?php echo $text_unread; ?></option>
                                    <?php } ?>
                                    <?php if (trim($filter_enquiry_status) == '1') { ?>
                                    <option value="1" selected="selected"><?php echo $text_read; ?></option>
                                    <?php } else { ?>
                                    <option value="1"><?php echo $text_read; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                        <?php if(!$is_seller) { ?>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label class="control-label" for="input-seller"><?php echo $entry_seller; ?></label>
                                    <select name="filter_seller" id="input-seller" class="form-control">
                                        <option value="*">Select a Seller</option>
                                        <?php foreach($sellers as $seller) { ?>
                                        <?php if ($seller['user_id'] == $filter_seller) { ?>
                                        <option value="<?php echo $seller['user_id']; ?>" selected="selected"><?php echo $seller['username']; ?></option>
                                        <?php } else { ?>
                                        <option value="<?php echo $seller['user_id']; ?>"><?php echo $seller['username']; ?></option>
                                        <?php } ?>
                                        <?php } ?>
                                    </select>
                                    </div>
                            </div>
                        <?php } ?>
                            <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
                        </div>
                    </div>
                </div>
                <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-product_enquiry">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <td class="text-center"><a href="javascript:void(1);">#</a></td>
                                <td class="text-left"><a href="javascript:void(1);"><?php echo $column_product; ?></a></td>
                                <td class="text-left"><a href="javascript:void(1);"><?php echo $column_name; ?></a></td>
                                <td class="text-left"><a href="javascript:void(1);"><?php echo $column_read_status; ?></a></td>
                                <td class="text-left"><a href="javascript:void(1);"><?php echo $column_date; ?></a></td>
                                <td class="text-right"><?php echo $column_action; ?></td>
                            </tr>
                            </thead>
                            <tbody>
                            <?php if ($product_enquiries) { ?>
                                <?php $i=1; foreach ($product_enquiries as $product_enquiry) { ?>
                                <tr>
                                    <td class="text-center"><?php echo $i++; ?></td>
                                    <td class="text-left"><a href="<?php echo $product_enquiry['product_link']; ?>" target="_blank"><?php echo $product_enquiry['product_name']; ?></a></td>
                                    <td class="text-left"><?php echo $product_enquiry['enquirer_name']; ?></td>
                                    <td class="text-left"><?php echo $product_enquiry['read_by_seller']; ?></td>
                                    <td class="text-left"><?php echo $product_enquiry['enquiry_date']; ?></td>
                                    <td class="text-right"><a href="<?php echo $product_enquiry['view']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-primary"><i class="fa fa-eye"></i></a></td>
                                </tr>
                                <?php } ?>
                            <?php } else { ?>
                            <tr>
                                <td class="text-center" colspan="6"><?php echo $text_no_results; ?></td>
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
        var url = 'index.php?route=catalog/product_enquiry&token=<?php echo $token; ?>';

        var filter_product = $('input[name=\'filter_product\']').val();

        if (filter_product) {
            url += '&filter_product=' + encodeURIComponent(filter_product);
        }

        var filter_enquiry_status = $('select[name=\'filter_enquiry_status\']').val();

        if (filter_enquiry_status != '*') {
            url += '&filter_enquiry_status=' + encodeURIComponent(filter_enquiry_status);
        }

        var filter_seller = $('select[name=\'filter_seller\']').val();

        if (filter_seller != '*') {
            url += '&filter_seller=' + encodeURIComponent(filter_seller);
        }

        location = url;
    });
    //--></script>
<?php echo $footer; ?>