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
		
	<p> Not Registered ? Register <a href="index.php"> Here</a>.</p>
	<div id="content">
	
	
	</div>
</body>

</html>