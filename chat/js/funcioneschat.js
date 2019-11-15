 $(function () {


     chatBox_show_hide();

     $(window).on('resize', function () {
         chatBox_show_hide();

     });

     $('.input_busqueda').on('keyup', function () {
         if (this.value != "") {
             filtro(this, 'users');
         } else {
             //ocultarRows(0);
         }
     });


     $('.input_busqueda').on('keyup', function () {
         var opacity = 0;
         if ($(this).val() != "") {
             opacity = 0;
         } else {
             opacity = 1;
         }
         $(this).parent().find('span').css({
             opacity: opacity
         });
     });

     setInterval(function () {
         Actualizar_conexion();
         act_historial_msj();
         load_user();
     }, 5000);

     load_user();

     function load_user() {
         $.post('../php/usuarios.php', function (data) {
             //console.log(data);
             var json = JSON.parse(data);
             $('.users').html(json['data'].html);
             $('#disponibles_chat').html('Conectados ' + json['data'].conectados);
         });
     }


     function chatBox(id, nombre, n_mensajes, status, fecha, is_type) {

         var chat = '<div class="chatBox Singular " data-id="' + id + '" data-tipo_conversacion="singular"><div class="chat_header"><a href="#" class="chat_name">' + nombre + '</a><span id="status' + id + '" class="status_user ' + status + ' fas fa-circle" style="margin: 0px 10px;"></span><span id="n_mensaje' + id + '" class="">' + n_mensajes + '</span><a href="#" class="cerrar_chat">X</a><a href="#" id="is_type' + id + '" class="chat_is_type">' + is_type + '</a></div><div class="chat_body" id="chat_body' + id + '">' + Historial_msj(id, "1") + '</div><small class="ultima_conexion_chat" id="fecha_ultima' + id + '"></small><div class="chat-foot ocultar_mensaje"><button class="btn_foot_chat btn_file_upload"><i class="fas fa-file-upload"></i></button><textarea id="textarea' + id + '" class="message_send"></textarea><button type="button" class="btn_foot_chat sendMessage"><i class="fas fa-paper-plane"></i></button></div></div>';
         $('.footer-chat').append(chat);
     }

     function act_historial_msj() {

         $('.Singular').each(function () {
             console.log("each de each");
             var id = $(this).data('id');
             Historial_msj(id, "2");
         });
         //console.log("actualizando historial de mensajes");
     }

     function Historial_msj(id, tipo) {
         $.post('../php/historial.php', {
             usuario: id,
             tipo_consult: tipo
         }, function (data) {
             // === undefined
             var json = JSON.parse(data);
             $('#chat_body' + id).html(json['data'].historial);
             $('#chat_body' + id).scrollTop($('#chat_body' + id).prop('scrollHeight'));


             $('#status' + id).removeClass("Activo NoActivo");
             $('#n_mensaje' + id).removeClass("new_chat_msj");

             if (json['data'].mostrar == "SiNumero_msj") {
                 var class_n_msj = '';
                 if (json['data'].contador > 0) {
                     $('#n_mensaje' + id).addClass('new_chat_msj');
                 }
                 $('#n_mensaje' + id).html(json['data'].contador);
             }
             var escribiendo = '';
             if (json['data'].is_type == "yes") {
                 escribiendo = "Escribiendo...";
             } else {
                 //escribiendo = "NoWriting";
                 escribiendo = "";
             }
             $('#is_type' + id).html(escribiendo);
             $('#status' + id).addClass(json['data'].conexion);

             var fecha_ = "";
             if (json['data'].fecha != "") {
                 fecha_ = "Ultima Conexion " + json['data'].fecha;
             }
             $('#fecha_ultima' + id).html(fecha_);

         });
     }

     //console.log(arreglo_id);
     $(document).on('click', '.item-user', function () {


         var id = $(this).data('id');
         var nombre = $(this).data('nombre');
         var fecha = $(this).data('fecha');
         var status = $(this).data('status');

         //var n_mensajes = $(this).data('n_mensaje');
         var n_mensajes = '';
         var escribiendo = '';
         var agregar_chat = agregar_arreglo(id, 'singular');

         if (agregar_chat) {

             chatBox(id, nombre, n_mensajes, status, fecha, escribiendo);
             $('#textarea' + id).emojioneArea({
                 pickerPosition: "top",
                 toneStyle: "bullet"
             });

             chatBox_show_hide();
         } else {
             console.log("este user ya existe en el chat");
         }
     });

     function Actualizar_conexion() {
         $.post('../php/act_conexion.php', function (data) {
             //console.log(data);
         });
     }


     $(document).on('click', '.sendMessage', function () {

         var id = $(this).parents('.chatBox').data('id');
         var mensaje = $.trim($('#textarea' + id).val());
         console.log(mensaje);
         if (mensaje == "") {
             alert("debes ingresar algo");
             return false;
         }
         $.post('../php/insertarMensaje.php', {
             id: id,
             data_msj: mensaje,
             type_conversacion: '0'
         }, function (data) {
             $('#chat_body' + id).html(data);
             var element = $('#textarea' + id).emojioneArea();
             element[0].emojioneArea.setText('');
             $('#chat_body' + id).scrollTop($('#chat_body' + id).prop('scrollHeight'));
         });
     });

     $(document).on('focus', '.message_send', function () {
         var id = $(this).parents('.chatBox').data('id');
         var is_type = 'yes';
         $.post("../php/insert_writing.php", {
             id: id,
             type: is_type
         }, function (data) {
             //console.log(data);
         });
     });

     $(document).on('blur', '.message_send', function () {
         var id = $(this).parents('.chatBox').data('id');
         var is_type = 'no';
         $.post("../php/insert_writing.php", {
             id: id,
             type: is_type
         }, function (data) {
             //console.log(data);
         });
     });


 });


 var chatBox_show_hide = function () {
     var screen_width = $('body').width();
     var hijos = $('.footer-chat').children('div').length;

     var n_aOcultar = 0;
     //console.log(hijos)

     if (screen_width >= 426) {
         n_aOcultar = 1;
     }
     if (screen_width >= 830) {
         n_aOcultar = 2;
     }
     if (screen_width >= 1026) {
         n_aOcultar = 3;
     }

     $('.footer-chat .chatBox').show();
     for (var i = 0; i < hijos - n_aOcultar; i++) {
         $('.footer-chat .chatBox').eq(i).hide();
     }


     if (screen_width < 426) {

         $('.chatBox').css({
             display: ''
         });
         $('.chatBox').css({
             height: ''
         });
         $('.chat_body').removeClass('ocultar');
         $('.chat-foot').removeClass('ocultar');

         $('.chat_body').css({
             display: ''
         });
         $('.chat-foot').css({
             display: ''
         });

         //this.parentNode.style.height = 300 + 'px';
         //this.parentNode.children[1].style.display = 'inherit';
         //this.parentNode.children[2].style.display = 'inherit';
     }
     if (arreglo_id.length > 0) {
         //console.log("el arreglo no esta   vacio" + arreglo_id.length);
         $('#footer-chat').css({
             zIndex: '9000'
         });
     } else {
         $('#footer-chat').css({
             zIndex: '-1'
         });
     }
 }


 $(document).on('click', '.chat_header', function () {
     //$('.chat_header').on('click', function () {
     //console.log("header-chat");
     var screen_width = $('body').width();
     var heigth = 350;
     if (!(screen_width >= 425)) {
         return false;
     }

     if ($(this).hasClass('ocultar')) {
         $(this).css({
             backgroundColor: "white"
         });
         $(this).removeClass('ocultar');
         this.parentNode.style.height = '400px';
         this.parentNode.children[1].style.display = 'inherit';
         this.parentNode.children[2].style.display = 'inherit';



     } else {
         console.log("1ro aqui");
         $(this).addClass('ocultar');
         $(this).css({
             backgroundColor: "#F0F3F4"
         });
         this.parentNode.style.height = '50px';
         this.parentNode.children[1].style.display = 'none';
         this.parentNode.children[2].style.display = 'none';
     }

 });

 $(document).on('click', '.cerrar_chat', function (e) {
     e.stopPropagation();
     console.log("eliminar");
     var element = $(this).parents('.chatBox');
     var id = element.data('id');
     var tipo = element.data('tipo_conversacion');
     element.remove();
     var id_tipo = id + tipo;
     var index = arreglo_id.indexOf(id_tipo);
     if (index != '-1') {
         arreglo_id.splice(index, 1);
     }
     //console.log(arreglo_id);
     chatBox_show_hide();
 });

 var arreglo_id = [];

 var agregar_arreglo = function (id, tipo) {
     var agregar = true;
     var id_tipo = id + tipo;
     for (var i = 0; i < arreglo_id.length; i++) {
         if (arreglo_id[i] == id_tipo) {
             agregar = false;
             break;
         }
     }
     if (agregar) {
         id = id + tipo;
         arreglo_id.push(id);
         //console.log("agregado" + id);
     }
     return agregar;
 }


 var filtro = function (input, padre) {
     input.style.border = '1px solid white';
     var cadeBusqueda = input.value;
     var counFilas = document.getElementById(padre);
     //alert(counFilas.children.length);

     var contador = 0;
     for (var newF = 0; newF < counFilas.childElementCount; newF++) {
         var MostrarRow = false;
         var fetchFilaNow = counFilas.children[newF];
         //console.log(fetchFilaNow);
         fetchFilaNow.style.display = 'none';

         var nombre = fetchFilaNow.dataset.nombre;
         if (nombre.toLocaleLowerCase().trim().indexOf(cadeBusqueda.toLocaleLowerCase().trim()) > -1) {
             MostrarRow = true;
         }
         if (MostrarRow) {
             fetchFilaNow.style.display = null;
             input.style.border = '1px solid #63B4CB';
             //console.log(nombre);
             contador++;
         }
     }
     if (contador <= 0) {
         input.style.border = '1px solid red';
     }

 }
