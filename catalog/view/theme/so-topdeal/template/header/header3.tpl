
<header id="header" class=" variant typeheader-<?php echo isset($typeheader) ? $typeheader : '1'?>">
	<!-- HEADER TOP -->
	<div class="header-top compact-hidden">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-9 col-xs-4">
					<?php if (trim($content_menu)) : 
						echo $content_menu;
					endif; ?>
				</div>
				<div class="text-text col-lg-4 hidden-md-down">
					<?php if($welcome_message_status):?>
					<div class="hidden-xs" >
						<?php
							if (isset($welcome_message) && is_string($welcome_message)) {
								echo html_entity_decode($welcome_message, ENT_QUOTES, 'UTF-8');
							} else {echo 'Default welcome msg!';}
						?>
					</div>
					<?php endif; ?>
				</div>
				<div class="nav-layout-3 col-lg-2 col-md-3 col-xs-8">
					<?php if($lang_status):?>
						<div class="link language" ><?php echo $language; ?></div>
						<div class="link currency" > <?php echo $currency; ?> </div>
					<?php endif; ?>
				</div>
			</div>
		</div>
	</div>
	
	<!-- HEADER CENTER -->
	<div class="header-center compact-hidden">
		<div class="container">
			<div class="row">
				<div class="header-logo col-lg-2 col-md-2 col-sm-3 col-xs-12">
				   <?php  $this->soconfig->get_logo();?>
				</div>
				<div class="header-search col-lg-6 col-md-6 col-sm-5 col-xs-7">
					<?php  echo $content_search; ?>
				</div>
				<div class="header-cart col-lg-2 col-md-2 col-sm-1  col-xs-1">
					<div class="shopping_cart">
					 	<?php echo $cart; ?>
					</div>
				</div>
				<div class="user-info-layout-3 col-lg-2 col-md-2 col-sm-3 col-xs-4">
					<div class="userinfo-block">
						<div class="user-info">
							<?php if ($logged) { ?>
							<a class="link-lg" href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a>
							
							<?php } else { ?>
							<a class="link-lg" href="<?php echo $login; ?>"><?php echo $text_login; ?> /</a>
							<a class="link-lg" href="<?php echo $register; ?>"><?php echo $text_register; ?></a> 
							
							<?php } ?>
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