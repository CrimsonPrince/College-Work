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
               <span id="spanNav">
                  <h1> DIT Libary </h1>
               </span>
               <ul>
                 <li><a href="register.php">Register</a></li>
				<li><a class="active" href="loginpage.php">Login</a></li>
               </ul>
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
      <div id="content">
         <form method="post" action="register.php" class="w3-container w3-card-4 w3-light-grey w3-text-blue w3-margin">
            <h2 class="w3-center">Register</h2>
			<div class="w3-row w3-section">
               <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user"></i></div>
               <div class="w3-rest">
                  <input class="w3-input w3-border" type="username" name="username" required placeholder="Username"><span class="error"><span><?php echo $nameErr;?></span>
               </div>
            </div>
            <div class="w3-row w3-section">
               <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user"></i></div>
               <div class="w3-rest">
                  <input class="w3-input w3-border" type="username" name="FirstName" required placeholder="First Name">
               </div>
            </div>
            <div class="w3-row w3-section">
               <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user"></i></div>
               <div class="w3-rest">
                  <input class="w3-input w3-border" type="username" name="LastName" required placeholder="Last Name">
               </div>
            </div>
			 <div class="w3-row w3-section">
               <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-key"></i></div>
               <div class="w3-rest">
                  <input class="w3-input w3-border" name="password" type="password" required placeholder="Password"><span class="error"><span><?php echo $pwErr;?></span>
               </div>
            </div>
            <div class="w3-row w3-section">
               <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-key"></i></div>
               <div class="w3-rest">
                  <input class="w3-input w3-border" name="passwordconfirm" type="password" required placeholder="Please Confirm Your Password"><span class="error"><span><?php echo $pwErr;?></span>
               </div>
            </div>
            <div class="w3-row w3-section">
               <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-phone"></i></div>
               <div class="w3-rest">
                  <input class="w3-input w3-border" name="phone" type="number" placeholder="Phone" required><span><?php echo $phoneErr;?></span>
               </div>
            </div>
            <div class="w3-row w3-section">
               <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-envelope"></i></div>
               <div class="w3-rest">
                  <input class="w3-input w3-border" name="Email" type="email" placeholder="Email" required>
               </div>
            </div>
            <input type="submit" value="Submit" class="w3-button w3-block w3-section w3-blue w3-ripple w3-padding">
         </form>
      </div>
   </body>
</html>
