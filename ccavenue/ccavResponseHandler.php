<html>
<head>
	<title> Receiving From Payment Gateway (CCAvenue) </title>
</head>
<body>
<center>
<?php
	require_once('../config.php');
	require_once('Crypto.php');
	error_reporting(0);

	$workingKey='E90DEFBC38BE1D13F737925FDADD197D';		//Working Key should be provided here.
	$encResponse=$_POST["encResp"];			//This is the response sent by the CCAvenue Server
	$rcvdString=decrypt($encResponse,$workingKey);		//Crypto Decryption used as per the specified working key.
	$order_status="";
	$decryptValues=explode('&', $rcvdString);
	$dataSize=sizeof($decryptValues);
	echo "<center>";

	for($i = 0; $i < $dataSize; $i++)
	{
		$information=explode('=',$decryptValues[$i]);
		if($i==3)	$order_status=$information[1];
	}

	if($order_status==="Success")
	{
		echo "<br>Thank you! Your transaction is successful. We will be redirecting you...";

	}
	else if($order_status==="Aborted")
	{
		echo "<br>There was some issue with the Transaction. We will track it manually & keep you posted via email. In any case you can write to us at support@sezplus.com";

	}
	else if($order_status==="Failure")
	{
		echo "<br>The Transaction has been declined.";
	}
	else
	{
		echo "<br>Security Error. Illegal access detected";

	}

	echo "<br><br>";

	// Create a POST request with all Variables Received.

	$postArr = array('orderNo'=>$_POST['orderNo']);
	for($i = 0; $i < $dataSize; $i++)
	{
		$information=explode('=',$decryptValues[$i]);
		$postArr[$information[0]] = urldecode($information[1]);
	}

	echo "</center>";
?>
<form method="post" name="redirect" action="<?php echo HTTP_SERVER; ?>index.php?route=seller/payment_process&payment=complete">
<?php
	foreach ($postArr as $var => $val)
	{
		echo "<input type=hidden name='{$var}' value='{$val}'>";
	}

?>
	</form>
</center>
<script language='javascript'>document.redirect.submit();</script>
</body>
</html>
