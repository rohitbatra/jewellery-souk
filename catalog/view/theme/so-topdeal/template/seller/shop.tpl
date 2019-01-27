<?php echo $header; ?>
<?php
$short_by = !empty ($pagination) ? 'col-md-6 col-sm-8 col-xs-12' : 'col-md-10 col-sm-12';

/*CHECK COOKIE LISTINGTYPE*/
if(isset($_COOKIE["listingType"])) $listingType = $_COOKIE["listingType"];
else $listingType =  isset($product_catalog_mode) && $product_catalog_mode ? 'list' : 'grid';

function lazyload($src_img){
    global $scroll_animation;

    return ($scroll_animation==1) ? 'data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7' : $src_img;
}
$lazyload_text = ($scroll_animation) ? 'lazy' : '';
$device_res = 'col-lg-3 col-md-3 col-sm-3 col-xs-6';
?>
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
<div class="container page-category">
    <div class="row">
        <?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-md-6 col-sm-4'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-md-9 col-sm-12 col-xs-12'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>">
            <?php if($column_left || $column_right) :?>
            <a href="javascript:void(0)" class="open-sidebar hidden-lg hidden-md"><i class="fa fa-bars"></i> <?php echo $text_sidebar; ?></a>
            <?php endif;?>
            <div class="sidebar-overlay "></div>
            <div class="products-category">

                <?php if ($products) { ?>
                <!-- Filters -->
                <div class="product-filter filters-panel">
                    <div class="row">
                        <div class="box-list col-md-2 hidden-sm hidden-xs">
                            <div class="view-mode">
                                <div class="list-view">
                                    <button class="btn btn-default grid <?php if($listingType =='grid') { echo 'active'; } ?>"  data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th-large"></i></button>
                                </div>
                            </div>
                        </div>
                        <div class="short-by-show form-inline text-right col-md-10 col-sm-12">
                            <div class="form-group short-by">
                                <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
                                <select id="input-sort" class="form-control" onchange="location = this.value;">
                                    <?php foreach ($sorts as $sorts2) { ?>
                                    <?php if ($sorts2['value'] == $sort . '-' . $order) { ?>
                                    <option value="<?php echo $sorts2['href']; ?>" selected="selected"><?php echo $sorts2['text']; ?></option>
                                    <?php } else { ?>
                                    <option value="<?php echo $sorts2['href']; ?>"><?php echo $sorts2['text']; ?></option>
                                    <?php } ?>
                                    <?php } ?>
                                </select>
                            </div>

                            <div class="form-group">
                                <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
                                <select id="input-limit" class="form-control" onchange="location = this.value;">
                                    <?php foreach ($limits as $limits2) { ?>
                                    <?php if ($limits2['value'] == $limit) { ?>
                                    <option value="<?php echo $limits2['href']; ?>" selected="selected"><?php echo $limits2['text']; ?></option>
                                    <?php } else { ?>
                                    <option value="<?php echo $limits2['href']; ?>"><?php echo $limits2['text']; ?></option>
                                    <?php } ?>
                                    <?php } ?>
                                </select>
                            </div>

                            <div class="product-compare form-group"><a href="<?php echo $compare; ?>" id="compare-total" class="btn btn-default"><i class="fa fa-retweet"></i> <?php echo $text_compare; ?></a></div>

                        </div>

                    </div>
                </div>
                <!-- //end Filters -->

                <!--Changed Listings-->
                <div class="products-list row grid">
                <?php foreach($products as $product) { ?>
                        <div class="product-layout <?php echo $device_res;?>">
                            <div class="product-item-container">
                                <div class="left-block">
                                    <div class="product-image-container <?php echo $lazyload_text?> <?php if($secondimg =='2' && isset($product['thumb2'])){ echo "second_img";} ?> ">
                                    <a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>">
                                        <img data-src="<?php echo $product['thumb']; ?>" src="<?php echo lazyload($product['thumb']); ?>"  title="<?php echo $product['name']; ?>" class="img-1 img-responsive" />
                                        <?php if( $secondimg =='2' && isset($product['thumb2']) && !empty($product['thumb2'])) :?>
                                        <img data-src="<?php echo $product['thumb2']; ?>" src="<?php echo lazyload($product['thumb2']); ?>"  alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-2 img-responsive" />
                                        <?php endif;?>
                                    </a>
                                </div>
                                <!--COUNTDOWN BOX-->
                                <?php
                                    if (file_exists(DIR_TEMPLATE . 'so-topdeal/template/soconfig/countdown.php')) include(DIR_TEMPLATE.'so-topdeal/template/soconfig/countdown.php');
                                    else echo 'Not found';
                                ?>
                                <div class="button-group">
                                    <div class="button-inner">
                                        <button class="bts wishlist btn-button" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart-o"></i></button>
                                        <button class="bts compare btn-button" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-random"></i></button>
                                        <button class="bts addToCart" type="button" data-toggle="tooltip" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><span class="hidden"><?php echo $button_cart; ?></span></button>
                                    </div>
                                </div>
                            </div>
                            <div class="box-label">
                                <!--New Label-->
                                <?php if (!isset($new_status) || ($new_status)) : ?>
                                <?php
                                    $day_range = 10;
                                    if ($days == '') $day = $day_range;
                                    else $day = $days;
                                    $day_number_to_range = date( "Y-m-d" ,  strtotime("-$day day")  );
                                    if ($product['date_available'] >= $day_number_to_range) :
                                ?>
                                <span class="label-product label-new"><?php echo (isset($new_text) && is_string($new_text)) ? $new_text : 'NEW'; ?></span>
                                <?php endif; ?>
                                <?php endif; ?>

                                <!--Sale Label-->
                                <?php if (!isset($sale_status) || ($sale_status )) : ?>
                                    <?php if ($product['price'] && $product['special']) : ?>
                                        <span class="label-product label-sale">
                                            <?php echo (isset($sale_text) ? $sale_text : 'SALE'); ?>
                                            <span class="hidden"><?php  if(!isset($discount_status) || $discount_status) echo $product['discount']; ?></span>
                                        </span>
                                    <?php endif; ?>
                                <?php endif; ?>
                            </div>


                            <div class="right-block">
                                <div class="caption">
                                    <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
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
                                        <?php if ($product['price']) { ?>
                                        <div class="price price-left">
                                            <?php if (!$product['special']) { ?>
                                            <span class="price-new"><?php echo $product['price']; ?></span>
                                            <?php } else { ?>
                                            <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                                            <?php } ?>
                                        </div>
                                        <?php } ?>
                                        <div class="price-sale price-right">
                                            <?php if ($product['price'] && $product['special']) : ?>
                                        <span class="discount">
                                        <?php  if(!isset($discount_status) || $discount_status) echo $product['discount']; ?>
                                            <strong>OFF</strong>
                                        </span>
                                            <?php endif; ?>
                                        </div>
                                    </div>
                                    <div class="description <?php if (!isset($lstdescription_status) || $lstdescription_status != 1) : ?> hidden <?php endif; ?>">
                                        <p><?php echo $product['description']; ?></p>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
            <?php } ?>
            </div>

                <!--// End Changed listings-->

                <!-- Filters -->
                <div class="product-filter product-filter-bottom filters-panel" >
                    <div class="row">
                        <div class="box-list col-md-2 hidden-sm hidden-xs">
                            <div class="view-mode">
                                <div class="list-view">
                                    <button class="btn btn-default grid <?php if($listingType =='grid') { echo 'active'; } ?>"  data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th-large"></i></button>
                                </div>
                            </div>
                        </div>
                        <div class="short-by-show text-center <?php echo $short_by;?>">
                            <div class="form-group" style="margin:0px"><?php echo $results; ?></div>
                        </div>
                        <?php if (!empty($pagination)) { ?>
                        <div class="box-pagination col-md-4 col-sm-4 text-right"><?php echo $pagination; ?></div>
                        <?php } ?>

                    </div>
                </div>
                <!-- //end Filters -->

                <?php } else { ?>
                <div class="form-group">
                    <h4><?php echo $text_empty; ?></h4>
                    <div class="buttons">
                        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
                    </div>
                </div>
                <?php } ?>
                <!--End content-->

                <script type="text/javascript"><!--
                    $('.view-mode .list-view button').bind("click", function() {
                        if ($(this).is(".active")) {return false;}
                            $.cookie('listingType', $(this).is(".grid") ? 'grid' : 'list', { path: '/' });
                        location.reload();
                    });
                    //--></script>

                <?php echo $content_bottom; ?>
            </div>
        </div>

        <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>