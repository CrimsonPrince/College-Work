<?php 

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

			$sql = "SELECT COUNT(*) FROM `book`";

		$result = $conn->query($sql);

?>