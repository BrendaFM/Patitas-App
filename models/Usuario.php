<?php

require_once '../core/conexion.php';

class Usuario {

    public function __CONSTRUCT(){
        $conexion = new Conexion();
        $this->pdo = $conexion->connectServer();
    }
    
    public function login($nombreUsuario){
        try{
            $comando = $this->pdo->prepare("CALL spu_usuarios_login(?)");
            $comando->execute(array($nombreUsuario));
            
            return $comando->fetch(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    // public function registrarUsuario($idpersona, $nombreusuario, $clave){
    //     try{
    //       $comando = $this->pdo->prepare("CALL spu_usuarios_registro(?,?,?)");
    //       $comando->execute(array($idpersona, $nombreusuario, password_hash($clave, PASSWORD_BCRYPT)));
    //     }
    //     catch(Exception $e){
    //       die($e->getMessage());
    //     }
    // }
}

?>