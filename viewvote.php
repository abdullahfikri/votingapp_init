<?php

require_once 'dbvote.php';
header("Content-Type: application/json; charset=UTF-8");


$query ="SELECT 
kandidat.id, 
cagub.nama AS nama_cagub, 
wagub.nama AS nama_wagub,
kandidat.nomor_urut,
kandidat.img FROM `kandidat` 
INNER JOIN `cagub` ON cagub.id=kandidat.idcagub 
INNER JOIN `wagub` ON wagub.id=kandidat.idwagub";



$execute = mysqli_query($dbConnection, $query); 

$check = mysqli_affected_rows($dbConnection);

if($check > 0) {
    $response["status"] = 'success';
    $response["message"] = "Telah mengambil data kandidat Gubernur dan Wakil Gubernur";
    $response["data"] = array();
    while($ambil = mysqli_fetch_object($execute)){
        $F["id"] = $ambil->id;
        $F["nama_cagub"] = $ambil->nama_cagub;
        $F["nama_wagub"] = $ambil->nama_wagub;
        $F["nomor_urut"] = $ambil->nomor_urut;
        $F["img"] = $ambil->img;
        array_push($response["data"], $F);
    }
} else{
    $response["status"] = "failed";
    $response["message"] = "Data kandidat tidak ditemukan";
}


$json = json_encode($response, JSON_PRETTY_PRINT);
echo $json;