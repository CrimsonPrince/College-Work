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

$servername = "localhost";
$username = "root";
$passwordDB = "";
$dbname = "webdevproj";

// Create connection
$conn = new mysqli($servername,$username,$passwordDB,$dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$result = mysqli_query($conn,"SELECT Username FROM users");

while($row = mysqli_fetch_array($result))
{	
	echo "hello";
	if($name == $row['Username'])
	{
		$nameErr = 10;
		header("Location:index.php?nameErr=" . $nameErr . "&" . "phoneErr=". $phoneErr . "&" . "pwErr=" . $pwErr);
	}
}

$sql = "INSERT INTO `users`(`Username`, `Password`, `Email`, `Phone`)
VALUES ('$name','$password','$email','$phone')";

if ($conn->query($sql) === TRUE) 
{
   header("Location:User.php");
} 
else 
{
    echo "Error: " . $sql . "<br>" . $conn->error;
}


$conn->close();

?>