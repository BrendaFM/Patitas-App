<?php
    require_once 'datatable.php';
    require_once 'acceso-seguro.php';
    if($_SESSION['nivelacceso']!= "C"){
        echo "<strong>No tiene el nivel de acceso requerido</strong>";
        exit();
    }
?>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div  class=" card card-outline card-info">
                <div class="card-header">
                    <p class="card-title mt-2" style="font-size: 22px">Lista de Eventos Terminados</p>
                    <a href="main.php?view=tipoevento-registro">
                        <button style="background-color: white;" type="button" class="btn btn-lg float-right"><i class="fas fa-arrow-circle-left"></i> &nbsp;Volver</button>
                    </a>
                </div>
                <div class="card-body table-responsive">
                    <table class="table" id="EventosTerminados">
                        <thead>
                            <tr>
                            <th class="text-center">N°</th>
                            <th class="text-center">Tipo de Evento</th>
                            <th class="text-center">Fecha de Inicio</th>
                            <th class="text-center">Fecha de Término</th>
                            </tr>
                        </thead>
                        <tbody class="table" id="datosEventosTerminados">
                            
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function(){

        function listarTipoEventosTerminados(){
            $.ajax({
                url: 'controllers/Eventos.controller.php',
                type: 'GET',
                data: 'op=listarTipoEventosTerminados',
                success: function(e){
                    var tabla = $("#EventosTerminados").DataTable();
                    tabla.destroy();
                    $("#datosEventosTerminados").html(e);
                    $("#EventosTerminados").DataTable({
                        language: { url: '//cdn.datatables.net/plug-ins/1.10.24/i18n/Spanish.json' },
                        columnDefs: [
                        {
                            visible: true,
                            searchable: true
                        }
                        ],
                        dom: 'Bfrtip',
                        buttons: ['copy', 'print', 'pdf', 'excel']
                    });
                }
            });
        }

        listarTipoEventosTerminados();
    });
</script>