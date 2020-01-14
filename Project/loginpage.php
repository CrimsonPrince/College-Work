<?php 

$uError = "";
$pError = "";

if(isset($_GET['uError']))
{
	$uError = "Your Username is incorrect";
}

if(isset($_GET['pError']))
{
	$pError = "Your Password is incorrect";
}


?>

<!DOCTYPE HTML>
<html>
<head>
	<title>Main Page</title>
	<link rel="stylesheet" type="text/css" href="Assets/CSS/site.css">
	<link rel="stylesheet" type="text/css" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<meta charset="UTF-8">
</head>

<body>
	<div id="main">
		<header>
				<nav>
				<a href="loginpage.php"><img src="Assets/Images/DIT_logocol_reverse2013.png"></img></a>
				<span id="spanNav"> <h1> DIT Libary </h1> </span>
					<ul>
					  <li><a href="register.php">Register</a></li>
					  <li><a class="active" href="loginpage.php">Login</a></li>
					</ul>
				</nav>	
		</header>
	</div>

	<div id="content">	
	<form method="post" action="login.php" class="w3-container w3-card-4 w3-light-grey w3-text-blue w3-margin w3-display-middle" style="width:50%">
<h2 class="w3-center">Login</h2>
 
<div class="w3-row w3-section">
  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user"></i></div>
    <div class="w3-rest">
      <input class="w3-input w3-border" name="username" type="username" placeholder="Username" required><?php echo $uError ?>
    </div>
</div>

<div class="w3-row w3-section">
  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user"></i></div>
    <div class="w3-rest">
      <input class="w3-input w3-border" name="password" type="password" placeholder="Password" required><?php echo $pError ?>
    </div>
</div>




<input type="submit" value="Login" class="w3-button w3-block w3-section w3-blue w3-ripple w3-padding">

</form>
	
	</div>
</body>

</html>