<?php
require_once 'db_connection.php';



// UPLOAD IMAGE BEGIN
$ip_server = 'http://10.0.2.2/';
$folder_root = 'votingapp/';

$target_dir = "image/";
$target_file = $target_dir .rand(999,9999). basename($_FILES["uploadfile"]["name"]);
$uploadOk = 1;
$imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
// Check if image file is a actual image or fake image
  $check = getimagesize($_FILES["uploadfile"]["tmp_name"]);
  if($check !== false) {
    // echo "File is an image - " . $check["mime"] . ".";
    $uploadOk = 1;

    if(move_uploaded_file($_FILES['uploadfile']['tmp_name'], $target_file)){
         echo "The file ". htmlspecialchars( basename( $_FILES["fileToUpload"]["name"])). " has been uploaded.";
         $url = $ip_server.$folder_root.$target_file;
        $query = "INSERT INTO `imagess`( `fileurl`) VALUES ('$url')";

        $execute = mysqli_query($dbConnection,$query);
        //  echo $execute;

        if ($execute) {
         echo 'sukses';
        } else {
            echo 'gagal';
        }
    } else {
    echo "Sorry, there was an error uploading your file.";
  }


  } else {
    echo "File is not an image.";
    $uploadOk = 0;
  }

//  UPLOAD IMAGE ENDED

?>