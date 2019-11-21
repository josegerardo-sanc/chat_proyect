<?php

if(isset($_POST['action'])){
include('conexion.php');
session_start();


if($_POST['action']=="finalizar_conver"){
    
     $respuesta="error al intentar  finalizar conversacion el cliente__";
     $id_anonimo=$_POST['id'];
     $query="UPDATE `anonimo` SET `status`='2' WHERE id_anonimo='$id_anonimo'"; 
     $ejecutar=$conexion->prepare($query);
       if($ejecutar->execute())
       {
         $respuesta="conversacion finalizada";  
       }
     echo $respuesta;
    return false;
}    
    
    
if($_POST['action']=="load_lista_anonimo"){
    $data=$conexion->prepare("SELECT * FROM `anonimo` WHERE status='0' AND id_user='0' ORDER BY id_anonimo DESC");
    $data->execute();
    
    $html='';
    $n_anonimos='';
    while($row=$data->fetch(PDO::FETCH_ASSOC)){
        
        $status_Espera='';
        $ultima_conexion="";
        $status="";
        $fecha = strtotime(date("Y-m-d H:i:s") . '- 10 second');
        $fecha = date('Y-m-d H:i:s', $fecha);
        $type_usuario=0;
        //$history=chat_history($type_usuario,$my_usuario, $usuario_friend,$conexion);   
        $conexion_status=status_conexion($row['id_anonimo'],2, $conexion);
        if($conexion_status>$fecha){
                $status='Activo';
                $n_anonimos++;
                $status_Espera='Atender....';
            }else{
                $status='NoActivo';
                $ultima_conexion=$conexion_status;
                $is_writing='no';
                $status_Espera='No Atendido';

            }
        
        $html.='<li class="item_grupo_event item_anonimo" data-fecha="'.$ultima_conexion.'" data-conexion="'.$status.'" data-nombre="'.ucwords($row['nombre']).'" data-id="'.$row['id_anonimo'].'">
                        '.ucwords($row['nombre'].' '.$row['apellido_p']).'
                        <small class="conexion_ '.$status.'">
                            <i class="fas fa-circle"></i>
                        </small>
                        <small class="status_grupo"><small>'.$status_Espera.'</small><small>'.$ultima_conexion.'</small></small>
                    </li>';
                }
    if($html==''){
        $html='<li class="item_grupo_event">
                    No se encontaron resultados
                </li>';
    }
    $arreglo=[
        "html"=>$html,
        "anonimo_call"=>$n_anonimos
    ];
    echo json_encode(array("data"=>$arreglo));
}    
    

if($_POST['action']=="load_lista_anonimo_ul"){

    $id_session=$_SESSION['id_usuario'];
    $data=$conexion->prepare("SELECT * FROM `anonimo` WHERE status='1' AND id_user='$id_session' ORDER BY id_anonimo DESC");
    $data->execute();
    
    $html='';
    $n_anonimos='';
    while($row=$data->fetch(PDO::FETCH_ASSOC)){
        
        $status_Espera='';
        $ultima_conexion="";
        $status="";
        $fecha = strtotime(date("Y-m-d H:i:s") . '- 10 second');
        $fecha = date('Y-m-d H:i:s', $fecha);
        $is_type='';
        $clase_n_mensaje='';
        $is_type=is_type($row['id_anonimo'],$_SESSION['id_usuario'],$conexion,'2');        
        $conexion_status=status_conexion($row['id_anonimo'],2, $conexion);
        //$is_writing=is_type($usuario_friend,$my_usuario,$conexion);     
        $n_mensajes=Mensaje_Contador_NoVisto($row['id_anonimo'],$_SESSION['id_usuario'],$conexion,2);
            if($n_mensajes>0){
                $clase_n_mensaje='n_mensaje';
            }
        if($conexion_status>$fecha){
                $status='Activo';
            }else{
                $status='NoActivo';
                $ultima_conexion=$conexion_status;
                $is_writing='no';
                $status_Espera='Ultima conexion';
                is_type_update($row['id_anonimo'],$conexion,0);
            }
            if($is_type=="yes" && $status=="Activo"){
                $is_type='<i class="far fa-comment-dots"></i>Escribiendo.....';
                    }else{
                        $is_type='';
                    }
        
        $html.='<li class="item_anonimo_ul" data-fecha="'.$ultima_conexion.'" data-conexion="'.$status.'" data-nombre="'.ucwords($row['nombre']).'" data-id="'.$row['id_anonimo'].'"><a href="#" class="user">
        <span class="is_type">
            '.$is_type.'
        </span>'.ucwords($row['nombre'].' '.$row['apellido_p']).'
        <span class="'.$clase_n_mensaje.'">'.$n_mensajes.'</span>
        </a><span class="status_user '.$status.'"><i class="fas fa-circle"></i></span></li>';
        }
    if($html==''){
        $html='<li class="item_grupo_event">
                    No se encontaron resultados
                </li>';
    }
    $arreglo=[
        "html"=>$html
    ];
    echo json_encode(array("data"=>$arreglo));
}    

if($_POST['action']=="update_anonimo"){

    $id_anonimo=trim($_POST['id_anonimo']);
    $id_session=$_SESSION['id_usuario'];
    $update_anonimo=$conexion->prepare("UPDATE `anonimo` SET `status`='1',`id_user`='$id_session' WHERE status='0' AND id_anonimo='$id_anonimo'");
    if($update_anonimo->execute()){
      echo "actualizado con exito";
    }
}

}else{
    //header('Location:');
    
}






?>
