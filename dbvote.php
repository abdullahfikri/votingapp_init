<?php

$server = 'localhost';
$username = 'root';
$password = "";
$db = "vottingapp";

$response = [];

try{
$dbConnection = mysqli_connect($server,$username,$password,$db) ;

} catch(Error ) {
    $response['message'] = 'Error';
}

