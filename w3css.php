<!DOCTYPE HTML>
<html>
<head>
	<title>Main Page</title>
	<link rel="stylesheet" type="text/css" href="https://www.w3schools.com/w3css/4/w3.css">
	<meta charset="UTF-8">
</head>

<body>
	<div id="main">
		<header>
				<nav class="w3-bar">
				<img src="Assets/Images/DIT_logocol_reverse2013.png" width="10%" height="10%"></img></a>
				 <h1 class="w3-bar-item"> DIT Libary </h1>
					
					  <a class="w3-bar-item w3-button w3-display-topright" href="contact.html">Contacts</a>
					  <a class="w3-bar-item w3-button" href="experiment.html">Experiments</a>
					  <a class="w3-bar-item w3-button" href="gallery.html">Galley</a>
					  <a class="w3-bar-item w3-button" href="about.html">About</a>
					  <a class="w3-bar-item w3-button" href="index.html">Home</a>
					
				</nav>	
		</header>
	</div>
	
	<?php 
	
		$pwErr = "";
		$phoneErr = "";
		$nameErr= "";
		
		if (isset($_GET['nameErr']))
		{
			$nameErr = htmlspecialchars($_GET['nameErr']); 
			if($nameErr == 0)
			{
				$nameErr= "";
			}
			if($nameErr == 10)
			{
				$nameErr = "Your Username is not Unique, Try another";
			}
		}
		
		if (isset($_GET['pwErr']))
		{
			$pwErr = htmlspecialchars($_GET['pwErr']); 
				if($pwErr == 0)
				{
					$pwErr= "";
				}
				if($pwErr == 10)
				{
					$pwErr = "Your passwords do not match please enter again";
				}
				
				if($pwErr == 20)
				{
					$pwErr = "Your password is not 6 characters long, please try again";
				}
		}
		
		if (isset($_GET['phoneErr']))
		{
			$phoneErr = htmlspecialchars($_GET['phoneErr']);
			if($phoneErr == 0)
			{
				$phoneErr= "";
			}
			
			if($phoneErr == 10)
			{
				$phoneErr = "Your phone number is not 10 digits long, please try again";
			}
		}
		
		
	?>
		
	<p> Already Registered? Login <a href="login.php"> Here</a>.</p>
	<div id="content">
	<form method="post" action="register.php">
	
	Please Enter a Username(Must be Unique).
	<input type="username" name="username" required>
	<span class="error"> <?php echo $nameErr;?></span>
	<br><br>
	
	Please Enter a password of at least 6 characters
	<input type="password" name="password" required>
	<span class="error"> <?php echo $pwErr;?></span>
	<br><br>

	Confirm this password
	<input type="password" name="passwordconfirm"  required>
	<span class="error"> <?php echo $pwErr;?></span>
	<br><br>
	Please Enter your Email Address
	<input type="email" name="email" required>
	<br>
	Please Enter your Phone Number
	<input type="number" name="phone" required>
	<span class="error"><?php echo $phoneErr;?></span>
	<br>
	<input type="submit" value="Submit">
	</form>
	</div>
</body>

</html>