<?php

require_once '../core/model.master.php';

class Raza extends ModelMaster{

    public function cargarRazas(array $data){
        try{
            return parent::execProcedure($data, "spu_razas_listar", true);
        } 
        catch (Exception $error){
            die($error->getMessage());
        }
    }

}

?>