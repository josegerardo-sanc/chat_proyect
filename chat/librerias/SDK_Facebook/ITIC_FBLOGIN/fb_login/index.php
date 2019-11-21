<?php
// Include FB config file && User class
require_once 'fbConfig.php';
require_once 'usuarios.php';



if(isset($accessToken)){
    if(isset($_SESSION['facebook_access_token'])){
        $fb->setDefaultAccessToken($_SESSION['facebook_access_token']);
    }else{
        // Token de acceso de corta duración en sesión
        $_SESSION['facebook_access_token'] = (string) $accessToken;
        
          // Controlador de cliente OAuth 2.0 ayuda a administrar tokens de acceso
        $oAuth2Client = $fb->getOAuth2Client();
        
        // Intercambia una ficha de acceso de corta duración para una persona de larga vida
        $longLivedAccessToken = $oAuth2Client->getLongLivedAccessToken($_SESSION['facebook_access_token']);
        $_SESSION['facebook_access_token'] = (string) $longLivedAccessToken;
        
        // Establecer token de acceso predeterminado para ser utilizado en el script
        $fb->setDefaultAccessToken($_SESSION['facebook_access_token']);
    }
    
    // Redirigir el usuario de nuevo a la misma página si url tiene "code" parámetro en la cadena de consulta
    if(isset($_GET['code'])){
        header('Location: ./');
    }
    
    // Obtener información sobre el perfil de usuario facebook
    try {
        $profileRequest = $fb->get('/me?fields=name,first_name,last_name,email,link,gender,locale,picture');
        $fbUserProfile = $profileRequest->getGraphNode()->asArray();
    } catch(FacebookResponseException $e) {
        echo 'Graph returned an error: ' . $e->getMessage();
        session_destroy();
        // Redirigir usuario a la página de inicio de sesión de la aplicación
        header("Location: ./");
        exit;
    } catch(FacebookSDKException $e) {
        echo 'Facebook SDK returned an error: ' . $e->getMessage();
        exit;
    }
    
    // Inicializar clase "user"
    $user = new User();
    
    // datos de usuario que iran a  la base de datos
    $fbUserData = array(
        'oauth_provider'=> 'facebook',
        'oauth_uid'     => $fbUserProfile['id'],
        'first_name'    => $fbUserProfile['first_name'],
        'last_name'     => $fbUserProfile['last_name'],
        'email'         => $fbUserProfile['email'],
        'gender'        => $fbUserProfile['gender'],
        'locale'        => $fbUserProfile['locale'],
        'picture'       => $fbUserProfile['picture']['url'],
        'link'          => $fbUserProfile['link']
    );
    $userData = $user->checkUser($fbUserData);
    
    // Poner datos de usuario en variables de Session
    $_SESSION['userData'] = $userData;
    
    // Obtener el url para cerrar sesión
    $logoutURL = $helper->getLogoutUrl($accessToken, $redirectURL.'cerrar.php');
    
    // imprimir datos de usuario
    if(!empty($userData)){

        $userInfo= 
        '<div class="col-md-offset-3 col-md-6">
        <table class="table table-responsive" style="background-color:rgba(255, 255, 255, 0.3); border: 2px #a0bbe8 solid;">
            <h4 class="bg-primary text-center pad-basic">INFORMACIÓN DEL USUARIO</h4>
            <tr><th>Miniatura de Perfil:</th><td><img src="'.$userData['picture'].'"></td></tr>
            <tr><th>Nombre:</th><td>' . $userData['first_name'].' '.$userData['last_name'].'</td></tr>
            <tr><th>Correo:</th><td>' . $userData['email'].'</td></tr>
            <tr><th>Género:</th><td>' . $userData['gender'].'</td></tr>
            <tr><th>Ubicación:</th><td>' . $userData['locale'].'</td></tr>
            <tr><th>Logueado con: </th><td> Facebook </td></tr>
            <tr><th>Cerrar Sesión de:</th><td><a class="btn btn-primary" href="'.$logoutURL.'"> Facebook</a></td></tr>
        </table>
        </div>';


    }else{
        $output = '<h3 style="color:red">Ocurrió algún problema, por favor intenta nuevamente.</h3>';
    }
    
}else{
    // Obtener la liga de inicio de sesión
    $loginURL = $helper->getLoginUrl($redirectURL, $fbPermissions);
    
    // imprimir botón de login
    $output = '<a href="'.htmlspecialchars($loginURL).'"><div class="col-md-6 col-md-offset-4"><img class="img-responsive" src="fblogin-btn.png"></a></div>';
}
?>
<html>
<head>
<title>Inicia Sesión con FB</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <link href="css/estilos.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
</head>
<body>

    <header>
      <div class="alert alert-info">
      <h2>Registro y Login con Facebook SDK PHP</h2>
      </div>
    </header>
    <!-- Mostrar información del perfil y botón de login -->
    <div><?php echo $output; echo $userInfo; ?></div>
</body>
</html>