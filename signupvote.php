<?php
require_once 'dbvote.php';
header("Content-Type: application/json; charset=UTF-8");

$email = $_POST[ 'email'];
$password = $_POST['password'];
$namalengkap = $_POST['namalengkap'];
$nik = $_POST['nik'];
$nomorhp = $_POST['nomorhp'];
$tempattinggal = $_POST['tempattinggal'];

$response = [];



try{

  if($email !='' && $password != '' && $namalengkap != '' && $nik !='' && $tempattinggal != '' && $nomorhp !='' ){


    // UPLOAD IMAGE BEGIN
    $target_dir = "images/";
    $target_file = $target_dir .rand(999,9999). basename($_FILES["image"]["name"]);
    $uploadOk = 1;
    $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));

    // Check if image file is a actual image or fake image
      $check = getimagesize($_FILES["image"]["tmp_name"]);
      if($check !== false ) {
        $uploadOk = 1;
      // move file img to server folder
        if(move_uploaded_file($_FILES['image']['tmp_name'], $target_file)){

            // Menyambung url
              $ip_server = 'http://10.0.2.2/';
              $folder_root = 'votingapp/';
              $url = $ip_server.$folder_root.$target_file;

              // Query insert
              $query = "INSERT INTO `users`(`email`, `password`, `nik`, `namalengkap`, `tempattinggal`, `nomorhp`, `imgurl`) VALUES ('$email','$password',$nik,'$namalengkap','$tempattinggal', '$nomorhp','$url')";
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
        $code['status'] = 'failed';
        $response['message'] = "File is not an image.";
      }

//  UPLOAD IMAGE ENDED

  } else {
    $response['status']= 'failed';
    $response['message']= 'Input tidak boleh kosong';
  }
}catch(mysqli_sql_exception $e){
  $response['status']= 'failed';
  $response['message'] = $e->getMessage();
}



$json = json_encode($response, JSON_PRETTY_PRINT);
echo $json;