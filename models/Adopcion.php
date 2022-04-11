<?php

require_once '../core/model.master.php';


class Adopcion extends ModelMaster{

    public function listarAdopcion(){
        try{
            return parent::getRows("spu_adopcion_listar_tabla");
        }catch(Exception $error){
            die($error->getMessage());
        }
    }

    public function devolverMascota(array $datos){
        try{
          parent::execProcedure($datos, "spu_adopciones_eliminar", false);
        }catch(Exception $error){
          die($error->getMessage());
        }
    }

    public function registrarAdopcion(array $datos){
        try{
            return parent::execProcedure($datos, "spu_adopciones_registrar" , false);
        }catch(Exception $error){
            die($error->getMessage());
        }
    }

}



?>