<?php

if(isset($_GET['search']))
{	
$search = $_GET['search'];
}

If(isset($_GET['option']))
{
	$option = $_GET['option'];
}

if(isset($_GET['cat']))
{			
$cat = $_GET['cat'];
}

$ISBN = $_GET['isbn'];
$Reserved = $_GET['reserved'];

		
		if($Reserved = "Y")
		{

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
			
			$sql = "UPDATE book SET Reserved = 'Y' WHERE ISBN = '{$ISBN}'";
			$result = $conn->query($sql);
			
			echo $conn->error;
		}
		
		If(isset($search))
		{
			header("Location:search.php?search={$search}&option=$option");
		}
		
		if(isset($cat))
		{
			header("Location:search.php?Category={$cat}");
		}
		
		
?>