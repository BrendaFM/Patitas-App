<?php

require_once '../models/Mascota.php';
if (isset($_GET['op'])){

    $mascota = new Mascota();

    if ($_GET['op'] == 'listarMascotas') {
        $datosObtenidos = $mascota->listarMascotas();

        //La salida fue comprobada en postman
        // echo json_encode($datosObtenidos);

        // Enviar resultados a la vista
        if(count($datosObtenidos) == 0){
            echo "<h5>No encontramos registros disponibles</h5>";
        }
        else{
            // Variable, utilizado para comprobar si contiene imagen o no
            $imagen = "";

            // Mostrar un registro, por cada iteración
            foreach($datosObtenidos as $fila){

                echo "
                    <div class='card col-md-3 mt-2 mb-2' style='width: 18rem;'>
                        <img src='./img/gato.jpg'>
                        <div class='card-body'>
                            <h5> $fila->nombremascota </h5> 
                            <p class='card-text' style='text-align:justif'><b>Raza:</b> $fila->raza</p>
                            <p class='card-text' style='text-align:justify'><b>Género:</b> $fila->genero</p>
                            <p class='card-text' style='text-align:justify'><b>Fecha de Nacimiento:</b> $fila->fechanacimiento</p>
                        </div>
                    </div>
                
                    ";
                        
            }
        }
            
        
    }

}




?>
