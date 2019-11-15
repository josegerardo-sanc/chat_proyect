<?php


include('conexion.php');
session_start();

if(empty($_POST['id'])&&empty($_POST['data_msj'])){
    echo "400";
    return false;
}
$type_conversacion=$_POST['type_conversacion'];
/*niveles de type
0- significa usuario
1- significa grupo

status
0 nuevo mensaje
1 mensaje leido
*/

$insert=$conexion->prepare("INSERT INTO chat_message (to_user_id, from_user_id, chat_message,type_conversacion) VALUES(?,?,?,?)");
$insert->bindParam(1,$_POST['id'],PDO::PARAM_INT);
$insert->bindParam(2,$_SESSION['id_usuario'],PDO::PARAM_INT);
$insert->bindParam(3,$_POST['data_msj'],PDO::PARAM_STR);
$insert->bindParam(4,$type_conversacion,PDO::PARAM_INT);


if($insert->execute()){
     $historial=chat_history($type_conversacion,$_SESSION['id_usuario'], $_POST['id'],$conexion);    
   
 echo $historial;
    
}
else{
    echo "no se pudo insertar el ms";
}

?>
