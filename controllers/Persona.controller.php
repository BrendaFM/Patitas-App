<?php
require_once '../models/Persona.php';
if (isset($_GET['op'])){

    $persona = new Persona();

    if ($_GET['op'] == 'cargarPersonas') {
        $datosObtenidos = $persona->cargarPersonas();

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

    if ($_GET['op'] == 'registrarPersona'){
        $persona->registrarPersona([
          "apellidos"     => $_GET["apellidos"],
          "nombres"       => $_GET["nombres"],
          "tipodoc"       => $_GET["tipodoc"],
          "numdoc"        => $_GET["numdoc"],
          "direccion"     => $_GET["direccion"],
          "telefono"      => $_GET["telefono"]
        ]);
    }

    if ($_GET['op'] == 'cargarPersonasTotal') {
        $datosObtenidos = $persona->cargarPersonasTotal();
  
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
}
?>
