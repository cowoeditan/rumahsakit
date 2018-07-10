<?php
require_once "../_config/config.php";

mysqli_query($con, "DELETE FROM tb_rekammedis WHERE id_rm='$_GET[id]'") or die (mysqli_error());
echo "<script>window.location='data.php'</script>";
?>