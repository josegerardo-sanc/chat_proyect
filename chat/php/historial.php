<?php

session_start();

if(isset($_SESSION['id_usuario']))
{
    
    include('conexion.php');
    $usuario_friend=$_POST['usuario'];
    
    if(isset($_SESSION['id_usuario'])){
    $my_usuario=$_SESSION['id_usuario'];    
    }
    
    if(isset($_SESSION['id_anonimo'])){
    $my_usuario=$_SESSION['id_anonimo'];    
    }
    
    
    $type_usuario=$_POST['tipo_conversacion'];
    $decision="SiNumero_msj";
    if($_POST['tipo_consult']=='1')
    {
        MensajesVisto($my_usuario, $usuario_friend, $conexion,$type_usuario);
        $decision="NoNumero_msj";
    }    
        $ultima_conexion="";
        $status="";
        $fecha = strtotime(date("Y-m-d H:i:s") . '- 10 second');
        $fecha = date('Y-m-d H:i:s', $fecha);
        $is_writing='no entramos';

        $history=chat_history($type_usuario,$my_usuario, $usuario_friend,$conexion); 
        $conexion_status=status_conexion($usuario_friend,$type_usuario, $conexion);
        $n_mensaje=Mensaje_Contador_NoVisto($usuario_friend,$my_usuario, $conexion,$type_usuario);
    
        if($type_usuario==2){
            $type_usuario=0;
        }
        $is_writing=is_type($usuario_friend,$my_usuario,$conexion,$type_usuario);
        if($conexion_status>$fecha){
                $status='Activo';
            }else{
                $status='NoActivo';
                $ultima_conexion=$conexion_status;
                $is_writing='no';
            }
        
      $array = [
            "historial" => $history,
            "contador" => $n_mensaje,
            "conexion"=>$status,
            "fecha"=>$ultima_conexion,
            "mostrar"=>$decision,
            "is_type"=>$is_writing
        ];
        
    echo json_encode(array("data"=>$array));
    
           
    //echo $history;
}
?>
