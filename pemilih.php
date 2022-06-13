<?php

include_once("dbvote.php");
header("Content-Type: application/json; charset=UTF-8");

$idKandidat = $_POST["id_kandidat"];
$idUser = $_POST["id_user"];
$response = [];


$query = "SELECT * FROM `pemilih` WHERE iduser='$idUser'";
$execute = mysqli_query($dbConnection, $query); 
$check = mysqli_num_rows($execute);

if($check > 0) {
    $response["status"] = "failed";
    $response["message"] = "Anda Sudah memilih kandidat, tidak boleh memilih lagi"; 
} else{
    if($idKandidat!="" && $idUser !=""){


        $query = "INSERT INTO `pemilih`(`idkandidat`, `iduser`) VALUES ('$idKandidat','$idUser')";
        $execute = mysqli_query($dbConnection, $query); 

        $sql = "UPDATE `users` SET `statusvoting`='1' WHERE id = '$idUser'";
        mysqli_query($dbConnection, $sql);

        $response["status"] = "success";
        $response["message"] = "Berhasil memilih kandidat"; 
    }
    else{
    $response["status"] = "failed";
    $response["message"] = "Data tidak boleh kosong"; 
    }
}
$json = json_encode($response, JSON_PRETTY_PRINT);
echo $json;