<?php

session_start();

if(isset($_SESSION['id_usuario']))
{
   
    include('conexion.php');
    $usuario_friend=$_POST['usuario'];
    $my_usuario=$_SESSION['id_usuario'];
    
    $decision="SiNumero_msj";
    if($_POST['tipo_consult']=='1')
    {
        MensajesVisto($my_usuario, $usuario_friend, $conexion);
        $decision="NoNumero_msj";
        
    }    
       
        $ultima_conexion="";
        $status="";
        
        $fecha = strtotime(date("Y-m-d H:i:s") . '- 10 second');
        $fecha = date('Y-m-d H:i:s', $fecha);
        $history=chat_history($my_usuario, $usuario_friend, $conexion);   
        $conexion_status=status_conexion($usuario_friend, $conexion);
        $is_writing=is_type($usuario_friend,$my_usuario,$conexion);
    
        if($conexion_status>$fecha){
                $status='Activo';
            }else{
                $status='NoActivo';
                $ultima_conexion=$conexion_status;
                $is_writing='no';
            }
        
     
      $n_mensaje=Mensaje_Contador_NoVisto($usuario_friend,$my_usuario, $conexion);
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
