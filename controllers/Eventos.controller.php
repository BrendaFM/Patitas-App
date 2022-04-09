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

        if(count($datosObtenidos) == 0){
            echo "
            <tr>
                <td class='text-center' colspan='5'>No se encuentran datos</td>             
            </tr>";
        }else{
            $i = 1;
            foreach($datosObtenidos as $tabla){
                echo "
                    <tr>
                        <td class='text-center'  width='10%'> $i </td>
                        <td class='text-center'  width='20%'> $tabla->nombremascota</td>
                        <td class='text-center'  width='20%'> $tabla->tipoevento</td>
                        <td class='text-center'  width='20%'> $tabla->fechahora</td>
                        <td class='text-center'  width='30%'> $tabla->informacion</td>
                    </tr>
                ";
                $i++;
            }

        }
    }

}

?>