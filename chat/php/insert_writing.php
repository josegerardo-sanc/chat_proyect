<?php
session_start();

include('conexion.php');

$index="";
$busqueda=false;
if(isset($_SESSION['is_type'])){ 
    $datos="";
    foreach($_SESSION['is_type'] as $key=>$usuario)
    {
        if($usuario['id_usuario']==$_POST['id'])
        {
            $busqueda=true;
            $index=$key;
            break;
        }
        
    }
    //echo json_encode(array("update"=>$_SESSION['is_type'])); 
}if($busqueda){
    
    $id_table=$_SESSION['is_type'][$index]['id_insert'];
    $update_type=$conexion->prepare("UPDATE is_writing SET is_type=? where (from_user_id=? and to_user_id=?) and id_writing=?");

    $update_type->bindParam(1,$_POST['type'],PDO::PARAM_STR);
    $update_type->bindParam(2,$_SESSION['id_usuario'],PDO::PARAM_INT);
    $update_type->bindParam(3,$_POST['id'],PDO::PARAM_INT);
    $update_type->bindParam(4,$id_table,PDO::PARAM_INT);
    if($update_type->execute()){
        if($_POST['type']=="yes"){
              MensajesVisto($_SESSION['id_usuario'],$_POST['id'], $conexion);
              echo "actualizado".$_POST['type'];
        }
        
    }
    //$data=$update_type->fetch(PDO::FETCH_ASSOC);
    //echo json_encode($data);    
}else{
    $insert_type=$conexion->prepare("INSERT INTO is_writing(from_user_id,to_user_id,is_type) values(?,?,?)");
    $insert_type->bindParam(1,$_SESSION['id_usuario'],PDO::PARAM_INT);
    $insert_type->bindParam(2,$_POST['id'],PDO::PARAM_INT);
    $insert_type->bindParam(3,$_POST['type'],PDO::PARAM_STR);

    if($insert_type->execute()){
    $_SESSION['is_type'][]=["id_insert"=>$conexion->lastInsertId(),"id_usuario"=>$_POST['id']];    
    echo json_encode(array("insert"=>$_SESSION['is_type']));
    }
    
}





?>
