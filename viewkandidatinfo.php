<?php

require_once 'dbvote.php';

$id_kandidat = $_POST['id_kandidat'];

try{
$query = "SELECT 
kandidat.id AS id_kandidat, 
cagub.nama AS nama_cagub,
cagub.ttl AS ttl_cagub,
cagub.riwayat_pendidikan AS pendidikan_cagub,
cagub.biografi_singkat AS bio_cagub,
cagub.imgurl AS img_cagub,
wagub.nama AS nama_wagub,
wagub.ttl AS ttl_wagub,
wagub.riwayat_pendidikan AS pendidikan_wagub,
wagub.biografi_singkat AS bio_wagub,
wagub.imgurl AS img_wagub 
FROM `kandidat` 
INNER JOIN `cagub` ON cagub.id=kandidat.idcagub 
INNER JOIN `wagub` ON wagub.id=kandidat.idwagub
WHERE kandidat.id = $id_kandidat";

$execute = mysqli_query($dbConnection, $query); 

$row = mysqli_fetch_assoc($execute);
// $check = mysqli_affected_rows($dbConnection);

//     if($check > 0) {
//         $response["status"] = 'success';
//         $response["message"] = "Telah mengambil data kandidat Gubernur dan Wakil Gubernur";
//         $response["data_kandidat"] = array();
//         while($ambil = mysqli_fetch_object($execute)){
//             $F["id_kandidat"] = $ambil->id_kandidat;
//             $F["nama_cagub"] = $ambil->nama_cagub;
//             $F["ttl_cagub"] = $ambil->ttl_cagub;
//             $F["pendidikan_cagub"] = $ambil->pendidikan_cagub;
//             $F["bio_cagub"] = $ambil->bio_cagub;
//             $F["img_cagub"] = $ambil->img_cagub;
//             $F["nama_wagub"] = $ambil->nama_wagub;
//             $F["ttl_wagub"] = $ambil->ttl_wagub;
//             $F["pendidikan_wagub"] = $ambil->pendidikan_wagub;
//             $F["bio_wagub"] = $ambil->bio_wagub;
//             $F["img_wagub"] = $ambil->img_wagub;
//             array_push($response["data_kandidat"], $F);
//         }
//     } else{
//         $response["status"] = "failed";
//         $response["message"] = "Data kandidat tidak ditemukan";
    // }
}catch(Error $e){
    $response['status'] = "failed";
}

$response["status"] = 'success';
$response["message"] = "Telah mengambil data kandidat Gubernur dan Wakil Gubernur";
$response["data_kandidat"] = $row;
$json = json_encode($response, JSON_PRETTY_PRINT);
echo $json;