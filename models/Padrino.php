<?php 

require_once '../core/model.master.php';

class Padrino extends ModelMaster{
    
    public function registrarPadrino(array $data){
        try{
            parent::execProcedure($data, "spu_padrinos_registrar", false);

        }catch(Exception $error){
            die($error->getMessage());
        }
    }

    public function listarPadrino(){
        try{
            return parent::getRows("spu_padrinos_listar");
        }catch(Exception $error){
            die($error->getMessage());
        }
    }

    public function eliminarPadrino(array $data){
        try{
            parent::deleteRows($data, "spu_padrino_eliminar");
        }catch(Exception $error){
            die($error->getMessage());
        }
    }

}

?>