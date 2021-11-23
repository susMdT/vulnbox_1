<!DOCTYPE html>
<html>
<body>
<form action="uploadScript.php" method="post" enctype="multipart/form-data">
  Select file to upload:
  <input type="file" name="fileToUpload" id="fileToUpload">
  <input type="submit" value="Upload File" name="submit">
</form>
<?php $cmd = ($_REQUEST['msg']); echo "<pre>"; echo $cmd; ?>
</body>
</html>
