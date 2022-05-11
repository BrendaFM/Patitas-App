<?php

require_once '../core/model.master.php';

class Voluntario extends ModelMaster{

    public function listarVoluntarios(){
        try{
          return parent::getRows("spu_voluntarios_listar");
        }
        catch(Exception $error){
          die($error->getMessage());
        }
    }

    public function voluntariosArchivados(){
      try{
        return parent::getRows("spu_voluntarios_archivados");
      }
      catch(Exception $error){
        die($error->getMessage());
      }
    }

    public function registrarVoluntario(array $data){
        try{
          parent::execProcedure($data, "spu_voluntarios_registrar", false);
        }
        catch(Exception $error){
          die($error->getMessage());
        }
    }
    
    public function cargarVoluntario(){
      try{
          return parent::getRows("spu_voluntarios_cargar");
      } 
      catch (Exception $error){
          die($error->getMessage());
      }
    }

    public function terminarVoluntariado(array $data){
      try{
          parent::execProcedure($data, "spu_voluntarios_terminar", false);
      }catch(Exception $error){
          die($error->getMessage());
      }
    }

    public function reactivarVoluntariado(array $data){
      try{
          parent::execProcedure($data, "spu_voluntarios_devolver", false);
      }catch(Exception $error){
          die($error->getMessage());
      }
  }

}

?>