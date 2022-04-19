<?php

require_once '../core/model.master.php';

class Donacion extends ModelMaster{

    public function registrarDonacion(array $datos){
        try{
            return parent::execProcedure($datos, "spu_donaciones_registrar" , false);
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

    public function otrasDonaciones(){
      try{
          return parent::getRows('spu_donaciones_otrasdonaciones');
      }catch(Exception $error){
          die($error->getMessage());
      }
  }

}

?>