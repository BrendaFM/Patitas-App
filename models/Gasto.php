<?php

require_once '../core/model.master.php';

class Gasto extends ModelMaster{
    
    public function GastosDinero(){
      try{
          return parent::getRows('spu_gastos_dinero');
      }catch(Exception $error){
          die($error->getMessage());
      }
    }
    
    public function GastosDineroTotal(){
      try{
          return parent::getRows('spu_gastos_dinero_total');
      }catch(Exception $error){
          die($error->getMessage());
      }
    }

    public function GastosComida(){
      try{
          return parent::getRows('spu_gastos_comida');
      }catch(Exception $error){
          die($error->getMessage());
      }
    }
    
    public function GastosComidaTotal(){
      try{
          return parent::getRows('spu_gastos_comida_total');
      }catch(Exception $error){
          die($error->getMessage());
      }
    }

    public function registrarGasto(array $datos){
        try{
            return parent::execProcedure($datos, "spu_gastos_registrar" , false);
        }catch(Exception $error){
            die($error->getMessage());
        }
    }

}

?>