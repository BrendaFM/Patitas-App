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
    
    public function listarMascotasAdoptadas(){
        try{
            return parent::getRows("spu_mascotas_adoptadas_listar");
        } 
        catch (Exception $error){
            die($error->getMessage());
        }
    }

    public function MascotaTipo(array $data){
        try{
        //Si el metodo retorna datos (true), NO OLVIDAR agregar el RETURN
        return parent::execProcedure($data, "spu_mascotas_tipo", true);
        }
        catch(Exception $error){
        die($error->getMessage());
        }
    }

    public function MascotaGenero(array $data){
        try{
        //Si el metodo retorna datos (true), NO OLVIDAR agregar el RETURN
        return parent::execProcedure($data, "spu_mascotas_genero", true);
        }
        catch(Exception $error){
        die($error->getMessage());
        }
    }

    public function MascotaEsterilizado(array $data){
        try{
        //Si el metodo retorna datos (true), NO OLVIDAR agregar el RETURN
        return parent::execProcedure($data, "spu_mascotas_esterilizacion", true);
        }
        catch(Exception $error){
        die($error->getMessage());
        }
    }

    public function registrarMascota(array $data){
        try{
            parent::execProcedure($data, "spu_mascotas_registro", false);
        }catch(Exception $error){
            die($error->getMessage());
        }
    }

    public function reporteAdoptados(){
        try{
          return parent::getRows("spu_grafico_adoptados");
        }
        catch(Exception $error){
          die($error->getMessage());
        }
    }

    public function cargarMascotaPadrino(){
        try{
            return parent::getRows("spu_mascotas_cargar_padrinos");
        }catch(Exception $error){
            die($error->getMessage());
        }
    }
    
    public function cargarMascotaEvento(){
        try{
            return parent::getRows("spu_mascotas_cargar_eventos");
        }catch(Exception $error){
            die($error->getMessage());
        }
    }
    
    public function cargarMascotaAdopcion(){
        try{
            return parent::getRows("spu_mascotas_cargar_adopciones");
        }catch(Exception $error){
            die($error->getMessage());
        }
    }

    public function eliminarMascota(array $data){
        try{
            parent::execProcedure($data, "spu_mascotas_eliminar", false);
        }catch(Exception $error){
            die($error->getMessage());
        }
    }

    public function esterilizarMascota(array $data){
        try{
            parent::execProcedure($data, "spu_esterilizar_mascota", false);
        }catch(Exception $error){
            die($error->getMessage());
        }
    }
    
}

?>