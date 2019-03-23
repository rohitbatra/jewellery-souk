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
                        <!--
                        <?php if($customer_logged) { ?>
                            <div class="model"><span><?php echo $text_contact_person; ?></span> <?php echo ucfirst($contact_person); ?></div>
                            <div class="model"><span><?php echo $text_telephone; ?></span> <?php echo $telephone; ?></div>
                            <div class="model"><span><?php echo $text_address; ?></span> <?php echo $address; ?></div>
                        <?php } else { ?>
                            <div class="model"><span> *** <?php echo $text_hidden; ?> ***</span></div>
                        <?php } ?>
                        -->
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
                <li class=""><a data-toggle="tab" href="#seller-enquiry"><?php echo $text_enquiry; ?></a></li>
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
                                                    <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-1 img-responsive" />
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
                    <div id="form-submit-response-div" style="display:none;"></div>
                    <div id="enquiry-form-div">
                        <form id="enquiry-form" class="form-horizontal">
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="sender_name">Name</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="sender_name" name="sender_name" placeholder="please enter your full name" value="<?php echo $sender_name; ?>">
                                    <input type="hidden" id="seller_id" name="seller_id" value="<?php echo $seller_id; ?>">
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="sender_email">Email</label>
                                <div class="col-sm-4">
                                    <input type="email" class="form-control" id="sender_email" name="sender_email" placeholder="please enter your Email address" value="<?php echo $sender_email; ?>">
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="sender_telephone">Telephone</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="sender_telephone" name="sender_telephone" placeholder="please enter your Phone number" value="<?php echo $sender_telephone; ?>">
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="content">Enquiry</label>
                                <div class="col-sm-6">
                                    <textarea name="content" id="enquiry-content" rows="3" cols="50" placeholder="please enter your query here"></textarea>
                                </div>
                            </div>

                            <?php echo $captcha; ?>

                            <div class="form-group">
                                <label class="col-sm-2 control-label"></label>
                                <div class="col-sm-6">
                                    <a href="javascript:void(1)" class="btn btn-default" id="btn-enquiry-send"><i class="fa fa-paper-plane" aria-hidden="true"></i>Send</a>
                                </div>
                            </div>
                        </form>
                    </div>

                    <div id="loader-form-div" style="display:none;">
                        <style>
                            .loader {
                                font-size: 10px;
                                margin: 50px auto;
                                text-indent: -9999em;
                                width: 11em;
                                height: 11em;
                                border-radius: 50%;
                                background: #ff89d8;
                                background: -moz-linear-gradient(left, #ff89d8 10%, rgba(255,137,216, 0) 42%);
                                background: -webkit-linear-gradient(left, #ff89d8 10%, rgba(255,137,216, 0) 42%);
                                background: -o-linear-gradient(left, #ff89d8 10%, rgba(255,137,216, 0) 42%);
                                background: -ms-linear-gradient(left, #ff89d8 10%, rgba(255,137,216, 0) 42%);
                                background: linear-gradient(to right, #ff89d8 10%, rgba(255,137,216, 0) 42%);
                                position: relative;
                                -webkit-animation: load3 1.4s infinite linear;
                                animation: load3 1.4s infinite linear;
                                -webkit-transform: translateZ(0);
                                -ms-transform: translateZ(0);
                                transform: translateZ(0);
                            }
                            .loader:before {
                                width: 50%;
                                height: 50%;
                                background: #ff89d8;
                                border-radius: 100% 0 0 0;
                                position: absolute;
                                top: 0;
                                left: 0;
                                content: '';
                            }
                            .loader:after {
                                background: #feffff;
                                width: 75%;
                                height: 75%;
                                border-radius: 50%;
                                content: '';
                                margin: auto;
                                position: absolute;
                                top: 0;
                                left: 0;
                                bottom: 0;
                                right: 0;
                            }
                            @-webkit-keyframes load3 {
                                0% {
                                    -webkit-transform: rotate(0deg);
                                    transform: rotate(0deg);
                                }
                                100% {
                                    -webkit-transform: rotate(360deg);
                                    transform: rotate(360deg);
                                }
                            }
                            @keyframes load3 {
                                0% {
                                    -webkit-transform: rotate(0deg);
                                    transform: rotate(0deg);
                                }
                                100% {
                                    -webkit-transform: rotate(360deg);
                                    transform: rotate(360deg);
                                }
                            }
                        </style>
                        <div class="loader">Loading...</div>
                    </div>

                <script type="text/javascript">
                    $(document).ready(function() {

                        function dryValidate() {
                            // Validate the Fields
                            $("#enquiry-form :input").each(function() {
                                if($.trim($(this).val()) == "") {
                                    alert('Please fill all the fields');
                                    $(this).focus();
                                    $('#loader-form-div').slideUp();
                                    $('#enquiry-form-div').slideDown();
                                    $('#btn-enquiry-send').removeAttr('disabled');
                                    throw new Error('Field missing');
                                }
                            });
                        }

                        $('#btn-enquiry-send').on('click', function(e) {

                            e.preventDefault();

                            $('#btn-enquiry-send').attr('disabled','disabled');
                            $('#enquiry-form-div').slideUp();
                            $('#loader-form-div').slideDown();

                            dryValidate();
                            var fd = $('#enquiry-form').serializeArray();

                            // Submit the FORM
                            $.ajax({
                                url: 'index.php?route=extension/module/seller_enquiry/storeQuery',
                                type: 'post',
                                data: fd,
                                async: false,
                                success: function(data){
                                    if($.isNumeric($.trim(data))) {
                                        // Success
                                        $("#enquiry-form")[0].reset();
                                        $('#loader-form-div').slideUp();
                                        $('#enquiry-form-div').slideDown();
                                        $("#form-submit-response-div").html("<p class=\"bg-success\">Your enquiry has been submitted. We will get in touch with you shortly.</p>").slideDown();
                                        $('#btn-enquiry-send').removeAttr('disabled');

                                    } else {
                                        // Error
                                        $('#loader-form-div').slideUp();
                                        $('#enquiry-form-div').slideDown();
                                        $("#form-submit-response-div").html("<p class=\"bg-danger\">Sorry, we couldn't send your query. Please try again in some time.</p>").slideDown();
                                        $('#btn-enquiry-send').removeAttr('disabled');
                                    }
                                },
                                error: function(jqXhr, textStatus, errorThrown){
                                    //console.log(errorThrown);
                                }
                            });

                        });
                    });
                </script>
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
