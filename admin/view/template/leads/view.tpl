<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right"> <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-comment-o"></i> <?php echo $heading_title; ?></h3>
            </div>
            <div class="panel-body">
                <div class="tab-content">
                    <div class="tab-pane active">
                        <div id="enquiry-table">
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <td class="text-left"><?php echo $entry_image; ?></td>
                                            <td class="text-left"><?php echo $entry_lead; ?></td>
                                            <td class="text-right"><?php echo $entry_action; ?></td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="text-left" style="width: 25%">
                                                <img class="img-thumbnail" src="<?php echo $lead['image']; ?>" style="width: 250px; height: 250px;" />
                                            </td>
                                            <td class="text-left" style="width: 65%;">
                                                <div class="form-group">
                                                    <span><label class="col-sm-2"><?php echo 'Title :'; ?></label><?php echo $lead['title']; ?></span>
                                                </div>
                                                <div class="form-group">
                                                    <span><label class="col-sm-2"><?php echo 'Quantity :'; ?></label><?php echo $lead['quantity']; ?></span>
                                                </div>
                                                <div class="form-group">
                                                    <span><label class="col-sm-2"><?php echo 'Description :'; ?></label><?php echo $lead['description']; ?></span>
                                                </div>
                                                <div class="form-group">
                                                    <span><label class="col-sm-2"><?php echo 'Location :'; ?></label><?php echo $lead['location']; ?></span>
                                                </div>
                                                <div class="form-group">
                                                    <span><label class="col-sm-2"><?php echo 'Posted On :'; ?></label><?php echo $lead['date_added']; ?></span>
                                                </div>

                                                <!--
                                                <form class="form-horizontal">
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label"><?php echo 'Title :'; ?></label>
                                                        <div class="col-sm-10">
                                                            <input type="text" disabled="disabled" value="<?php echo $lead['title']; ?>" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label"><?php echo 'Quantity :'; ?></label>
                                                        <div class="col-sm-10">
                                                            <input type="text" disabled="disabled" value="<?php echo $lead['quantity']; ?>" />
                                                            <span><?php echo $lead['quantity']; ?></span>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label"><?php echo 'Description :'; ?></label>
                                                        <div class="col-sm-10">
                                                            <textarea disabled="disabled" rows="5" cols="30"><?php echo $lead['description']; ?></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label"><?php echo 'Location :'; ?></label>
                                                        <div class="col-sm-10">
                                                            <input type="text" disabled="disabled" value="<?php echo $lead['location']; ?>" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label"><?php echo 'Posted On :'; ?></label>
                                                        <div class="col-sm-10">
                                                            <input type="text" disabled="disabled" value="<?php echo $lead['date_added']; ?>" />
                                                        </div>
                                                    </div>
                                                </form>
                                                -->
                                            </td>
                                            <td class="text-right" style="width: 10%;">
                                                <?php if($isSeller == false) { ?>
                                                    <div class="form-group">
                                                        <?php if(strtolower($lead['status']) == 'pending') { ?>
                                                            <a href="<?php echo $lead['approve']; ?>" data-toggle="tooltip" title="<?php echo $button_approve; ?>" class="btn btn-success"><i class="fa fa-check"></i></a>
                                                            <a href="javascript:void(1);" data-action="Reject" data-href="<?php echo $lead['reject']; ?>" data-toggle="tooltip" title="<?php echo $button_reject; ?>" class="btn btn-danger enterReason"><i class="fa fa-times"></i></a>
                                                        <?php } else if(strtolower($lead['status']) == 'approved') { ?>
                                                            <a href="javascript:void(1);" data-action="Expire" data-href="<?php echo $lead['expire']; ?>" data-toggle="tooltip" title="<?php echo $button_expire; ?>" class="btn btn-warning enterReason"><i class="fa fa-ban"></i></a>
                                                        <?php } else { ?>
                                                            <a href="javascript:void(1);" data-toggle="tooltip" title="<?php echo ucfirst($lead['status']); ?>" class="btn btn-success disabled"><i class="fa fa-check"></i></a>
                                                        <?php } ?>
                                                    </div>
                                                    <div class="form-group">
                                                        <!-- Show Contact Details -->
                                                        <a href="javascript:void(1);" data-toggle="tooltip" title="View Contact Details" class="btn btn-success showContact"><i class="fa fa-eye"></i> View Contact</a>
                                                    </div>
                                                    <input type="hidden" id="contact_name" value="<?php echo $lead['name']; ?>"/>
                                                    <input type="hidden" id="contact_email" value="<?php echo $lead['email']; ?>"/>
                                                    <input type="hidden" id="contact_phone" value="<?php echo $lead['phone']; ?>"/>
                                                <?php } else { ?>
                                                    <div class="form-group">
                                                        <?php if($lead['bought']) { ?>
                                                            <input type="hidden" id="contact_name" value="<?php echo $lead['name']; ?>"/>
                                                            <input type="hidden" id="contact_email" value="<?php echo $lead['email']; ?>"/>
                                                            <input type="hidden" id="contact_phone" value="<?php echo $lead['phone']; ?>"/>
                                                            <a href="javascript:void(1);" data-toggle="tooltip" title="View Contact Details" class="btn btn-success showContact"><i class="fa fa-eye"></i> View Contact</a>
                                                        <?php } else { ?>
                                                            <a href="<?php echo $lead['buy']; ?>" data-toggle="tooltip" title="Buy Lead" class="btn btn-primary buyLead"><i class="fa fa-cart-plus"></i> Buy Lead</a>
                                                        <?php } ?>
                                                    </div>
                                                <?php } ?>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript"><!--
        $(document).ready(function() {

            $('.enterReason').on('click', function(e) {
                e.preventDefault();
                e.stopPropagation();
                var urlHref = $(e.currentTarget).attr('data-href');
                alertify.prompt( 'Reason for '+$(e.currentTarget).attr('data-action'), 'Please enter a reason below', ''
                        , function(evt, value) {
                            // add this in the URL & redirect the page
                            var url = urlHref;
                            url += '&reason=' + encodeURIComponent(value);
                            location = url;
                        }
                        , function() {
                            // Close the Prompt do nothing
                            alertify.error('Operation Canceled!')
                        }
                );
            });

            window.showAlert = function(htmlStr) {
                alertify.confirm(htmlStr);
            }

            alertify.confirm().setting('modal', false);
            alertify.confirm().setHeader('View Contact');

            $('.showContact').on('click', function(e) {
                e.preventDefault();
                e.stopPropagation();

                var htmlStr = "<div> <p><label>Contact Name:</label> "+ $('#contact_name').val() +" </p> <p><label>Contact E-Mail: </label> " + $('#contact_email').val() + " </p> <p><label>Contact Phone:</label> "+ $('#contact_phone').val() +"</p>";
                showAlert(htmlStr);
            });

        });
        --></script>
</div>
<!-- Bootstrap theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.11.2/build/css/themes/bootstrap.min.css"/>
<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.11.2/build/css/alertify.min.css"/>
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.11.2/build/alertify.min.js"></script>
<?php echo $footer; ?>