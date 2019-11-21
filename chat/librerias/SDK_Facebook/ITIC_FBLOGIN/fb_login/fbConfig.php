<?php
if(!session_id()){
    session_start();
}

// Incluir el autoloader del the SDK
require_once __DIR__ . '/facebook-php-sdk/autoload.php';

// Include required libraries
use Facebook\Facebook;
use Facebook\Exceptions\FacebookResponseException;
use Facebook\Exceptions\FacebookSDKException;
/*
 * Configuración de Facebook SDK
 */
$appId         = '1908910596018805'; //Identificador de la Aplicación
$appSecret     = 'd957a4ade1e8ca26956dcdd7c20479c9'; //Clave secreta de la aplicación
$redirectURL   = 'http://itictutoriales.260mb.net/fb_login/'; //Callback URL
$fbPermissions = array('');  //Permisos opcionales

$fb = new Facebook(array(
    'app_id' => $appId,
    'app_secret' => $appSecret,
    'default_graph_version' => 'v2.9',
));

// Obtener el apoyo de logueo
$helper = $fb->getRedirectLoginHelper();

// Try para obtener el token
try {
    if(isset($_SESSION['facebook_access_token'])){
        $accessToken = $_SESSION['facebook_access_token'];
    }else{
          $accessToken = $helper->getAccessToken();
    }
} catch(FacebookResponseException $e) {
     echo 'Graph returned an error: ' . $e->getMessage();
      exit;
} catch(FacebookSDKException $e) {
    echo 'Facebook SDK returned an error: ' . $e->getMessage();
      exit;
}

?>