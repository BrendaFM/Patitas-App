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

    if($_GET['op'] == 'DonacionesComida'){
      $datos = $donacion->DonacionesComida();

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
                      <td class='text-center'  width='5%'> $i </td>
                      <td class='text-center'  width='20%'> $tabla->apellidos, $tabla->nombres</td>
                      <td class='text-center'  width='20%'> $tabla->tipoapoyo</td>
                      <td class='text-center'  width='10%'> $tabla->fechaapoyo</td>
                      <td class='text-center'  width='15%'> $tabla->cantidad</td>
                      <td  width='30%'> $tabla->descripcion</td>
                  </tr>
              ";
              $i++;
          }

      }
    }

    if ($_GET['op'] == 'TotalKG'){
      $datos = $donacion->DonacionesComidaTotal();
          foreach($datos as $tabla){
              echo "
                  <tr>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td class='text-center'>Total de Kg.:</td>
                      <td class='text-center'>$tabla->preciototal</td>
                      <td></td>
                  </tr>
              ";
          }
    }

    if($_GET['op'] == 'DonacionesDinero'){
      $datos = $donacion->DonacionesDinero();

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
                      <td class='text-center'  width='5%'> $i </td>
                      <td class='text-center'  width='20%'> $tabla->apellidos, $tabla->nombres</td>
                      <td class='text-center'  width='20%'> $tabla->tipoapoyo</td>
                      <td class='text-center'  width='10%'> $tabla->fechaapoyo</td>
                      <td class='text-center'  width='15%'> $tabla->cantidad</td>
                      <td  width='30%'> $tabla->descripcion</td>
                  </tr>
              ";
              $i++;
          }
      }
    }

    if ($_GET['op'] == 'TotalDinero'){
      $datos = $donacion->DonacionesDineroTotal();
          foreach($datos as $tabla){
              echo "
                  <tr>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td class='text-center'>Total de Dinero:</td>
                      <td class='text-center'>$tabla->preciototal</td>
                      <td></td>
                  </tr>
              ";
          }
    }

    if($_GET['op'] == 'DonacionesDineroMayor'){
      $datos = $donacion->DonacionesDineroMayor();

      if(count($datos) == 0){
        echo "
        <tr>
            <td class='text-center' colspan='5'>No se encuentran datos</td>
        </tr>";
      }else{
          $i = 1;
          foreach($datos as $tabla){
              echo "
              <div d-flex justify-content-center '>
                <div class='card card-just-text' data-background='color' data-color='blue' data-radius='none'>
                    <div class='content'>
                        <h4 class='title'>¡Graias por tu apoyo!</h4>
                        <h6 class='category'> $tabla->apellidos , $tabla->nombres </h6>
                        <H6 class='category'> Cantidad: S/. $tabla->cantidad </H6>
                    </div>
                </div> 
              </div>
              ";
              $i++;
          }

      }
    }

    if($_GET['op'] == 'DonacionesComidaMayor'){
      $datos = $donacion->DonacionesComidaMayor();

      if(count($datos) == 0){
        echo "
        <tr>
            <td class='text-center' colspan='5'>No se encuentran datos</td>
        </tr>";
      }else{
          $i = 1;
          foreach($datos as $tabla){
              echo "
              <div class=' d-flex justify-content-center '>
                <div class='card card-just-text' data-background='color' data-color='blue' data-radius='none'>
                    <div class='content'>
                        <h4 class='title'>¡Gracias por tu Apoyo!</h4>
                        <h6 class='category'> $tabla->apellidos , $tabla->nombres </h6>
                        <H6 class='category'> Cantidad: $tabla->cantidad Kg. </H6>
                    </div>
                </div> 
              </div>
              ";
              $i++;
          }

      }
    }
}

?>