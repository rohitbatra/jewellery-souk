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
<fieldset>
    <legend></legend>
    <div class="form-group required">
        <label class="col-sm-2 control-label"><?php echo $entry_seller_type; ?></label>
        <div class="col-sm-10">
            <label class="radio-inline"><input type="radio" name="seller_type" value="individual" /> An Individual</label>
            <label class="radio-inline"><input type="radio" name="seller_type" value="company" /> A Company</label>
            <?php if ($error_seller_type) { ?>
            <div class="text-danger"><?php echo $error_seller_type; ?></div>
            <?php } ?>
        </div>
    </div>

</fieldset>

<fieldset id="company_details" style="display: none;">
    <legend><?php echo $text_company_details; ?></legend>
    <div class="form-group required">
      <label class="col-sm-2 control-label" for="input-company_name"><?php echo $entry_company_name; ?></label>
      <div class="col-sm-10">
        <input type="text" name="company_name" value="<?php echo $company_name; ?>" placeholder="<?php echo $entry_company_name; ?>" id="input-company_name" class="form-control" />
        <?php if ($error_company_name) { ?>
        <div class="text-danger"><?php echo $error_company_name; ?></div>
        <?php } ?>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-2 control-label" for="input-company_pan"><?php echo $entry_company_pan; ?></label>
      <div class="col-sm-10">
        <input type="text" name="company_pan" value="<?php echo $company_pan; ?>" placeholder="<?php echo $entry_company_pan; ?>" id="input-company_pan" class="form-control" />
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-2 control-label" for="input-company_tin"><?php echo $entry_company_tin; ?></label>
      <div class="col-sm-10">
        <input type="text" name="company_tin" value="<?php echo $company_tin; ?>" placeholder="<?php echo $entry_company_tin; ?>" id="input-company_tin" class="form-control" />
      </div>
    </div>
</fieldset>

<fieldset id="individual_details" style="display: none;">
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
    <div class="form-group">
      <label class="col-sm-2 control-label" for="input-your_pan"><?php echo $entry_your_pan; ?></label>
      <div class="col-sm-10">
        <input type="text" name="pan_number" value="<?php echo $pan_number; ?>" placeholder="<?php echo $entry_your_pan; ?>" id="input-your_pan" class="form-control" />
      </div>
    </div>
</fieldset>

<fieldset id="address_details" style="display: none;">
  <legend id="your_address_legend"><?php echo $text_your_address; ?></legend>
  <legend id="company_address_legend"><?php echo $text_company_address; ?></legend>
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
    <input type="text" name="order_id" value="<?php echo uniqid('SOUK-'); ?>"/>
    <input type="text" name="amount" value="<?php echo $subscription_fees; ?>"/>
    <input type="text" name="currency" value="INR"/>
    <input type="text" name="redirect_url" value="<?php echo HTTP_SERVER; ?>ccavenue/ccavResponseHandler.php"/>
    <input type="text" name="cancel_url" value="<?php echo HTTP_SERVER; ?>index.php?route=seller/register"/>
    <input type="text" name="language" value="EN"/>
</form>

<?php echo $content_bottom; ?></div>
<?php echo $column_right; ?></div>
</div>
  <script type="text/javascript">
      $(document).ready(function()
      {
          // Set Country to India
          $('#input-country').val(99);

          // Disable the Selection Control
          $('select[name=\'country_id\']').prop('disabled',true);

          // trigger change
          $('select[name=\'country_id\']').trigger('change');

          // Fees Disabled
          $('#input-subscription_fees').prop('disabled',true);

          // Buttons Hidden
          $('.buttons').hide();

          // Seller Type UI Changer
          $('input[name="seller_type"]').click(function()
          {
              $('#company_details').hide();
              $('#individual_details').hide();
              $('#address_details').hide();
              $('#subscription_fees').hide();
              $('#your_address_legend').hide();
              $('#company_address_legend').hide();
              $('.buttons').hide();

              var checkedSellerType = $(this).val();

              if(checkedSellerType == 'individual')
              {
                $('#individual_details').slideDown('slow');
                $('#subscription_fees').slideDown('slow');
                $('#address_details').slideDown('slow');
                $('#your_address_legend').show();
                $('.buttons').slideDown('slow');

              }else if(checkedSellerType == 'company')
              {
                  $('#company_details').slideDown('slow');
                  $('#subscription_fees').slideDown('slow');
                  $('#address_details').slideDown('slow');
                  $('#company_address_legend').show();
                  $('.buttons').slideDown('slow');

              }
          });

      });
  </script>
<?php echo $footer; ?>
