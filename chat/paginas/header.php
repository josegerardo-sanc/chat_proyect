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
        <img src="../imagenes/img4.png" alt="" class="img_perfil">
        <a href="#" id="config_footer"><i class="fas fa-cogs"></i></a>
    </div>

    <ul class="configuraciones_perfil">
        <li>
            <img src="../imagenes/img4.png" alt="">
        </li>
        <li>
            <p><?php echo ucwords($_SESSION['usuario']);?> <i class="fas fa-user"></i></p>
        </li>
        <li>
            <p>Editar cuenta <i class="fas fa-edit"></i></p>
        </li>
        <li>
            <p id="cerrar">Cerrar Sesión <i class="fas fa-toggle-off"></i></p>
        </li>
    </ul>
</div>
