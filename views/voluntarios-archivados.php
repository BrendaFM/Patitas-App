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
                    <p class="card-title mt-2" style="font-size: 22px">Voluntarios Archivados</p>
                </div>
                <div class="card-body table-responsive">
                    <table class="table" id="TablaVoluntariosArchivados">
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
                        <tbody class="table" id="datosVoluntariosArchivados">
                            
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script>   

    $(document).ready(function(){

        function voluntariosArchivados(){
            $.ajax({
                url: 'controllers/Voluntario.controller.php',
                type: 'GET',
                data: 'op=voluntariosArchivados',
                success: function(e){
                    var tabla = $("#TablaVoluntariosArchivados").DataTable();
                    tabla.destroy();
                    $("#datosVoluntariosArchivados").html(e);
                    $("#TablaVoluntariosArchivados").DataTable({
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


        $("#datosVoluntariosArchivados").on("click",".reactivar" , function(){
            let idvoluntario = $(this).attr('data-idvoluntarioarchivado');
            let idpersona = $(this).attr('data-idpersona');

            Swal.fire({
                icon: 'question',
                title: 'PATITAS APP',
                text: 'Esta seguro de reactivar este Voluntariado?',
                showCancelButton: true,
                cancelButtonText: 'Cancelar',
                confirmButtonText: 'Confirmar',
            }).then((result)=>{
                if(result.isConfirmed){
                    var datos = {
                        'op' : 'reactivarVoluntariado',
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
                                title: 'Reactivar correctamente'
                            });
                            voluntariosArchivados();
                        }
                    });
                }
            });
        });

        voluntariosArchivados();
    });

</script>