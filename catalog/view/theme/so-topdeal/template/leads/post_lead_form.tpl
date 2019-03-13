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
<h2><?php echo $heading_new_lead; ?></h2>
<p><?php echo $subline_new_lead; ?></p>
<form action="<?php echo $action; ?>" method="post" class="form-horizontal" id="post_lead_form" name="post_lead_form" enctype="multipart/form-data">

<fieldset id="lead_info">
    <legend><?php echo $text_lead_info; ?></legend>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="input-title"><?php echo $entry_lead_title; ?></label>
        <div class="col-sm-10">
            <input type="email" name="title" value="<?php echo $title; ?>" placeholder="<?php echo $placeholder_lead_title; ?>" id="input-title" class="form-control" />
            <?php if ($error_title) { ?>
            <div class="text-danger"><?php echo $error_title; ?></div>
            <?php } ?>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label" for="input-quantity"><?php echo $entry_quantity; ?></label>
        <div class="col-sm-10">
            <input type="text" name="quantity" value="<?php echo $quantity; ?>" placeholder="<?php echo $placeholder_quantity; ?>" id="input-quantity" class="form-control" />
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label" for="input-description"><?php echo $entry_lead_description; ?></label>
        <div class="col-sm-10">
            <textarea class="form-control" placeholder="<?php echo $placeholder_lead_description; ?>" name="description" id="input-description"><?php echo $description; ?></textarea>
            <?php if ($error_description) { ?>
                <div class="text-danger"><?php echo $error_description; ?></div>
            <?php } ?>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label" for="input-image"><?php echo $entry_image; ?></label>
        <div class="col-sm-10">
            <input type="file" class="custom-file-input" id="image" name="lead-image">
            <p class="help-block"><?php echo $help_image; ?></p>
        </div>
    </div>
</fieldset>

<fieldset id="contact_details">
    <legend><?php echo $text_contact_details; ?></legend>

    <div class="form-group">
        <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
        <div class="col-sm-10">
            <input type="text" name="contact_name" value="<?php echo $contact_name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
            <?php if ($error_contact_name) { ?>
            <div class="text-danger"><?php echo $error_contact_name; ?></div>
            <?php } ?>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
        <div class="col-sm-10">
            <input type="email" name="contact_email" value="<?php echo $contact_email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
            <?php if ($error_contact_email) { ?>
            <div class="text-danger"><?php echo $error_contact_email; ?></div>
            <?php } ?>
        </div>
    </div>


    <div class="form-group">
        <label class="col-sm-2 control-label" for="input-phone"><?php echo $entry_phone; ?></label>
        <div class="col-sm-10">
            <input type="text" name="contact_phone" value="<?php echo $contact_phone; ?>" placeholder="<?php echo $entry_phone; ?>" id="input-phone" class="form-control" />
            <?php if ($error_contact_phone) { ?>
            <div class="text-danger"><?php echo $error_contact_phone; ?></div>
            <?php } ?>
        </div>
    </div>


    <div class="form-group">
        <label class="col-sm-2 control-label" for="input-location"><?php echo $entry_location; ?></label>
        <div class="col-sm-10">
            <input type="text" name="location" value="<?php echo $location; ?>" placeholder="<?php echo $entry_location; ?>" id="input-location" class="form-control" />
        </div>
    </div>


</fieldset>
<fieldset>
    <?php echo $captcha; ?>
    <!-- T&C
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
    -->
    <div class="form-group">
        <label class="col-sm-2 control-label"></label>
        <div class="col-sm-10">
            <input type="submit" value="<?php echo $button_submit; ?>" id="btn_submit" class="btn btn-default" />
        </div>
    </div>
</fieldset>
</form>
</div>
<?php echo $content_bottom; ?></div>
<?php echo $column_right; ?></div>
</div>
<script type="text/javascript">
    $(document).ready(function() {

        // Submit BTN click
        $('#btn_submit').click(function(e) {
            e.preventDefault();
            e.stopPropagation();
            $('btn_submit').attr('disabled','disabled');
            dryValidateForm();
            $('#post_lead_form').submit();
        });

        // Validate the Fields
        function dryValidateForm() {

            $("#post_lead_form :input").each(function() {
                if($.trim($(this).val()) == "") {
                    alert('Please fill all the fields');
                    $(this).focus();
                    $('#loader-form-div').slideUp();
                    $('#post_lead_form').slideDown();
                    $('btn_submit').removeAttr('disabled');
                    throw new Error('Field missing');
                }
            });
        }

    });
</script>
<?php echo $footer; ?>
