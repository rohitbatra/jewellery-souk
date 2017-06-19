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
    <label class="col-sm-2 control-label" for="input-username"><?php echo $entry_username; ?></label>
    <div class="col-sm-10">
        <input type="text" name="username" value="<?php echo $username; ?>" placeholder="<?php echo $entry_username; ?>" id="input-username" class="form-control" />
        <?php if ($error_username) { ?>
        <div class="text-danger"><?php echo $error_username; ?></div>
        <?php } ?>
    </div>
</div>
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
    <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
    <div class="col-sm-10">
        <input type="email" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
        <?php if ($error_email) { ?>
        <div class="text-danger"><?php echo $error_email; ?></div>
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
<fieldset id="address" style="display: none;">
<legend><?php echo $text_your_address; ?></legend>
<div class="form-group">
    <label class="col-sm-2 control-label" for="input-company"><?php echo $entry_company; ?></label>
    <div class="col-sm-10">
        <input type="text" name="company" value="<?php echo $company; ?>" placeholder="<?php echo $entry_company; ?>" id="input-company" class="form-control" />
    </div>
</div>
<div class="form-group required">
    <label class="col-sm-2 control-label" for="input-address-1"><?php echo $entry_address_1; ?></label>
    <div class="col-sm-10">
        <input type="text" name="address_1" value="<?php echo $address_1; ?>" placeholder="<?php echo $entry_address_1; ?>" id="input-address-1" class="form-control" />
        <?php if ($error_address_1) { ?>
        <div class="text-danger"><?php echo $error_address_1; ?></div>
        <?php } ?>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label" for="input-address-2"><?php echo $entry_address_2; ?></label>
    <div class="col-sm-10">
        <input type="text" name="address_2" value="<?php echo $address_2; ?>" placeholder="<?php echo $entry_address_2; ?>" id="input-address-2" class="form-control" />
    </div>
</div>
<div class="form-group required">
    <label class="col-sm-2 control-label" for="input-city"><?php echo $entry_city; ?></label>
    <div class="col-sm-10">
        <input type="text" name="city" value="<?php echo $city; ?>" placeholder="<?php echo $entry_city; ?>" id="input-city" class="form-control" />
        <?php if ($error_city) { ?>
        <div class="text-danger"><?php echo $error_city; ?></div>
        <?php } ?>
    </div>
</div>
<div class="form-group required">
    <label class="col-sm-2 control-label" for="input-postcode"><?php echo $entry_postcode; ?></label>
    <div class="col-sm-10">
        <input type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-postcode" class="form-control" />
        <?php if ($error_postcode) { ?>
        <div class="text-danger"><?php echo $error_postcode; ?></div>
        <?php } ?>
    </div>
</div>
<div class="form-group required">
    <label class="col-sm-2 control-label" for="input-country"><?php echo $entry_country; ?></label>
    <div class="col-sm-10">
        <select name="country_id" id="input-country" class="form-control">
            <option value=""><?php echo $text_select; ?></option>
            <?php foreach ($countries as $country) { ?>
            <?php if ($country['country_id'] == $country_id) { ?>
            <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
            <?php } ?>
            <?php } ?>
        </select>
        <?php if ($error_country) { ?>
        <div class="text-danger"><?php echo $error_country; ?></div>
        <?php } ?>
    </div>
</div>
<div class="form-group required">
    <label class="col-sm-2 control-label" for="input-zone"><?php echo $entry_zone; ?></label>
    <div class="col-sm-10">
        <select name="zone_id" id="input-zone" class="form-control">
        </select>
        <?php if ($error_zone) { ?>
        <div class="text-danger"><?php echo $error_zone; ?></div>
        <?php } ?>
    </div>
</div>
</fieldset>
<fieldset>
    <legend><?php echo $text_your_password; ?></legend>
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
        <label class="col-sm-2 control-label" for="input-confirm"><?php echo $entry_confirm; ?></label>
        <div class="col-sm-10">
            <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="input-confirm" class="form-control" />
            <?php if ($error_confirm) { ?>
            <div class="text-danger"><?php echo $error_confirm; ?></div>
            <?php } ?>
        </div>
    </div>
</fieldset>
<fieldset>
    <legend><?php echo $text_your_payment; ?></legend>
    <div class="form-group required">
        <label class="col-sm-2 control-label" for="input-bank_name"><?php echo $entry_bank_name; ?></label>
        <div class="col-sm-10">
            <input type="text" name="bank_name" value="<?php echo $bank_name; ?>" placeholder="<?php echo $entry_bank_name; ?>" id="input-bank_name" class="form-control" />
            <?php if ($error_bank_name) { ?>
            <div class="text-danger"><?php echo $error_bank_name; ?></div>
            <?php } ?>
        </div>
    </div>
    <div class="form-group required">
        <label class="col-sm-2 control-label" for="input-bank_branch_name"><?php echo $entry_bank_branch; ?></label>
        <div class="col-sm-10">
            <input type="text" name="bank_branch" value="<?php echo $bank_branch; ?>" placeholder="<?php echo $entry_bank_branch; ?>" id="input-bank_branch" class="form-control" />
            <?php if ($error_bank_branch) { ?>
            <div class="text-danger"><?php echo $error_bank_branch; ?></div>
            <?php } ?>
        </div>
    </div>
    <div class="form-group required">
        <label class="col-sm-2 control-label" for="input-account_number"><?php echo $entry_bank_account_number; ?></label>
        <div class="col-sm-10">
            <input type="text" name="bank_account_number" value="<?php echo $bank_account_number; ?>" placeholder="<?php echo $entry_bank_account_number; ?>" id="input-account_number" class="form-control" />
            <?php if ($error_bank_account_number) { ?>
            <div class="text-danger"><?php echo $error_bank_account_number; ?></div>
            <?php } ?>
        </div>
    </div>
    <div class="form-group required">
        <label class="col-sm-2 control-label" for="input-bank_payee_name"><?php echo $entry_bank_payee_name; ?></label>
        <div class="col-sm-10">
            <input type="text" name="bank_payee_name" value="<?php echo $bank_payee_name; ?>" placeholder="<?php echo $entry_bank_payee_name; ?>" id="input-bank_payee_name" class="form-control" />
            <?php if ($error_bank_payee_name) { ?>
            <div class="text-danger"><?php echo $error_bank_payee_name; ?></div>
            <?php } ?>
        </div>
    </div>
    <div class="form-group required">
        <label class="col-sm-2 control-label" for="input-bank_name"><?php echo $entry_bank_ifsc_code; ?></label>
        <div class="col-sm-10">
            <input type="text" name="bank_ifsc_code" value="<?php echo $bank_ifsc_code; ?>" placeholder="<?php echo $entry_bank_ifsc_code; ?>" id="input-bank_ifsc_code" class="form-control" />
            <?php if ($error_bank_ifsc_code) { ?>
            <div class="text-danger"><?php echo $error_bank_ifsc_code; ?></div>
            <?php } ?>
        </div>
    </div>
</fieldset>
<fieldset id="subscription">
    <legend><?php echo $text_seller_package; ?></legend>
    <div class="form-group required">
        <label class="col-sm-2 control-label" for="input-selling_fees"><?php echo $entry_selling_fees; ?></label>
        <div class="col-sm-10">
            <input type="text" name="selling_fees" value="<?php echo $selling_fees; ?>" placeholder="<?php echo $entry_selling_fees; ?>" id="input-selling_fees" class="form-control" />
            <?php /*if ($error_selling_fees) { */ ?>
            <!--<div class="text-danger"><?php echo $error_selling_fees; ?></div>-->
            <?php /* }*/ ?>
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
    <input type="text" name="amount" value="500.00"/>
    <input type="text" name="currency" value="INR"/>
    <input type="text" name="redirect_url" value="https://sezplus.com/cad/ccavenue/ccavResponseHandler.php"/>
    <input type="text" name="cancel_url" value="https://sezplus.com/cad/index.php?route=account/seller/register"/>
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
            $('#input-selling_fees').prop('disabled',true);

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
