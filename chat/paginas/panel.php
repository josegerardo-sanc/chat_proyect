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
    <link rel="stylesheet" href="../css/chatGroup.css">


</head>

<body>

    <?php
        include('header.php');
    ?>

    <nav class="conte_users">
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
    <div class="cont_main">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">

                    <h1 class="display-4" style="width: 100%; margin-left:auto; text-align: right;">chat</h1>
                    <button type="button" id="alert">alert</button>

                    <script>
                        window.onload = function() {
                            document.getElementById('alert').addEventListener('click', function() {
                                alert("olisss");
                            });
                        }
                    </script>

                    <!--   <div class="d-flex justify-content-end">
                        <input type="hidden" id="is_active_group_chat_window" value="no" />
                        <button class="btn btn-sm  btn-info" id="group_chat">Iniciar Chat Grupal</button>
                    </div> -->

                    <!--  <form class="chat-grupo">
                        <div class="p-2 text-center">
                            <a class="lead" href="#">Conversacion grupal</a>
                            <span cerrar>X</span>
                            <hr>
                        </div>
                        <ul class="historial_chat" id="group_chat_history">
                    
                        </ul>
                        <div class="p-4">
                            <textarea class="form-control" id="group_chat_message" name="chat_message">
                            </textarea>
                            <div class="mt-2">
                                <button class="btn btn-primary" id="send_group_chat">enviar</button>
                            </div>
                        </div>
                    
                    
                    
                    </form> -->



                </div>
            </div>
        </div>
    </div>


    <div class="footer-chat" id="footer-chat">

        <!-- <div class="chatBox" data-id="'+ start_chat_Clave + '">
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
        </div> -->

    </div>

    <script src="../librerias/js/jquery-3.3.1.js"></script>
    <script src="../librerias/emojionearea/dist/emojionearea.min.js"></script>
    <script src="../js/menu_modulo_usuario.js"></script>
    <script src="../js/funcioneschat.js"></script>

    <!-- <script src="../js/funciones2.js"></script>
     -->
</body></html>
