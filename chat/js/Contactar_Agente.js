$(function () {


    var iniciar = setInterval(function () {
        Actualizar_conexion();
        Buscando_Agente();
        //act_historial_msj();
        //load_user();
    }, 5000);

    //status_anonimo == undefined si no existe mi variable no ejecuran los ajax

    /*----------------------------------------------*/
    function Actualizar_conexion() {
        var status_anonimo = $('#anonimo_id').val();
        if (status_anonimo == undefined) {
            console.log("la variable id_details no esta definida para el usuario anonimo!!");
            return false;
        }
        $.post('php/contactarAgente.php', {
            action: 'update_status'
        }, function (data) {
            console.log(data);
        });
    }
    /*----------------------------------------------*/

    var audio = document.getElementById("miAudio");
    Buscando_Agente();
    var contador_mensjaes=0;//arreglo de contador de mensaje;
    function Buscando_Agente() {
        var status_anonimo = $('#anonimo_id').val();
        if (status_anonimo == undefined) {
            console.log("la variable id_details no esta definida para el usuario anonimo!!");
            return false;
        }
        $.post('php/contactarAgente.php', {
            action: 'busqueda_agente',
            type_conversacion:'2'
        }, function (data) {
            console.log(data);
            var json = JSON.parse(data);
            if (json['data'].status_agente != '0') {
                /*oculto mi magen gif*/
                //////////////////////////////////
                $('#chat_body_anonimo').html(json['data'].html);
                /////////////////////////////////
                $('.buscandoAgente').css({
                    display: 'none'
                });
                if (json['data'].conv_finalizada == 2) {
                    $('#finalizacion').html("conversacion finalizada");
                    $.post('php/contactarAgente.php', {
                        action: 'finalizar_chat'
                    }, function (data) {
                        console.log("chat finalizado");
                        $('.buscandoAgente').css({
                            display: 'flex'
                        });
                        $('.chatBox_anonimo').css({
                            display: 'none'
                        });
                        $('#anonimo_id').remove();
                    });

                }
                
                $('#status_anonimo').removeClass("Activo NoActivo");
                $('#n_mensaje_anonimo').removeClass("new_chat_msj");
                $('#n_mensaje_anonimo').text('');
                $('#status_anonimo').addClass(json['data'].conexion);
                $('.chatBox_anonimo').data('id', json['data'].id_agente);
                $('#agente_name').html(json['data'].agente);
                if (json['data'].mostrar == "SiNumero_msj") {
                    if (json['data'].contador >0) {
                        $('#n_mensaje_anonimo').html(json['data'].contador);
                        $('#n_mensaje_anonimo').addClass('new_chat_msj');
                        if(json['data'].contador >0){
                            if(json['data'].contador >contador_mensjaes){
                                promise_audio(audio.play(),audio);
                                contador_mensjaes=json['data'].contador;
                            }
                        }
                    }
                }
                var escribiendo = '';
                if (json['data'].is_type == "yes") {
                    escribiendo = "Escribiendo...";
                } else {
                    //escribiendo = "NoWriting";
                    escribiendo = "";
                }
                $('#chat_is_type').html(escribiendo);
            }

        });

    }
    function promise_audio(promise, call_call) {
        if (promise !== undefined) {

            promise.then(_ => {
                //call_call.currentTime = 0;
                call_call.play();
                console.log("succeful audio")
                //Autoplay started!
                return true;
            }).catch(error => {
                console.log("error audio");
                return false;
                // Autoplay was prevented.

                // Show a "Play" button so that user can start playback.

            });

        }

    } 

    /*---------------cerrar chat--------------------*/
    $('#cerrar_chat_anonimo').on('click', function () {
        $('.chatBox_anonimo').css({
            display: 'none'
        });
    });
    /*--------------llamado del formulario----------------------*/

    $('.Contactar_Agente').on('click', function (e) {
        e.preventDefault();
        var status_anonimo = $('#anonimo_id').val(); //status_anonimo_id

        if (status_anonimo == undefined) {
            $('.status_login_').html(''); //status_msj alert
            $('#formu_login')[0].reset();
            $('#tipo_logueo').val('anonimo');
            $('#input_pass_logueo').hide();
            $('#campos_anonimo').fadeIn();
            $('#modal_login .modal-title').text('Contactar Un Agente');
            $('#modal_login').modal('show');

        } else {
            $('.chatBox_anonimo').fadeIn();
            $('.chatBox_anonimo').css({
                display: 'flex'
            });
        }
    });
    /*----------------------------------------------*/

    $('.usuario_normal').on('click', function (e) {
        e.preventDefault();
        $('.status_login_').html(''); //status_msj

        $('#formu_login')[0].reset();
        $('#tipo_logueo').val('usuario');
        $('#input_pass_logueo').show();
        $('#campos_anonimo').hide();
        $('#modal_login .modal-title').text('Acceder');
        $('#modal_login').modal('show');

    });
    /*----------------------------------------------*/

    $('#btn_logueo').on('click', function (e) {
        e.preventDefault();
        var tipo_logueo = $('#tipo_logueo').val();

        var correo = $('#correo').val();
        if (tipo_logueo == "usuario") {
            var pass = $('#pass').val();
            if (correo == "" && pass == "") {
                alert("son obligatorios los campos");
                return false;
            }
            $.post('php/acceso.php', {
                usuario: correo,
                pass: pass
            }, function (data) {
                var json = JSON.parse(data);
                var alert = 'alert-warning';
                if (json['data'].respuesta) {
                    var alert = 'alert-success';
                    window.location.href = 'paginas/panel.php'; //Will take you to Google.
                }
                var alert = '<div class="mb-2 alert ' + alert + ' alert-dismissible fade show" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>' + json['data'].error + '</div>';


                $('.status_login_').html(alert);

            });

        } else {
            console.log("entramos");
            var nombre = $('#nombre').val();
            var paterno = $('#paterno').val();
            var materno = $('#materno').val();

            if (nombre == "" && paterno == "" && materno == "") {
                alert("son obligatorios los campos");
                return false;
            }

            $.post('php/contactarAgente.php', {
                usuario: correo,
                nombre: nombre,
                paterno: paterno,
                materno: materno,
                action: 'inset_anonimo'
            }, function (data) {
                console.log(data);
                var json = JSON.parse(data);
                if (json['data'].datos) {
                    $('#modal_login').modal('hide');
                    //alert("Datos Insertados Con Exito");
                    $('.chatBox_anonimo').css({
                        display: 'flex'
                    });
                    $('body').append('<input id="anonimo_id" type="hidden" value="1">');
                }

            });
        }
    });
    /*--------------------*/

    $(document).on('click', '.sendMessage', function () {
        var id = $(this).parents('.chatBox_anonimo').data('id');
        var mensaje = $.trim($('#textarea').val());
        if (mensaje == "") {
            alert("debes ingresar algo");
            return false;
        }
        $.post('php/insertarMensaje.php', {
            id: id,
            data_msj: mensaje,
            type_conversacion: '2' //2 representa mensaje de anonimo
        }, function (data) {
            console.log("mensaje enviado");
            $('#chat_body_anonimo').html(data);
            $('#textarea').val('');
            //var element = $('#textarea').emojioneArea();
            //element[0].emojioneArea.setText('');
            $('#chat_body_anonimo').scrollTop($('#chat_body_anonimo').prop('scrollHeight'));
        });
    });

 $(document).on('focus', '.message_send_cliente', function () {
        var id = $(this).parents('.chatBox_anonimo').data('id');
        focus_('yes', id, '', '0', 'php/insert_writing.php');
});

 $(document).on('blur', '.message_send_cliente', function () {
        var id = $(this).parents('.chatBox_anonimo').data('id');
        focus_('no', id, '', '0', 'php/insert_writing.php');
    });

 function focus_(is_type, id, tipo_chatbox, type_conversacion, ruta) {
    $.post(ruta, {
        id: id,
        type: is_type,
        type_conversacion: type_conversacion
    }, function (data) {
        console.log(data);
    });
}

});
