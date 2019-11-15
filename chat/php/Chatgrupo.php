<?php

session_start();
if(isset($_SESSION['type_user_logueo'])){
    
    include('conexion.php');
    
    if(isset($_POST['action']) && $_POST['action']=='load_usuarios'){
       
        if(isset($_SESSION['grupo'])){
            unset($_SESSION['grupo']);
        }    
    $li_html='';

        if($_SESSION['type_user_logueo']=="2"){
            $data_consult=$conexion->prepare("select * from login where id!=? and type_user=3");
            $data_consult->bindParam(1,$_SESSION['id_usuario'],PDO::PARAM_INT);
        }
        else{
           $data_consult=$conexion->prepare("select * from login where id!=? and type_user!=1");
           $data_consult->bindParam(1,$_SESSION['id_usuario'],PDO::PARAM_INT);
        }
        $data_consult->execute();

        while($li_result=$data_consult->fetch(PDO::FETCH_ASSOC)){
              
            $nombre=data_user_personal($li_result['id_datos_personal'],$conexion);
            
            $li_html.='<li class="usuario_grupo" data-nombre="'.$nombre.'" data-id="'.$li_result['id'].'">
                                            <div>
                                                <button class="btn_Agregar btn btn-info"><i class="fas fa-plus"></i></button>
                                                <button class="btn_Noagregar btn btn-danger ocultar_opc"><i class="fas fa-trash"></i></button>
                                            </div>
                                            <a href="#" class="name_grupo">'.$nombre.'</a>
                                            <img src="../imagenes/img2.jpg" alt="">
                                        </li>';
        }
    echo $li_html;
        return false;
    }
    
    if($_POST['action']=="add" || $_POST['action']=="remove"){
            $busqueda=false;
        $index="";
        if(isset($_SESSION['grupo'])){
            foreach($_SESSION['grupo'] as $key=>$usuario)
               {
            if($usuario['id']==$_POST['id'])
                    {
                        $busqueda=true;
                        $index=$key;
                        break;
                    }
              }
        }
        if(!$busqueda && $_POST['action']=="add"){
             $_SESSION['grupo'][]=['id'=>$_POST['id']];
             echo json_encode($_SESSION['grupo']);   
        }
        else{
        $eliminarElemento=$_SESSION['grupo'];
        unset($eliminarElemento[$index]);
        $modificacionArreglo=array_values($eliminarElemento);   
        $_SESSION['grupo']=$modificacionArreglo;    
          echo json_encode($_SESSION['grupo']);   

        }  
    }
    
     
    if($_POST['action']=="crear_grupo"){
        if(isset($_SESSION['grupo']) && !empty($_SESSION['grupo']))
        {
          
            $mensaje=trim($_POST['nombre_grupo']);
            $mensaje=ucwords($mensaje);
            $id_user=$_SESSION['id_usuario'];
            
            
            $insert=$conexion->prepare("INSERT INTO newgrupo (`nombregrupo`, `id_user`) VALUES ('$mensaje','$id_user')");
            if($insert->execute()){
                    $_SESSION['id_grupo']=$conexion->lastInsertId(); 
                    $_SESSION['grupo'][]=['id'=>$_SESSION['id_usuario']];
               
                    $insert=$conexion->prepare("INSERT INTO `participantes`(`id_user`, `id_grupo`) VALUES (?,?)");
                    foreach($_SESSION['grupo'] as $key=>$usuario){
                    $insert->bindParam(1,$usuario['id'],PDO::PARAM_INT);
                    $insert->bindParam(2,$_SESSION['id_grupo'],PDO::PARAM_INT);
                    $insert->execute();
                }
               
            }
        }else{
            echo "esta vacio la variable";
      }
    }
    
}

?>
