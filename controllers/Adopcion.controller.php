<?php
require_once '../models/Adopcion.php';



if(isset($_GET['op'])){
    
    $adopcion = new Adopcion();

    if($_GET['op'] == 'listarAdopcion'){
        $datosObtenidos = $adopcion->listarAdopcion();

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
                        <td class='text-center'> $tabla->apellidos , $tabla->nombres</td>
                        <td class='text-center'>$tabla->animal</td>
                        <td class='text-center'>$tabla->nombremascota</td>
                        <td class='text-center'> $tabla->fechaadopcion</td>
                        <td class='text-center'>
                            <a href='#' data-idmascota='$tabla->idmascota' class='btn btn-sm btn-outline-secondary devolvermascota'>
                            <i class='fas fa-trash-alt'></i>
                            </a>
                        </td>
                    </tr>
                ";
                $i++;
            }

        }
    }


    if ($_GET['op'] == 'devolverMascota'){

        $datosObtenidos = [
            'idmascota' => $_GET['idmascota']
        ];
        $adopcion->devolverMascota($datosObtenidos);
    }

    if($_GET['op'] == 'registrarAdopcion'){
        $adopcion->registrarAdopcion([
            "idpersona" => $_GET["idpersona"],
            "idmascota" => $_GET["idmascota"]
        ]);
    }
}
?>