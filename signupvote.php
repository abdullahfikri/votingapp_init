<?php
require_once 'dbvote.php';
header("Content-Type: application/json; charset=UTF-8");

$email = $_POST[ 'email'];
$password = $_POST['password'];
$namalengkap = $_POST['namalengkap'];
$nik = $_POST['nik'];
// echo gettype($nik);
$tempattinggal = $_POST['tempattinggal'];

// echo $email.gettype($email);
// echo $password.gettype($password);
// echo $namalengkap.gettype($namalengkap);
// echo $nik.gettype($nik);
// echo $tempattinggal.gettype($tempattinggal);



// $query = "INSERT INTO users (email, password, namalengkap, nik, tempattinggal) VALUES ('$email', '$password', '$namalengkap', '$nik', '$tempattinggal')";
// $execute = mysqli_query($dbConnection, $query); 
$response = [];



// UPLOAD IMAGE BEGIN

$target_dir = "images/";
$target_file = $target_dir .rand(999,9999). basename($_FILES["uploadfile"]["name"]);
$uploadOk = 1;
$imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));

// Check if image file is a actual image or fake image
  $check = getimagesize($_FILES["uploadfile"]["tmp_name"]);
  if($check !== false ) {
    $uploadOk = 1;
   // move file img to server folder
    if(move_uploaded_file($_FILES['uploadfile']['tmp_name'], $target_file)){
         echo "The file ". htmlspecialchars( basename( $_FILES["fileToUpload"]["name"])). " has been uploaded.";

         // Menyambung url
         $ip_server = 'http://10.0.2.2/';
         $folder_root = 'votingapp/';
         $url = $ip_server.$folder_root.$target_file;

         // Query insert
         $query = "INSERT INTO `users`(`email`, `password`, `nik`, `namalengkap`, `tempattinggal`, `imgurl`) VALUES ('$email','$password',$nik,'$namalengkap','$tempattinggal','$url')";
         // Eksekusi query
         $execute = mysqli_query($dbConnection,$query);

         if ($execute) {
            $response['status'] = 'success';
            $response['message'] = 'Berhasil Mendaftar Account';
         } else {
            $response['status'] = 'failed';
            $response['message'] = 'Gagal Mendaftar Account';
         }
    } else {
       $response['status'] = 'failed';
       $response['message'] = 'Gagal dalam mengupload file';
  }


  } else {
    echo "File is not an image.";
    $uploadOk = 0;
  }

//  UPLOAD IMAGE ENDED


$json = json_encode($response, JSON_PRETTY_PRINT);
echo $json;