<?php


session_start();
if(isset($_SESSION['id_usuario']))
{
    include('conexion.php');
    $data_users = $conexion->prepare("SELECT * FROM  login WHERE id!=?");
    $data_users->bindParam(1, $_SESSION['id_usuario'], PDO::PARAM_INT);
    $data_users->execute();
    $filas='';
    if($data_users->rowCount()>0)
    {
        $conectados_n=0;
        while($usuario=$data_users->fetch(PDO::FETCH_ASSOC)){
        $ultima_conexion='';   
        $fecha = strtotime(date("Y-m-d H:i:s") . '- 10 second');
        $fecha = date('Y-m-d H:i:s', $fecha);
        $n_mensajes=0;
        $clase_n_mensaje='';
        $is_type='';
        $is_type=is_type($usuario['id'],$_SESSION['id_usuario'],$conexion);    
        $status_usuario=status_conexion($usuario['id'],$conexion);    
        
            
        $nombre_completo_=data_user_personal($usuario['id_datos_personal'],$conexion);  
        $n_mensajes=Mensaje_Contador_NoVisto($usuario['id'],$_SESSION['id_usuario'],$conexion);
            if($n_mensajes>0){
                $clase_n_mensaje='n_mensaje';
            }
            if($status_usuario>$fecha){
                $status='Activo';
                $conectados_n++;
                //$ultima_conexion='activo';
            }else{
                $status='NoActivo';
                $ultima_conexion=$status_usuario;
                is_type_update($usuario['id'],$conexion);//si se desconecto entonce ya no esta escribiendo..
            }
            
            if($is_type=="yes" && $status=="Activo"){
            $is_type='<i class="far fa-comment-dots"></i>Escribiendo.....';
                }else{
                    $is_type='';
                }
            
        $filas.='
            <li class="item-user" data-status="'.$status.'" data-fecha="'.$ultima_conexion.'" data-n_mensaje="'.$n_mensajes.'" data-id="'.$usuario['id'].'" data-nombre="'.$nombre_completo_.'">
            <img src="https://picsum.photos/200/300" alt="">
                <a href="#" class="user">
                    <span class="is_type">
                        '.$is_type.'
                    </span>
                    '.$nombre_completo_.'
                    <span class="'.$clase_n_mensaje.'">'.$n_mensajes.'</span>
                </a>
                <span class="status_user '.$status.'">
                    <i class="fas fa-circle"></i>
                </span>
            </li>';   
        }
        
        $arreglo=["html"=>$filas,"conectados"=>$conectados_n];
        echo json_encode(array("data"=>$arreglo));
    }
    else{
        echo $filas;
        
    }
    
}
?>
