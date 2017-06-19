<?php if ($checkout_method == 'iframe') { ?>
	<iframe name="hss_iframe" width="100%" height="450px" style="border:0px solid #DDDDDD;" src="<?php echo $iframeaction; ?>"></iframe>	
<?php } else { ?>	
	<form method="post" action="<?php  echo $action?>" id="ccavenueform" name="ccavenueform">		
		<input type="hidden" name="encRequest" value="<?php  echo $encrypted_data?>"> 
		<input type="hidden" name="access_code" value="<?php  echo $access_code?>">
		 <div class="buttons">
		  <div class="pull-right">
			<input type="submit" value="<?php echo $button_confirm; ?>" id="button-confirm" class="btn btn-primary" />
		  </div>
		</div>
	</form>
<?php } ?>