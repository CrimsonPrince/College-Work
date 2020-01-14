<?php

$ISBN = $_GET['isbn'];
		
		
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
			
			$sql = "UPDATE book SET Reserved = 'N' WHERE ISBN = '{$ISBN}'";
			$result = $conn->query($sql);
			
			echo $conn->error;
		
			
		header("Location:view.php");
		
		
?>