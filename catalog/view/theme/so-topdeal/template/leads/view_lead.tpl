<?php // Header Blocks =========================================?>
<?php echo $header; ?>

<?php // Breadcrumb Blocks =========================================?>
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
<?php // Content Detail Blocks ========================================= ?>
<div class="container product-detail product-full">
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
    <?php } ?>
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
    <?php } ?>
    <div class="row">
        <?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-md-9 col-xs-12'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>

        <div id="content" class="<?php echo $class; ?>">
            <?php if($column_left || $column_right) :?>
            <a href="javascript:void(0);" class="open-sidebar hidden-lg hidden-md"><i
                        class="fa fa-bars"></i> <?php echo $text_sidebar; ?></a>
            <?php endif;?>
            <div class="sidebar-overlay "></div>
                <div class="product-view product-info clearfix">
                    <div class="product-view-inner clearfix">
                        <div class="content-product-left col-md-4 col-sm-12 col-xs-12">
                            <div class="large-image">
                                <img src="<?php echo $lead_img; ?>" title="<?php echo $heading_title; ?>"
                                     alt="<?php echo $heading_title; ?>"/>
                            </div>
                        </div>
                        <div class="content-product-right col-md-8 col-sm-12 col-xs-12">
                            <div class="title-product">
                                <h1><?php echo $heading_title; ?></h1>
                            </div>
                            <div class="product-box-desc">
                                <div class="inner-box-desc">
                                    <!-- Quantity -->
                                    <?php if (!empty($lead_quantity)) { ?>
                                        <div class="model">
                                           <span><?php echo $text_quantity; ?>:</span> <?php echo $lead_quantity; ?>
                                        </div>
                                    <?php } ?>

                                    <!-- Location -->
                                    <?php if (!empty($lead_location)) { ?>
                                        <div class="model">
                                            <span><?php echo $text_location; ?>:</span> <?php echo $lead_location; ?>
                                        </div>
                                    <?php } ?>

                                    <!-- Date Posted -->
                                    <?php if (!empty($lead_posted_on)) { ?>
                                        <div class="model">
                                            <span><?php echo $text_date_added; ?>:</span> <?php echo $lead_posted_on; ?>
                                        </div>
                                    <?php } ?>
                                </div>
                            </div>

                            <div class="box-cart cart clearfix">
                                <hr>
                                <!-- Buy Lead Button -->
                                <div class="form-group box-info-product">
                                    <input type="hidden" name="lead_id" id="lead_id" value="<?php echo $lead_id; ?>" />
                                    <!-- CART -->
                                    <div class="cart">
                                        <input data-href="<?php echo $lead_buy_href; ?>" type="button" data-toggle="tooltip" title="<?php echo $button_cart; ?>" value="<?php echo $button_cart; ?>" data-loading-text="<?php echo $text_loading; ?>" id="button-cart" class="btn btn-mega btn-lg" <?php if($btnDisabled) { ?> disabled="disabled" <?php } ?> />
                                    </div>
                                </div>
                            </div>

                            <!-- Social Share -->
                            <?php if ($product_page_button): ?>
                                <div class="form-group share clearfix">
                                    <hr>
                                    <?php
                                        if (isset($product_socialshare) && $product_socialshare != '' && is_string($product_socialshare)) :
                                            echo str_replace('|url|',urlencode((isset($_SERVER['HTTPS']) ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]"),html_entity_decode($product_socialshare, ENT_QUOTES, 'UTF-8'));
                                        endif;
                                    ?>
                                </div>
                            <?php endif; ?>
                        <!-- end box info product -->
                    </div>
                </div>
            </div>

            <div class="product-view product-info clearfix">
                <div class="product-view-inner clearfix">
                        <div class="col-xs-12">
                        <?php if ($lead_description) : ?>
                        <div>
                            <?php echo $lead_description; ?>
                        </div>
                        <?php endif; ?>
                    </div>
                </div>
            </div>

            <?php echo $content_top; ?>

            <div class="row product-bottom producttab">
                <div class="tabsslider col-xs-12 bottom-product clearfix">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab"
                                              href="#latest-leads"><?php echo $text_latest_leads; ?></a></li>
                    </ul>
                    <div class="tab-content">
                        <div id="latest-leads" class="tab-pane fade in active">
                            <?php if($latest_leads) { ?>
                                <div class="clearfix module">
                                    <div class="products-category">
                                        <div class="releate-products products-list grid">
                                            <?php foreach($latest_leads as $lead) { ?>
                                            <div class="product-layout">
                                                <div class="product-item-container">
                                                    <div class="left-block">
                                                        <div class="product-image-container">
                                                            <a href="<?php echo $lead['href']; ?>">
                                                                <img src="<?php echo $lead['thumb']; ?>"
                                                                     alt="<?php echo $lead['title']; ?>"
                                                                     title="<?php echo $lead['title']; ?>"
                                                                     class="img-1 img-responsive"/>
                                                            </a>
                                                        </div>
                                                        <div class="button-group hidden">
                                                            <div class="button-inner">
                                                                <a class="btn" href="<?php echo $lead['href']; ?>"
                                                                        data-toggle="tooltip"
                                                                        title="<?php echo $button_cart; ?>"
                                                                    <span><?php echo $button_cart; ?></span>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- BOX BUTTON -->
                                                    <div class="right-block">
                                                        <div class="caption">
                                                            <h4><a class="preview-image"
                                                                   href="<?php echo $lead['href']; ?>"><?php echo $lead['title']; ?></a>
                                                            </h4>
                                                            <div class="total-price clearfix">
                                                                <div class="price price-left">
                                                                    <span class="price-new"><?php echo ucfirst($lead['location']); ?></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <?php } ?>
                                        </div>
                                    </div>
                                </div>
                            <?php } else { ?>
                                <div class="module">
                                    <div class="item-left col-lg-5 col-md-5">
                                        <div class="error-image">
                                    <span class="error-key">
                                        <img src="image/catalog/demo/bonuspage/404/img-404.png" alt="">
                                    </span>
                                        </div>
                                    </div>
                                    <div class="item-right col-lg-7 col-md-7">
                                        <h3>Oops, no Leads found!</h3>
                                        <div class="block-bottom">
                                            <a class="btn btn-revo" title="<?php echo $button_continue; ?>"
                                               href="<?php echo $home_link; ?>"><?php echo $button_continue; ?></a>
                                        </div>
                                    </div>
                                </div>
                            <?php } ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <?php //Column Right Block -------?>
        <?php echo $column_right; ?>
        <?php //End Column Right Block -------?>
        <script>// <![CDATA[
            jQuery(document).ready(function ($) {
                $('.releate-products').owlCarousel2({
                    pagination: false,
                    center: false,
                    nav: true,
                    dots: false,
                    loop: false,
                    margin: 30,
                    navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
                    slideBy: 1,
                    rtl: false,
                    autoplay: false,
                    autoplayTimeout: 2500,
                    autoplayHoverPause: true,
                    autoplaySpeed: 800,
                    startPosition: 0,
                    items: 4
                });
            });
            // ]]></script>
        <script type="text/javascript">
            $(document).ready(function() {

                $('#button-cart').on('click', function(e) {
                    e.preventDefault();
                    e.stopPropagation();
                    var urlHref = $(e.currentTarget).attr('data-href');
                    console.log(urlHref);
                    alertify.confirm('Buy Lead', 'Are you sure you want to buy this Lead?', function(){ location = urlHref; }
                            , function(){ alertify.error('Operation Canceled!')});
                });
            });
        </script>
    </div>
</div>
<!-- Bootstrap theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.11.2/build/css/themes/bootstrap.min.css"/>
<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.11.2/build/css/alertify.min.css"/>
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.11.2/build/alertify.min.js"></script>
<?php // Footer Blocks =========================================?>
<?php echo $footer; ?>
