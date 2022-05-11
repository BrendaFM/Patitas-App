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

  public function registrarTipoEvento(array $datos){
    try{
      return parent::execProcedure($datos, "spu_tipoeventos_registrar", false);
    }catch(Exception $error){
      die($error->getMessage());
    }
  }

  public function listarTipoEventos(){
    try{
      return parent::getRows("spu_tipoeventos_listar");
    }
    catch(Exception $error){
      die($error->getMessage());
    }
  }

  public function terminarEvento(array $data){
    try{
        parent::execProcedure($data, "spu_tipoeventos_terminar", false);
    }catch(Exception $error){
        die($error->getMessage());
    }
  }

  public function listarTipoEventosTerminados(){
    try{
      return parent::getRows("spu_tipoeventos_terminados_listar");
    }
    catch(Exception $error){
      die($error->getMessage());
    }
  }

  public function listarTipoEventosTodo(){
    try{
      return parent::getRows("spu_tipoeventos_listar_todo");
    }
    catch(Exception $error){
      die($error->getMessage());
    }
  }

  public function FiltrarEvento(array $data){
    try{
    //Si el metodo retorna datos (true), NO OLVIDAR agregar el RETURN
    return parent::execProcedure($data, "spu_eventos_filtro_tipoeventos", true);
    }
    catch(Exception $error){
    die($error->getMessage());
    }
  }

}

?>