<?php 

require_once "dbvote.php";

$query = "SELECT * FROM `cagub`";

$execute = mysqli_query($dbConnection, $query);
$response= [];
$row = mysqli_fetch_all($execute);

$response['data'] = $row;

$json = json_encode($response, JSON_PRETTY_PRINT);
echo $json;

