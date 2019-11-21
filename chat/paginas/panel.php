<html>

<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Chat Application using PHP Ajax Jquery</title>

    <link rel="stylesheet" href="../librerias/css/bootstrap.min.css">

    <link rel="stylesheet" href="../librerias/emojionearea/dist/emojionearea.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
    <link rel="stylesheet" href="../css/M_encabezado.css">
    <link rel="stylesheet" href="../css/Menu.css">
    <link rel="stylesheet" href="../css/chatBox.css">
    <script src="../librerias/js/all.js"></script>

    <link rel="stylesheet" href="../css/chatBoxGrupo.css">



</head>

<body>

    <?php
        include('header.php');
    /*si el usuario presiona f5 se reinicia mi variable grupo para que vuelva afuncionar la opcio agregar y NoAgregar*/
         unset($_SESSION['grupo']);//esta variable pertenece alos particpantes de un grupo
         unset($_SESSION['id_anonimo']);//esta variable pertenece a chatAnonimo
    ?>
    <!-- <div class="conte_menu" id="header_conte_header">
        <div class="opcion_rigth">
            <a href="#" class="item_a" id="ocultar_anonimo">
                <i class="fas fa-arrow-right"></i>
            </a>
            <a href="#" class="item_a" id="responder_anonimo">
                <i class="fas fa-phone-volume">
                </i>
                <small id="" class="anonimo_call"></small>
                <ul class="anonimo_lista" id="lista_new_anonimos">
                    <li class="item_grupo_event" datanombre="'.ucwords($nombre_grupo).'" data-id="'.$grupo['id_grupo'].'">
                        <small class="conexion_">
                            <i class="fas fa-circle"></i>
                        </small>
                        <small class="new_mensaje_">21</small>
                        <small class="status_grupo">Atender</small>
                    </li>
                </ul>
    
            </a>
        </div>
        <div class="opcion_rigth right">
            <div class="opcion_rigth show_notificacione">
                <a href="#" class="item_a">
                    <i class="fas fa-envelope"></i>
                    <small id="count_aviso" class="anonimo_call"></small>
                </a>
                <a href="#" class="item_a ">
                    <i class="fas fa-bell"></i>
                    <small class="anonimo_call" id="new_grupos"></small>
                </a>
                <ul class="grupo_lista" id="lista_new_group">
                    <li class="item_grupo_event" datanombre="'.ucwords($nombre_grupo).'" data-id="'.$grupo['id_grupo'].'">
                    '.ucworddldddss($nombre_grupo).'
                    <small class="new_mensaje"></small>
                    <small class="status_grupo">Nuevo Grupo</small>
                </li>
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
    
     -->
    <nav class="conte_users" id="conte_usuarios">
        <div class="info_users">
            <h1 class="lead">Usuarios </h1>
            <span class="small text-info" id="disponibles_chat">Conectado 0</span>
        </div>
        <ul class="users" id="users">
            <!-- <li class="item-user" data-id="'.$usuario['id'] .'">
            
                <img src="https://picsum.photos/200/300" alt="">
                <a href="#" class="user">
                    <span class="is_type">
                        <i class="far fa-comment-dots"></i>Escribiendo...
                    </span>
                    Maria del carmen
                    <span class="n_mensaje">9</span>
            
                </a>
                <span class="status_user Activo">
                    <i class="fas fa-circle"></i>
                </span>
            </li>
            
            <li class="item-user" data-id="'.$usuario['id'] .'">
            
                <img src="https://picsum.photos/200/300" alt="">
                <a href="#" class="user">
            
                    Jose gerardo sanc..
            
                    <span class="n_mensaje">9</span>
            
                </a>
                <span class="status_user Activo">
                    <i class="fas fa-circle"></i>
                </span>
            </li> -->
        </ul>
        <div class="" id="buscar">
            <span class="icon_"><i class="fas fa-search"></i></span>
            <input type="search" class="input_busqueda">
        </div>
    </nav>

    <nav class="conte_anonimos show" id="anonimos_conte">
        <div class="info_users">
            <h1 class="lead">Clientes </h1>
            <span class="small text-info" id="disponibles_chat">Atendiendo 0</span>

        </div>
        <ul class="users" id="anonimos">
            <!--<li class="item-user" data-id="'.$usuario['id'] .'">

                <a href="#" class="user">
                    <span class="is_type">
                        <i class="far fa-comment-dots"></i>Escribiendo...
                    </span>
                    Maria del carmen zamudio herrera
                    <span class="n_mensaje">9</span>

                </a>
                <span class="status_user Activo">
                    <i class="fas fa-circle"></i>
                </span>
            </li>-->
        </ul>
    </nav>


    <div class="cont_main">
        <div class="container">
            <div class="row d-flex justify-content-end">
                <div class="col-sm-10">

                    <!-- Button trigger modal -->
                    <?php
                    if($_SESSION['type_user_logueo']!=3)
                    {?>

                    <button type="button" class="btn btn-primary" data-toggle="modal" id="grupo_chat">
                        Crear Grupo
                    </button>

                    <div class="modal fade" id="modal_grupo_chat" tabindex="-1" role="dialog" aria-labelledby="grupo_chat" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label for="" class="col-form-label">Nombre del grupo</label>
                                        <input type="text" class="form-control" id="name_grupo">
                                    </div>
                                    <div class="input-group mb-3">
                                        <input id="buscar_user" type="search" class="form-control" placeholder="Buscar usuario">
                                        <div class="input-group-append">
                                            <span class="input-group-text" id="basic-addon2"><i class="fas fa-search"></i></span>
                                        </div>
                                    </div>

                                    <ul class="body_grupo_chat" id="body_grupo_chat">
                                        <!--  <li class="usuario_grupo" data-nombre="gerardo" data-id="10">
                                            <div>
                                                <button class="btn_Agregar btn btn-info"><i class="fas fa-plus"></i></button>
                                                <button class="btn_Noagregar btn btn-danger ocultar_opc"><i class="fas fa-trash"></i></button>
                                            </div>
                                            <a href="#" class="name_grupo">Jose gerardo </a>
                                            <img src="../imagenes/img2.jpg" alt="">
                                        </li>
                                        <li class="usuario_grupo" data-nombre="miguel" data-id="1">
                                            <div>
                                                <button class="btn_Agregar btn btn-info"><i class="fas fa-plus"></i></button>
                                                <button class="btn_Noagregar btn btn-danger ocultar_opc"><i class="fas fa-trash"></i></button>
                                            </div>
                                            <a href="#" class="name_grupo">Miguel angel </a>
                                            <img src="../imagenes/img2.jpg" alt="">
                                        </li> -->
                                    </ul>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                    <button type="button" class="btn btn-success" id="crear_grupo">Crear Grupo</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <?php
                      }
                    ?>
                    <!-- Modal -->
                    <!--        
                    fin del modal -->

                </div>
            </div>
        </div>
    </div>


    <div class="footer-chat" id="footer-chat">
        <audio controls src="../librerias/mensaje_ting.mp3" id="miAudio" style=" display:none;">
            Your browser does not support the audio element.
        </audio>
        <audio controls src="../librerias/apple_tono_ring.mp3" id="call_call" style=" display:none;">
            Your browser does not support the audio element.
        </audio>


        <!--         <div class="chatBox" data-id="'+ start_chat_Clave + '">
            <div class="chat_header">
                <a href="#" class="chat_name">1_jose</a>
                <span class="conexion_status fas fa-circle Activo" style="margin: 0px 10px;"></span>
                <span class="new_chat_msj">
                    1120
                </span>
                <a href="#" class="cerrar_chat">X</a>
                <a href="#" class="chat_is_type">escribiendo......</a>
            </div>
        
            <div class="chat_body"></div>
            <div class="chat-foot ocultar_mensaje">
                <button class="btn_foot_chat btn_file_upload">
                    <i class="fas fa-file-upload"></i>
                </button>
        
                <textarea id="message_send' + start_chat_Clave + '" class="message_send"></textarea>
                <button type="button" class="btn_foot_chat btn_send"><i class="fas fa-paper-plane"></i></button>
            </div>
        </div>
         -->
    </div>



    <script src="../librerias/js/jquery-3.3.1.js"></script>
    <script src="../librerias/js/bootstrap.min.js"></script>
    <script src="../librerias/emojionearea/dist/emojionearea.min.js"></script>
    <script src="../js/menu_modulo_usuario.js"></script>
    <script src="../js/funcioneschat.js"></script>
    <script src="../js/grupoChat.js"></script>
    <script src="../js/anonimo.js"></script>
</body>

</html>
