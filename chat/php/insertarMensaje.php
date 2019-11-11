<?php


include('conexion.php');
session_start();

if(empty($_POST['id'])&&empty($_POST['data_msj'])){
    echo "400";
}

$status=1;
$insert=$conexion->prepare("INSERT INTO chat_message (to_user_id, from_user_id, chat_message, status) VALUES(?,?,?,?)");
$insert->bindParam(1,$_POST['id'],PDO::PARAM_INT);
$insert->bindParam(2,$_SESSION['id_usuario'],PDO::PARAM_INT);
$insert->bindParam(3,$_POST['data_msj'],PDO::PARAM_STR);
$insert->bindParam(4,$status,PDO::PARAM_INT);

if($insert->execute()){
   
 $historial=chat_history($_SESSION['id_usuario'], $_POST['id'], $conexion);    
echo $historial;
    
}



?>
