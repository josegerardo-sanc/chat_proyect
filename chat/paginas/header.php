<?php
session_start();

if (!isset($_SESSION['id_usuario'])) {
	header("location:../index.php");
}
?>




<div class="conte_menu" id="header_conte_header">
    <div class="opcion_rigth">
        <a href="#" id="mostrar_menu_items">
            <!--   <i class="fas fa-bars"></i> -->
        </a>
    </div>
    <div class="opcion_rigth right">
        <button type="button" class="btn btn-primary" id="show_notificacione">
           <span class="aviso_"><i class="fas fa-envelope"></i><small id="count_aviso" class="count_aviso"></small></span>
            Notificaciones <span class="badge badge-light" id="new_grupos"></span>
        </button>
        <img src="../imagenes/img4.png" alt="" class="img_perfil">
        <a href="#" id="config_footer"><i class="fas fa-cogs"></i></a>
    </div>

    <ul class="configuraciones_perfil grupo_fooot" id="lista_new_group">
       <!--  <li class="item_grupo_event" datanombre="'.ucwords($nombre_grupo).'" data-id="'.$grupo['id_grupo'].'">'.ucworddldddss($nombre_grupo).'
            <small class="status_msj_new">12</small>
            <small class="status_grupo_new">Nuevo Grupo</small> </li> -->
    </ul>


    <ul class="configuraciones_perfil datos_">
        <li>
            <img src="../imagenes/img4.png" alt="">
        </li>
        <li>
            <p><?php echo $_SESSION['usuario'];?> <i class="fas fa-user"></i></p>
        </li>
        <li>
            <p>Editar cuenta <i class="fas fa-edit"></i></p>
        </li>
        <li>
            <p id="cerrar">Cerrar Sesión <i class="fas fa-toggle-off"></i></p>
        </li>
    </ul>
</div>
