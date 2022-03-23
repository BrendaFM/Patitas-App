<?php

require_once '../core/model.master.php';

//Cualquier operación / método / funcionalidad de tus MODELOS
//se hará con los métodos de la SUPER CLASE
class Mascota extends ModelMaster{

    public function listarMascotas(){
        try{
            return parent::getRows("spu_mascotas_listar");
        } 
        catch (Exception $error){
            die($error->getMessage());
        }
    }

}

?>