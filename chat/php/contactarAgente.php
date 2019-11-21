<?php
include('conexion.php');
session_start();


if($_POST['action']=="finalizar_chat"){
    unset($_SESSION['id_anonimo']);
    echo "chat finalizado";
}



if($_POST['action']=="inset_anonimo"){

if(isset($_POST['usuario'])&& isset($_POST['nombre']))
{
    
     if(!empty($_POST['usuario'])&&!empty($_POST['nombre'])&&!empty($_POST['paterno'])&&!empty($_POST['materno'])){
          
         
          $usuario=trim($_POST['usuario']);
          $nombre=trim($_POST['nombre']);
          $paterno=trim($_POST['paterno']);
          $materno=trim($_POST['materno']);
          
         
        //true es xq se inserto con exito
       $respuesta_insert=insertar_anonimo($usuario,$nombre,$paterno,$materno,$conexion);
       $arreglo=["datos"=>true];
       }
    else{
        //si datos es false es por su valores son vacios!!!
        $arreglo=["datos"=>false];
    }

    echo json_encode(array("data"=>$arreglo));    
}
else{
 header('Location:../index.php');
}

}


if($_POST['action']=="update_status"){
    $respuesta=update_last_activity_user($_SESSION['id_detalle'],2,$conexion);
    if(!$respuesta){
        echo $respuesta;
    }
}

if($_POST['action']=="busqueda_agente"){
    
    //status
    //o no atendido
    //1 atendido
    //2 finalizado conversacion
    
    $id_anonimo=$_SESSION['id_anonimo'];//reprenta a cliente
    
    $consult_anonimo=$conexion->prepare("SELECT * FROM `anonimo` WHERE id_anonimo='$id_anonimo'");
    $consult_anonimo->execute();
    
    $row=$consult_anonimo->fetch(PDO::FETCH_ASSOC);
    $status=$row['status'];
    $id_user=$row['id_user'];//reprenta al agente 
    $type_conversacion=$_POST['type_conversacion'];
    $status_contenido=0;
    $nombre_agente='';
    $mensaje='';
    $ultima_conexion='';
    $is_writing='';
    $status_conexion='';
    if($status!='0' && $id_user!="0")
    {
        $decision="SiNumero_msj";
        $nombre_agente= data_user_personal($id_user,$conexion);
        $status_contenido=1;
        $fecha = strtotime(date("Y-m-d H:i:s") . '- 10 second');
        $fecha = date('Y-m-d H:i:s', $fecha);
        $mensaje=chat_history(2,$_SESSION['id_anonimo'], $id_user, $conexion);
        $conexion_status=status_conexion($id_user,'0', $conexion);
        $is_writing=is_type($id_user,$id_anonimo,$conexion,$type_conversacion);      
        $n_mensaje=Mensaje_Contador_NoVisto($id_user,$id_anonimo, $conexion,$type_conversacion);
    
    if($conexion_status>$fecha){
        $status_conexion='Activo';
    }else{
        $status_conexion='NoActivo';
        $ultima_conexion=$conexion_status;
        $is_writing='no';
    } 
    


    }
    $conversaion_finalizada=0;
    if($status=='2')
    {
    $conversaion_finalizada=2;
    }
    /*$mensaje='<div class="chat">
                    <small class="chat_width-100 name_chat">'.$nombre_agente.'</small>
                    <p class="small friend chat-message" style="width:100%;">Hola '.ucwords($row['nombre'].' '.$row['apellido_p']).' ¿En que te puedo ayudarte?</p>
                    <p class="chat_width-100 fecha_chat">19/08/2019</p>
                </div>';*/
    
    //2 reprenta el numero de conversacion que es anonimo
    
    $arreglo=[
      "html"=>$mensaje,
      "id_agente"=>$id_user,    
      "agente"=>$nombre_agente,
      "status_agente"=>$status_contenido,//saber si se muestra el chat
      "conv_finalizada"=>$conversaion_finalizada,//status de la conversacion 0,1,2
      "is_type"=>$is_writing,
      "ultima_conexion"=>$ultima_conexion,
      "conexion"=>$status_conexion,
      "mostrar"=>$decision,
      "contador"=>$n_mensaje
    ];
    echo json_encode(array("data"=>$arreglo));  
}


function insertar_anonimo($usuario,$nombre,$paterno,$materno,$conexion){
    $query_insert=$conexion->prepare("INSERT INTO `anonimo`(`nombre`, `apellido_p`, `apellido_m`, `correo`) VALUES (?,?,?,?)");
    $query_insert->bindParam(1,$nombre,PDO::PARAM_STR);
    $query_insert->bindParam(2,$paterno,PDO::PARAM_STR);
    $query_insert->bindParam(3,$materno,PDO::PARAM_STR);
    $query_insert->bindParam(4,$usuario,PDO::PARAM_STR);
    $respuesta=false;
    if($query_insert->execute()){
      $respuesta=true;
      $_SESSION['id_anonimo']=$conexion->lastInsertId();        
      $_SESSION['name_anonimo']=ucwords($nombre);        
        
      $insertDetails = $conexion->prepare('INSERT INTO login_details(user_id,type_user) VALUES(?,?)');
                $type_user=2;
                $insertDetails->bindParam(1,$_SESSION['id_anonimo'],PDO::PARAM_INT);
                $insertDetails->bindParam(2,$type_user,PDO::PARAM_INT);
			    $insertDetails->execute();
                $_SESSION['id_detalle'] = $conexion->lastInsertId();
                $respuesta=true;  
    }
    return $respuesta;
    
}

?>
