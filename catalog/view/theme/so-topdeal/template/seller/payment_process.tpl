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
      <h1><?php echo $heading_title; ?></h1>
      <div style="display: none;">
          <form method="post" name="sellerData" id="sellerData" action="ccavenue/ccavRequestHandler.php">
              <input type="text" name="tid" id="tid" value="<?php echo strtotime(date('d-m-Y h:m:s')) ?>" readonly />
              <input type="text" name="merchant_id" value="93868"/>
              <input type="text" name="order_id" value="<?php echo 'SOUK-'.date('Y').'-'.$uID; ?>"/>
              <input type="text" name="amount" value="<?php echo $subscription_fees; ?>"/>
              <input type="text" name="currency" value="INR"/>
              <input type="text" name="redirect_url" value="<?php echo HTTP_SERVER; ?>ccavenue/ccavResponseHandler.php"/>
              <input type="text" name="cancel_url" value="<?php echo HTTP_SERVER; ?>index.php?route=seller/payment_process&amp;error=payCancel"/>
              <input type="text" name="language" value="EN"/>
          </form>
      </div>
      <?php if(isset($seller_name) && !empty($seller_name)) { ?>
        <?php echo $text_welcome; ?>
      <?php } ?>
      <?php echo $text_message; ?>
      <div class="buttons">
        <div class="pull-right"><input type="submit" class="btn btn-primary" id="btn_submit" value="<?php echo $button_continue; ?>" /></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script>
$(document).ready(function()
{
    <?php if(isset($error_warning) && !empty($error_warning)) { ?>
        var action_url = "<?php echo $contact_url; ?>";
        $('#btn_submit').click(function(e)
        {
            window.location.href = action_url;
        });
    <?php } else { ?>
        var action_url = $('#sellerData').attr('action');
        $('#btn_submit').click(function(e)
        {
            $('#sellerData').submit();
        });
    <?php } ?>

});
</script>
<?php echo $footer; ?>
