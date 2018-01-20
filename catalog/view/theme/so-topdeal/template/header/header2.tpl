
<header id="header" class=" variant typeheader-<?php echo isset($typeheader) ? $typeheader : '1'?>">
	<div class="header-bonus">
		<?php if (trim($content_head)) :
			echo $content_head;
		endif; ?>
	</div>
	<div class="header-top compact-hidden">
		<div class="container">
			<div class="row">
				<div class="header-top-left  col-lg-6  col-sm-7 col-md-6 hidden-xs">
					<div class="list-contact">
						<?php if($welcome_message_status):?>
							<?php
								if (isset($welcome_message) && is_string($welcome_message)) {
									echo html_entity_decode($welcome_message, ENT_QUOTES, 'UTF-8');
								} else {echo 'Default welcome msg!';}
							?>

						<?php endif; ?>
					</div>
				</div>
				<div class="header-top-right collapsed-block col-lg-6 col-sm-5 col-md-6 col-xs-12 ">

					<div  class="tabBlock" id="TabBlock-1">
						<ul class="top-link list-inline">
							<?php if ($logged) { ?>
							<li class="account" id="my_account"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="btn-xs dropdown-toggle" data-toggle="dropdown"> <span><?php echo $text_account; ?></span> <span class="fa fa-angle-down"></span></a>
								<ul class="dropdown-menu ">
									<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
									<li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
									<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
									<?php if($checkout_status):?><li class="checkout"><a href="<?php echo $checkout; ?>" class="btn-link" title="<?php echo $text_checkout; ?>"><span ><?php echo $text_checkout; ?></span></a></li><?php endif; ?>
								</ul>
							</li>
							<?php } ?>
							<?php if (!$logged) { ?>
								<li class="account"><a href="<?php echo $seller_landing; ?>"><?php echo 'Seller(s)'; ?></a></li>
							<?php } ?>
							<li class="login">
								<?php if ($logged) { ?>
								<a class="link-lg" href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a>
								<?php } else { ?>
								<a class="link-lg" href="<?php echo $login; ?>"><?php echo $text_login; ?></a>/
								<a class="link-lg res" href="<?php echo $register; ?>"><?php echo $text_register; ?></a>
								<?php } ?>
							</li>
							<!-- LANGUAGE CURENTY -->
							<?php if($lang_status):?>

								<li class="language" ><?php echo $language; ?></li>
								<li class="currency" > <?php echo $currency; ?> </li>
							<?php endif; ?>

						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- HEADER CENTER -->
	<div class="header-center compact-hidden">
		<div class="container">
			<div class="row">
				<!-- LOGO -->
				<div class="navbar-logo col-lg-3 col-md-12 col-xs-12">
				   <?php  $this->soconfig->get_logo();?>
				</div>
				<div class="header-center-right col-lg-6 col-md-7 col-sm-7 col-xs-9">
					<!-- BOX CONTENT MENU -->
					<div class="header_search">
						<?php  echo $content_search; ?>
					</div>
				</div>
				<div class="header-cart-phone col-lg-3 col-md-5 col-sm-5 col-xs-3">
					<?php if($phone_status):?>
						<div class="bt-head header-phone" >
							<?php
								if (isset($contact_number) && is_string($contact_number)) {
									echo html_entity_decode($contact_number, ENT_QUOTES, 'UTF-8');
								} else {echo 'Telephone No';}
							?>

						</div>
					<?php endif; ?>
					<div class="bt-head header-cart">
					 	<?php echo $cart; ?>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- HEADER BOTTOM -->
	<div class="header-bottom ">
		<div class="container">
			<div class="header-bottom-inner">
				<div class="row">
					<div class="header-bottom-left menu-vertical col-md-3 col-sm-6 col-xs-7">
						<?php if (trim($content_menu1)) :
								echo $content_menu1;
						endif; ?>
					</div>
					<div class="header-bottom-right col-md-9 col-sm-6 col-xs-5">
						<div class="header-menu">
							<?php echo $content_menu; ?>
						</div>

					</div>
				</div>
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
