<?php
session_start();

if(isset($_SESSION['login_user']))
{
	
}
else
{
	header("Location:login.html");
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
               <a href="index.html"><img src="Assets/Images/DIT_logocol_reverse2013.png"></img></a>
               <span id="spanNav">
                  <h1> DIT Libary </h1>
               </span>
               <ul>
                   <li><a class="active" href="contact.html">Contact Us</a></li>
                  <li><a href="view.php">View Reserved</a></li>
                  <li><a href="catalog.php">Catalog</a></li>
                  <li><a href="advsearch.php">Advanced Search</a></li>
                  <li><a href="user.php">Home</a></li>
               </ul>
            </nav>
         </header>
      </div>
	  
	  <div id="content">
	  <form action="search.php" method="post" class="w3-container" style="width:50%; margin-left:25%; margin-top:10%; color: #0095DA">
	  <h2 class="w3-center">Search</h2>
	    <div class="w3-row w3-section">
		  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-search"></i></div>
			<div class="w3-rest">
			  <input class="w3-input w3-border" name="search" type="search" placeholder="Enter Book Title or Author Name" required>
			  <select class="w3-select w3-border" name="option" style="width:30%" required>
			  <option value="BookTitle" selected>Book Title</option>
			  <option value="Author">Author</option>
			</select>
			<input type="submit" value="Search" class="w3-button w3-block w3-section w3-blue w3-ripple w3-padding">
			</div>
		</div>
		</form>
</div>
   </body>
</html>