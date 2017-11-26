<?php

$name = $_POST["username"];
$password = $_POST["password"];

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

	$sql = "SELECT Password FROM `users` WHERE Username =". "'$name'";

$result = $conn->query($sql);

if (!$result) {
    trigger_error('Invalid query: ' . $conn->error);
}

$hash = mysqli_fetch_object($result)->Password;

if(password_verify($password, $hash))
{
	echo "True";
	header("Location:user.php");
	session_start();
	$_SESSION['login_user'] = $name;
}
else
{
	echo "False";
}

		

$conn->close();

?>