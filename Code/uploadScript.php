<?php
$target_dir = "/var/www/html/wordpress/uploads/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$tmp_name = $_FILES["fileToUpload"]["tmp_name"];
$uploadOk = 1;
move_uploaded_file($tmp_name, $target_file);
echo "The file ". htmlspecialchars( basename( $_FILES["fileToUpload"]["name"])). " has been uploaded.";
header("Location: http://wordpress.site/dev/upload.php?msg=Done");
?>
