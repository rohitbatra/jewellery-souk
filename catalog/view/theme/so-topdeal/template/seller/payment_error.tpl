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

  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
		<?php echo $content_top; ?>
        <div class="row">
            <div>
                <div class="">
                    <div class="block-top font-ct">
                        <h2><span>Oops!</span></h2>
                        <p><?php echo $name; ?>, your recent payment transaction has <strong style="color:red;">FAILED</strong>.</p>
                        <p>Your Seller account will be enabled after you complete the Subscription fees payment.</p>
                        <p>You can re-try the Payment using the below Button:</p>
                    </div>

                    <div class="block-bottom">
                        <a href="<?php echo $continue; ?>" class="btn btn-revo" title="<?php echo $button_continue; ?>"><?php echo $button_continue; ?></a>
                    </div>
                    <div>
                      <p>If you have any questions, please email our <strong><a href="mailto:seller.support@sezplus.com">Support Team</a></strong>.</p>
                    </div>
                </div>
            </div>
            <?php echo $content_bottom; ?>
        </div>
    </div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
