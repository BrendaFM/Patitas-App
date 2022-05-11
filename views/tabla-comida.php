<?php
    require_once 'datatable.php';
    require_once 'acceso-seguro.php';
    if($_SESSION['nivelacceso']!= "C"){
        echo "<strong>No tiene el nivel de acceso requerido</strong>";
        exit();
    }
?>

<div class="container">
<p class="h2 m-2" style="text-align:center">Reporte de Kilogramos de Comida</p>
</div>
<br>

<div class="ml-3" id="restante-comida"> </div>
<br>
<div class="row">
    <div class="col-md-6">
        <div  class="card card-outline card-info  ml-3 mr-3 card-inverse">
            <div class="card-header">
                <p class="card-title mt-2" style="font-size: 22px">Kilogramos Donados</p>
            </div>
            <div class="card-body table-responsive">
                <table class="table" id="tablaDonacionesComidas">
                    <thead>
                        <tr>
                            <th class="text-center">N°</th>
                            <th class="text-center">Donante</th>
                            <th class="text-center">Fecha</th>
                            <th class="text-center">Cantidad</th>
                        </tr>
                    </thead>
                    <tbody class="table" id="DonacionesComidas">
                        <!-- Se carga de manera dinamica -->
                    </tbody>
                    <tfoot id="suma">

                    </tfoot>
                </table>
            </div>
        </div>
    </div>

    <div class="col-md-6">
        <div  class="card card-outline card-info  ml-3 mr-3 card-inverse">
            <div class="card-header">
                <p class="card-title mt-2" style="font-size: 22px">Comida Gastada</p>
                <a href="main.php?view=donaciones-registro">
                    <button style="background-color: white;" type="button" class="btn btn-lg float-right"><i class="fas fa-arrow-circle-left"></i> &nbsp;Volver</button>
                </a>
            </div>
            <div class="card-body table-responsive">
                <table class="table" id="tablaComidaGastos">
                    <thead>
                        <tr>
                            <th class="text-center">N°</th>
                            <th class="text-center">Usuario</th>
                            <th class="text-center">Fecha</th>
                            <th class="text-center">Cantidad</th>
                            <th class="text-center">Descripción</th>
                        </tr>
                    </thead>
                    <tbody class="table" id="ComidaGastos">
                        <!-- Se carga de manera dinamica -->
                    </tbody>
                    <tfoot id="sumaGastos">

                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function(){

        function listarDonacionesComidas(){
            $.ajax({
                url: 'controllers/Donacion.controller.php',
                type: 'GET',
                data: 'op=DonacionesComida',
                success: function(e){
                    var tabla = $("#tablaDonacionesComidas").DataTable();
                    tabla.destroy();
                    $("#DonacionesComidas").html(e);
                    $("#tablaDonacionesComidas").DataTable({
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

        function listarComidaGastos(){
            $.ajax({
                url: 'controllers/Gastos.controller.php',
                type: 'GET',
                data: 'op=GastosComida',
                success: function(e){
                    var tabla = $("#tablaComidaGastos").DataTable();
                    tabla.destroy();
                    $("#ComidaGastos").html(e);
                    $("#tablaComidaGastos").DataTable({
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

        function cargarTotal(){
            $.ajax({
                url: 'controllers/Donacion.controller.php',
                type: 'GET',
                data: 'op=TotalKG',
                success: function(e){
                    $("#suma").html(e);
                }
            });
        }

        function cargarTotalGastos(){
            $.ajax({
                url: 'controllers/Gastos.controller.php',
                type: 'GET',
                data: 'op=GastosComidaTotal',
                success: function(e){
                    $("#sumaGastos").html(e);
                }
            });
        }

        function restanteComida(){
            $.ajax({
                url: 'controllers/Gastos.controller.php',
                type: 'GET',
                data: 'op=restantecomida',
                success: function(e){
                    $("#restante-comida").html(e);
                }
            });
        }

        cargarTotal();
        cargarTotalGastos();
        listarDonacionesComidas();
        listarComidaGastos();
        restanteComida();
    });
</script>