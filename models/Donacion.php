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

    public function DonacionesComida(){
      try{
          return parent::getRows('spu_donaciones_comida');
      }catch(Exception $error){
          die($error->getMessage());
      }
    }
    
    public function DonacionesComidaTotal(){
      try{
          return parent::getRows('spu_donaciones_comida_total');
      }catch(Exception $error){
          die($error->getMessage());
      }
    }

    public function DonacionesComidaMayor(){
      try{
          return parent::getRows('spu_donaciones_comida_mayor');
      }catch(Exception $error){
          die($error->getMessage());
      }
    }
    
    public function DonacionesDinero(){
      try{
          return parent::getRows('spu_donaciones_dinero');
      }catch(Exception $error){
          die($error->getMessage());
      }
    }
    
    public function DonacionesDineroTotal(){
      try{
          return parent::getRows('spu_donaciones_dinero_total');
      }catch(Exception $error){
          die($error->getMessage());
      }
    }

    public function DonacionesDineroMayor(){
      try{
          return parent::getRows('spu_donaciones_dinero_mayor');
      }catch(Exception $error){
          die($error->getMessage());
      }
    }

}

?>