<?php echo $header; ?>
<div class="breadcrumbs">
    <div class="container">
        <div class="title-breadcrumb">
            <?php $count = count($breadcrumbs);?>
            <?php $i=0; ?>
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <?php if( $i == $count-1){ ?>
            <?php echo '<b>'.$breadcrumb['text'].'</b>'; ?>
            <?php }else{ ?>
            <a href="<?php echo $breadcrumb['href']; ?>"></a>
            <?php } ?>
            <?php $i++; ?>
            <?php } ?>
        </div>
        <ul class="breadcrumb-cate">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } ?>
        </ul>
    </div>
</div>
<div class="container">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
    <?php } ?>
    <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-md-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="well">
              <h1><?php echo $heading_title; ?></h1>
              <p><?php echo $text_account_already; ?></p>
              <form action="<?php echo $action; ?>" method="post" class="form-horizontal" id="seller_register_form" name="seller_register_form">
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
                              <label class="radio-inline"><input type="radio" name="seller_type" value="individual" /> An <?php echo $entry_individual; ?></label>
                              <label class="radio-inline"><input type="radio" name="seller_type" value="company" /> A <?php echo $entry_company; ?></label>
                              <?php if ($error_seller_type) { ?>
                              <div class="text-danger"><?php echo $error_seller_type; ?></div>
                              <?php } ?>
                          </div>
                      </div>

                      <div class="form-group required">
                          <label class="col-sm-2 control-label"><?php echo $entry_category; ?></label>
                          <div class="col-sm-10">
                            <select name="category">
                              <option value="*">Please Select</option>
                              <?php foreach ($categories as $category_c) { ?>
                                  <option value="<?php echo $category_c['value']; ?>"><?php echo $category_c['name']; ?></option>
                              <?php } ?>
                            </select>
                            <a tabindex="0" class="btn btn-primary" role="button" data-toggle="popover" data-html="true" data-trigger="focus" title="Other(s) Category:" data-content="<ul><li>Raw Gold Merchant</li><li>Model(s)</li><li>Mould(s)</li><li>Packaging & Displays</li><li>Tools & Machinery </li><li>Book(s), Catalogue & Magazine(s) </li><li>Diamond & Gem Stone(s)</li></ul>"><i class="fa fa-info-circle" aria-hidden="true"></i></a>
                              <?php if ($error_category) { ?>
                              <div class="text-danger"><?php echo $error_category; ?></div>
                              <?php } ?>
                          </div>
                      </div>

                  </fieldset>

                  <fieldset id="company_details" style="display: none;">
                      <legend><?php echo $text_company_details; ?></legend>
                      <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-company_name"><?php echo $entry_company_name; ?></label>
                        <div class="col-sm-10">
                          <input type="text" name="company_name" value="<?php echo $company_name; ?>" placeholder="<?php echo $entry_company_name; ?>" id="input-company_name" class="form-control company" />
                          <?php if ($error_company_name) { ?>
                          <div class="text-danger"><?php echo $error_company_name; ?></div>
                          <?php } ?>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-company_pan"><?php echo $entry_company_pan; ?></label>
                        <div class="col-sm-10">
                          <input type="text" name="company_pan" value="<?php echo $company_pan; ?>" placeholder="<?php echo $entry_company_pan; ?>" id="input-company_pan" class="form-control company" />
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-company_tin"><?php echo $entry_company_tin; ?></label>
                        <div class="col-sm-10">
                          <input type="text" name="company_tin" value="<?php echo $company_tin; ?>" placeholder="<?php echo $entry_company_tin; ?>" id="input-company_tin" class="form-control company" />
                        </div>
                      </div>
                      <div class="form-group required">
                          <label class="col-sm-2 control-label" for="input-company_p_firstname"><?php echo $entry_company_p_firstname; ?></label>
                          <div class="col-sm-4">
                              <input type="text" name="company_p_firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_company_p_firstname; ?>" id="input-company_p_firstname" class="form-control company" />
                              <?php if ($error_company_p_firstname) { ?>
                              <div class="text-danger"><?php echo $error_company_p_firstname; ?></div>
                              <?php } ?>
                          </div>

                          <label class="col-sm-2 control-label" for="input-company_p_lastname"><?php echo $entry_company_p_lastname; ?></label>
                          <div class="col-sm-4">
                              <input type="text" name="company_p_lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_company_p_lastname; ?>" id="input-company_p_lastname" class="form-control company" />
                              <?php if ($error_company_p_lastname) { ?>
                              <div class="text-danger"><?php echo $error_company_p_lastname; ?></div>
                              <?php } ?>
                          </div>
                      </div>
                  </fieldset>

                  <fieldset id="individual_details" style="display: none;">
                      <legend><?php echo $text_your_details; ?></legend>
                      <div class="form-group required">
                          <label class="col-sm-2 control-label" for="input-firstname"><?php echo $entry_firstname; ?></label>
                          <div class="col-sm-10">
                              <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control individual" />
                              <?php if ($error_firstname) { ?>
                              <div class="text-danger"><?php echo $error_firstname; ?></div>
                              <?php } ?>
                          </div>
                      </div>
                      <div class="form-group required">
                          <label class="col-sm-2 control-label" for="input-lastname"><?php echo $entry_lastname; ?></label>
                          <div class="col-sm-10">
                              <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control individual" />
                              <?php if ($error_lastname) { ?>
                              <div class="text-danger"><?php echo $error_lastname; ?></div>
                              <?php } ?>
                          </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-your_pan"><?php echo $entry_your_pan; ?></label>
                        <div class="col-sm-10">
                          <input type="text" name="pan_number" value="<?php echo $pan_number; ?>" placeholder="<?php echo $entry_your_pan; ?>" id="input-your_pan" class="form-control individual" />
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
                  <fieldset id="btns" style="display: none;">
                    <?php echo $captcha; ?>
                    <?php if ($text_agree) { ?>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"></label>
                            <div class="col-sm-10">
                              <?php if ($agree) { ?>
                              <input type="checkbox" name="agree" value="1" checked="checked" />
                              <?php } else { ?>
                              <input type="checkbox" name="agree" value="1" />
                              <?php } ?>
                              &nbsp; <?php echo $text_agree; ?>
                            </div>
                        </div>
                    <?php } ?>
                      <div class="form-group">
                        <label class="col-sm-2 control-label"></label>
                        <div class="col-sm-10">
                          <input type="submit" value="<?php echo $button_continue; ?>" id="btn_submit" class="btn btn-default" />
                        </div>
                      </div>
                  </fieldset>
      </form>
  </div>
<?php echo $content_bottom; ?></div>
<?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
    $('.date').datetimepicker({
        pickTime: false
    });

    $('.time').datetimepicker({
        pickDate: false
    });

    $('.datetime').datetimepicker({
        pickDate: true,
        pickTime: true
    });
    //--></script>
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
        $('#btns').hide();

        // Seller Type UI Changer
        $('input[name="seller_type"]').click(function()
        {
            $('#company_details').hide();
            $('#individual_details').hide();
            $('#address_details').hide();
            $('#your_address_legend').hide();
            $('#company_address_legend').hide();
            $('#btns').hide();
            $('.individual').removeAttr('disabled');
            $('.company').removeAttr('disabled');

            var checkedSellerType = $(this).val();

            if(checkedSellerType == 'individual')
            {
                $('#individual_details').slideDown('slow');
                $('#address_details').slideDown('slow');
                $('#your_address_legend').show();
                $('#btns').slideDown('slow');

                // Disable the fields to prevent them being sent in form post
                $('.company').attr('disabled','disabled');
                $('.individual').removeAttr('disabled');

            }else if(checkedSellerType == 'company')
            {
                $('#company_details').slideDown('slow');
                $('#address_details').slideDown('slow');
                $('#company_address_legend').show();
                $('#btns').slideDown('slow');

                // Disable the fields to prevent them being sent in form post
                $('.individual').attr('disabled','disabled');
                $('.company').removeAttr('disabled');
            }
        });

        // Submit BTN click
        $('#btn_submit').click(function(e)
        {
          e.preventDefault();
          e.stopPropagation();
          $('select[name=\'country_id\']').prop('disabled',false);
          dryValidateForm();
          $('#seller_register_form').submit();
        });

        function dryValidateForm()
        {

          // Check for Seller EMail
          if($('input[name="email"]').val() == "")
          {
            // Break error
            alert('Please enter your E-Mail!');
            $('input[name="email"]').focus();
            throw new Error("Seller E-Mail not found");
          }

          // Check for Seller username
          if($('input[name="username"]').val() == "")
          {
            // Break error
            alert('Please enter your desired username!');
            $('input[name="username"]').focus();
            throw new Error("Seller username not found");
          }

          // Check for Seller telephone
          if($('input[name="telephone"]').val() == "")
          {
            // Break error
            alert('Please enter your Telephone Number!');
            $('input[name="telephone"]').focus();
            throw new Error("Seller telephone not found");
          }

          // Check for Seller type & category fields only
          if($('input[name="seller_type"]:checked').val() == "undefined")
          {
            // Break error
            alert('Please Select any one Seller Type!');
            $('input[name="seller_type"]').focus();
            throw new Error("Seller Type not selected error");
          }

          if($('select[name="category"] option:selected').val() == "*")
          {
            // Break error
            alert('Please Select one Category!');
            $('select[name="category"]').focus();
            throw new Error("Category not Selected error");
          }
        }

        // In Validation Error Conditions
        var s_t = $.trim("<?php echo $seller_type; ?>");
        var cat = $.trim("<?php echo $category; ?>");

        if(s_t !== "")
        {
            // Seller Type Select & Trigger
            $('input:radio[name="seller_type"][value="' + $.trim(s_t) + '"]').prop('checked', true).trigger('click');
        }

        if(cat !== "")
        {
            // Category Value
            $("select[name='category']").val($.trim(cat));
        }

        $('[data-toggle="popover"]').popover({
          trigger: 'focus'
        });
    });
</script>
<?php echo $footer; ?>
