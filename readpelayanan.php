<?php
$conn=mysqli_connect("localhost","root","","skycashier");
$query=mysqli_query($conn,"select * from pelayanan");
$data=mysqli_fetch_all($query,MYSQLI_ASSOC);
echo json_encode($data);
?>