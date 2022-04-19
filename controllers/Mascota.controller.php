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
                    <div class='col-md-3 col-lg-3 pb-3'>
                        <div class='card card-custom bg-white border-white border-0'>
                            <div class='card-custom-img' style='background-image: url(./img/gato.jpg);'></div>
                            <div class='card-custom-avatar'>
                                <img class='img-fluid' src='./img/avatar.jpg' alt='Avatar' />
                            </div>
                            <div class='card-body' style='overflow-y: auto'>
                                <h1 class='card-title display-3'>$fila->nombremascota</h1>
                                <p class='card-text' style='text-align:justify'><b>Tipo de animal:</b> $fila->animal</p>
                                    <p class='card-text' style='text-align:justify'><b>Raza:</b> $fila->raza</p>
                                    <p class='card-text' style='text-align:justify'><b>Género:</b> $fila->genero</p>
                                    <p class='card-text' style='text-align:justify'><b>Esterilizado:</b> $fila->esterilizacion</p>
                                    <p class='card-text' style='text-align:justify'><b>Fecha de Nacimiento:</b> $fila->fechanacimiento</p>
                            </div>
                        </div>
                    </div>
                
                    ";
                        
            }
        }
            
        
    }

    if ($_GET['op'] == 'listarMascotasTabla') {
        $datosObtenidos = $mascota->listarMascotas();

        if(count($datosObtenidos) == 0){
            echo "
            <tr>
                <td class='text-center' colspan='7'>No se encuentran datos</td>
            </tr>";
        }else{
            $i = 1;
            foreach($datosObtenidos as $tabla){
                $esterilizado = "";

                if($tabla->esterilizacion == "No"){
                    $esterilizado = "
                        <a href='#' data-idmascota='$tabla->idmascota' class='btn btn-sm btn-outline-info modificar'>
                            <i class='fas fa-clinic-medical'></i>
                        </a>
                    ";
                }else{
                    $esterilizado = "
                        <a  class='btn btn-sm btn-outline-info esterilizado'>
                            <i class='fas fa-check'></i>
                        </a> 
                    ";
                }

                echo "
                    <tr>
                        <td class='text-center'> $i </td>
                        <td class='text-center'> $tabla->nombremascota</td>
                        <td class='text-center'> $tabla->animal</td>
                        <td class='text-center'> $tabla->genero</td>
                        <td class='text-center'> $tabla->fechanacimiento</td>
                        <td class='text-center'> $tabla->esterilizacion</td>
                        <td class='text-center'>
                            {$esterilizado}
                            <a href='#' data-idmascota='$tabla->idmascota'  class='btn btn-sm btn-outline-secondary eliminar'>
                                <i class='fas fa-trash-alt'></i>
                            </a>
                        </td>
                    </tr>
                ";
                $i++;
            }
        }
    }

    if ($_GET['op'] == 'listarMascotasAdoptadas') {
        $datosObtenidos = $mascota->listarMascotasAdoptadas();

        if(count($datosObtenidos) == 0){
            echo "<h5>No encontramos registros disponibles :( </h5>";
        }
        else{
            // Variable, utilizado para comprobar si contiene imagen o no
            $imagen = "";

            // Mostrar un registro, por cada iteración
            foreach($datosObtenidos as $fila){

                echo "
                    <div class='col-md-3 col-lg-3 pb-3'>
                        <div class='card card-custom bg-white border-white border-0'>
                            <div class='card-custom-img' style='background-image: url(./img/gato.jpg);'></div>
                            <div class='card-custom-avatar'>
                                <img class='img-fluid' src='./img/avatar.jpg' alt='Avatar' />
                            </div>
                            <div class='card-body' style='overflow-y: auto'>
                                <h1 class='card-title display-3'>$fila->nombremascota</h1>
                                <p class='card-text' style='text-align:justify'><b>Tipo de animal:</b> $fila->animal</p>
                                    <p class='card-text' style='text-align:justify'><b>Raza:</b> $fila->raza</p>
                                    <p class='card-text' style='text-align:justify'><b>Género:</b> $fila->genero</p>
                                    <p class='card-text' style='text-align:justify'><b>Esterilizado:</b> $fila->esterilizacion</p>
                                    <p class='card-text' style='text-align:justify'><b>Fecha de Nacimiento:</b> $fila->fechanacimiento</p>
                            </div>
                        </div>
                    </div>
                    ";
                        
            }
        }
            
        
    }

    if ($_GET['op'] == 'MascotaTipo') {

        $datosObtenidos = $mascota->MascotaTipo(["idanimal" => $_GET['idanimal']]);

        if(count($datosObtenidos) == 0){
            echo "<h5>No encontramos registros disponibles :( </h5>";
        }
        else{
            // Variable, utilizado para comprobar si contiene imagen o no
            $imagen = "";

            // Mostrar un registro, por cada iteración
            foreach($datosObtenidos as $fila){

                echo "
                    <div class='col-md-3 col-lg-3 pb-3'>
                        <div class='card card-custom bg-white border-white border-0'>
                            <div class='card-custom-img' style='background-image: url(./img/gato.jpg);'></div>
                            <div class='card-custom-avatar'>
                                <img class='img-fluid' src='./img/avatar.jpg' alt='Avatar' />
                            </div>
                            <div class='card-body' style='overflow-y: auto'>
                                <h1 class='card-title display-3'>$fila->nombremascota</h1>
                                <p class='card-text' style='text-align:justify'><b>Tipo de animal:</b> $fila->idanimal</p>
                                    <p class='card-text' style='text-align:justify'><b>Raza:</b> $fila->raza</p>
                                    <p class='card-text' style='text-align:justify'><b>Género:</b> $fila->genero</p>
                                    <p class='card-text' style='text-align:justify'><b>Esterilizado:</b> $fila->esterilizacion</p>
                                    <p class='card-text' style='text-align:justify'><b>Fecha de Nacimiento:</b> $fila->fechanacimiento</p>
                            </div>
                        </div>
                    </div>
                    ";
                        
            }
        }

    }

    if ($_GET['op'] == 'MascotaGenero') {

        $datosObtenidos = $mascota->MascotaGenero(["genero" => $_GET['genero']]);

        if(count($datosObtenidos) == 0){
            echo "<h5>No encontramos registros disponibles :( </h5>";
        }
        else{
            // Variable, utilizado para comprobar si contiene imagen o no
            $imagen = "";

            // Mostrar un registro, por cada iteración
            foreach($datosObtenidos as $fila){

                echo "
                    <div class='col-md-3 col-lg-3 pb-3'>
                        <div class='card card-custom bg-white border-white border-0'>
                            <div class='card-custom-img' style='background-image: url(./img/gato.jpg);'></div>
                            <div class='card-custom-avatar'>
                                <img class='img-fluid' src='./img/avatar.jpg' alt='Avatar' />
                            </div>
                            <div class='card-body' style='overflow-y: auto'>
                                <h1 class='card-title display-3'>$fila->nombremascota</h1>
                                <p class='card-text' style='text-align:justify'><b>Tipo de animal:</b> $fila->idanimal</p>
                                    <p class='card-text' style='text-align:justify'><b>Raza:</b> $fila->raza</p>
                                    <p class='card-text' style='text-align:justify'><b>Género:</b> $fila->genero</p>
                                    <p class='card-text' style='text-align:justify'><b>Esterilizado:</b> $fila->esterilizacion</p>
                                    <p class='card-text' style='text-align:justify'><b>Fecha de Nacimiento:</b> $fila->fechanacimiento</p>
                            </div>
                        </div>
                    </div>
                    ";
                        
            }
        }

    }

    if ($_GET['op'] == 'MascotaEsterilizacion') {

        $datosObtenidos = $mascota->MascotaEsterilizado(["esterilizacion" => $_GET['esterilizacion']]);

        if(count($datosObtenidos) == 0){
            echo "<h5>No encontramos registros disponibles :( </h5>";
        }
        else{
            // Variable, utilizado para comprobar si contiene imagen o no
            $imagen = "";

            // Mostrar un registro, por cada iteración
            foreach($datosObtenidos as $fila){

                echo "
                    <div class='col-md-3 col-lg-3 pb-3'>
                        <div class='card card-custom bg-white border-white border-0'>
                            <div class='card-custom-img' style='background-image: url(./img/gato.jpg);'></div>
                            <div class='card-custom-avatar'>
                                <img class='img-fluid' src='./img/avatar.jpg' alt='Avatar' />
                            </div>
                            <div class='card-body' style='overflow-y: auto'>
                                <h1 class='card-title display-3'>$fila->nombremascota</h1>
                                <p class='card-text' style='text-align:justify'><b>Tipo de animal:</b> $fila->idanimal</p>
                                    <p class='card-text' style='text-align:justify'><b>Raza:</b> $fila->raza</p>
                                    <p class='card-text' style='text-align:justify'><b>Género:</b> $fila->genero</p>
                                    <p class='card-text' style='text-align:justify'><b>Esterilizado:</b> $fila->esterilizacion</p>
                                    <p class='card-text' style='text-align:justify'><b>Fecha de Nacimiento:</b> $fila->fechanacimiento</p>
                            </div>
                        </div>
                    </div>
                    ";
                        
            }
        }

    }

    if($_GET['op'] == 'registrarMascota'){
        $mascota->registrarMascota([
            "idusuario"         => $_GET["idusuario"],
            "idraza"            => $_GET["idraza"],
            "nombremascota"     => $_GET["nombremascota"],
            "genero"            => $_GET["genero"],
            "fechanacimiento"   => $_GET["fechanacimiento"],
            "observaciones"     => $_GET["observaciones"],
            "esterilizacion"    => $_GET["esterilizacion"] 
        ]);
    }
    
    if ($_GET['op'] == 'reporteAdoptados') {

        $data = $mascota->reporteAdoptados();
    
        if($data){
          echo json_encode($data);
        }else{
          echo "No existen datos";
        }
    }

    if($_GET['op'] == 'cargarMascotaPadrino'){
        $datosObtenidos = $mascota->cargarMascotaPadrino();

        if(count($datosObtenidos) == 0){
            echo "<option>No hay ninguna mascota registrada</option>";
        }else{
            echo "<option value=''>Seleccione</option>";
            foreach($datosObtenidos as $fila){
                echo "
                    <option value='$fila->idmascota'>$fila->animal - $fila->nombremascota</option>
                ";
            }
        }
    }

    if($_GET['op'] == 'cargarMascotaEvento'){
        $datosObtenidos = $mascota->cargarMascotaEvento();

        if(count($datosObtenidos) == 0){
            echo "<option>No hay ninguna mascota registrada</option>";
        }else{
            echo "<option value=''>Seleccione</option>";
            foreach($datosObtenidos as $fila){
                echo "
                    <option value='$fila->idmascota'>$fila->animal - $fila->nombremascota</option>
                ";
            }
        }
    }

    if($_GET['op'] == 'cargarMascotaAdopcion'){
        $datosObtenidos = $mascota->cargarMascotaAdopcion();

        if(count($datosObtenidos) == 0){
            echo "<option>No hay ninguna mascota registrada</option>";
        }else{
            echo "<option value=''>Seleccione</option>";
            foreach($datosObtenidos as $fila){
                echo "
                    <option value='$fila->idmascota'>$fila->animal - $fila->nombremascota</option>
                ";
            }
        }
    }
    
    if($_GET['op'] == 'eliminarMascota'){
        $mascota->eliminarMascota(["idmascota" => $_GET['idmascota']]);
    }

    if($_GET['op'] == 'esterilizarMascota'){
        $mascota->esterilizarMascota(["idmascota" => $_GET['idmascota']]);
    }

    if ($_GET['op'] == 'reporteAdoptadosMeses') {

        $data = $mascota->reporteAdoptadosMeses();
    
        if($data){
          echo json_encode($data);
        }else{
          echo "No existen datos";
        }
    }
}
?>
