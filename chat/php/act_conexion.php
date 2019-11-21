<?php

session_start();

if($_SESSION['id_detalle']){
    
    include('conexion.php');
    $respuesta=update_last_activity_user($_SESSION['id_detalle'],0,$conexion);
    if(!$respuesta){
    echo $respuesta;
    }
    return false;
}
else{
    
    header('Location:../index.php');
}

?>
