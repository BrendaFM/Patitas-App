<?php
require_once '../models/Voluntario.php';

$voluntario = new Voluntario();

// despues
if (isset($_GET['op'])){
    if ($_GET['op'] == 'listarVoluntarios') {
        $datosObtenidos = $voluntario->listarVoluntarios();
        
        if(count($datosObtenidos) == 0){
          echo "
          <tr>
              <td class='text-center' colspan='5'>No se encuentran datos</td>             
          </tr>";
        }else{
            $i = 1;
            foreach($datosObtenidos as $tabla){

                $fechafinalizada = "";
                $finalizarVoluntariado = "";

                if($tabla->fechafin == ""){
                  $fechafinalizada = "
                     Activo
                  ";
                }else{
                    $fechafinalizada = "
                      $tabla->fechafin
                    ";
                }

                if($tabla->fechafin == null){
                  $finalizarVoluntariado = "
                      <a href='#' data-idvoluntario='$tabla->idvoluntario' data-idpersona='$tabla->idpersona' class='btn btn-sm btn-outline-info terminar'>
                          <i class='fas fa-clinic-medical'></i>
                      </a>
                  ";
                }else{
                    $finalizarVoluntariado = "
                        <a  class='btn btn-sm btn-outline-info noactivo'>
                            <i class='fas fa-check'></i>
                        </a> 
                    ";
                }

                echo "
                    <tr>
                        <td class='text-center'> $i </td>
                        <td class='text-center'>$tabla->apellidos,  $tabla->nombres</td>
                        <td class='text-center'> $tabla->fechainicio</td>
                        <td class='text-center'> {$fechafinalizada} </td>
                        <td class='text-center'> $tabla->descripcionvol</td>
                        <td class='text-center'>
                            {$finalizarVoluntariado}
                        </td>
                    </tr>
                ";
                $i++;
            }

        }
    }

    if ($_GET['op'] == 'registrarVoluntario'){
      $voluntario->registrarVoluntario([
        "idpersona"         => $_GET["idpersona"],
        "descripcionvol"    => $_GET["descripcionvol"]
      ]);
    }

    if ($_GET['op'] == 'cargarVoluntario') {
      $datosObtenidos = $voluntario->cargarVoluntario();

      if(count($datosObtenidos) == 0){
          echo "<option>No encontramos registros disponibles</option>";
      }
      else{
          echo "<option value=''>Seleccione</option>";
          foreach($datosObtenidos as $fila){
              echo "
                  <option value='$fila->idpersona'>$fila->apellidos , $fila->nombres</option>
                  ";
                      
          }
      }
    }

    if($_GET['op'] == 'terminarVoluntariado'){
      $voluntario->terminarVoluntariado([
        "idvoluntario" => $_GET['idvoluntario'],
        "idpersona" => $_GET['idpersona']
      ]);
    }

}

?>