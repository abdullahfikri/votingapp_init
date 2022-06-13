<?php

include_once("dbvote.php");

header("Content-Type: application/json; charset=UTF-8");

$querypemilih = "SELECT `idkandidat`FROM `pemilih`";
$querypaslon1 = "SELECT `idkandidat`FROM `pemilih` WHERE idkandidat = 1";
$querypaslon2 = "SELECT `idkandidat`FROM `pemilih` WHERE idkandidat = 2";
$querypaslon3 = "SELECT `idkandidat`FROM `pemilih` WHERE idkandidat = 3";

$execute = mysqli_query($dbConnection, $querypaslon1); 
$hasilPaslon1 = mysqli_num_rows($execute);

$execute = mysqli_query($dbConnection, $querypaslon2); 
$hasilPaslon2 = mysqli_num_rows($execute);

$execute = mysqli_query($dbConnection, $querypaslon3); 
$hasilPaslon3 = mysqli_num_rows($execute);

$execute = mysqli_query($dbConnection, $querypemilih); 
$pemilih = mysqli_num_rows($execute);

$response["status"] = "success";
$response["message"] = "berhasil mengambil data rahasia";
$response["data"] = [
    "paslon1" => $hasilPaslon1,
    "paslon2" => $hasilPaslon2,
    "paslon3" => $hasilPaslon3,
    "pemilih" => $pemilih
];

$json = json_encode($response, JSON_PRETTY_PRINT);
echo $json;