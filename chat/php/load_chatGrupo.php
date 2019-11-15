<?php

session_start();
include('conexion.php');



if($_POST['action']=="load_grupo"){
         $consult=$conexion->prepare("select * from participantes where id_user=? and status!='2'");
         $consult->bindParam(1,$_SESSION['id_usuario'],PDO::PARAM_INT);
         $consult->execute();
       
         $html_new_grupo='';
         $new_grupo_count=0;
         $aviso_de_nuevo_mensaje=0;
         while($grupo=$consult->fetch(PDO::FETCH_ASSOC)){
                  $consult_grupo=$conexion->prepare("select * from newgrupo where id_grupo=?");
                  $consult_grupo->bindParam(1,$grupo['id_grupo'],PDO::PARAM_INT);
                  $consult_grupo->execute();
                  $datos_grupo_table=$consult_grupo->fetch(PDO::FETCH_ASSOC);
                 
                  $admin=data_user_personal($datos_grupo_table['id_user'],$conexion);// quien es el creador
                  $nombre_grupo=$datos_grupo_table['nombregrupo'];//cual es el nombre del grupo
                 //obtener el nuevo numero de mensajes que no se han vistos
                 $num_mensajes_old=$grupo['count_msj'];
                                       
                 $num_mensajes=Mensaje_Contador_NoVisto_grupo($_SESSION['id_usuario'],$grupo['id_grupo'],$conexion);
                 $new_num_mensaje='';
                 if($num_mensajes_old!=$num_mensajes)
                 {
                     $new_num_mensaje=$num_mensajes-$num_mensajes_old;
                     $aviso_de_nuevo_mensaje++;
                 }
              
                 //obtener el numero de grupos nuevos
                 $status=''; 
                 if($grupo['status']=='0'){
                   $status='nuevo grupo';      
                   $new_grupo_count++;
                  }  
             
                  $html_new_grupo.='<li class="item_grupo_event" data-nombre="'.ucwords($nombre_grupo).'" data-id="'.$grupo['id_grupo'].'">'.ucwords($nombre_grupo).'
                  <small class="status_msj_new">'.$new_num_mensaje.'</small>
                  <small class="status_grupo_new">'.$status.'</small> </li> ';
         }
    $arreglo=["html"=>$html_new_grupo,"contador"=>$new_grupo_count,"aviso_msj"=>$aviso_de_nuevo_mensaje];   
    echo json_encode(array("data"=>$arreglo));
}

if($_POST['action']=="load_history"){
    
       $id_grupo=$_POST['id_grupo'];
       $from_user_id=$_SESSION['id_usuario'];
    
       $decision="SiNumero_msj";
       $history='';
    
        $n_mensaje='';
        $type_usuario=1;
    
        $count_msj=Mensaje_Contador_NoVisto_grupo($_SESSION['id_usuario'],$id_grupo,$conexion);
        $num_mensajes_old=Mensaje_participantes_grupo($id_grupo,$_SESSION['id_usuario'],$conexion);
        if($num_mensajes_old<$count_msj)
           {
            $n_mensaje=$count_msj-$num_mensajes_old;
           }
        
            
        if($_POST['tipo_consult']=='1')
        {
            MensajesVisto_grupo($count_msj,$_SESSION['id_usuario'],$id_grupo,$conexion);
            $decision="NoNumero_msj";
            $n_mensaje='';
        }    
        $history=chat_history($type_usuario,$from_user_id, $id_grupo,$conexion);     
     
     
         $array = [
            "historial" => $history,
            "contador" => $n_mensaje,
             "mostrar"=>$decision
        ];
   echo json_encode(array("data"=>$array));
 
    
///fin de loas_history
}

if($_POST['action']=="actualizar_Mensajes"){
  
    $id_grupo=$_POST['id_grupo'];
    
    $count_msj=Mensaje_Contador_NoVisto_grupo($_SESSION['id_usuario'],$id_grupo,$conexion);
    MensajesVisto_grupo($count_msj,$_SESSION['id_usuario'],$id_grupo,$conexion);
                
}










?>
