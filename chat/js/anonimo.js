$(function () {

    $('#ocultar_anonimo').on('click', function () {
        $('.conte_anonimos').toggleClass('show');

        if ($(this).hasClass('cambiar')) {
            $(this).removeClass('cambiar');
            $(this).html('<i class="fas fa-arrow-right"></i>');

        } else {
            $(this).addClass('cambiar');
            $(this).html('<i class="fas fa-arrow-left"></i>');
        }

    });


    setInterval(() => {
        lista_anonimos();
        load_anonimo_lista();
        act_historial_msj_anonimo();
    }, 5000);

    lista_anonimos();
    load_anonimo_lista();
    var call_anonimos = 0;
    var call_call = document.getElementById('call_call');

    function lista_anonimos() {
        $.post('../php/Anonimo.php', {
            action: 'load_lista_anonimo'
        }, function (data) {
            //console.log(data);
            var json = JSON.parse(data);
            $('#lista_new_anonimos').html(json['data'].html);
            $('#call_Call_anonimo').html('');
            if (json['data'].anonimo_call > 0) {
                $('#call_Call_anonimo').html(json['data'].anonimo_call);
                promise_audio(call_call.play());
            }
        });

    }

    function load_anonimo_lista() {
        $.post('../php/Anonimo.php', {
            action: 'load_lista_anonimo_ul'
        }, function (data) {

            var json = JSON.parse(data);
            $('#anonimos').html(json['data'].html);
        });

    }

    function promise_audio(promise, call_call) {
        if (promise !== undefined) {

            promise.then(_ => {
                //call_call.currentTime = 0;
                call_call.play();
                //Autoplay started!

            }).catch(error => {
                console.log("error audio");
                // Autoplay was prevented.

                // Show a "Play" button so that user can start playback.

            });

        }

    }


    $('#responder_anonimo').on('click', function () {
        call_call.pause();
    });


    $(document).on('click', '.item_anonimo', function (e) {

        var id = $(this).data('id');
        var nombre = $(this).data('nombre');
        var fecha = $(this).data('fecha');
        var status = $(this).data('conexion');

        //var n_mensajes = $(this).data('n_mensaje');
        var n_mensajes = '';
        var escribiendo = '';
        $.post('../php/Anonimo.php', {
                action: 'update_anonimo',
                id_anonimo: id
            },
            function (data) {
                //console.log(data);
                var agregar_chat = agregar_arreglo(id, 'anonimo');
                if (agregar_chat) {
                    chatBox(id, nombre, n_mensajes, status, fecha, escribiendo);
                    $('#textarea_anonimo' + id).emojioneArea({
                        pickerPosition: "top",
                        toneStyle: "bullet"
                    });
                    chatBox_show_hide();
                } else {
                    console.log("este user ya existe en el chat");
                }
            });

    });


    $(document).on('click', '.item_anonimo_ul', function (e) {
        var id = $(this).data('id');
        var nombre = $(this).data('nombre');
        var fecha = $(this).data('fecha');
        var status = $(this).data('conexion');
        //var n_mensajes = $(this).data('n_mensaje');
        var n_mensajes = '';
        var escribiendo = '';
        //console.log(data);
        var agregar_chat = agregar_arreglo(id, 'anonimo');
        if (agregar_chat) {
            chatBox(id, nombre, n_mensajes, status, fecha, escribiendo);
            $('#textarea_anonimo' + id).emojioneArea({
                pickerPosition: "top",
                toneStyle: "bullet"
            });
            chatBox_show_hide();
        } else {
            console.log("este user ya existe en el chat");
        }


    });


    function chatBox(id, nombre, n_mensajes, status, fecha, is_type) {

        var chat = '<div class="chatBox anonimo" data-id="' + id + '" data-tipo_conversacion="anonimo"><div class="chat_header"><span class="btn btn-sm btn-danger terminar_conversacion"><i class="fas fa-phone-slash"></i></span><a href="#" class="chat_name">Cliente ' + nombre + '</a><span id="status_anonimo' + id + '" class="status_user ' + status + ' fas fa-circle" style="margin: 0px 10px;"></span><span id="n_mensaje_anonimo' + id + '" class="">' + n_mensajes + '</span><a href="#" class="cerrar_chat">X</a><a href="#" id="is_type_anonimo' + id + '" class="chat_is_type">' + is_type + '</a></div><div class="chat_body" id="chat_body_anonimo' + id + '">' + Historial_msj_anonimo(id, "1", "2") + '</div><small class="ultima_conexion_chat" id="fecha_ultima_anonimo' + id + '">Ultima Conexion' + fecha + '</small><div class="chat-foot ocultar_mensaje"><button class="btn_foot_chat btn_file_upload"><i class="fas fa-file-upload"></i></button><textarea id="textarea_anonimo' + id + '" class="message_send_anonimo"></textarea><button type="button" class="btn_foot_chat btn_send sendMessage_anonimo"><i class="fas fa-paper-plane"></i></button></div></div>';
        $('.footer-chat').append(chat);
    }

    $(document).on('click', '.terminar_conversacion', function () {
        var txt;
        var r = confirm("Finalizar conversacion?");
        if (r == true) {
            const id = $(this).parents('.chatBox').data('id');
            $.post('../php/anonimo.php', {
                id: id,
                action: 'finalizar_conver'
            }, function (data) {
                console.log(data);
            });
        }
    })

    $(document).on('click', '.sendMessage_anonimo', function () {

        var id = $(this).parents('.chatBox').data('id');
        var mensaje = $.trim($('#textarea_anonimo' + id).val());

        console.log(mensaje);
        if (mensaje == "") {
            alert("debes ingresar algo");
            return false;
        }
        $.post('../php/insertarMensaje.php', {
            id: id,
            data_msj: mensaje,
            type_conversacion: '2'
        }, function (data) {
            $('#chat_body_anonimo' + id).html(data);
            var element = $('#textarea_anonimo' + id).emojioneArea();
            element[0].emojioneArea.setText('');
            $('#chat_body_anonimo' + id).scrollTop($('#chat_body_anonimo' + id).prop('scrollHeight'));
        });
    });



    function act_historial_msj_anonimo() {

        $('.anonimo').each(function () {
            //console.log("anonimo de anonimo");
            var id = $(this).data('id');
            Historial_msj_anonimo(id, "2", "2");
        });
        //console.log("actualizando historial de mensajes");
    }
    var audio = document.getElementById("miAudio");

    function Historial_msj_anonimo(id, tipo, anonimo) {
        $.post('../php/historial.php', {
            usuario: id,
            tipo_consult: tipo,
            tipo_conversacion: anonimo
        }, function (data) {
            // === undefined
            console.log(data);
            var json = JSON.parse(data);
            $('#chat_body_anonimo' + id).html(json['data'].historial);
            $('#chat_body_anonimo' + id).scrollTop($('#chat_body_anonimo' + id).prop('scrollHeight'));


            $('#status_anonimo' + id).removeClass("Activo NoActivo");
            $('#n_mensaje_anonimo' + id).removeClass("new_chat_msj");

            if (json['data'].mostrar == "SiNumero_msj") {

                if (json['data'].contador > 0) {
                    $('#n_mensaje_anonimo' + id).addClass('new_chat_msj');
                    //para que no vuelva asonar
                    var id_tipo = id + 'anonimo';
                    var indice = 0;
                    var encontrado = false;
                    for (var i = 0; i < arreglo_id.length; i++) {
                        if (arreglo_id[i][0] === id_tipo) {
                            indice = i;
                            encontrado = true;
                            //console.log(arrayChatbox_sound);
                        }
                    }
                    if (encontrado) {
                        if (json['data'].contador > arreglo_id[indice][1]) {
                            audio.currentTime = 0;
                            audio.play();
                            arreglo_id[indice][1] = json['data'].contador;
                        }
                    }
                    console.log(arreglo_id);

                }
            }
            $('#n_mensaje_anonimo' + id).html(json['data'].contador);

            var escribiendo = '';
            if (json['data'].is_type == "yes") {
                escribiendo = "Escribiendo...";
            } else {
                //escribiendo = "NoWriting";
                escribiendo = "";
            }
            $('#is_type_anonimo' + id).html(escribiendo);
            $('#status_anonimo' + id).addClass(json['data'].conexion);

            var fecha_ = "";
            if (json['data'].fecha != "") {
                fecha_ = "Ultima Conexion " + json['data'].fecha;
            }
            $('#fecha_ultima_anonimo' + id).html(fecha_);

        });
    }

    $(document).on('focus', '.message_send_anonimo', function () {
        var id = $(this).parents('.chatBox').data('id');
        focus_('yes', id, 'singular', '2', '../php/insert_writing.php');
    });


    $(document).on('blur', '.message_send_anonimo', function () {
        var id = $(this).parents('.chatBox').data('id');
        focus_('no', id, 'singular', '2', '../php/insert_writing.php');
    });

});
