<?php
require_once '../models/Usuario.php';

$usuario = new Usuario();

if(isset($_GET['op'])){

    if($_GET['op'] == 'login'){
        $tabla = $usuario->login($_GET['nombreusuario']);
        $claveIngresada = $_GET['clave'];
        
        if ($tabla){
          $claveEncriptada = $tabla['clave'];     
          
          if (password_verify($claveIngresada, $claveEncriptada)){
            $_SESSION['datosusuario'] = $tabla['nombreusuario'];
            $_SESSION['idactivo'] = $tabla['idusuario'];
            $_SESSION['clave'] = $claveIngresada;
            $_SESSION['nivel'] = $tabla['nivelacceso'];
    
            $_SESSION['login'] = true;     
            echo "";
    
          }else{
            $_SESSION['datosusuario'] = "";
            $_SESSION['login'] = false;
            echo "Error en la contraseña";
          }
    
        }else{
          $_SESSION['login'] = false;
          echo "No encontramos al usuario";
        } 
    }

    // if ($_GET['op'] == 'registrar-usuario'){
    //   $usuario->registrarUsuario([
    //     "idpersona"     => $_GET['idpersona'], 
    //     "nombreusuario" => $_GET['nombreusuario'], 
    //     "clave"         => $_GET['clave']
    //   ]);
    // }
}

?>