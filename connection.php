<?php

$server = 'localhost';
$username = 'root';
$password = "";
$db = "kuliweb";

$dsn ="mysql:host=$server;dbname=$db";
$con = null;
try {
    $con = new PDO($dsn, $username, $password);

} catch(PDOException $e){

    echo "test ".$e;
}
