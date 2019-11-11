<?php

session_start();

if($_SESSION['id_usuario']){
    
    include('conexion.php');
    
    $update_conexion = $conexion->prepare("UPDATE login_details SET last_activity=now() WHERE login_details_id=?");
    $update_conexion->bindParam(1, $_SESSION['id_detalle'], PDO::PARAM_INT);

    if ($update_conexion->execute()) {
        echo "exitoso";
    } else {
        echo "algo fallo";
    }
    return false;
}
else{
    
    header('Location:../index.php');
}

?>
