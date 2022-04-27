<?php

require_once '../core/model.master.php';


class Usuario extends ModelMaster{

  //Login
  public function login(array $data){
    try{
      return parent::execProcedureLogin($data, "spu_usuarios_login", true);

    } catch (Exception $error){
      die($error->getMessage());
    }
  }

    // public function registrarUsuario($idpersona, $nombreusuario, $clave){
    //     try{
    //       $comando = $this->pdo->prepare("CALL spu_usuarios_registro(?,?,?)");
    //       $comando->execute(array($idpersona, $nombreusuario, password_hash($clave, PASSWORD_BCRYPT)));
    //     }
    //     catch(Exception $e){
    //       die($e->getMessage());
    //     }
    // }
}

?>