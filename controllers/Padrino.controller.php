<?php

require_once '../models/Padrino.php';

if (isset($_GET['op'])){

    $padrino = new Padrino();
    
    if($_GET['op'] == 'registrarPadrino'){
        $padrino->registrarPadrino([
            "idpersona" => $_GET["idpersona"],
            "idmascota" => $_GET["idmascota"]
        ]);
    }

    if($_GET['op'] == 'listarPadrino'){
        $datosObtenidos = $padrino->listarPadrino();

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
                        <td class='text-center'> $i </td>
                        <td class='text-center'>$tabla->apellidos,  $tabla->nombres</td>
                        <td class='text-center'> $tabla->animal</td>
                        <td class='text-center'> $tabla->nombremascota</td>
                        <td class='text-center'> $tabla->fecha</td>
                        <td class='text-center'> $tabla->vive</td>
                        <td class='text-center'>
                            <a href='#' data-idpadrino='$tabla->idpadrino' class='btn btn-sm btn-outline-secondary eliminar'>
                            <i class='fas fa-trash-alt'></i>
                            </a>
                        </td>
                    </tr>
                ";
                $i++;
            }

        }
    }

    if($_GET['op'] == 'eliminarPadrino'){
        $padrino->eliminarPadrino([
            "idpadrino" => $_GET['idpadrino']
        ]);
    }

}

?>