<?php
require_once '../models/Voluntario.php';

$voluntario = new Voluntario();

// despues
if (isset($_GET['op'])){
    if ($_GET['op'] == 'listarVoluntarios') {
        $data = $voluntario->listarVoluntarios();
        if($data){
          echo json_encode($data);
        }else{
          echo "No existen datos";
        }
    }

    if ($_GET['op'] == 'registrarVoluntario'){
      $voluntario->registrarVoluntario([
        "idpersona"         => $_GET["idpersona"],
        "descripcionvol"    => $_GET["descripcionvol"]
      ]);
    }

}

?>