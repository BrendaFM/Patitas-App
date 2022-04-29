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

  public function actualizarClave(array $data){
    try {
      parent::execProcedureLogin($data, "spu_usuarios_actualizarclave", false);
    } catch (Exception $error) {
        die($error->getMessage());
    }
  }

  public function registrarUsuario(array $data){
    try{
      parent::execProcedure($data, "spu_usuarios_registro", false);
    }catch(Exception $error){
      die($error->getMessage());
    }
  }
}

?>