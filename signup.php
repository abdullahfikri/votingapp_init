<?php
require_once 'db_connection.php';
header("Content-Type: application/json; charset=UTF-8");
$username = $_POST['username'];
$password = $_POST['password'];
$namaLengkap = $_POST['nama_lengkap'];
$email = $_POST['email'];
$nohp = $_POST['no_hp'];

$query = "INSERT INTO users (`username`, `password`, `nama_lengkap`,  `no_hp`, `email`) VALUES ('$username', '$password', '$namaLengkap', '$nohp','$email')";

$execute = mysqli_query($dbConnection,$query);
$response = [];

if ($execute) {
    $response['status'] = 'success';
    $response['message'] = 'Berhasil mendaftarkan account';
} else {
    $response['status'] = 'failed';
    $response['message'] = 'Gagal mendaftarkan account';
}

$json = json_encode($response,JSON_PRETTY_PRINT);
echo $json;