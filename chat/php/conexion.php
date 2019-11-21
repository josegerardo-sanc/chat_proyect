<?php

date_default_timezone_set("America/Mexico_City");
/*
$dns = "mysql:dbname=id11596109_chat;host=localhost;charset=utf8mb4";
$usuario = "id11596109_root";
$pass = "chat_";
$conexion="";

*/
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

session_start();

function checkUser($userData = array()){
    if(!empty($userData)){
        // Revisar si la información de usuario ya existe
        $prevQuery = "SELECT * FROM ".$this->userTbl." WHERE oauth_provider = '".$userData['oauth_provider']."' AND oauth_uid = '".$userData['oauth_uid']."'";
        $prevResult = $this->db->query($prevQuery);
        if($prevResult->num_rows > 0){
            // actualizar información si es que existe
            $query = "UPDATE ".$this->userTbl." SET first_name = '".$userData['first_name']."', last_name = '".$userData['last_name']."', email = '".$userData['email']."', gender = '".$userData['gender']."', locale = '".$userData['locale']."', picture = '".$userData['picture']."', link = '".$userData['link']."', modified = '".date("Y-m-d H:i:s")."' WHERE oauth_provider = '".$userData['oauth_provider']."' AND oauth_uid = '".$userData['oauth_uid']."'";
            $update = $this->db->query($query);
        }else{
            // Insertar información del usuario
            $query = "INSERT INTO ".$this->userTbl." SET oauth_provider = '".$userData['oauth_provider']."', oauth_uid = '".$userData['oauth_uid']."', first_name = '".$userData['first_name']."', last_name = '".$userData['last_name']."', email = '".$userData['email']."', gender = '".$userData['gender']."', locale = '".$userData['locale']."', picture = '".$userData['picture']."', link = '".$userData['link']."', created = '".date("Y-m-d H:i:s")."', modified = '".date("Y-m-d H:i:s")."'";
            $insert = $this->db->query($query);
        }
        
        // Tomar la información de la BD
        $result = $this->db->query($prevQuery);
        $userData = $result->fetch_assoc();
    }
    
    // return
    return $userData;
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

function update_last_activity_user($id_details,$type_user,$conexion){
    $update_conexion = $conexion->prepare("UPDATE login_details SET last_activity=now() WHERE login_details_id=? and type_user=?");
    $update_conexion->bindParam(1,$id_details,PDO::PARAM_INT);
    $update_conexion->bindParam(2,$type_user,PDO::PARAM_INT);

    if ($update_conexion->execute()) {
        return true;
    } else {
        return "algo fallo en la actualizacion de login_detail hora_";
    }
    
}


function status_conexion($user_id,$type_user, $connect)
{
    $status_="";
    $query = "
        SELECT last_activity FROM login_details 
        WHERE user_id = '$user_id' AND type_user='$type_user'
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


function Mensaje_Contador_NoVisto($from_user_id, $to_user_id, $connect,$type_conversacion)
{
	$query = "
	SELECT * FROM chat_message 
	WHERE (from_user_id = '$from_user_id' 
	AND to_user_id = '$to_user_id') 
	AND (status = '0' AND type_conversacion='$type_conversacion')";
    
    /*SELECT * FROM chat_message WHERE from_user_id = 1 AND to_user_id = 6 AND (status = 0 AND type_conversacion=2) */
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
    //type_conversacion
    //0 usuario 
    //1 grupo
    //2 anonimo
    
	if($type_usuario==1){
    $query = "SELECT * FROM `chat_message` WHERE to_user_id='$to_user_id' AND type_conversacion='1' AND status!='2'";
	$stament_historial = $conexion->prepare($query);
	$stament_historial->execute();
    }
    else{
    $stament_historial=$conexion->prepare("SELECT * FROM chat_message WHERE (type_conversacion='$type_usuario' AND status!=2) AND ((from_user_id=? AND to_user_id=?) OR (to_user_id=? AND from_user_id=?))");
    $stament_historial->bindParam(1,$from_user_id,PDO::PARAM_INT);
    $stament_historial->bindParam(2,$to_user_id,PDO::PARAM_INT);
    $stament_historial->bindParam(3,$from_user_id,PDO::PARAM_INT);
    $stament_historial->bindParam(4,$to_user_id,PDO::PARAM_INT);
    $stament_historial->execute();
    }
    
    $historia_html='';
    
    
    while($result=$stament_historial->fetch(PDO::FETCH_ASSOC)){
        
         $D=$result['from_user_id'];
         /*$query=$conexion->prepare("SELECT * FROM `login` WHERE id='$D'");
         $query->execute();
         $id_data_personal=$query->fetch(PDO::FETCH_ASSOC);
         */
         
        $style_chat='friend';
        if($from_user_id==$result['from_user_id'])
        {
            $NAME=search_name($type_usuario,$D,$conexion);
             $style_chat='self';
        }
        else{
             $NAME=search_name($type_usuario,$D,$conexion);
          }
        
        $html_img='';
        $html_style_='width:100%';
        
        if($type_usuario!="2"){
            $html_img='<img src="https://picsum.photos/200/200" class="user-photo" alt="">';
            $html_style_='';
        }
        
            $historia_html.='<div class="chat"><small class="chat_width-100 name_chat"> '.$NAME.'</small>'.$html_img.'';
            $historia_html.='<p class="small '.$style_chat.' chat-message" style="'.$html_style_.'">'.$result['chat_message'].'</p><p class="chat_width-100 fecha_chat">'.$result['timestamp'].'</p></div>';
            
        
        /*else{
            $historia_html.='<div class="chat">
            <small class="chat_width-100 name_chat"> '.$NAME.'</small>
            <img src="https://picsum.photos/200/200" class="user-photo" alt="">
            <p class="small friend chat-message">'.$result['chat_message'].'</p>
            <p class="chat_width-100 fecha_chat">'.$result['timestamp'].'</p>
            </div>';
            }*/
    }
    return $historia_html;
}

function search_name($type_usuario,$D,$conexion){
 if($type_usuario=="2"){
             $anonimo=$conexion->prepare("SELECT * FROM `anonimo` WHERE id_anonimo='$D'");
             $anonimo->execute();
             $data_anonimo=$anonimo->fetch(PDO::FETCH_ASSOC);
             $NAME=ucwords($data_anonimo['nombre'].' '.$data_anonimo['apellido_p']);
            }else{
                $query=$conexion->prepare("SELECT * FROM `login` WHERE id='$D'");
                $query->execute();
                $count =$query->rowCount();
	            $id_data_personal=$query->fetch(PDO::FETCH_ASSOC);
                $NAME=data_user_personal($id_data_personal['id_datos_personal'],$conexion);
              }
    return $NAME;
}

function MensajesVisto($from_user_id, $to_user_id, $conexion,$type_convers){
    $mensajes=$conexion->prepare("UPDATE chat_message SET status='1' WHERE ((to_user_id=? AND from_user_id=?) AND status='0') AND type_conversacion='$type_convers'");
    $mensajes->bindParam(1,$from_user_id,PDO::PARAM_INT);
    $mensajes->bindParam(2,$to_user_id,PDO::PARAM_INT);
    $mensajes->execute();
    
}
function MensajesVisto_grupo($numero_msj,$from_user,$id_grupo,$conexion){
    //status a 1 significa que el grupo pasa hacer visto!!!
    $mensajes=$conexion->prepare("UPDATE `participantes` SET `status`='1',`count_msj`='$numero_msj' WHERE (id_user='$from_user' AND id_grupo='$id_grupo') AND status!='2'");
    $mensajes->execute();
    
}

function is_type($from_user_id,$to_user_id,$conexion,$type_conversacion){

    $consul_type=$conexion->prepare("SELECT is_type FROM is_writing WHERE (from_user_id=? and to_user_id=?)and type_conversacion='$type_conversacion' ORDER BY id_writing DESC LIMIT 1");
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

function is_type_update($id_user,$conexion,$type_conversacion){
    
    $query=$conexion->prepare("UPDATE is_writing SET is_type='no' WHERE from_user_id='$id_user' and type_conversacion='$type_conversacion'");
    $query->execute();
}

function chat_history_original($type_usuario,$from_user_id, $to_user_id, $conexion)
{
    //type_conversacion
    //0 usuario 
    //1 grupo
    //2 anonimo
    
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
            $historia_html.='<div class="chat">
            <small class="chat_width-100 name_chat"> '.data_user_personal($id_data_personal['id_datos_personal'],$conexion).'</small>
            <img src="https://picsum.photos/200/200" class="user-photo" alt="">
            <p class="small self chat-message">'.$result['chat_message'].'</p>
            <p class="chat_width-100 fecha_chat">'.$result['timestamp'].'</p>
            </div>';
            
        }
        else{
            $historia_html.='<div class="chat">
            <small class="chat_width-100 name_chat"> '.data_user_personal($id_data_personal['id_datos_personal'],$conexion).'</small>
            <img src="https://picsum.photos/200/200" class="user-photo" alt="">
            <p class="small friend chat-message">'.$result['chat_message'].'</p>
            <p class="chat_width-100 fecha_chat">'.$result['timestamp'].'</p>
            </div>';
            }
    }
    return $historia_html;
}



/*ESTO ES PHP*/
