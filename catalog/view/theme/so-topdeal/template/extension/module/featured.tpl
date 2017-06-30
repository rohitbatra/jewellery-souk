<div id="sticky" class="hidden-xs hidden-sm hidden-md">	
	<div class="button-close"><span class="button-ex">button</span></div>
	<div class="so-feature-custom special">
		<div class="title-module">
			<h3 class="block-title"><?php echo $heading_title; ?></h3>
		</div>
		
		<div class="item">
		  <?php foreach ($products as $product) { ?>
		  <div class="product-layout ">
		    <div class="product-thumb transition">
		    	<div class="left-block">
		    		<div class="product-image">
			     	 <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
			     	</div>
		    	</div>
		      	<div class="right-block">
		      		<div class="product-info">
				        <h5 class="product-title"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
				        <p class="hidden"><?php echo $product['description']; ?></p>
				        <?php if ($product['rating']) { ?>
				        <div class="rating hidden">
				          <?php for ($i = 1; $i <= 5; $i++) { ?>
				          <?php if ($product['rating'] < $i) { ?>
				          <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
				          <?php } else { ?>
				          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
				          <?php } ?>
				          <?php } ?>
				        </div>
				        <?php } ?>
				        <?php if ($product['price']) { ?>
				        <p class="price">
				          <?php if (!$product['special']) { ?>
				          <?php echo $product['price']; ?>
				          <?php } else { ?>
				           <span class="price-old"><?php echo $product['price']; ?></span><span class="price-new"><?php echo $product['special']; ?></span>
				          <?php } ?>
				          <?php if ($product['tax']) { ?>
				          <span class="price-tax hidden"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
				          <?php } ?>
				        </p>
				        <?php } ?>
				      </div>
				      <div class="button-group hidden">
				        <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
				        <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
				        <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
				      </div>
				    </div>
		      	</div>
		      	
		  </div>
		  <?php } ?>
		</div>
		
	</div>

	<script>

	    $(document).ready(function(){
	        $(".button-close").click(function(){
	            if($('.so-feature-custom.special').hasClass('active-special')){
	                $('.so-feature-custom.special').removeClass('active-special');
	            }else{
	                $('.so-feature-custom.special').removeClass('active-special');
	                $('.so-feature-custom.special').addClass('active-special');
	            }
	        });

	        $(".button-close").click(function(){
	            if($('#sticky').hasClass('active')){
	                $('#sticky').removeClass('active');
	            }else{
	                $('#sticky').removeClass('active');
	                $('#sticky').addClass('active');
	            }
	        });

	        $(".button-ex").on('click',function(){
	                if($('.button-ex').hasClass('active')){
	                    $('.button-ex').removeClass('active');
	                }else{
	                    $('.button-ex').removeClass('active');
	                    $('.button-ex').addClass('active');
	                }
	        });
	    });

		var $stickyHeight = 460; // chiều cao của banner quảng cáo
		var $padding = 80; // khoảng cách top của banner khi dính
		var $topOffset = 650; // khoảng cách từ top của banner khi bắt đầu dính (tức là khoảng cách tính từ trên xuống đến vị trí đặt banner )
		var $footerHeight = 10; // Định vị điểm dừng của banner, tính từ chân lên
		/* <![CDATA[ */
		function scrollSticky(){
		if($(window).height() >= $stickyHeight) {
		var aOffset = $('#sticky').offset();
		if($(document).height() - $footerHeight - $padding < $(window).scrollTop() + $stickyHeight) {
		var $top = $(document).height() - $stickyHeight - $footerHeight - $padding - 185;
		$('#sticky').attr('style', 'position:absolute; top:'+$top+'px;left:auto;right:0;');
		}else if($(window).scrollTop() + $padding > $topOffset) {
		$('#sticky').attr('style', 'position:fixed; top:'+$padding+'px;left:auto;right:0;');
		}else{
		$('#sticky').attr('style', 'position:relative; display:none;');
		}
		}
		}
		$(window).scroll(function(){
		scrollSticky();
		});
		/* ]]> */
	</script>
</div>