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

  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> <?php echo $success; ?></div>
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
      <div class="row">
          <div class="col-sm-9">
            <div class="well">
              <h2>Contact Us</h2>
              <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="support_form">
                <div class="form-group required">
                  <label class="control-label" for="input-name"><?php echo $entry_name; ?>:</label>
                  <input type="text" name="name" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
                </div>
                <div class="form-group required">
                  <label class="control-label" for="input-telephone"><?php echo $entry_number; ?>:</label>
                  <input type="text" name="telephone" placeholder="<?php echo $entry_number; ?>" id="input-telephone" class="form-control" />
                </div>
                <div class="form-group">
                  <label class="control-label" for="input-email"><?php echo $entry_email; ?>:</label>
                  <input type="text" name="email" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
                </div>
                <div class="form-group required">
                  <label class="control-label" for="input-query"><?php echo $entry_query; ?>:</label>
                  <textarea name="query" placeholder="<?php echo $entry_query; ?>" id="input-query" class="form-control"></textarea>
                </div>
                <div class="form-group">
                  <?php echo $captcha; ?>
                </div>
                <div class="form-group">
                  <a href="javascript:void(1)" class="btn btn-default" id="btn-send" ><i class="fa fa-paper-plane" aria-hidden="true"></i><?php echo $button_send; ?></a>
                </div>
              </form>
          </div>
        </div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript">
$(document).ready(function()
{

    $('#btn-send').on('click', function(e) {
        e.preventDefault();
        e.stopPropagation();
        // Validate Form Fields
        validateForm();
        // Submit the Form
        $('#support_form').submit();
    });

    function validateForm() {
        // Validate the Fields
        $("#support_form :input").each(function() {
            if($.trim($(this).val()) == "") {
                alert('Please fill all the fields');
                $(this).focus();
                throw new Error('Field missing');
            }
        });
        /*
         // Name not Blank
         if($.trim($('#input-name').val()) == "")
         {
         alert('Please enter your Full Name!');
         $('#input-name').focus();
         throw new Exception('Name cannot be Blank');
         }

         // Number not Blank
         if($.trim($('#input-telephone').val()) == "")
         {
         alert('Please enter your Telephone Number!');
         $('#input-telephone').focus();
         throw new Exception('Telephone cannot be Blank');
         }

         // Query not Blan
         if($.trim($('#input-query').val()) == "")
         {
         alert('Please enter your Query!');
         $('#input-query').focus();
         throw new Exception('Query cannot be Blank');
         }
         */
    }

});
</script>
<?php echo $footer; ?>
