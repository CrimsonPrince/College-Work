<?php

$name = $_POST["username"];
$password = $_POST["password"];
$passwordconfirm = $_POST["passwordconfirm"];
$email = $_POST["email"];
$phone = $_POST["phone"];

$phoneErr = 0;
$nameErr = 0;
$pwErr = 0;

if($password != $passwordconfirm)
{
	$pwErr = 10;
		header("Location:index.php?nameErr=" . $nameErr . "&" . "phoneErr=". $phoneErr . "&" . "pwErr=" . $pwErr);
}
	
if(strlen($password) < 6)
{
	$pwErr = 20;
		header("Location:index.php?nameErr=" . $nameErr . "&" . "phoneErr=". $phoneErr . "&" . "pwErr=" . $pwErr);
}

if(strlen($phone) < 10)
{
	$phoneErr = 10;
		header("Location:index.php?nameErr=" . $nameErr . "&" . "phoneErr=". $phoneErr . "&" . "pwErr=" . $pwErr);
}
?>