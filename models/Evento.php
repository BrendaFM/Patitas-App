<?php

require_once '../core/model.master.php';

class Evento extends ModelMaster{

  public function listarEventos(){
    try{
      return parent::getRows("spu_eventos_listar");
    }
    catch(Exception $error){
      die($error->getMessage());
    }
  }

  public function registrarEvento(array $datos){
    try{
      return parent::execProcedure($datos, "spu_eventos_registrar", false);
    }catch(Exception $error){
      die($error->getMessage());
    }
  }

}

?>