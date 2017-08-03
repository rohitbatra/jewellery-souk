<?php echo $header; ?>
<div class="container">
<ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
</ul>
<?php if ($error_warning) { ?>
<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
<?php } ?>
<div class="row"><?php echo $column_left; ?>
<?php if ($column_left && $column_right) { ?>
<?php $class = 'col-sm-6'; ?>
<?php } elseif ($column_left || $column_right) { ?>
<?php $class = 'col-sm-9'; ?>
<?php } else { ?>
<?php $class = 'col-sm-12'; ?>
<?php } ?>
<div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
<h1><?php echo $heading_title; ?></h1>
<p><?php echo $text_account_already; ?></p>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal" id="form-seller-register">
<fieldset id="account">
    <legend><?php echo $text_your_details; ?></legend>
    <div class="form-group required">
        <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
        <div class="col-sm-10">
            <input type="email" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
            <?php if ($error_email) { ?>
            <div class="text-danger"><?php echo $error_email; ?></div>
            <?php } ?>
        </div>
    </div>
    <div class="form-group required">
        <label class="col-sm-2 control-label" for="input-username"><?php echo $entry_username; ?></label>
        <div class="col-sm-10">
            <input type="text" name="username" value="<?php echo $username; ?>" placeholder="<?php echo $entry_username; ?>" id="input-username" class="form-control" />
            <?php if ($error_username) { ?>
            <div class="text-danger"><?php echo $error_username; ?></div>
            <?php } ?>
        </div>
    </div>
    <div class="form-group required">
        <label class="col-sm-2 control-label" for="input-password"><?php echo $entry_password; ?></label>
        <div class="col-sm-10">
            <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
            <?php if ($error_password) { ?>
            <div class="text-danger"><?php echo $error_password; ?></div>
            <?php } ?>
        </div>
    </div>
    <div class="form-group required">
        <label class="col-sm-2 control-label"><?php echo $entry_confirm; ?></label>
        <div class="col-sm-10">
            <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="input-confirm" class="form-control" />
            <?php if ($error_confirm) { ?>
            <div class="text-danger"><?php echo $error_confirm; ?></div>
            <?php } ?>
        </div>
    </div>
</fieldset>
<fieldset id="" style="display: block;">
    <legend></legend>
    <div class="form-group required">
        <label class="col-sm-2 control-label"><?php echo 'Select'; ?></label>
        <div class="col-sm-10">

            <?php if ($error_confirm) { ?>
            <div class="text-danger"><?php echo $error_confirm; ?></div>
            <?php } ?>
        </div>
    </div>

</fieldset>

<fieldset id="company_details" style="display: none;">
    <legend><?php echo $text_company_details; ?></legend>

</fieldset>
<fieldset id="your_details" style="display: none;">
    <legend><?php echo $text_your_details; ?></legend>
    <div class="form-group required">
        <label class="col-sm-2 control-label" for="input-firstname"><?php echo $entry_firstname; ?></label>
        <div class="col-sm-10">
            <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control" />
            <?php if ($error_firstname) { ?>
            <div class="text-danger"><?php echo $error_firstname; ?></div>
            <?php } ?>
        </div>
    </div>
    <div class="form-group required">
        <label class="col-sm-2 control-label" for="input-lastname"><?php echo $entry_lastname; ?></label>
        <div class="col-sm-10">
            <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control" />
            <?php if ($error_lastname) { ?>
            <div class="text-danger"><?php echo $error_lastname; ?></div>
            <?php } ?>
        </div>
    </div>
    <div class="form-group required">
        <label class="col-sm-2 control-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
        <div class="col-sm-10">
            <input type="tel" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="form-control" />
            <?php if ($error_telephone) { ?>
            <div class="text-danger"><?php echo $error_telephone; ?></div>
            <?php } ?>
        </div>
    </div>
</fieldset>

<fieldset id="subscription_fees" style="display: none;">
    <legend><?php echo $text_subscription_fees; ?></legend>
    <div class="form-group required">
        <label class="col-sm-2 control-label" for="input-subscription_fees"><?php echo $entry_subscription_amount; ?></label>
        <div class="col-sm-10">
            <input type="text" name="subscription_fees" value="<?php echo $subscription_fees; ?>" placeholder="<?php echo $entry_subscription_fees; ?>" id="input-subscription_fees" class="form-control" />
        </div>
    </div>
</fieldset>
<?php echo $captcha; ?>
<?php if ($text_agree) { ?>
<div class="buttons">
    <div class="pull-right"><?php echo $text_agree; ?>
        <?php if ($agree) { ?>
        <input type="checkbox" name="agree" value="1" checked="checked" />
        <?php } else { ?>
        <input type="checkbox" name="agree" value="1" />
        <?php } ?>
        &nbsp;
        <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
    </div>
</div>
<?php } else { ?>
<div class="buttons">
    <div class="pull-right">
        <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
    </div>
</div>
<?php } ?>
</form>

<form method="post" name="customerData" action="ccavenue/ccavRequestHandler.php" style="display: none;">
    <input type="text" name="tid" id="tid" value="<?php echo strtotime(date('d-m-Y h:m:s')) ?>" readonly />
    <input type="text" name="merchant_id" value="93868"/>
    <input type="text" name="order_id" value=""/>
    <input type="text" name="amount" value="<?php echo $subscription_fees; ?>"/>
    <input type="text" name="currency" value="INR"/>
    <input type="text" name="redirect_url" value="<?php echo HTTP_SERVER; ?>ccavenue/ccavResponseHandler.php"/>
    <input type="text" name="cancel_url" value="<?php echo HTTP_SERVER; ?>index.php?route=seller/register"/>
    <input type="text" name="language" value="EN"/>
</form>

<?php echo $content_bottom; ?></div>
<?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
    $('select[name=\'country_id\']').on('change', function() {
        $.ajax({
            url: 'index.php?route=account/account/country&country_id=' + this.value,
            dataType: 'json',
            beforeSend: function() {
                $('select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
            },
            complete: function() {
                $('.fa-spin').remove();
            },
            success: function(json) {
                if (json['postcode_required'] == '1') {
                    $('input[name=\'postcode\']').parent().parent().addClass('required');
                } else {
                    $('input[name=\'postcode\']').parent().parent().removeClass('required');
                }

                html = '<option value=""><?php echo $text_select; ?></option>';

                if (json['zone'] && json['zone'] != '') {
                    for (i = 0; i < json['zone'].length; i++) {
                        html += '<option value="' + json['zone'][i]['zone_id'] + '"';

                        if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
                            html += ' selected="selected"';
                        }

                        html += '>' + json['zone'][i]['name'] + '</option>';
                    }
                } else {
                    html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
                }

                $('select[name=\'zone_id\']').html(html);
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });


    //--></script>

    <script>
        $(document).ready(function(){

            // Set Country to India
            $('#input-country').val(99);

            // Disable the Selection Control
            $('select[name=\'country_id\']').prop('disabled',true);

            // trigger change
            $('select[name=\'country_id\']').trigger('change');

            // Fees Disabled
            $('#input-subscription_fees').prop('disabled',true);

            $('#form-seller-register').submit(function(e) {

                e.stopPropagation();
                e.preventDefault();

                // First Register the User in System
                var seller_id = registerUser();

                if($.isNumeric(seller_id))
                {
                    // Now Redirect to Payment Processor Page with another Hidden Form Fields
                    $('input[name="order_id"]').val("SEZCAD" + seller_id);
                    $("form[name='customerData']").submit();
                }
            });

            function registerUser()
            {
                var form_data = $('#form-seller-register').serializeArray();
                var uID = 0;
                $.ajax({
                    url: '<?php echo $action;?>',
                    type: 'post',
                    data: form_data,
                    async: false,
                    success: function(data){
                        if($.isNumeric(data))
                        {
                            uID = data;
                        }else{
                            uID = false;
                        }
                    },
                    error: function( jqXhr, textStatus, errorThrown ){
                        console.log(errorThrown);
                    }
                });
                return uID;
            }
        });
    </script>
<?php echo $footer; ?>
