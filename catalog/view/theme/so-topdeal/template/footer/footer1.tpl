
<footer class="footer-container typefooter-<?php echo isset($typefooter) ? $typefooter : '1'?>">
	<?php if ($footertop) : ?>
	<div class="footer--main">
		<?php echo $footertop; ?>
	</div>
	<?php endif; ?>
	<div class="footer--bottom ">
		<div class="container">
			<div class="row">
				<?php $col_copyright = ($imgpayment_status) ? 'col-md-7  col-sm-7' : 'col-sm-6'?>
				<div class="<?php echo $col_copyright;?> copyright">
					<?php
					$datetime = new DateTime();
					$cur_year	= $datetime->format('Y');
					echo (!isset($copyright) || !is_string($copyright) ? $powered : str_replace('{year}', $cur_year,html_entity_decode($copyright, ENT_QUOTES, 'UTF-8')));?>
				</div>
				<div class="col-sm-4" style="float:right;">
					<a href="about-us">About Us</a>  |  <a href="privacy-policy">Privacy Policy</a>  |  <a href="terms">Terms & Conditions</a>  |  <a href="index.php?route=information/contact">Contact Us</a>
				</div>

				<?php if (isset($imgpayment_status) && $imgpayment_status != 0) : ?>
				<div class="col-md-5 col-sm-5 paymen">
					<?php
					if ((isset($imgpayment) && $imgpayment != '') ) { ?>
						<img src="image/<?php echo  $imgpayment ?>"  alt="imgpayment">
					<?php } ?>
				</div>
				<?php endif; ?>

			</div>
		</div>
	</div>
</footer>
