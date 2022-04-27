<?php
session_start();

require_once '../models/Usuario.php';

if (isset($_GET['op'])){

  $usuario = new Usuario();

  if ($_GET['op'] == 'login'){

    //Array asociativo
    $datos = ["nombreusuario" => $_GET['nombreusuario']];
    $resultado = $usuario->login($datos);
    
    if ($resultado){
      //Acceso al sistema
      //var_dump($resultado);

      $registro = $resultado[0];
      //var_dump($registro);

      //Sabemos que el usuario existe, entonces verificamos que su clave es CORRECTA
      $claveValidar = $_GET['clave'];

      //Validando la contraseña
      if (password_verify($claveValidar, $registro['clave'])){

        $_SESSION['acceso'] = true;

        //La clave es correcta...
        $_SESSION['idusuario'] = $registro['idusuario'];
        $_SESSION['apellidos'] = $registro['apellidos'];
        $_SESSION['nombres'] = $registro['nombres'];
        $_SESSION['nombreusuario'] = $registro['nombreusuario'];
        $_SESSION['clave'] = $registro['clave'];
        $_SESSION['nivelacceso'] = $registro['nivelacceso'];

        echo "";

      }else{

        $_SESSION['acceso'] = false;
        $_SESSION['idusuario'] = '';
        $_SESSION['apellidos'] = '';
        $_SESSION['nombres'] = '';
        $_SESSION['nombreusuario'] = '';
        $_SESSION['clave'] = '';
        $_SESSION['nivelacceso'] = '';

        echo "La clave es incorrecta";

      }

    }else{
      
      //No se puede acceder, usuario NO existe
      $_SESSION['acceso'] = false;
      $_SESSION['idusuario'] = '';
      $_SESSION['apellidos'] = '';
      $_SESSION['nombres'] = '';
      $_SESSION['nombreusuario'] = '';
      $_SESSION['clave'] = '';
      $_SESSION['nivelacceso'] = '';

      echo "El usuario no existe";
    }
  }

  if ($_GET['op'] == 'cerrar-sesion'){
    session_destroy();
    session_unset();
    header('Location:../');
  }

}

?>