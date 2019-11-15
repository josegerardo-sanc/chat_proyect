$(function () {

    load_grupo_grupo_chat(); //carga la lista de grupos
    setInterval(function () {
        load_grupo_grupo_chat();
        Historial_grupo_actualizar();
    }, 5000);

    function load_grupo_grupo_chat() {
        $.post("../php/load_chatGrupo.php", {
            action: 'load_grupo'
        }, function (data) {
            var json = JSON.parse(data);
            $('#lista_new_group').html(json['data'].html);
            $('#new_grupos').html(json['data'].contador);
            $('#count_aviso').removeClass('count_aviso');
            $('#count_aviso').html('');
            if(json['data'].aviso_msj>0){
            $('#count_aviso').addClass('count_aviso')    
            $('#count_aviso').html(json['data'].aviso_msj);
            }
        });

    }

    function Historial_grupo_actualizar() {
        // console.log("historial grupo");
        $('.grupo').each(function () {
            var id = $(this).data('id');
            Historial_grupo(id, "2");
        });
        //console.log("actualizando historial de mensajes");
    }

    function Historial_grupo(id, tipo) {
        $.post('../php/load_chatGrupo.php', {
            id_grupo: id,
            tipo_consult: tipo,
            action: 'load_history'
        }, function (data) {
            var json = JSON.parse(data);
            $('#chat_body_grupo' + id).html(json['data'].historial);
            $('#chat_body_grupo' + id).scrollTop($('#chat_body_grupo' + id).prop('scrollHeight'));
            $('#n_mensaje_grupo' + id).removeClass("new_chat_msj");

            if (json['data'].mostrar == "SiNumero_msj") {
                var class_n_msj = '';
                if (json['data'].contador > 0) {
                    $('#n_mensaje_grupo' + id).addClass('new_chat_msj');
                }
                $('#n_mensaje_grupo' + id).html(json['data'].contador);
            }
        });
    }


    $(document).on('click', '.item_grupo_event', function () {
        var id = $(this).data('id');
        var nombre = $(this).data('nombre');
        var agregar_chat = agregar_arreglo(id, 'grupo');

        if (agregar_chat) {
            var n_mensajes = '';
            chatBox(id, nombre, n_mensajes);
            $('#textarea_grupo' + id).emojioneArea({
                 pickerPosition: "top",
                 toneStyle: "bullet"
             });

        } else {
            //console.log("este user ya existe en el chat");
        }
        chatBox_show_hide();
    });

    function chatBox(id, nombre, n_mensajes) {

        var chat = '<div class="chatBox grupo" data-tipo_conversacion="grupo" data-id="' + id + '"><div class="chat_header"><a href="#" class="chat_name">' + nombre + '</a><span id="n_mensaje_grupo' + id + '" class=""></span><a href="#" class="cerrar_chat">X</a></div><div class="chat_body" id="chat_body_grupo' + id + '">' + Historial_grupo(id, "1") + '</div><div class="chat-foot ocultar_mensaje"><button class="btn_foot_chat btn_file_upload"><i class="fas fa-file-upload"></i></button><textarea id="textarea_grupo' + id + '" class="message_send_grupo"></textarea><button type="button" class="btn_foot_chat sendMessage_grupo"><i class="fas fa-paper-plane"></i></button></div></div>';
        $('.footer-chat').append(chat);
    }

    $(document).on('focus', '.message_send_grupo', function () {
        var id = $(this).parents('.chatBox').data('id');
        $.post('../php/load_chatGrupo.php', {
            id_grupo: id,
            action: 'actualizar_Mensajes'
        }, function (data) {
            console.log(data);
        });
    });

    $(document).on('click', '.sendMessage_grupo', function () {

        var id = $(this).parents('.chatBox').data('id');
        var mensaje = $.trim($('#textarea_grupo' + id).val());
        if (mensaje == "") {
            alert("debes ingresar algo");
            return false;
        }
        $.post('../php/insertarMensaje.php', {
            id: id,
            data_msj: mensaje,
            type_conversacion: '1'
        }, function (data) {
            $('#chat_body_grupo' + id).html(data);
            var element = $('#textarea_grupo' + id).emojioneArea();
            element[0].emojioneArea.setText('');
            $('#chat_body_grupo' + id).scrollTop($('#chat_body_grupo' + id).prop('scrollHeight'));
        });
    });

    /*funciones para crear un nuevo grupo*/
    $('#buscar_user').on('keyup', function () {
        //nc por que me marca en rojo si la funcion esta entrando!!!
        //quizas la desconoce por que no esta en el documento
        filtro(this, 'body_grupo_chat');
    });

    function load_grupo() {
        $.post("../php/Chatgrupo.php", {
            action: 'load_usuarios'
        }, function (data) {
            $('#body_grupo_chat').html(data);
        });

    }
    $('#grupo_chat').on('click', function () {
        load_grupo();
        $('#modal_grupo_chat').modal('show');
    });
    $('#crear_grupo').on('click', function () {
        var nombre_grupo = $('#name_grupo').val();
        $.post('../php/Chatgrupo.php', {
            action: 'crear_grupo',
            nombre_grupo: nombre_grupo
        }, function (data) {
            //console.log(data)
            alert("Grupo creado con exito");
            $('#name_grupo').val('');
            load_grupo();

        });

    });



    /*ocultar y mostrar opciones de agregar y ocular**/

    $(document).on('click', '.btn_Agregar', function () {
        var id = $(this).parents('.usuario_grupo').data('id'); //li
        remove_class_btn(this);

        $.post('../php/Chatgrupo.php', {
            id: id,
            action: 'add'
        }, function (data) {
            console.log(data)

        });

    });

    $(document).on('click', '.btn_Noagregar', function () {
        var id = $(this).parents('.usuario_grupo').data('id'); //li
        remove_class_btn(this);
        $.post('../php/Chatgrupo.php', {
            id: id,
            action: 'remove'
        }, function (data) {
            console.log(data)

        });

    });

    function remove_class_btn(btn) {
        var elemento = btn.parentNode; //div padre de las etiquetas a
        for (var i = 0; i < elemento.childElementCount; i++) {
            elemento.children[i].classList.remove('ocultar_opc');
        }
        btn.classList.add('ocultar_opc');
    }


});
