$(function () {



    var screen_width = Math.round($(window).width());


    var icono_decendiente = '';
    icono_decendiente = '<i class="derecha eliminar fas fa-angle-up"></i>';

    /*<<<<<<<<<<este me permite mstrar mi conte opciones perfil>>>>>>>*/
    $('#config_footer').on('click', function (e) {
        e.preventDefault();
        if ($('.configuraciones_perfil').hasClass('conf_show')) {
            $('.configuraciones_perfil').removeClass('conf_show');
        } else {
            $('.configuraciones_perfil').addClass('conf_show');

        }

    });

    $('#cerrar').on('click', function () {

        window.location = "../php/salir.php";
    });


    /*<<<<<<<<<<btn de mostrar conte menu >>>>>>>*/
    $('#cerrar_men').on('click', function (e) {
        e.preventDefault();
        $('.menu_menu').toggleClass('show_menu');
    });


    $('#mostrar_menu_items').on('click', function (e) {

        e.preventDefault();
        $('.ul_menu_navegacion li').children('ul').css({
            display: ''
        }); /*quitar los slideup*/

        //esto me permite quitar los colores de la equita seleccionada
        $('.ul_menu_navegacion li a').removeClass('activado');
        $('.ul_menu_navegacion li a div').removeClass('activado');

        $('.menu_menu').toggleClass('show_menu');
    });


    $('#show_notificacione').on('click', function () {
        $('#lista_new_group').toggleClass('show');
    });

    /*<<<<<<<<<<me perimite desplegar mi menu>>>>>>>>>>>>><*/

    $('.ul_menu_navegacion li:has(ul)').on('click', function (e) {


        var hijo = this.children;
        if (hijo[0].classList.contains('activado')) {
            hijo[0].classList.remove('activado'); /*a*/
            hijo[0].children[0].classList.remove('activado'); /*a div*/
            $(this).children('ul').slideUp(); /*li ul*/
        } else {
            $('.ul_menu_navegacion li a').removeClass('activado');
            $('.ul_menu_navegacion li').children('ul').slideUp(); /*hide*/

            hijo[0].classList.add('activado'); /*a*/
            $(this).children('ul').slideDown(); /*li ul*/
        }

    });

    $(window).resize(function () {
        screen_width = $(window).width();
        /*<<<<<esconde mi conte perfil>>>>>*/
        $('.configuraciones_perfil').removeClass('conf_show');
        /*<<<<<esconde mi conte menu>>>*/
        $('.ul_menu_navegacion').removeClass('show_menu');

        //elementoos del menu seleccionado quitar el active

        //esto me permite quitar los colores de la equita seleccionada
        $('.ul_menu_navegacion li a').removeClass('activado');

        $('.ul_menu_navegacion li ul').css({
            display: ''
        }); /*hide*/

    });


});
