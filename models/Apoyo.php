<?php

require_once '../core/model.master.php';

class Apoyo extends ModelMaster{

    public function registrarApoyo(array $datos){
        try{
            return parent::execProcedure($datos, "spu_apoyo_registrar" , false);
        }catch(Exception $error){
            die($error->getMessage());
        }
    }

    public function listarApoyo(){
        try{
            return parent::getRows("spu_apoyo_listar");
        }catch(Exception $error){
            die($error->getMessage());
        }
    }
    
    public function reportesoles(){
        try{
          return parent::getRows("spu_grafico_soles");
        }
        catch(Exception $error){
          die($error->getMessage());
        }
    }
    
    public function reportekilos(){
        try{
          return parent::getRows("spu_grafico_kilogramos");
        }
        catch(Exception $error){
          die($error->getMessage());
        }
    }

}

?>