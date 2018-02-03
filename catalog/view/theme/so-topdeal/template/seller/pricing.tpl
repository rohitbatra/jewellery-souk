<?php echo $header; ?>
<style>
/*--------------------------------------------------
    [Gutter]
----------------------------------------------------*/

.content-sm {
  padding-top: 40px;
  padding-bottom: 40px;
}

.content-md {
  padding-top: 80px;
  padding-bottom: 80px;
}

.margin-b-40 {
    margin-bottom: 40px !important;
}

@media (max-width: 992px) {
  .md-margin-b-30 {
    margin-bottom: 30px !important;
  }
}


/*--------------------------------------------------
    [Radius]
----------------------------------------------------*/

.radius-3 {
  border-radius: 3px !important;
}

.radius-10 {
  border-radius: 10px !important;
}


/*--------------------------------------------------
    [Colors]
----------------------------------------------------*/

.bg-color-sky-light {
  background: #f7f8fa !important;
}


/*--------------------------------------------------
    [Button]
----------------------------------------------------*/

.btn-dark-brd {
  position: relative;
  display: inline-block;
  line-height: 1.4;
  color: #34343c;
  text-align: center;
  background: transparent;
  background-image: none;
  border-width: 1px;
  border-style: solid;
  border-color: #34343c;
  white-space: nowrap;
  vertical-align: middle;
  -ms-touch-action: manipulation;
  touch-action: manipulation;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

.btn-dark-brd:focus, .btn-dark-brd:active:focus, .btn-dark-brd.active:focus, .btn-dark-brd.focus, .btn-dark-brd:active.focus, .btn-dark-brd.active.focus {
  outline: none;
}

.btn-dark-brd:hover {
  transition-duration: 200ms;
  transition-property: all;
  transition-timing-function: cubic-bezier(0.7, 1, 0.7, 1);
}

.btn-dark-brd:hover, .btn-dark-brd:focus, .btn-dark-brd.focus {
  color: #fff;
  background: #34343c;
  border-color: #34343c;
  text-decoration: none;
}

.btn-dark-brd:after, .btn-dark-brd:before {
  background: transparent;
}

.btn-dark-brd:active, .btn-dark-brd.active {
  background-image: none;
  outline: 0;
}

.btn-dark-brd.disabled, .btn-dark-brd[disabled],
fieldset[disabled] .btn-dark-brd {
  cursor: not-allowed;
  box-shadow: none;
  opacity: .65;
  pointer-events: none;
}

.btn-dark-brd .btn-base-element-xs {
  position: absolute;
  top: 0;
  right: 0;
  background: transparent;
  border-left: 1px solid #2b2b31;
  padding: 6px 9px;
}

.btn-dark-brd .btn-base-element-sm {
  position: absolute;
  top: 0;
  right: 0;
  background: transparent;
  border-left: 1px solid #2b2b31;
  padding: 9px 11px;
}

.btn-dark-brd .btn-base-element-md {
  position: absolute;
  top: 0;
  right: 0;
  background: transparent;
  border-left: 1px solid #2b2b31;
  padding: 12px 13px;
}

.btn-dark-brd .btn-base-element-lg {
  position: absolute;
  top: 0;
  right: 0;
  background: transparent;
  border-left: 1px solid #2b2b31;
  padding: 15px 15px;
}

.btn-base-sm {
  font-size: 14px;
  font-weight: 300;
  padding: 9px 22px;
}


/*--------------------------------------------------
    [Pricing List v4]
----------------------------------------------------*/
.pricing-list-v4 {
  text-align: center;
  background: #fff;
  box-shadow: 15px 15px 15px 0 #eff1f8;
}

.pricing-list-v4 .pricing-list-v4-header {
  border-bottom: 1px solid #e4e8f3;
  padding: 40px 20px 40px;
  margin: 10px 30px;
}

.pricing-list-v4 .pricing-list-v4-header .pricing-list-v4-title {
  font-size: 30px;
  margin-bottom: 5px;
}

.pricing-list-v4 .pricing-list-v4-header .pricing-list-v4-subtitle {
  display: block;
  font-size: 16px;
  font-weight: 200;
}

.pricing-list-v4 .pricing-list-v4-content {
  padding: 40px 20px;
}

.pricing-list-v4 .pricing-list-v4-content .pricing-list-v4-price-sign {
  position: relative;
  top: -30px;
  font-size: 20px;
}

.pricing-list-v4 .pricing-list-v4-content .pricing-list-v4-price {
  font-size: 64px;
  font-weight: 400;
  line-height: .5;
  letter-spacing: -3px;
}

.pricing-list-v4 .pricing-list-v4-content .pricing-list-v4-subprice {
  font-size: 30px;
  font-weight: 400;
}

.pricing-list-v4 .pricing-list-v4-content .pricing-list-v4-price-info {
  position: relative;
  display: block;
  letter-spacing: 1px;
}

.pricing-list-v4 .pricing-list-v4-content .pricing-list-v4-price-info:before {
  font-size: 22px;
  font-weight: 300;
  content: "/";
  margin-right: 3px;
}
</style>
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
  <div class="row">
    <?php echo $column_left; ?>
      <?php if ($column_left && $column_right) { ?>
      <?php $class = 'col-sm-6'; ?>
      <?php } elseif ($column_left || $column_right) { ?>
      <?php $class = 'col-md-9'; ?>
      <?php } else { ?>
      <?php $class = 'col-sm-12'; ?>
      <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="row">
        <div class="col-sm-12">

          <!-- Pricing List v4 -->
            <div class="bg-color-sky-light">
                <div class="content-md container">
                    <div class="row">
                      <?php foreach($pricing as $st) { ?>
                        <div class="col-md-4 md-margin-b-30">
                            <!-- Pricing List v4 -->
                            <div class="pricing-list-v4 radius-10">
                                <div class="pricing-list-v4-header">
                                    <h4 class="pricing-list-v4-title"><?php echo $st['name']; ?></h4>
                                    <span class="pricing-list-v4-subtitle">First Registration Offer</span>
                                </div>
                                <div class="pricing-list-v4-content">
                                    <div class="margin-b-40">
                                        <span class="pricing-list-v4-price-sign">₹</span>
                                        <span class="pricing-list-v4-price"><?php echo $st['fees']; ?></span>
                                        <!--<span class="pricing-list-v4-subprice"></span>-->
                                        <span class="pricing-list-v4-price-info">Year</span>
                                    </div>
                                    <div class="center-block">
                                        <button type="button" class="btn-dark-brd btn-base-sm radius-3" onclick="window.location.href='<?php echo $register_link; ?>';">Register!</button>
                                    </div>
                                </div>
                            </div>
                            <!-- End Pricing List v4 -->
                        </div>
                      <?php } ?>
                    </div>
                    <!--// end row -->
                </div>
            </div>
            <!-- End Pricing List v4 -->
        </div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
