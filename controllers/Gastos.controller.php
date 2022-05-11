<?php
require_once '../models/Gasto.php';
require_once '../models/Donacion.php';

$gasto = new Gasto();
$donacion = new Donacion();

if(isset($_GET['op'])){

    if($_GET['op'] == 'GastosDinero'){
      $datos = $gasto->GastosDinero();

      if(count($datos) != 0){
          $i = 1;
          foreach($datos as $tabla){
              echo "
                  <tr>
                      <td class='text-center'  width='10%'> $i </td>
                      <td class='text-center'  width='30%'> $tabla->apellidos, $tabla->nombres</td>
                      <td class='text-center'  width='15%'> $tabla->fecha</td>
                      <td class='text-center'  width='15%'> $tabla->cantidadsalida</td>
                      <td  width='30%'> $tabla->descripcion</td>
                  </tr>
              ";
              $i++;
          }
      }
    }

    if ($_GET['op'] == 'GastosDineroTotal'){
      $datos = $gasto->GastosDineroTotal();
          foreach($datos as $tabla){
              echo "
                  <tr>
                      <td></td>
                      <td></td>
                      <td class='text-center'>Dinero Gastado:</td>
                      <td class='text-center'>$tabla->gastototal</td>
                      <td></td>
                  </tr>
              ";
          }
    }

    if($_GET['op'] == 'GastosComida'){
        $datos = $gasto->GastosComida();
  
        if(count($datos) != 0){
            $i = 1;
            foreach($datos as $tabla){
                echo "
                    <tr>
                        <td class='text-center'  width='10%'> $i </td>
                        <td class='text-center'  width='30%'> $tabla->apellidos, $tabla->nombres</td>
                        <td class='text-center'  width='15%'> $tabla->fecha</td>
                        <td class='text-center'  width='15%'> $tabla->cantidadsalida</td>
                        <td  width='30%'> $tabla->descripcion</td>
                    </tr>
                ";
                $i++;
            }
        }
    }
  
    if ($_GET['op'] == 'GastosComidaTotal'){
        $datos = $gasto->GastosComidaTotal();
            foreach($datos as $tabla){
                echo "
                    <tr>
                        <td></td>
                        <td></td>
                        <td class='text-center'>Dinero Gastado:</td>
                        <td class='text-center'>$tabla->gastototal</td>
                        <td></td>
                    </tr>
                ";
            }
    }

    if ($_GET['op'] == 'restantecomida'){
        $datos = $donacion->DonacionesComidaTotal();
        $datosGastos = $gasto->gastosComidaTotal();

        foreach($datosGastos as $tablagastos){
          $salida = $tablagastos->gastototal;
        }

        foreach($datos as $tabla){
            $entrada = $tabla->preciototal;
        }

        $restante = $entrada - $salida;

        echo "<h5>&nbsp; <i class='fas fa-utensils'></i> La comida que resta es: $restante Kg. </h5>";
    }

    if ($_GET['op'] == 'restantedinero'){
        $datos = $donacion->DonacionesDineroTotal();
        $datosGastos = $gasto->gastosDineroTotal();

        foreach($datosGastos as $tablagastos){
          $salida = $tablagastos->gastototal;
        }

        foreach($datos as $tabla){
            $entrada = $tabla->preciototal;
        }

        $restante = $entrada - $salida;

        echo "<h5>&nbsp; <i class='fas fa-hand-holding-usd'></i> El dinero que resta es: $restante soles. </h5>";
    }

    if($_GET['op'] == 'registrarGasto'){
        $gasto->registrarGasto([
            "idusuario" => $_GET["idusuario"],
            "idtipoapoyo" => $_GET["idtipoapoyo"],
            "cantidadsalida" => $_GET["cantidadsalida"],
            "descripcion" => $_GET["descripcion"]
        ]);
    }

}
?>