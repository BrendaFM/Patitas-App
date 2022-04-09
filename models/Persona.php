<?php

require_once '../core/model.master.php';

//Cualquier operación / método / funcionalidad de tus MODELOS
//se hará con los métodos de la SUPER CLASE
class Persona extends ModelMaster{

    public function cargarPersonas(){
        try{
            return parent::getRows("spu_personas_listar");
        } 
        catch (Exception $error){
            die($error->getMessage());
        }
    }

    public function registrarPersona(array $data){
        try{
            parent::execProcedure($data, "spu_personas_registro", false);
        } 
        catch (Exception $error){
            die($error->getMessage());
        }
    }

    public function cargarPersonasTotal(){
        try{
            return parent::getRows("spu_personas_cargar");
        }catch(Exception $error){
            die($error->getMessage());
        }
    }
}

?>