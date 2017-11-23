<!DOCTYPE HTML>
<html>
<head>
	<title>Main Page</title>
	<link rel="stylesheet" type="text/css" href="Assets/CSS/site.css">
	<meta charset="UTF-8">
</head>

<body>
	<div id="main">
		<header>
				<nav>
				<a href="index.html"><img src="Assets/Images/DIT_logocol_reverse2013.png"></img></a>
				<span id="spanNav"> <h1> DIT Libary </h1> </span>
					<ul>
					  <li><a class="active" href="contact.html">Contacts</a></li>
					  <li><a href="experiment.html">Experiments</a></li>
					  <li><a href="gallery.html">Galley</a></li>
					  <li><a href="about.html">About</a></li>
					  <li><a href="index.html">Home</a></li>
					</ul>
				</nav>	
		</header>
	</div>
	
	<?php 
	
		$pwErr = "";
		$phoneErr = "";
		
		if (isset($_GET['pwErr']))
		{
			$pwErr = htmlspecialchars($_GET['pwErr']); 
		}
		if (isset($_GET['phoneErr']))
		{
			$pwErr = $_GET['phoneErr'];
		}
		
	?>
		
	<p> Already Registered? Login <a href="register.php"> Here</a>.</p>
	<div id="content">
	<form method="post" action="login.php">
	
	Please Enter a Username(Must be Unique).
	<input type="username" id="username" required>
	<br><br>
	
	Please Enter a password of at least 6 characters
	<input type="password" id="password" required>
	<span class="error"> <?php echo $pwErr;?></span>
	<br><br>

	Confirm this password
	<input type="password" id="passwordconfirm"  required>
	<span class="error"> <?php echo $pwErr;?></span>
	<br><br>
	Please Enter your Email Address
	<input type="email" id="email" required>
	<br>
	Please Enter your Phone Number
	<input type="number" id="phone" required>
	<span class="error"><?php echo $phoneErr;?></span>
	<br>
	<input type="submit" value="Submit">
	</form>
	</div>
</body>

</html>