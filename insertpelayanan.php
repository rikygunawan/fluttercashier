<?php
$conn=mysqli_connect("localhost","root","","skycashier");
$jenislayanan = $_POST["jenislayanan"];
$harga = $_POST["harga"];
$data = mysqli_query($conn,"insert into pelayanan set jenislayanan='$jenislayanan', harga='$harga'");
?>