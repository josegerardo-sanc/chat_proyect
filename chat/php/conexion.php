<?php

date_default_timezone_set("America/Mexico_City");

$dns = "mysql:dbname=chat;host=localhost;charset=utf8mb4";
$usuario = "root";
$pass = "";
try {
    $conexion = new PDO($dns, $usuario, $pass);
    //echo 'Conectado a '.$conexion->getAttribute(PDO::ATTR_CONNECTION_STATUS);
    return $conexion;
} catch (PDOExeption $e) {
    echo  "conexion fallida" . $e->getMessage();
    exit();
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
	WHERE from_user_id = '$from_user_id' 
	AND to_user_id = '$to_user_id' 
	AND status = '1'";
	$statement = $connect->prepare($query);
	$statement->execute();
	$count = $statement->rowCount();
	$output = '';
    
	if($count>0){
        $output=$count;
    }
	return $output;
}

function chat_history($from_user_id, $to_user_id, $conexion)
{
	
    $stament_historial=$conexion->prepare('SELECT * FROM chat_message WHERE (from_user_id=? AND to_user_id=?) OR (to_user_id=? AND from_user_id=?)');
    $stament_historial->bindParam(1,$from_user_id,PDO::PARAM_INT);
    $stament_historial->bindParam(2,$to_user_id,PDO::PARAM_INT);
    $stament_historial->bindParam(3,$from_user_id,PDO::PARAM_INT);
    $stament_historial->bindParam(4,$to_user_id,PDO::PARAM_INT);
    
    $stament_historial->execute();
    $historia_html='';
    
    while($result=$stament_historial->fetch(PDO::FETCH_ASSOC)){
       
        if($from_user_id==$result['from_user_id'])
        {
            $historia_html.='<div class="estilo_prueba">
            <div class="chat">
            <img src="https://picsum.photos/200/200" class="user-photo" alt="">
            <p class="small self chat-message">'.$result['chat_message'].'</p>
            </div>
            <span class="fecha fecha-self">'.$result['timestamp'].'</span>
            </div>';
            
        }
        else{
            $historia_html.='<div class="estilo_prueba">
            <div class="chat">
            <img src="https://picsum.photos/200/200" class="user-photo" alt="">
            <p class="small friend chat-message">'.$result['chat_message'].'</p>
            </div>
            <span class="fecha fecha-friend">'.$result['timestamp'].'</span>
            </div>';
        }
    }
    return $historia_html;
}

function MensajesVisto($from_user_id, $to_user_id, $conexion){
    $mensajes=$conexion->prepare("UPDATE chat_message SET status='0' WHERE ((to_user_id=? AND from_user_id=?) AND status='1')");
    $mensajes->bindParam(1,$from_user_id,PDO::PARAM_INT);
    $mensajes->bindParam(2,$to_user_id,PDO::PARAM_INT);
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

function fetch_group_chat_history($connect)
{
	$query = "
	SELECT * FROM chat_message 
	WHERE to_user_id = '0'  
	ORDER BY timestamp DESC
	";

	$statement = $connect->prepare($query);

	$statement->execute();

	$result = $statement->fetchAll();

	$output = '<ul class="list-unstyled">';
	foreach($result as $row)
	{
		$user_name = '';
		$dynamic_background = '';
		$chat_message = '';
		if($row["from_user_id"] == $_SESSION["user_id"])
		{
			if($row["status"] == '2')
			{
				$chat_message = '<em>This message has been removed</em>';
				$user_name = '<b class="text-success">You</b>';
			}
			else
			{
				$chat_message = $row["chat_message"];
				$user_name = '<button type="button" class="btn btn-danger btn-xs remove_chat" id="'.$row['chat_message_id'].'">x</button>&nbsp;<b class="text-success">You</b>';
			}
			
			$dynamic_background = 'background-color:#ffe6e6;';
		}
		else
		{
			if($row["status"] == '2')
			{
				$chat_message = '<em>This message has been removed</em>';
			}
			else
			{
				$chat_message = $row["chat_message"];
			}
			$user_name = '<b class="text-danger">'.get_user_name($row['from_user_id'], $connect).'</b>';
			$dynamic_background = 'background-color:#ffffe6;';
		}

		$output .= '

		<li style="border-bottom:1px dotted #ccc;padding-top:8px; padding-left:8px; padding-right:8px;'.$dynamic_background.'">
			<p>'.$user_name.' - '.$chat_message.' 
				<div align="right">
					- <small><em>'.$row['timestamp'].'</em></small>
				</div>
			</p>
		</li>
		';
	}
	$output .= '</ul>';
	return $output;
}





















/*ESTO ES PHP*/
