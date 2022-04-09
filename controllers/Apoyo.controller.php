<?php
require_once '../models/Apoyo.php';

$apoyo = new Apoyo();

if(isset($_GET['op'])){

    // después
    if($_GET['op'] == 'listarApoyo'){
        $datos = $apoyo->listarApoyo();

        if(count($datos) == 0){
            echo "<h5>No se encontraron datos</h5>";
        }else{
            echo json_encode($datos);
        }
    }

    if($_GET['op'] == 'registrarApoyo'){
        $apoyo->registrarApoyo([
            "idpersona" => $_GET["idpersona"],
            "idtipoapoyo" => $_GET["idtipoapoyo"],
            "cantidad" => $_GET["cantidad"],
            "descripcion" => $_GET["descripcion"]
        ]);
    }

    if ($_GET['op'] == 'reportesoles') {

        $data = $apoyo->reportesoles();

        if($data){
          echo json_encode($data);
        }else{
          echo "No existen datos";
        }
    }

    if ($_GET['op'] == 'reportekilos') {

        $data = $apoyo->reportekilos();

        if($data){
          echo json_encode($data);
        }else{
          echo "No existen datos";
        }
    }
    
}

?>