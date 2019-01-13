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
                <h3 class="panel-title"><i class="fa fa-comment-o"></i> <?php echo $text_product_enquiry; ?></h3>
            </div>
            <div class="panel-body">
                <div class="tab-content">
                    <div class="tab-pane active">
                        <div id="enquiry-table">
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <td class="text-left"><?php echo $entry_sender; ?></td>
                                            <td class="text-left"><?php echo $entry_product; ?></td>
                                            <td class="text-left"><?php echo $entry_enquiry; ?></td>
                                            <td class="text-left"><?php echo $entry_date_added; ?></td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="text-left"><img class="img-thumbnail" src="https://www.gravatar.com/avatar/<?php echo md5(strtolower(trim($sender_email)));?>?d=mp&" /> <br/> Name: <strong><?php echo $sender_name;?></strong> <?php if(!$is_seller) { ?> <br/> <small>e-Mail: <?php echo $sender_email; ?></small><br/> <small>Telephone: <?php echo $sender_telephone; ?></small> <?php } ?></td>
                                            <td class="text-left"><a href="<?php echo $product_href; ?>" target="_blank"><?php echo $product_name; ?></a> </td>
                                            <td class="text-left"><?php echo $enquiry; ?></td>
                                            <td class="text-left"><?php echo $enquiry_added; ?></td>
                                        </tr>
                                        <?php if($enquiry_replied) { ?>
                                            <tr>
                                                <td class="text-left"><?php echo $seller['firstname']." ".$seller['lastname']; ?></td>
                                                <td class="text-left">-NA-</td>
                                                <td class="text-left"><?php echo $reply_content; ?></td>
                                                <td class="text-left"><?php echo $reply_added; ?></td>
                                            </tr>
                                        <?php } ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <br />
                        <?php if($enquiry_replied) { ?>

                        <?php } else { ?>
                            <?php if($is_seller) { ?>
                                <fieldset>
                                    <legend><?php echo $text_reply_product_enquiry; ?></legend>
                                    <form class="form-horizontal" id="reply-form" action="<?php echo $action; ?>" method="post">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label" for="input-comment"><?php echo $entry_reply; ?></label>
                                            <div class="col-sm-10">
                                                <textarea name="reply_content" rows="8" id="input-comment" class="form-control"></textarea>
                                            </div>
                                        </div>
                                    </form>
                                </fieldset>
                                <div class="text-right">
                                    <button id="button-reply" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i> <?php echo $button_send_reply; ?></button>
                                </div>
                            <?php } ?>
                        <?php } ?>
                    </div>
                </div>
            </div>
    </div>
</div>
    <script type="text/javascript"><!--
    $(document).delegate('#button-reply', 'click', function(e) {

        e.stopPropagation();
        e.preventDefault();
        if($.trim($('#input-comment').val()) == "") {
            alert('Please enter your Reply!');
            $('#input-comment').focus();
            throw new Error('Reply Content cannot be blank!');
        }

        $('#reply-form').submit();
    });
    --></script>
</div>
<?php echo $footer; ?>