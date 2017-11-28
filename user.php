<?php
session_start();

if(isset($_SESSION['login_user']))
{
	echo "Authenticated";
}
else
{
	header("Location:login.html");
}


?>