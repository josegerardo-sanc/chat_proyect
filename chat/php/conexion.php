<?php

date_default_timezone_set("America/Mexico_City");

$dns = "mysql:dbname=chat;host=localhost;charset=utf8mb4";
$usuario = "root";
$pass = "";
$conexion="";


try {
    $conexion = new PDO($dns, $usuario, $pass);
    //echo 'Conectado a '.$conexion->getAttribute(PDO::ATTR_CONNECTION_STATUS);
    return $conexion;
} catch (PDOExeption $e) {
    echo  "conexion fallida" . $e->getMessage();
    exit();
}

function data_user_personal($usuario_id,$conexion){
  
	$data_user=$conexion->prepare("SELECT * FROM datospersonales WHERE id_datos_personal='$usuario_id' ");
	$data_user->execute();
	$dato=$data_user->fetch(PDO::FETCH_ASSOC);

	$nombre_completo=ucwords($dato['nombre'].' '.$dato['ap_paterno']);
    return $nombre_completo;

}

function fetch_is_type_status($user_id, $connect)
{
	$query = "
	SELECT is_type FROM login_details 
	WHERE user_id = '".$user_id."' 
	ORDER BY last_activity DESC 
	LIMIT 1";	
	$statement = $connect->prepare($query);
	$statement->execute();
	$result = $statement->fetchAll();
	$output = '';
	foreach($result as $row)
	{
		if($row["is_type"] == 'yes')
		{
			$output = '<span class="small text-muted">  Escribiendo...</span>';
		}
	}
	return $output;
}

function status_conexion($user_id, $connect)
{
    $status_="";
    $query = "
        SELECT last_activity FROM login_details 
        WHERE user_id = '$user_id' 
        ORDER BY last_activity DESC 
        LIMIT 1";

    $statement = $connect->prepare($query);
    $statement->execute();
    $result = $statement->fetch(PDO::FETCH_ASSOC);
    
    if($result['last_activity']!=null){
        $status_= $result['last_activity'];
        }
    return $status_;
    
}


function Mensaje_Contador_NoVisto($from_user_id, $to_user_id, $connect)
{
	$query = "
	SELECT * FROM chat_message 
	WHERE (from_user_id = '$from_user_id' 
	AND to_user_id = '$to_user_id') 
	AND (status = '0' AND type_conversacion='0')";
	$statement = $connect->prepare($query);
	$statement->execute();
	$count = $statement->rowCount();
	$output = '';
    
	if($count>0){
        $output=$count;
    }
	return $output;
}

function Mensaje_Contador_NoVisto_grupo($from_user,$to_user_id, $connect)
{
	$query = "
	SELECT * FROM chat_message 
	WHERE (to_user_id = '$to_user_id' AND from_user_id!='$from_user') 
	AND type_conversacion='1'";
	$statement = $connect->prepare($query);
	$statement->execute();
	$count = $statement->rowCount();
	$output =0;
    
	if($count>0){
        $output=$count;
    }
	return $output;
}

function Mensaje_participantes_grupo($id_grupo,$id_user,$connect)
{  
	$query = "SELECT * FROM `participantes` WHERE id_grupo='$id_grupo' AND id_user='$id_user'";
	$statement = $connect->prepare($query);
	$statement->execute();
	$output=0;
    
	$result = $statement->fetch(PDO::FETCH_ASSOC);
    
    if($result['count_msj']>0){
      $output=$result['count_msj'];
    }
	return $output;
}

function chat_history($type_usuario,$from_user_id, $to_user_id, $conexion)
{
    //status
    //0 nuevo
    //1 visto
    //2 salio del grupo // 2 lo sacaron del grupo
    
	if($type_usuario==1){
    
    $query = "SELECT * FROM `chat_message` WHERE to_user_id='$to_user_id' AND type_conversacion='1' AND status!='2'";
	$stament_historial = $conexion->prepare($query);
	$stament_historial->execute();
    
    }
    else{
    $stament_historial=$conexion->prepare('SELECT * FROM chat_message WHERE (type_conversacion=0 AND status!=2) AND (from_user_id=? AND to_user_id=?) OR (to_user_id=? AND from_user_id=?)');
    $stament_historial->bindParam(1,$from_user_id,PDO::PARAM_INT);
    $stament_historial->bindParam(2,$to_user_id,PDO::PARAM_INT);
    $stament_historial->bindParam(3,$from_user_id,PDO::PARAM_INT);
    $stament_historial->bindParam(4,$to_user_id,PDO::PARAM_INT);
    $stament_historial->execute();
    }
    
    $historia_html='';
    
    while($result=$stament_historial->fetch(PDO::FETCH_ASSOC)){
        
        $D=$result['from_user_id'];
         $query=$conexion->prepare("SELECT * FROM `login` WHERE id='$D'");
         $query->execute();
         $id_data_personal=$query->fetch(PDO::FETCH_ASSOC);
       
        if($from_user_id==$result['from_user_id'])
        {
            $historia_html.='<div class="estilo_prueba">
            <small style="display:block; width:100%; color:#277548;">'.data_user_personal($id_data_personal['id_datos_personal'],$conexion).'</small>
            <div class="chat">
            <img src="https://picsum.photos/200/200" class="user-photo" alt="">
            <p class="small self chat-message">'.$result['chat_message'].'</p>
            </div>
            <span class="fecha fecha-self">'.$result['timestamp'].'</span>
            </div>';
            
        }
        else{
            $historia_html.='<div class="estilo_prueba">
            <small style="display:block; width:100%; color:red;">'.data_user_personal($id_data_personal['id_datos_personal'],$conexion).'</small>
            <div class="chat">
            <img src="https://picsum.photos/200/200" class="user-photo" alt="">
            <p class="small friend chat-message">'.$result['chat_message'].'</p>
            </div>
            <p class="fecha fecha-friend">'.$result['timestamp'].'</p>
            </div>';
        }
    }
    return $historia_html;
}

function MensajesVisto($from_user_id, $to_user_id, $conexion){
    $mensajes=$conexion->prepare("UPDATE chat_message SET status='1' WHERE ((to_user_id=? AND from_user_id=?) AND status='0')");
    $mensajes->bindParam(1,$from_user_id,PDO::PARAM_INT);
    $mensajes->bindParam(2,$to_user_id,PDO::PARAM_INT);
    $mensajes->execute();
    
}
function MensajesVisto_grupo($numero_msj,$from_user,$id_grupo,$conexion){
    //status a 1 significa que el grupo pasa hacer visto!!!
    $mensajes=$conexion->prepare("UPDATE `participantes` SET `status`='1',`count_msj`='$numero_msj' WHERE (id_user='$from_user' AND id_grupo='$id_grupo') AND status!='2'");
    $mensajes->execute();
    
}

function is_type($from_user_id,$to_user_id,$conexion){

    $consul_type=$conexion->prepare("SELECT is_type FROM is_writing WHERE from_user_id=? and to_user_id=? ORDER BY id_writing DESC LIMIT 1");
    $consul_type->bindParam(1,$from_user_id,PDO::PARAM_INT);
    $consul_type->bindParam(2,$to_user_id,PDO::PARAM_INT);
    $consul_type->execute();
    $Is_Type='';
    if($consul_type->rowCount()>0){
         $data=$consul_type->fetch(PDO::FETCH_ASSOC);
         $Is_Type=$data['is_type'];
       }
    return $Is_Type;
}

function is_type_update($id_user,$conexion){
    
    $query=$conexion->prepare("UPDATE is_writing SET is_type='no' WHERE from_user_id='$id_user'");
    $query->execute();
}


function chat_history_grupo(){
    
    
    
}





















/*ESTO ES PHP*/
