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
                    <p class="card-title mt-2" style="font-size: 22px">Lista de Voluntario</p>
                    <a href="main.php?view=voluntarios-registro">
                        <button style="background-color: white;" type="button" class="btn btn-lg float-right"><i class="fas fa-arrow-circle-left"></i> &nbsp;Volver</button>
                    </a>
                </div>
                <div class="card-body table-responsive">
                    <table class="table" id="tablaVoluntario">
                        <thead>
                            <tr>
                                <th class="text-center">N°</th>
                                <th class="text-center">Voluntario</th>
                                <th class="text-center">Fecha inicio</th>
                                <th class="text-center">Fecha termino</th>
                                <th class="text-center">Descripción</th>
                                <th class="text-center">Operación</th>
                            </tr>
                        </thead>
                        <tbody class="table" id="datosVoluntario">
                            
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script>   

    $(document).ready(function(){

        function listarVoluntarios(){
            $.ajax({
                url: 'controllers/Voluntario.controller.php',
                type: 'GET',
                data: 'op=listarVoluntarios',
                success: function(e){
                    var tabla = $("#tablaVoluntario").DataTable();
                    tabla.destroy();
                    $("#datosVoluntario").html(e);
                    $("#tablaVoluntario").DataTable({
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

        $("#datosVoluntario").on("click", ".noactivo", function(){
            Swal.fire({
                icon: 'info',
                title: 'Ya finalizó su voluntariado'
            });
        });

        $("#datosVoluntario").on("click",".terminar" , function(){
            let idvoluntario = $(this).attr('data-idvoluntario');
            let idpersona = $(this).attr('data-idpersona');

            Swal.fire({
                icon: 'question',
                title: 'PATITAS APP',
                text: 'Esta seguro de terminar Voluntariado?',
                showCancelButton: true,
                cancelButtonText: 'Cancelar',
                confirmButtonText: 'Confirmar',
            }).then((result)=>{
                if(result.isConfirmed){
                    var datos = {
                        'op' : 'terminarVoluntariado',
                        'idvoluntario' : idvoluntario,
                        'idpersona' : idpersona
                    };

                    $.ajax({
                        url: 'controllers/Voluntario.controller.php',
                        type: 'GET',
                        data: datos,
                        success: function(e){
                            Swal.fire({
                                icon: 'success',
                                title: 'Finalizado correctamente'
                            });
                            listarVoluntarios();
                        }
                    });
                }
            });
        });
        listarVoluntarios();
    });

</script>