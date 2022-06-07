<?php
require_once 'dbvote.php';
header("Content-Type: application/json; charset=UTF-8");

$email = $_POST[ 'email'];
$password = $_POST['password'];

$query = "SELECT * FROM users WHERE email = '$email' AND password = '$password'";

$execute = mysqli_query($dbConnection, $query); 
$response = [];
$row = mysqli_fetch_assoc($execute);
 if ($row){
if (count($row) > 0 ) {
   $response['status'] = 'success';
   $response['message'] = 'Berhasil Login';
   $response['data'] = $row;
} 
} else {
   $response['status'] = 'failed';
   $response['message'] = 'Gagal Login';
   $response['data'] = $row;
}
$json = json_encode($response, JSON_PRETTY_PRINT);
echo $json;