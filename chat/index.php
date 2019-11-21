<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="librerias/css/bootstrap.css">
    <link rel="stylesheet" href="css/chatBox.css">
    <script src="librerias/js/all.js"></script>
</head>
<?php
    session_start();    
?>

<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
            <a class="navbar-brand" href="#">Hidden brand</a>
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled" href="#">Disabled</a>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <button class="usuario_normal btn btn-info mr-1" style="border-radius:50%;"><i class="fas fa-user"></i></button>
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>

    <div class="container" style="margin-top: 100px;">

        <div class="row d-flex justify-content-center">

            <div class="col-sm-12 col-md-5">

            </div>
        </div>
    </div>
    <?php
    if(isset($_SESSION['id_anonimo'])){
    ?>
    <input type="hidden" id="anonimo_id" value="<?php echo $_SESSION['id_anonimo'];?>">
    <?php    
    }
    ?>

    <div class="modal" tabindex="-1" role="dialog" id="modal_login">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="" id="formu_login">
                        <div class="status_login_" style="min-height:50px;">

                        </div>
                        <input type="hidden" value="usuario" id="tipo_logueo">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon1"><i class="fas fa-user"></i></span>
                            </div>
                            <input id="correo" type="email" class="form-control" placeholder="Correo" aria-label="Username" aria-describedby="basic-addon1" required>
                        </div>

                        <div class="input-group mb-3" id="input_pass_logueo">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon1"><i class="fas fa-key"></i></span>
                            </div>
                            <input id="pass" type="password" class="form-control" placeholder="Contraseña" aria-label="password" aria-describedby="basic-addon1" required>
                        </div>
                        <!-- 
               campos de usuario anonimo -->
                        <div id="campos_anonimo" style="display: none;">
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="basic-addon1"><i class="fas fa-key"></i></span>
                                </div>
                                <input id="nombre" type="text" class="form-control" placeholder="Nombre" aria-label="nombre" aria-describedby="basic-addon1" required>
                            </div>

                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="basic-addon1"><i class="fas fa-key"></i></span>
                                </div>
                                <input id="paterno" type="text" class="form-control" placeholder="Apellido Paterno" aria-label="paterno" aria-describedby="basic-addon1" required>
                            </div>

                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="basic-addon1"><i class="fas fa-key"></i></span>
                                </div>
                                <input id="materno" type="text" class="form-control" placeholder="Apellido materno" aria-label="materno" aria-describedby="basic-addon1" required>
                            </div>
                        </div>
                        <!-- 
               campos de usuario anonimo -->


                        <div style="display: flex; justify-content: space-around;" class="form-group">
                            <button type="submit" value="acceso" name="acceso" class="btn btn-primary" style="border-radius: 0px;">Ingresar con Facebook</button>

                            <button type="submit" value="acceso" name="acceso" class="btn btn-danger" style="border-radius: 0px;">Ingresar con Gmail</button>

                        </div>
                        <a href="paginas/privacy_policy.html" class="politica_privacidad">consultar politica de privacidad</a>
                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="btn_logueo">Acceder</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <audio controls src="librerias/mensaje_ting.mp3" id="miAudio" style="display:none;">
        Your browser does not support the audio element.
    </audio>
    <div class="footer_chat_anonimo">
        <div class='chatBox_anonimo' id='id_agente' data-id=''>
            <div class="buscandoAgente">
                <p>Un agente esta en camino</p>
                <img src="librerias/gif_carga.gif" alt="">
            </div>
            <div class="chat_header"><a href="#" class="chat_name" id="agente_name">Agente</a>
                <span id="status_anonimo" class="status_user fas fa-circle" style="margin: 0px 10px;"></span>
                <span id="n_mensaje_anonimo" class="new_chat_msj"></span>
                <a href="#" class="cerrar_chat" id="cerrar_chat_anonimo">X</a>
                <a href="#" id="chat_is_type" class="chat_is_type">Escribiendo...</a> </div>
            <div class="chat_body" id="chat_body_anonimo"></div>
            <small class="text-danger ultima_conexion_chat" id="finalizacion"></small>
            <div class="chat-foot ocultar_mensaje">
                <button class="btn_foot_chat btn_file_upload"><i class="fas fa-file-upload"></i></button>
                <textarea id="textarea" class="message_send message_send_cliente"></textarea>
                <button type="button" class="btn_foot_chat btn_send sendMessage"><i class="fas fa-paper-plane"></i></button>
            </div>
        </div>



        <a href="#" class="Contactar_Agente">
            <span class="expandir_background">
                <i class="far fa-comment-dots"></i>
            </span>
        </a>

    </div>

    <script src="librerias/js/jquery-3.3.1.js"></script>
    <script src="librerias/js/bootstrap.js"></script>
    <script src="js/Contactar_Agente.js"></script>
</body>

</html>
