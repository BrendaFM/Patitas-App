<?php
    require_once 'datatable.php';
?>

<div class="row">
    <div class="col-md-3">
        <div id="topDonadoresComida">
        
        </div>
    </div>
    <div class="col-md-9">
        <div  class="card card-outline card-info  ml-3 mr-3">
            <div class="card-header">
                <p class="card-title mt-2" style="font-size: 22px">Kilogramos Donados</p>
                <a href="main.php?view=donaciones-registro">
                    <button style="background-color: white;" type="button" class="btn btn-lg float-right"><i class="fas fa-arrow-circle-left"></i> &nbsp;Volver</button>
                </a>
            </div>
            <div class="card-body">
                <table class="table" id="tablaDonacionesComidas">
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
                    <tbody class="table" id="DonacionesComidas">
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

        function DonacionesComidaMayor(){
            $.ajax({
                url: 'controllers/Donacion.controller.php',
                type: 'GET',
                data: 'op=DonacionesComidaMayor',
                success: function(e){
                    $("#topDonadoresComida").html(e);
                }
            });
        }


        DonacionesComidaMayor();
        cargarTotal();
        listarDonacionesComidas();
    });
</script>