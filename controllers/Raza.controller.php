<?php
require_once '../models/Raza.php';
if (isset($_GET['op'])){

    $raza = new Raza();

    if($_GET['op'] == 'cargarRazas'){
        $datosObtenidos = $raza->cargarRazas(["idanimal" => $_GET['idanimal']]);

        // var_dump($datosObtenidos);

        if(count($datosObtenidos) == 0){
            echo "<h5>No encontramos registros disponibles</h5>";
        }
        else{
            // Mostrar un registro, por cada iteración
            foreach($datosObtenidos as $fila){
                echo "
                        <option value='$fila->idraza'>$fila->raza</option>

                    ";
            }
        }
    }
    
}
?>