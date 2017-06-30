
<header id="header" class=" variant typeheader-<?php echo isset($typeheader) ? $typeheader : '1'?>">
	<!-- HEADER TOP -->
	<div class="header-top">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-xs-6 header-logo ">
					<div class="navbar-logo">
					   <?php  $this->soconfig->get_logo();?>
					</div>
				</div>
				<div class="col-lg-7 header-sevices">
					<?php if (trim($content_topbar)) : 
						echo $content_topbar;
					endif; ?>
				</div>
				<div class="col-lg-2 col-xs-6 header-cart">
					<div class="shopping_cart">
					 	<?php echo $cart; ?>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- HEADER CENTER -->
	<div class="header-center">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-8 col-sm-1 col-xs-3 header-menu">
					<?php echo $content_menu; ?>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-11 col-xs-9 header-search">
					<?php  echo $content_search; ?>
				</div>
			</div>
		</div>
	</div>
	<div class="header-form">
		<div class="button-header current">
			<i class="fa fa-bars"></i>
		</div>
		<div class="dropdown-form toogle_content">
			<?php if($lang_status):?>
				<?php echo $language; ?>
				<?php echo $currency; ?>
			<?php endif; ?>
			<span class="text"><?php echo $objlang->get('text_menu_link'); ?></span>
			<ul class="dropdown-menu">
            <li class="wishlist"><a href="<?php echo $wishlist; ?>" id="wishlist-total" class="top-link-wishlist" title="<?php echo $text_wishlist; ?>"><span><?php echo $text_wishlist; ?></span></a></li>
            <li class="checkout"><a href="<?php echo $checkout; ?>" class="top-link-checkout" title="<?php echo $text_checkout; ?>"><span ><?php echo $text_checkout; ?></span></a></li>
            
          </ul>
		</div>
		<div class="button-user">
		    <div class="user-info">
	            <a class="link-lg" href="<?php echo $login; ?>"><?php echo $text_login; ?></a>
            </div>
		</div>
	</div>
	
	
	<!-- Navbar switcher -->
	<?php if (!isset($toppanel_status) || $toppanel_status != 0) : ?>
	<?php if (!isset($toppanel_type) || $toppanel_type != 2 ) :  ?>
	<div class="navbar-switcher-container">
		<div class="navbar-switcher">
			<span class="i-inactive">
				<i class="fa fa-caret-down"></i>
			</span>
			 <span class="i-active fa fa-times"></span>
		</div>
	</div>
	<?php endif; ?>
	<?php endif; ?>
</header>