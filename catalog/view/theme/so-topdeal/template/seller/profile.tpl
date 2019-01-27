<?php
/******************************************************
 * @package	SO Theme Framework for Opencart 2.0.x
 * @author	http://www.magentech.com
 * @license	GNU General Public License
 * @copyright(C) 2008-2015 Magentech.com. All rights reserved.
*******************************************************/

if($column_left && $column_right) $getColumn='3column';
else if ($column_left)  $getColumn='left';
else if($column_right)  $getColumn='right';
else $getColumn='full';
?>

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
<div class="container product-detail <?php echo'product-'. $getColumn;?>">
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
            <a href="javascript:void(0)" class="open-sidebar hidden-lg hidden-md"><i
                        class="fa fa-bars"></i> <?php echo $text_sidebar; ?></a>
            <?php endif;?>
            <div class="sidebar-overlay "></div>
            <div class="product-view product-info clearfix">
                <div class="product-view-inner clearfix">
                    <div class="content-product-left col-md-4 col-sm-12 col-xs-12">
                        <div class="large-image">
                            <img src="<?php echo $seller_img; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>"/>
                        </div>
                    </div>

                <?php //Product info Block -------?>
                <div class="content-product-right col-md-8 col-sm-12 col-xs-12">
                <div class="title-product">
                    <h1><?php echo $heading_title; ?></h1>
                </div>
                <?php //Product Description -------?>
                <div class="product-box-desc">
                    <div class="inner-box-desc">
                        <div class="brand"><span><?php echo $text_seller_type; ?></span><?php echo ucfirst($seller_type); ?></div>
                        <div class="model"><span><?php echo $text_category; ?></span> <?php echo ucfirst($category); ?></div>
                        <div class="model"><span><?php echo $text_city; ?></span> <?php echo ucfirst($city); ?></div>
                        <div class="model"><span><?php echo $text_country; ?></span> <?php echo $country; ?></div>
                        <?php if($customer_logged) { ?>
                            <div class="model"><span><?php echo $text_contact_person; ?></span> <?php echo ucfirst($contact_person); ?></div>
                            <div class="model"><span><?php echo $text_telephone; ?></span> <?php echo $telephone; ?></div>
                            <div class="model"><span><?php echo $text_address; ?></span> <?php echo $address; ?></div>
                        <?php } else { ?>
                            <div class="model"><span> *** <?php echo $text_hidden; ?> ***</span></div>
                        <?php } ?>
                    </div>
                </div>

                <?php // End Product Description -------?>
            </div>
            <!-- end box info product -->

        </div>
        <?php //End Product info Block -------?>

    </div>

    <?php echo $content_top; ?>

    <div class="row product-bottom producttab">
        <div class="tabsslider col-xs-12 bottom-product clearfix">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#seller-products"><?php echo $text_products; ?></a></li>
                <li class="hidden"><a data-toggle="tab" href="#seller-enquiry"><?php echo $text_enquiry; ?></a></li>
            </ul>
            <div class="tab-content">
                <div id="seller-products" class="tab-pane fade in active">
                    <?php if($products) { ?>
                    <div class="clearfix module">
                        <div class="products-category">
                            <div class="releate-products products-list grid">
                            <?php foreach($products as $product) { ?>
                                <div class="product-layout">
                                    <div class="product-item-container">
                                        <div class="left-block">
                                            <div class="product-image-container">
                                                <a href="<?php echo $product['href']; ?>">
                                                    <img  src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-1 img-responsive" />
                                                    <?php if( $secondimg =='2' && isset($product['thumb2']) && !empty($product['thumb2'])) :?>
                                                    <img data-src="<?php echo $product['thumb2']; ?>" src="<?php echo lazyload($product['thumb2']); ?>"  alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-2 img-responsive" />
                                                    <?php endif;?>
                                                </a>
                                            </div>
                                            <div class="button-group">
                                                <div class="button-inner">
                                                    <!-- WISHLIST -->
                                                    <button class="bts wishlist" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
                                                    <!-- COMPARE -->
                                                    <button class="bts compare" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
                                                    <button class="bts addToCart" type="button" data-toggle="tooltip" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');"> <span class="hidden"><?php echo $button_cart; ?></span></button>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- BOX BUTTON -->
                                        <div class="right-block">
                                            <div class="caption">
                                                <h4><a class="preview-image" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                                                <?php if (isset($rating_status) && $rating_status!= 0) : ?>
                                                <div class="ratings">
                                                    <div class="rating-box">
                                                        <?php for ($i = 1; $i <= 5; $i++) { ?>
                                                        <?php if ($product['rating'] < $i) { ?>
                                                        <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                                                        <?php } else { ?>
                                                        <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
                                                        <?php } ?>
                                                        <?php } ?>
                                                    </div>
                                                </div>
                                                <?php endif; ?>
                                                <div class="total-price clearfix">
                                                    <?php if (!isset($product_catalog_mode) || $product_catalog_mode != 1) : ?>
                                                    <div class="price price-left">
                                                        <?php if ($product['price']) : ?>
                                                        <?php if (!$product['special']) { ?>
                                                        <span class="price-new"><?php echo $product['price']; ?></span>
                                                        <?php } else { ?>
                                                        <span class="price-new"><?php echo $product['special']; ?></span>
                                                        <span class="price-old"><?php echo $product['price']; ?></span>

                                                        <?php } ?>
                                                        <?php endif; ?>
                                                    </div>
                                                    <?php endif; ?>
                                                    <div class="price-sale price-right">
                                                        <?php if ($product['price'] && $product['special']) : ?>
                                                                <span class="discount">
                                                                <?php  if(!isset($discount_status) || $discount_status) echo $product['discount']; ?>
                                                                    <strong>OFF</strong>
                                                                </span>
                                                        <?php endif; ?>
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
                            <!-- View All Button -->
                    <div class="container">
                        <div class="row">
                            <div class="col text-center">
                                <a class="btn btn-revo" title="<?php echo $button_all_products; ?>" href="<?php echo $shop_link; ?>"><?php echo $button_all_products; ?></a>
                            </div>
                        </div>
                    </div>

                    <?php } else { ?>
                    <div class="module">
                        <div class="item-left col-lg-5 col-md-5">
                            <div class="erro-image">
                                <span class="erro-key">
                                    <img src="image/catalog/demo/bonuspage/404/img-404.png" alt="">
                                </span>
                            </div>
                        </div>
                        <div class="item-right col-lg-7 col-md-7">
                            <h3>Oops, no products found for this Seller!</h3>
                            <div class="block-bottom">
                                <a class="btn btn-revo" title="<?php echo $button_continue; ?>" href="<?php echo $home_link; ?>"><?php echo $button_continue; ?></a>
                            </div>
                        </div>
                    </div>

                    <?php } ?>
                </div>
                <div id="seller-enquiry" class="tab-pane fade">
                    <?php echo $content_bottom; ?>
                </div>
            </div>
        </div>
    </div>
</div>

<?php //Column Right Block -------?>
<?php echo $column_right; ?>
<?php //End Column Right Block -------?>
        <script>// <![CDATA[
            jQuery(document).ready(function($) {
                $('.releate-products').owlCarousel2({
                    pagination: false,
                    center: false,
                    nav: true,
                    dots: false,
                    loop: false,
                    margin: 30,
                    navText: ['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>'],
                    slideBy: 1,
                    rtl:false,
                    autoplay: false,
                    autoplayTimeout: 2500,
                    autoplayHoverPause: true,
                    autoplaySpeed: 800,
                    startPosition: 0,
                    items: 4
                });
            });
            // ]]></script>
</div>
</div>

<?php // Footer Blocks =========================================?>
<?php echo $footer; ?>
