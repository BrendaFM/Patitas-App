<?php
    require_once 'datatable.php';
    require_once 'acceso-seguro.php';
    if($_SESSION['nivelacceso']!= "C"){
        echo "<strong>No tiene el nivel de acceso requerido</strong>";
        exit();
    }
?>

<div class="row">
    <div class="col-md-4">
        <div class="small-box bg-info">
            <div class="inner">
                <h3>RECUERDA</h3>
                <p>"Una mascota es un miembro más de la familia"</p>
            </div>
            <div class="icon">
                <i class="fas fa-paw"></i>
            </div>
        </div>

        <div class=" card card-outline card-info">
            <div class="card-header">
                <p class="card-title" style="font-size: 22px">Registro de Tipos de Eventos</p>
            </div>
            <!-- /.card-header -->
            
            <div class="card-body">
                <form action="" id="formularioTipoEvento">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-12 mt-3">
                                <label for="tipoevento">Tipo de evento</label>
                                <input type="text" class="form-control form-control-border" id="tipoevento" placeholder="Escriba un tipo de evento">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <!-- /.card-body -->
            <div class="card-footer text-right bg-white">
                <button type="buttom" class="btn bg-gradient-secondary " id="cancelar">Cancelar</button>
                <button type="button" class="btn bg-gradient-info" id="guardar">Guardar</button>
            </div>
            <!-- /.card-footer -->
        </div>
    </div>

    <div class="col-md-8">
        <div  class=" card card-outline card-info">
            <div class="card-header">
                <p class="card-title" style="font-size: 22px">Lista de Eventos Activos</p>
                <a href="main.php?view=eventos-terminados">
                    <button style="background-color: white;" type="button" class="btn btn-lg float-right"><i class="fas fa-folder-open"></i> &nbsp;Eventos terminados</button>
                </a>
            </div>
            <div class="card-body table-responsive">
                <table class="table" id="tablaTipoEventos">
                    <thead>
                        <tr>
                            <th class="text-center">N°</th>
                            <th class="text-center">Tipo de Evento</th>
                            <th class="text-center">Fecha de Inicio</th>
                            <th class="text-center">Operación</th>
                        </tr>
                    </thead>
                    <tbody class="table" id="datosTipoEvento">
                        <!-- Se carga de manera dinamica -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function(){

        $("#cancelar").click(function(){
            $("#formularioTipoEvento")[0].reset();
        });

        function listarTipoEventos(){
            $.ajax({
                url: 'controllers/Eventos.controller.php',
                type: 'GET',
                data: 'op=listarTipoEventos',
                success: function(e){
                    var tabla = $("#tablaTipoEventos").DataTable();
                    tabla.destroy();
                    $("#datosTipoEvento").html(e);
                    $("#tablaTipoEventos").DataTable({
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

        function registrarTipoEvento(){
            let tipoevento = $("#tipoevento").val();

            if(tipoevento == ""){
                Swal.fire({
                    icon: 'warning',
                    title: 'Por favor escriba el tipo de evento'
                });
            }else{
                Swal.fire({
                    icon: 'question',
                    title: 'PATITAS APP',
                    text: '¿Está seguro de registrar?',
                    showCancelButton: true,
                    cancelButtonText: 'Cancelar',
                    confirmButtonText: 'Confirmar'
                }).then((result) =>{
                    if(result.isConfirmed){
                        var datos ={
                            'op'            : 'registrarTipoEvento',
                            'tipoevento'  : tipoevento
                        };

                        $.ajax({
                            url: 'controllers/Eventos.controller.php',
                            type: 'GET',
                            data: datos,
                            success: function(e){
                                Swal.fire({
                                    icon: 'success',
                                    title: 'Registrado correctamente'
                                });
                                listarTipoEventos();
                                $("#formularioTipoEvento")[0].reset();
                            }
                        });
                    }
                });
            }

            
        }

        $("#datosTipoEvento").on("click",".terminar" , function(){
            let idtipoevento = $(this).attr('data-idtipoevento');

            Swal.fire({
                icon: 'question',
                title: 'PATITAS APP',
                text: '¿Está seguro de terminar el evento?',
                showCancelButton: true,
                cancelButtonText: 'Cancelar',
                confirmButtonText: 'Confirmar',
            }).then((result)=>{
                if(result.isConfirmed){
                    var datos = {
                        'op' : 'terminarEvento',
                        'idtipoevento' : idtipoevento
                    };

                    $.ajax({
                        url: 'controllers/Eventos.controller.php',
                        type: 'GET',
                        data: datos,
                        success: function(e){
                            Swal.fire({
                                icon: 'success',
                                title: 'Finalizado correctamente'
                            });
                            listarTipoEventos();
                        }
                    });
                }
            });
        });
        
        $("#guardar").click(registrarTipoEvento);
        listarTipoEventos();
    });
</script>