<?php
// Incuir el archivo FB config
require_once 'fbConfig.php';

// Deshacer la sesión
unset($_SESSION['facebook_access_token']);

// Deshacer la información del usuario
unset($_SESSION['userData']);

// Redireccionar a página de inicio
header("Location:index.php");
?>