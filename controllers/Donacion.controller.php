<?php
require_once '../models/Donacion.php';

$donacion = new Donacion();

if(isset($_GET['op'])){

    if($_GET['op'] == 'registrarDonacion'){
        $donacion->registrarDonacion([
            "idpersona" => $_GET["idpersona"],
            "idtipoapoyo" => $_GET["idtipoapoyo"],
            "cantidad" => $_GET["cantidad"],
            "descripcion" => $_GET["descripcion"]
        ]);
    }

    if ($_GET['op'] == 'reportesoles') {

        $data = $donacion->reportesoles();

        if($data){
          echo json_encode($data);
        }else{
          echo "No existen datos";
        }
    }

    if ($_GET['op'] == 'reportekilos') {

        $data = $donacion->reportekilos();

        if($data){
          echo json_encode($data);
        }else{
          echo "No existen datos";
        }
    }
    
    if($_GET['op'] == 'otrasDonaciones'){
      $datos = $donacion->otrasDonaciones();

      if(count($datos) == 0){
        echo "
        <tr>
            <td class='text-center' colspan='5'>No se encuentran datos</td>
        </tr>";
      }else{
          $i = 1;
          foreach($datos as $tabla){
              echo "
                  <tr>
                      <td class='text-center'  width='10%'> $i </td>
                      <td class='text-center'  width='25%'> $tabla->apellidos, $tabla->nombres</td>
                      <td class='text-center'  width='15%'> $tabla->tipoapoyo</td>
                      <td class='text-center'  width='15%'> $tabla->fechaapoyo</td>
                      <td  width='35%'> $tabla->descripcion</td>
                  </tr>
              ";
              $i++;
          }

      }
    }
}

?>