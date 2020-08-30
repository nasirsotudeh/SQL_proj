<?php
$servername = "localhost";
$username = "root";
$password = "";
$db="db_project";

// Create connection
$conn = mysqli_connect($servername, $username, $password,$db);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
//echo "Connected successfully";

$sql="SELECT U.id as unit_id , C.* FROM db_project.charges C
	join charge_ladger CL on C.id = CL.charge_id
    join units U on U.ladger_id = CL.ladger_id
    where area > 100;";


$conn->exec($sql);
echo "Table MyGuests created successfully";
?>