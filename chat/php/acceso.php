<?php

include('conexion.php');


session_start();

if(isset($_POST['acceso'])&&($_POST['acceso']=="acceso"))
{
    if(!empty($_POST['usuario'])&&!empty($_POST['pass']))
    {
     $logueo=$conexion->prepare("SELECT * FROM login WHERE usuario=? AND pass=?");
        
        $logueo->bindParam(1,$_POST['usuario'],PDO::PARAM_STR);
        $logueo->bindParam(2,$_POST['pass'],PDO::PARAM_STR);
        $logueo->execute();
        
        if($logueo->rowCount()>0)
        {
        $datos_=$logueo->fetch(PDO::FETCH_ASSOC);
        
        
        $_SESSION['usuario']=data_user_personal($datos_['id_datos_personal'],$conexion);    
        $_SESSION['id_usuario']=$datos_['id'];
        $_SESSION['type_user_logueo']=$datos_['type_user'];
            
                $insertDetails = $conexion->prepare('INSERT INTO login_details(user_id) VALUES(?)');
                $insertDetails->bindParam(1,$_SESSION['id_usuario'],PDO::PARAM_INT);
			    $insertDetails->execute();
                $_SESSION['id_detalle'] = $conexion->lastInsertId();
                
             
        header('Location:../paginas/panel.php');    
        return false;    
        }
        else{
        $_SESSION['acceso']='Credenciales incorrecta intente de nuevo';   
        }
    }
    else{
        $_SESSION['acceso']='Los campos usuario y pass son obligatorios';
    }
    
}
else{
    $_SESSION['acceso']="Debe ingresar sus crendenciales";
   
}
 header('Location:../index.php');

?>
