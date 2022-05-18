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

  if ($_GET['op'] == 'actualizarClave'){
    // la clave actual enviada coincide con la que iniciamos sesion

    $claveActual = $_GET['claveActual'];
    $claveNueva = $_GET['claveNueva'];

    if(password_verify($claveActual, $_SESSION['clave'])){
      //El usuario indico correctamente la clave original

      $datos = [
        "idusuario" => $_SESSION['idusuario'],
        "clave"     => password_hash($claveNueva, PASSWORD_BCRYPT)
      ];

      $usuario->actualizarClave($datos);

      echo "OK";
    }else{
      echo "La clave actual no es correcta";
    }
  }

  if ($_GET['op'] == 'registrarUsuario'){
    $clave = $_GET["clave"];
    $usuario->registrarUsuario([
      "idpersona"     => $_GET["idpersona"],
      "nombreusuario" => $_GET["nombreusuario"],
      "clave"         => password_hash( $clave, PASSWORD_BCRYPT)
    ]);
  }

  if ($_GET['op'] == 'registrarColaborador'){
    $clave = $_GET["clave"];
    $usuario->registrarColaborador([
      "idpersona"     => $_GET["idpersona"],
      "nombreusuario" => $_GET["nombreusuario"],
      "clave"         => password_hash( $clave, PASSWORD_BCRYPT)
    ]);
  }

  if($_GET['op'] == 'listarUsuariosRegistrados'){
    $datos = $usuario->listarUsuariosRegistrados();
    if(count($datos) != 0){
      $i = 1;
      foreach($datos as $tabla){
          echo "
              <tr>
                  <td class='text-center'> $i </td>
                  <td class='text-center'>$tabla->apellidos</td>
                  <td class='text-center'>$tabla->nombres</td>
                  <td class='text-center'> $tabla->fechaalta</td>
                  <td class='text-center'>
                      <a href='#' data-idusuario='$tabla->idusuario' class='btn btn-sm btn-outline-secondary actualizar'>
                        <i class='fas fa-edit'></i>
                      </a>
                  </td>
              </tr>
          ";
          $i++;
      }
    }
  }

  if($_GET['op'] == 'actualizarUsuariosAColaboradores'){
    $usuario->actualizarUsuariosAColaboradores(["idusuario"=> $_GET['idusuario']]);
  }

  if($_GET['op'] == 'listarColaboradores'){
    $datos = $usuario->listarColaboradores();
    if(count($datos) != 0){
      $i = 1;
      foreach($datos as $tabla){
          echo "
              <tr>
                  <td class='text-center'> $i </td>
                  <td class='text-center'>$tabla->apellidos</td>
                  <td class='text-center'>$tabla->nombres</td>
                  <td class='text-center'>$tabla->nombreusuario</td>
                  <td class='text-center'>
                      <a href='#' data-idusuario='$tabla->idusuario' class='btn btn-sm btn-outline-secondary quitar'>
                        <i class='fas fa-user-times'></i>
                      </a>
                  </td>
              </tr>
          ";
          $i++;
      }
    }
  }

  if($_GET['op'] == 'actualizarColaboradoresAUsuarios'){
    $usuario->actualizarColaboradoresAUsuarios(["idusuario"=> $_GET['idusuario']]);
  }
  
}
?>