<?php echo $header; ?>
<?php

    function lazyload($src_img){
		global $scroll_animation;

		return ($scroll_animation==1) ? 'data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7' : $src_img;
	}
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
            <div class="sidebar-overlay"></div>
            <div class="products-category">
                <div class="product-filter filters-panel">
                    <div class="row">
                        <div class="short-by-show form-inline text-right col-md-12 col-sm-12">
                            <div class="form-group">
                                <label class="control-label" for="input-limit"><?php echo $text_limit; ?>:</label>
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
                        </div>
                    </div>
                </div>

                <div class="products-list row list">
                    <?php if(!empty($leads)) { ?>
                        <?php foreach($leads as $lead) { ?>
                            <div class="product-list product-layout col-xs-12">
                                <div class="product-item-container">
                                    <div class="left-block col-md-4">
                                        <div class="product-image-container lazy lazy-loaded">
                                            <a href="<?php echo $lead['href']; ?>" title="<?php echo $lead['name']; ?>">
                                                <img data-src="<?php echo $lead['thumb']; ?>" src="<?php echo lazyload($lead['thumb']); ?>"  title="<?php echo $lead['name']; ?>" class="img-1 img-responsive" />
                                            </a>
                                        </div>
                                    </div>
                                    <!-- end left block -->
                                    <div class="right-block col-md-8">
                                        <!-- Title -->
                                        <div class="caption">
                                            <h4><a href="<?php echo $lead['href']; ?>"><?php echo $lead['name']; ?></a></h4>
                                            <!-- Description -->
                                            <div class="description">
                                                <p><?php echo $lead['description']; ?></p>
                                            </div>

                                            <!-- Quantity -->
                                            <?php if (!empty($lead['quantity'])) { ?>
                                                <div class="hidden">
                                                    <p><strong><?php echo $text_quantity; ?>:</strong> <?php echo $lead['quantity']; ?></p>
                                                </div>
                                            <?php } ?>

                                            <!-- Location -->
                                            <?php if (!empty($lead['location'])) { ?>
                                                <div class="hidden">
                                                    <p><strong><?php echo $text_location; ?>:</strong> <?php echo $lead['location']; ?> </p>
                                                </div>
                                            <?php } ?>

                                            <!-- Date Posted -->
                                            <?php if (!empty($lead['date_added'])) { ?>
                                                <div class="">
                                                    <p><strong><?php echo $text_date_added; ?>:</strong> <?php echo $lead['date_added']; ?> </p>
                                                </div>
                                            <?php } ?>
                                        </div>
                                        <div class="button-group">
                                            <a class="btn font-sn" title="<?php echo $button_view_lead; ?>" href="<?php echo $lead['href']; ?>"> <span><?php echo $button_view_lead; ?></span></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <?php } ?>
                </div>
                <!-- Pagination -->
                <div class="product-filter product-filter-bottom filters-panel" >
                    <div class="row">
                        <div class="box-list col-md-2">
                            <div class="view-mode">
                                <div class="list-view hidden">
                                    <button class="btn btn-default grid active" data-toggle="tooltip" title="" data-original-title="Grid"><i class="fa fa-th-large"></i></button>
                                    <button class="btn btn-default list " data-toggle="tooltip" title="" data-original-title="List"><i class="fa fa-bars"></i></button>
                                </div>
                            </div>
                        </div>
                        <div class="short-by-show text-center col-md-6 col-sm-8 col-xs-12">
                            <div class="form-group" style="margin:0px"><?php echo $results; ?></div>
                        </div>
                        <?php if (!empty($pagination)){ ?>
                            <div class="box-pagination col-md-4 col-sm-4 text-right"><?php echo $pagination; ?></div>
                        <?php } ?>
                    </div>
                </div>

        <?php } else { ?>

            <div class="form-group">
                <h4><?php echo $text_empty; ?></h4>
                <div class="buttons">
                    <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
                </div>
            </div>

        <?php } ?>

                <!--End content-->
            <?php echo $content_bottom; ?>
            </div>
        </div>
        <?php echo $column_right; ?></div>
    </div>
<?php echo $footer; ?>

