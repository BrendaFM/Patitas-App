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
                    <p class="card-title mt-2" style="font-size: 22px">Lista de Colaboradores</p>
                </div>
                <div class="card-body">
                    <table class="table" id="tablaColaboradores">
                        <thead>
                            <tr>
                                <th class="text-center">N°</th>
                                <th class="text-center">Apellidos</th>
                                <th class="text-center">Nombres</th>
                                <th class="text-center">Nombre de usuario</th>
                                <th class="text-center">Operaciones</th>
                            </tr>
                        </thead>
                        <tbody class="table" id="datosColaboradores">
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

        function listarColaboradoreRegistrados(){
            $.ajax({
                url: 'controllers/Usuario.controller.php',
                type: 'GET', 
                data:  'op=listarColaboradores',
                success: function(e) {
                    var tabla = $("#tablaColaboradores").DataTable();
                    tabla.destroy();
                    $("#datosColaboradores").html(e);
                    $("#tablaColaboradores").DataTable({
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

        $("#datosColaboradores").on("click", ".quitar", function(){
            let idusuario = $(this).attr('data-idusuario');
            Swal.fire({
                icon: 'question',
                title: 'PATITAS APP',
                text: '¿Está seguro de quitarle el colaborador a este usuario?',
                showCancelButton: true,
                cancelButtonText: 'Cancelar',
                confirmButtonText: 'Confirmar',
            }).then((result)=>{
                if(result.isConfirmed){
                    var datos = {
                        'op' : 'actualizarColaboradoresAUsuarios',
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
                            listarColaboradoreRegistrados();
                        }
                    });
                }
            });
        });

        listarColaboradoreRegistrados();
    });
</script>