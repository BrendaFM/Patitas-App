<?php
    require_once 'datatable.php';
    require_once 'acceso-seguro.php';
    if($_SESSION['nivelacceso']!= "C"){
        echo "<strong>No tiene el nivel de acceso requerido</strong>";
        exit();
    }
?>

<div class="container">
<p class="h2 m-2" style="text-align:center">Reporte de mascotas que participaron en los eventos</p>
<br>
    <div class="row mb-5">
        <!-- select evento -->
        <div class="col-md-12">
            <label for="idtipoevento">Selecciona un Evento</label>
            <select id="idtipoevento" class="form-control form-control-border">
            </select>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div  class=" card card-outline card-info">
                <div class="card-header">
                    <p class="card-title mt-2" style="font-size: 22px">Lista</p>
                    <a href="main.php?view=eventos-registro">
                        <button style="background-color: white;" type="button" class="btn btn-lg float-right"><i class="fas fa-arrow-circle-left"></i> &nbsp;Volver</button>
                    </a>
                </div>
                <div class="card-body table-responsive">
                    <table class="table" id="filtroevento">
                        <thead>
                            <tr>
                                <th class="text-center">N°</th>
                                <th class="text-center">Tipo de Mascota</th>
                                <th class="text-center">Mascota</th>
                                <th class="text-center">Tipo de Evento</th>
                                <th class="text-center">Fecha</th>
                                <th class="text-center">Información</th>
                            </tr>
                        </thead>
                        <tbody class="table" id="datosfiltroevento">
                            
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function(){

        function cargarTipoEvento(){
            $.ajax({
                url: 'controllers/Eventos.controller.php',
                type: 'GET',
                data: 'op=cargarTipoeventosTodo',
                success: function(e){
                    $("#idtipoevento").html(e);
                }
            });
        }
        cargarTipoEvento();

        $("#idtipoevento").change(function (){

            var datos = {
                'op'                : 'FiltrarEvento',
                'idtipoevento'      : $(this).val()
            };

            $.ajax({
                url: 'controllers/Eventos.controller.php',
                type: 'GET',
                data: datos,
                success: function (e){
                    var tabla = $("#filtroevento").DataTable();
                    tabla.destroy();
                    $("#datosfiltroevento").html(e);
                    $("#filtroevento").DataTable({
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
        });

    });
</script>