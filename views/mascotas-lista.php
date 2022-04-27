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
                    <p class="card-title mt-2" style="font-size: 22px">Lista de Mascotas</p>
                    <a href="main.php?view=mascotas-registro">
                        <button style="background-color: white;" type="button" class="btn btn-lg float-right"><i class="fas fa-arrow-circle-left"></i> &nbsp;Volver</button>
                    </a>
                </div>
                <div class="card-body">
                    <table class="table" id="tablaMascotas">
                        <thead>
                            <tr>
                                <th class="text-center">N°</th>
                                <th class="text-center">Nombre de Mascota</th>
                                <th class="text-center">Animal</th>
                                <th class="text-center">Genero</th>
                                <th class="text-center">Fecha Nacimiento</th>
                                <th class="text-center">Esterilizado</th>
                                <th class="text-center">Operaciones</th>

                            </tr>
                        </thead>
                        <tbody class="table" id="datosMascotas">
                            
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<br>

<script>
    $(document).ready(function(){

        function listarMascotas(){
            $.ajax({
                url: 'controllers/Mascota.controller.php',
                type: 'GET',
                data: 'op=listarMascotasTabla',
                success: function(e){
                    var tabla = $("#tablaMascotas").DataTable();
                    tabla.destroy();
                    $("#datosMascotas").html(e);
                    $("#tablaMascotas").DataTable({
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

        $("#datosMascotas").on("click", ".modificar", function(){
            let idmascota = $(this).attr('data-idmascota');

            Swal.fire({
                icon: 'question',
                title: 'PATITAS APP',
                text: 'Esta seguro de esterilizar?',
                showCancelButton: true,
                cancelButtonText: 'Cancelar',
                confirmButtonText: 'Confirmar',
            }).then((result)=>{
                if(result.isConfirmed){
                    var datos = {
                        'op' : 'esterilizarMascota',
                        'idmascota' : idmascota
                    };

                    $.ajax({
                        url: 'controllers/Mascota.controller.php',
                        type: 'GET',
                        data: datos,
                        success: function(e){
                            Swal.fire({
                                icon: 'success',
                                title: 'Modificado correctamente'
                            });
                            listarMascotas();
                        }
                    });
                }
            });
        });

        $("#datosMascotas").on("click", ".eliminar", function(){
            let idmascota = $(this).attr('data-idmascota');

            Swal.fire({
                icon: 'question',
                title: 'PATITAS APP',
                text: 'Esta seguro de eliminar?',
                showCancelButton: true,
                cancelButtonText: 'Cancelar',
                confirmButtonText: 'Confirmar',
            }).then((result)=>{
                if(result.isConfirmed){
                    var datos = {
                        'op' : 'eliminarMascota',
                        'idmascota' : idmascota
                    };

                    $.ajax({
                        url: 'controllers/Mascota.controller.php',
                        type: 'GET',
                        data: datos,
                        success: function(e){
                            Swal.fire({
                                icon: 'success',
                                title: 'Eliminado correctamente'
                            });
                            listarMascotas();
                        }
                    });
                }
            });
        });

        $("#datosMascotas").on("click", ".esterilizado", function(){
            Swal.fire({
                icon: 'info',
                title: 'Esta mascota ya ha sido esterilizada'
            });
        });

        listarMascotas();
    });
</script>