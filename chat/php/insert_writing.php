<?php
session_start();

include('conexion.php');

//elimar todos los posibles scribiendo si la persona presiona f5

if(isset($_SESSION['id_usuario'])){
    $my_session=$_SESSION['id_usuario'];
    }
    if(isset($_SESSION['id_anonimo'])){
    $my_session=$_SESSION['id_anonimo'];
}


if(isset($_POST['eliminar'])){
    
    $query=$conexion->prepare("UPDATE is_writing SET is_type='no' WHERE from_user_id='$my_session'");
    $query->execute();
    echo "remove all the is_type if(f5)";
    return false;
}

$index="";
$busqueda=false;
$friend=$_POST['id'];
$type_conversacion=$_POST['type_conversacion'];

if(isset($_SESSION['is_type'])){ 
    $datos="";
    foreach($_SESSION['is_type'] as $key=>$usuario)
    {
        if($usuario['id_usuario']==$friend && $usuario['type_conversacion']==$type_conversacion)
        {
            $busqueda=true;
            $index=$key;
            break;
        }
        
    }       
    //echo json_encode(array("update"=>$_SESSION['is_type'])); 
}
if($busqueda){
    
    $id_table=$_SESSION['is_type'][$index]['id_insert'];
    $update_type=$conexion->prepare("UPDATE is_writing SET is_type=? where (from_user_id=? and to_user_id=?) and (id_writing=? and type_conversacion=?)");

    $update_type->bindParam(1,$_POST['type'],PDO::PARAM_STR);
    $update_type->bindParam(2,$my_session,PDO::PARAM_INT);
    $update_type->bindParam(3,$friend,PDO::PARAM_INT);
    $update_type->bindParam(4,$id_table,PDO::PARAM_INT);
    $update_type->bindParam(5,$type_conversacion,PDO::PARAM_INT);
    if($update_type->execute()){
        if($_POST['type']=="yes"){
              
              $type_conversacion=isset($_SESSION['id_anonimo'])?2:$type_conversacion;
              MensajesVisto($my_session,$friend, $conexion,$type_conversacion);
              echo "actualizado".$_POST['type'];
        }
        
    }
    //$data=$update_type->fetch(PDO::FETCH_ASSOC);
    //echo json_encode($data);    
}
else{
    $insert_type=$conexion->prepare("INSERT INTO is_writing(from_user_id,to_user_id,is_type,type_conversacion) values(?,?,?,?)");
    $insert_type->bindParam(1,$my_session,PDO::PARAM_INT);
    $insert_type->bindParam(2,$friend,PDO::PARAM_INT);
    $insert_type->bindParam(3,$_POST['type'],PDO::PARAM_STR);
    $insert_type->bindParam(4,$type_conversacion,PDO::PARAM_INT);
    if($insert_type->execute()){
    $_SESSION['is_type'][]=["id_insert"=>$conexion->lastInsertId(),"id_usuario"=>$friend,"type_conversacion"=>$type_conversacion]; 
    echo json_encode(array("insert"=>$_SESSION['is_type']));
    }
    
}





?>
