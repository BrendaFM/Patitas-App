<?php

require_once '../models/Evento.php';

if (isset($_GET['op'])){

    $evento = new Evento();
    
    if($_GET['op'] == 'registrarEvento'){
        $evento->registrarEvento([
            "idmascota" => $_GET["idmascota"],
            "idtipoevento" => $_GET["idtipoevento"],
            "informacion" => $_GET["informacion"]
        ]);
    }

    if($_GET['op'] == 'listarEventos'){
        $datosObtenidos = $evento->listarEventos();

        if(count($datosObtenidos) != 0){
            $i = 1;
            foreach($datosObtenidos as $tabla){
                echo "
                    <tr>
                        <td class='text-center'  width='5%'> $i </td>
                        <td class='text-center'  width='15%'> $tabla->animal</td>
                        <td class='text-center'  width='15%'> $tabla->nombremascota</td>
                        <td class='text-center'  width='25%'> $tabla->tipoevento</td>
                        <td class='text-center'  width='15%'> $tabla->fechahora</td>
                        <td class='text-center'  width='25%'> $tabla->informacion</td>
                    </tr>
                ";
                $i++;
            }

        }
    }

    if($_GET['op'] == 'cargarTipoeventos'){
        $datosObtenidos = $evento->listarTipoEventos();

        if(count($datosObtenidos) == 0){
            echo "<option>No hay ningún evento disponible</option>";
        }else{
            echo "<option value=''>Seleccione</option>";
            foreach($datosObtenidos as $fila){
                echo "
                    <option value='$fila->idtipoevento'>$fila->tipoevento</option>
                ";
            }
        }
    }

    if($_GET['op'] == 'cargarTipoeventosTodo'){
        $datosObtenidos = $evento->listarTipoEventosTodo();

        if(count($datosObtenidos) == 0){
            echo "<option>No hay ningún evento disponible</option>";
        }else{
            echo "<option value=''>Seleccione</option>";
            foreach($datosObtenidos as $fila){
                echo "
                    <option value='$fila->idtipoevento'>$fila->tipoevento - $fila->fechainicio</option>
                ";
            }
        }
    }

    if($_GET['op'] == 'registrarTipoEvento'){
        $evento->registrarTipoEvento([
            "tipoevento" => $_GET["tipoevento"]
        ]);
    }

    if($_GET['op'] == 'listarTipoEventos'){
        $datosObtenidos = $evento->listarTipoEventos();

        if(count($datosObtenidos) != 0){
            $i = 1;
            foreach($datosObtenidos as $tabla){
                echo "
                    <tr>
                        <td class='text-center'  width='15%'> $i </td>
                        <td class='text-center'  width='45%'> $tabla->tipoevento</td>
                        <td class='text-center'  width='20%'> $tabla->fechainicio</td>
                        <td class='text-center' width='20%'>
                            <a href='#' data-idtipoevento='$tabla->idtipoevento' class='btn btn-sm btn-outline-info terminar'>
                                <i class='fas fa-calendar-times'></i>
                            </a>
                        </td>
                    </tr>
                ";
                $i++;
            }

        }
    }

    if($_GET['op'] == 'terminarEvento'){
        $evento->terminarEvento([
          "idtipoevento" => $_GET['idtipoevento']
        ]);
    }

    if($_GET['op'] == 'listarTipoEventosTerminados'){
        $datosObtenidos = $evento->listarTipoEventosTerminados();

        if(count($datosObtenidos) != 0){
            $i = 1;
            foreach($datosObtenidos as $tabla){
                echo "
                    <tr>
                        <td class='text-center'  width='15%'> $i </td>
                        <td class='text-center'  width='45%'> $tabla->tipoevento</td>
                        <td class='text-center'  width='20%'> $tabla->fechainicio</td>
                        <td class='text-center'  width='20%'> $tabla->fechatermino</td>
                    </tr>
                ";
                $i++;
            }
        }
    }

    if ($_GET['op'] == 'FiltrarEvento') {

        $datosObtenidos = $evento->FiltrarEvento(["idtipoevento" => $_GET['idtipoevento']]);

        if(count($datosObtenidos) != 0){
            $i = 1;
            foreach($datosObtenidos as $tabla){
                echo "
                    <tr>
                        <td class='text-center'  width='5%'> $i </td>
                        <td class='text-center'  width='15%'> $tabla->animal</td>
                        <td class='text-center'  width='15%'> $tabla->nombremascota</td>
                        <td class='text-center'  width='25%'> $tabla->tipoevento</td>
                        <td class='text-center'  width='15%'> $tabla->fechahora</td>
                        <td class='text-center'  width='25%'> $tabla->informacion</td>
                    </tr>
                ";
                $i++;
            }

        }

    }

}

?>