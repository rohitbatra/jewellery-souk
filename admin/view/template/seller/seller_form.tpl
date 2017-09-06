<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-user" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-user" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab" aria-expanded="true">General</a></li>
            <li class=""><a href="#tab-details" data-toggle="tab" aria-expanded="false">Details</a></li>
            <li class=""><a href="#tab-payments" data-toggle="tab" aria-expanded="false">Payments</a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-general">
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-seller-type-id"><?php echo $entry_user_group; ?></label>
                <div class="col-sm-10">
                  <select name="seller_type_id" id="input-seller-type-id" class="form-control">
                    <?php foreach ($seller_types as $seller_type) { ?>
                      <?php if ($seller_type['id'] == $seller_type_id) { ?>
                        <option value="<?php echo $seller_type['id']; ?>" selected="selected"><?php echo $seller_type['name']; ?></option>
                      <?php } else { ?>
                        <option value="<?php echo $seller_type['id']; ?>"><?php echo $seller_type['name']; ?></option>
                      <?php } ?>
                    <?php } ?>
                  </select>
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
                <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
                  <?php if ($error_email) { ?>
                    <div class="text-danger"><?php echo $error_email; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-password"><?php echo $entry_password; ?></label>
                <div class="col-sm-10">
                  <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" autocomplete="off" />
                  <?php if ($error_password) { ?>
                    <div class="text-danger"><?php echo $error_password; ?></div>
                  <?php  } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-confirm"><?php echo $entry_confirm; ?></label>
                <div class="col-sm-10">
                  <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="input-confirm" class="form-control" />
                  <?php if ($error_confirm) { ?>
                    <div class="text-danger"><?php echo $error_confirm; ?></div>
                  <?php  } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                <div class="col-sm-10">
                  <select name="status" id="input-status" class="form-control">
                    <?php if ($status) { ?>
                      <option value="0"><?php echo $text_disabled; ?></option>
                      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <?php } else { ?>
                      <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                      <option value="1"><?php echo $text_enabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
            </div>

            <div id="tab-details" class="tab-pane">
              <?php if($seller_details['seller_type'] == "company") { ?>
                <legend><?php echo $text_company_details; ?></legend>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-company_name"><?php echo $entry_company_name; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="company_name" value="<?php echo $company_name; ?>" placeholder="<?php echo $entry_company_name; ?>" id="input-company_name" class="form-control" />
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
                <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-company_p_firstname"><?php echo $entry_company_p_firstname; ?></label>
                    <div class="col-sm-4">
                        <input type="text" name="company_p_firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_company_p_firstname; ?>" id="input-company_p_firstname" class="form-control" />
                    </div>

                    <label class="col-sm-2 control-label" for="input-company_p_lastname"><?php echo $entry_company_p_lastname; ?></label>
                    <div class="col-sm-4">
                        <input type="text" name="company_p_lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_company_p_lastname; ?>" id="input-company_p_lastname" class="form-control" />
                    </div>
                </div>
              <?php } else if($seller_details['seller_type'] == "individual") { ?>
                  <legend><?php echo $text_personal_details; ?></legend>
                  <div class="form-group required">
                      <label class="col-sm-2 control-label" for="input-firstname"><?php echo $entry_firstname; ?></label>
                      <div class="col-sm-10">
                          <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control" />
                      </div>
                  </div>
                  <div class="form-group required">
                      <label class="col-sm-2 control-label" for="input-lastname"><?php echo $entry_lastname; ?></label>
                      <div class="col-sm-10">
                          <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control" />
                      </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-your_pan"><?php echo $entry_your_pan; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="pan_number" value="<?php echo $pan_number; ?>" placeholder="<?php echo $entry_your_pan; ?>" id="input-your_pan" class="form-control" />
                    </div>
                  </div>
              <?php } ?>

              <legend><?php echo $text_address; ?></legend>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-address-1"><?php echo $entry_address_1; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="address_1" value="<?php echo $address_1; ?>" placeholder="<?php echo $entry_address_1; ?>" id="input-address-1" class="form-control" />
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
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-postcode"><?php echo $entry_postcode; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-postcode" class="form-control" />
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
                </div>
              </div>
              <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
                  <div class="col-sm-10">
                      <input type="tel" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="form-control" />
                  </div>
              </div>

            </div>

            <div id="tab-payments" class="tab-pane">
              <div>
                <?php foreach ($transactions as $k) { ?>
                    <?php if(is_array($k)) { ?>
                      <table class="table table-bordered">
                        <?php foreach($k as $v => $l) { ?>
                          <tr>
                            <td><strong><?php echo ucwords(str_replace('_',' ',$v)); ?></strong></td>
                            <td><?php if(is_array(json_decode($l,true))) { ?> <pre><?php print_r(json_decode($l,true)); ?></pre> <?php } else { ?> <?php echo $l; ?> <?php } ?></td>
                          </tr>
                        <?php } ?>
                      </table>
                    <?php } ?>
                <?php } ?>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>
