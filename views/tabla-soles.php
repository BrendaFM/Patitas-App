<?php
    require_once 'datatable.php';
?>
<div class="row">
<div class="col-md-3">
        <div id="topDonadoresDinero">
    
        </div>
    </div>
    <div class="col-md-9">
        <div  class="card card-outline card-info  ml-3 mr-3 card-inverse">
            <div class="card-header">
                <p class="card-title mt-2" style="font-size: 22px">Soles Donados</p>
                <a href="main.php?view=donaciones-registro">
                    <button style="background-color: white;" type="button" class="btn btn-lg float-right"><i class="fas fa-arrow-circle-left"></i> &nbsp;Volver</button>
                </a>
            </div>
            <div class="card-body table-responsive">
                <table class="table" id="tablaDonacionesDinero">
                    <thead>
                        <tr>
                            <th class="text-center">N°</th>
                            <th class="text-center">Donante</th>
                            <th class="text-center">Tipo de Apoyo</th>
                            <th class="text-center">Fecha</th>
                            <th class="text-center">Cantidad</th>
                            <th class="text-center">Descripción</th>
                        </tr>
                    </thead>
                    <tbody class="table" id="DonacionesDinero">
                        <!-- Se carga de manera dinamica -->
                    </tbody>
                    <tfoot id="suma">

                    </tfoot>
                </table>
            </div>
        </div>
    </div>

</div>



<script>
    $(document).ready(function(){
        function listarDonacionesDinero(){
            $.ajax({
                url: 'controllers/Donacion.controller.php',
                type: 'GET',
                data: 'op=DonacionesDinero',
                success: function(e){
                    var tabla = $("#tablaDonacionesDinero").DataTable();
                    tabla.destroy();
                    $("#DonacionesDinero").html(e);
                    $("#tablaDonacionesDinero").DataTable({
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
                data: 'op=TotalDinero',
                success: function(e){
                    $("#suma").html(e);
                }
            });
        }

        function DonacionesDineroMayor(){
            $.ajax({
                url: 'controllers/Donacion.controller.php',
                type: 'GET',
                data: 'op=DonacionesDineroMayor',
                success: function(e){
                    $("#topDonadoresDinero").html(e);
                }
            });
        }


        DonacionesDineroMayor();
        cargarTotal();
        listarDonacionesDinero();
    });
</script>