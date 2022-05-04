<?php
    require_once 'acceso-seguro.php';
    if($_SESSION['nivelacceso']!= "C"){
        echo "<strong>No tiene el nivel de acceso requerido</strong>";
        exit();
    }

    require_once 'datatable.php';
?>

<div class="container">
    <div  class=" card card-outline card-info ">
        <div class="card-header">
            <p class="card-title mt-2" style="font-size: 22px">Lista de Usuarios</p>
        </div>
        <div class="card-body table-responsive">
            <table class="table" id="tablaUsuarios">
                <thead>
                    <tr>
                        <th class="text-center">N°</th>
                        <th class="text-center">Apellidos</th>
                        <th class="text-center">Nombres</th>
                        <th class="text-center">Fecha de Registro</th>
                        <th class="text-center">Operación</th>
                    </tr>
                </thead>
                <tbody  id="datosUsuarios">
                    <!-- Se carga de manera dinamica -->
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    $(document).ready(function(){

        function listarUsuariosRegistrados(){
            $.ajax({
                url: 'controllers/Usuario.controller.php',
                type: 'GET', 
                data:  'op=listarUsuariosRegistrados',
                success: function(e) {
                    var tabla = $("#tablaUsuarios").DataTable();
                    tabla.destroy();
                    $("#datosUsuarios").html(e);
                    $("#tablaUsuarios").DataTable({
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


        $("#datosUsuarios").on("click", ".actualizar", function(){
        let idusuario = $(this).attr('data-idusuario');

            Swal.fire({
                icon: 'question',
                title: 'PATITAS APP',
                text: '¿Está seguro de hacer colaborador a este Usuario?',
                showCancelButton: true,
                cancelButtonText: 'Cancelar',
                confirmButtonText: 'Confirmar',
            }).then((result)=>{
                if(result.isConfirmed){
                    var datos = {
                        'op' : 'actualizarUsuariosAColaboradores',
                        'idusuario' : idusuario
                    };

                    $.ajax({
                        url: 'controllers/Usuario.controller.php',
                        type: 'GET',
                        data: datos,
                        success: function(e){
                            Swal.fire({
                                icon: 'success',
                                title: 'Actualizado correctamente'
                            });
                            listarUsuariosRegistrados();
                            cargarPersonas();
                        }
                    });
                }
            });
        });

        
        
        listarUsuariosRegistrados();
    });
</script>