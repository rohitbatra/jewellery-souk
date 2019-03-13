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
                        <?php if($method != 'purchased') { ?>
                            <?php if($isSeller) { ?>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="control-label" for="input-status"><?php echo $entry_status; ?></label>
                                        <select name="filter_status" id="input-status" class="form-control" disabled="disabled">
                                            <option value="approved" selected="selected"><?php echo $text_approved; ?></option>
                                        </select>
                                    </div>
                                </div>
                            <?php } else { ?>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="control-label" for="input-status"><?php echo $entry_status; ?></label>
                                        <select name="filter_status" id="input-status" class="form-control">
                                            <option value="*"><?php echo $text_all; ?></option>
                                            <option value="pending"><?php echo $text_pending; ?></option>
                                            <option value="approved"><?php echo $text_approved; ?></option>
                                            <option value="rejected"><?php echo $text_rejected; ?></option>
                                            <option value="expired"><?php echo $text_expired; ?></option>
                                        </select>
                                    </div>
                                </div>
                            <?php } ?>
                            <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
                        <?php } ?>

                        <?php if($method == 'purchased' && $isSeller === false) { ?>
                            <div class="col-sm-4 hidden">
                                <div class="form-group">
                                    <label class="control-label" for="input-status"><?php echo $entry_status; ?></label>
                                    <select name="filter_status" id="input-status" class="form-control" disabled="disabled">
                                        <option value="approved" selected="selected"><?php echo $text_approved; ?></option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label class="control-label" for="input-user"><?php echo $entry_seller; ?></label>
                                    <select name="filter_user_id" id="input-user" class="form-control">
                                        <option value="*">Select User</option>
                                        <?php foreach($sellers as $seller) { ?>
                                            <?php if ($seller['user_id'] == $filter_user_id) { ?>
                                                <option value="<?php echo $seller['user_id']; ?>" selected="selected"><?php echo $seller['username']; ?></option>
                                            <?php } else { ?>
                                                <option value="<?php echo $seller['user_id']; ?>"><?php echo $seller['username']; ?></option>
                                            <?php } ?>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
                        <?php } ?>
                    </div>
                </div>

                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <td class="text-center">#</td>
                            <td class="text-left"><?php echo $column_title; ?></td>
                            <td class="text-left"><?php echo $column_location; ?></td>
                            <td class="text-left"><?php echo $column_views; ?></td>
                            <td class="text-left"><?php echo $column_status; ?></td>
                            <td class="text-left"><?php echo $column_date_added; ?></td>
                            <td class="text-right"><?php echo $column_action; ?></td>
                        </tr>
                        </thead>
                        <tbody>
                        <?php if ($leads) { ?>
                            <?php
                            $i=1;
                            foreach ($leads as $lead) { ?>
                                <tr>
                                    <td class="text-center"><?php echo $i++; ?></td>
                                    <td class="text-left"><?php echo $lead['name']; ?></td>
                                    <td class="text-left"><?php echo $lead['location']; ?></td>
                                    <td class="text-left"><?php echo $lead['views']; ?></td>
                                    <td class="text-left"><?php echo $lead['status']; ?></td>
                                    <td class="text-left"><?php echo $lead['date_added']; ?></td>
                                    <td class="text-right">
                                        <?php if(!$isSeller && $method !== 'purchased') { ?>
                                            <?php if(strtolower($lead['status']) == 'pending') { ?>
                                                <a href="<?php echo $lead['approve']; ?>" data-toggle="tooltip" title="<?php echo $button_approve; ?>" class="btn btn-success"><i class="fa fa-check"></i></a>
                                                <a href="javascript:void(1);" data-action="Reject" data-href="<?php echo $lead['reject']; ?>" data-toggle="tooltip" title="<?php echo $button_reject; ?>" class="btn btn-danger enterReason"><i class="fa fa-times"></i></a>
                                            <?php } ?>
                                            <?php if(strtolower($lead['status']) == 'approved') { ?>
                                                <a href="javascript:void(1);" data-action="Expire" data-href="<?php echo $lead['expire']; ?>" data-toggle="tooltip" title="<?php echo $button_expire; ?>" class="btn btn-warning enterReason"><i class="fa fa-ban"></i></a>
                                            <?php } ?>
                                        <?php } ?>
                                        <a href="<?php echo $lead['view']; ?>" data-toggle="tooltip" title="<?php echo $text_view; ?>" class="btn btn-primary"><i class="fa fa-eye"></i></a>
                                    </td>
                                </tr>
                            <?php } ?>
                        <?php } else { ?>
                        <tr>
                            <td class="text-center" colspan="7"><?php echo $text_no_results; ?></td>
                        </tr>
                        <?php } ?>
                        </tbody>
                    </table>
                </div>
                <div class="row">
                    <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                    <div class="col-sm-6 text-right"><?php echo $results; ?></div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript"><!--
    $(document).ready(function()
    {
        $('#button-filter').on('click', function() {
            var url = 'index.php?route=leads/action/<?php echo $method; ?>&token=<?php echo $token; ?>';

            var filter_status = $('select[name=\'filter_status\']').val();

            if (filter_status != '*') {
                url += '&filter_status=' + encodeURIComponent(filter_status);
            }

            var filter_user_id = $('select[name=\'filter_user_id\']').val();

            if (filter_user_id != '*' && typeof(filter_user_id) != 'undefined') {
                url += '&filter_user_id=' + encodeURIComponent(filter_user_id);
            }

            location = url;
        });

        $('.enterReason').on('click', function(e) {
            e.preventDefault();
            e.stopPropagation();
            var urlHref = $(e.currentTarget).attr('data-href');
            alertify.prompt( 'Reason for '+$(e.currentTarget).attr('data-action'), 'Please enter a reason below', ''
                    , function(evt, value) {
                        // add this in the URL & redirect the page
                        var url = urlHref;

                        url += '&reason=' + encodeURIComponent(value);

                        var filter_status = $('select[name=\'filter_status\']').val();

                        if (filter_status != '*') {
                            url += '&filter_status=' + encodeURIComponent(filter_status);
                        }

                        var filter_user_id = $('select[name=\'filter_user_id\']').val();

                        if (filter_user_id != '*' && typeof(filter_user_id) != 'undefined') {
                            url += '&filter_user_id=' + encodeURIComponent(filter_user_id);
                        }

                        location = url;
                    }
                    , function() {
                        // Close the Prompt do nothing
                        alertify.error('Operation Canceled!')
                    }
            );
        });

        <?php if(isset($filter_status) && !empty($filter_status)) { ?>
            $('select[name=\'filter_status\']').val('<?php echo $filter_status; ?>');
        <?php } ?>
    });

    //--></script>
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.11.2/build/alertify.min.js"></script>
<!-- Bootstrap theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.11.2/build/css/themes/bootstrap.min.css"/>
<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.11.2/build/css/alertify.min.css"/>
<?php echo $footer; ?>