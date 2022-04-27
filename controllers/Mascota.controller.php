<?php
require_once '../models/Mascota.php';

session_start();

date_default_timezone_set("America/Lima");
$mascota = new Mascota();

if (isset($_GET['op'])){

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
                            <div class='card-custom-img' style='background-image: url(img/mascotas/$fila->fotografia);'></div>
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
                            <div class='card-custom-img' style='background-image: url(img/mascotas/$fila->fotografia);'></div>
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
                            <div class='card-custom-img' style='background-image: url(img/mascotas/$fila->fotografia);'></div>
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
                            <div class='card-custom-img' style='background-image: url(img/mascotas/$fila->fotografia);'></div>
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
                            <div class='card-custom-img' style='background-image: url(img/mascotas/$fila->fotografia);'></div>
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

    if ($_GET['op'] == 'listarMascotasPerdidos') {
        $datosObtenidos = $mascota->listarMascotasPerdidos();

        // Enviar resultados a la vista
        if(count($datosObtenidos) == 0){
            echo "<h5>No encontramos registros disponibles</h5>";
        }
        else{
            // Variable, utilizado para comprobar si contiene imagen o no
            $imagen = "";

            // Mostrar un registro, por cada iteración
            foreach($datosObtenidos as $fila){

                $boton = "";

                if($_SESSION['nivelacceso'] == 'C'){
                    $boton = "<button class='btn bg-gradient-secondary eliminar' style='float: right;' data-idmascota='$fila->idmascotaperdida'>Encontrado</button>";
                }
                echo "
                    <div class='col-md-3 col-lg-3 pb-3'>
                        <div class='card card-custom bg-white border-white border-0'>
                            <div class='card-custom-img' style='background-image: url(img/mascotasperdidas/$fila->fotografia);'></div>
                            <div class='card-custom-avatar'>
                                <img class='img-fluid' src='./img/avatar.jpg' alt='Avatar' />
                            </div>
                            <d class='card-body' style='overflow-y: auto'>
                                <p class='card-text' style='text-align:justify'><b>Tipo de animal:</b> $fila->animal</p>
                                <p class='card-text' style='text-align:justify'><b>Género:</b> $fila->genero</p>
                                <p class='card-text' style='text-align:justify'><b>Fecha encontrado:</b> $fila->fecha</p>
                                <p class='card-text' style='text-align:justify'><b>Lugar encontrado:</b>
                                    <a href='$fila->ubicacion'>Ubicacion Aqui</a>
                                </p>
                                $boton
                            </div>
                        </div>
                    </div>
                    ";  
            }
        }
    }

    if($_GET['op'] == 'eliminarMascotaPerdido'){
        $mascota->eliminarMascotaPerdido(["idmascotaperdida" => $_GET['idmascotaperdida']]);
    }

    if ($_GET['op'] == 'listarMascotasGaleria') {
        $datosObtenidos = $mascota->listarMascotasGaleria();

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
                    <div class='col-md-2 col-lg-3 pb-3'>
                        <div class='card card-custom2 bg-white border-white border-0'>
                            <div class='card-custom-img' style='background-image: url(img/mascotas/$fila->fotografia);'></div>
                            <div class='card-custom-avatar'>
                                <img class='img-fluid' src='./img/avatar.jpg' alt='Avatar' />
                            </div>
                            <div class='card-body' style='overflow-y: auto'>
                                <p class='card-title'><b>Nombre: </b>$fila->nombremascota</p>
                                <p class='card-text' style='text-align:justify'><b>Información:</b> $fila->animal - $fila->genero</p>
                            </div>
                        </div>
                    </div>
                    ";  
            }
        }
    }
}

if(isset($_POST['op'])){

    if($_POST['op'] == 'registrarMascota'){

        $nombre = "";
            
        if ($_FILES['fotografia']['tmp_name'] != ''){
            $nombre = date('YmdhGs') . ".jpg";
            if (move_uploaded_file($_FILES['fotografia']['tmp_name'], "../img/mascotas/" . $nombre)){
                $mascota->registrarMascota([
                    "idusuario"         => $_POST["idusuario"],
                    "idraza"            => $_POST["idraza"],
                    "nombremascota"     => $_POST["nombremascota"],
                    "genero"            => $_POST["genero"],
                    "fechanacimiento"   => $_POST["fechanacimiento"],
                    "observaciones"     => $_POST["observaciones"],
                    "esterilizacion"    => $_POST["esterilizacion"],
                    "fotografia"        => $nombre
                ]);
            }
        } 
    }

    if($_POST['op'] == 'registrarMascotaPerdidos'){

        $nombre = "";
            
        if ($_FILES['fotografia']['tmp_name'] != ''){
            $nombre = date('YmdhGs') . ".jpg";
            if (move_uploaded_file($_FILES['fotografia']['tmp_name'], "../img/mascotasperdidas/" . $nombre)){
                $mascota->registrarMascotaPerdidos([
                    "idusuario"         => $_POST["idusuario"],
                    "idraza"            => $_POST["idraza"],
                    "genero"            => $_POST["genero"],
                    "observaciones"     => $_POST["observaciones"],
                    "ubicacion"         => $_POST["ubicacion"],
                    "fotografia"        => $nombre
                ]);
            }
        }
    }
}
?>
