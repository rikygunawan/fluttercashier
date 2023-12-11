<?php
$conn=mysqli_connect("localhost","root","","skycashier");
$nama = $_POST["nama"];
$alamat = $_POST["alamat"];
$nomorhp = $_POST["nomorhp"];
$data = mysqli_query($conn,"insert into costumer set nama='$nama', alamat='$alamat' , nomorhp='$nomorhp'");
?>