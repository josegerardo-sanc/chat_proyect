<?php
session_start();

if (!isset($_SESSION['id_usuario'])) {
	header("location:../index.php");
}
?>

<div class="conte_menu" id="header_conte_header">
    <div class="opcion_rigth">
        <a href="#" class="item_a" id="ocultar_anonimo">
            <i class="fas fa-arrow-right"></i>
        </a>
        <a href="#" class="item_a" id="responder_anonimo">
            <i class="fas fa-phone-volume">
            </i>
            <small id="call_Call_anonimo" class="anonimo_call"></small>
            <ul class="anonimo_lista" id="lista_new_anonimos">
                <!-- <li class="item_grupo_event" datanombre="'.ucwords($nombre_grupo).'" data-id="'.$grupo['id_grupo'].'">
                        <small class="conexion_">
                            <i class="fas fa-circle"></i>
                        </small>
                        <small class="new_mensaje_">21</small>
                        <small class="status_grupo">Atender</small>
                    </li> -->
            </ul>

        </a>
    </div>
    <div class="opcion_rigth right">
        <div class="opcion_rigth show_notificacione" id="show_notificacione">
            <a href="#" class="item_a">
                <i class="fas fa-envelope"></i>
                <small id="count_aviso" class="anonimo_call"></small>
            </a>
            <a href="#" class="item_a ">
                <i class="fas fa-bell"></i>
                <small class="anonimo_call" id="new_grupos"></small>
            </a>
            <ul class="grupo_lista" id="lista_new_group">
                <!-- <li class="item_grupo_event" datanombre="'.ucwords($nombre_grupo).'" data-id="'.$grupo['id_grupo'].'">
                    '.ucworddldddss($nombre_grupo).'
                    <small class="new_mensaje"></small>
                    <small class="status_grupo">Nuevo Grupo</small>
                </li> -->
            </ul>
        </div>


        <img src="../imagenes/img4.png" alt="" class="img_perfil">
        <a href="#" id="config_footer" class="item_a">
            <i class="fas fa-cogs"></i>
        </a>
    </div>
    <ul class="perfil">
        <li>
            <img class="img_perfil_config" src="../imagenes/img4.png" alt="">
        </li>
        <li>
            <?php echo $_SESSION['usuario'];?> <i class="fas fa-user"></i>
        </li>
        <li>
            Editar cuenta <i class="fas fa-edit"></i>
        </li>
        <li id="cerrar_session">
            Cerrar Sesión <i class="fas fa-toggle-off"></i>
        </li>
    </ul>
</div>
