<?php
    require_once 'datatable.php';
?>
<div class="row">
    <div class="col-md-4">
        <div class="small-box bg-info">
            <div class="inner">
                <h3>RECUERDA</h3>
                <p>"El amor de un perro solo es comparable al de un hijo a su madre"</p>
            </div>
            <div class="icon">
                <i class="fas fa-paw"></i>
            </div>
        </div>

        <div class=" card card-outline card-info">
            <div class="card-header">
                <p class="card-title" style="font-size: 22px">Registro de Eventos</p>
            </div>
            <!-- /.card-header -->
            
            <div class="card-body">
                <form action="" id="formularioEventos">
                    <div class="form-group">
                        <div class="row">
                            <!-- select mascotas -->
                            <div class="col-md-12">
                                <label for="idmascota">Selecciona una Mascota</label>
                                <select id="idmascota" class="form-control form-control-border">
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <!-- select evento -->
                            <div class="col-md-12 mt-3">
                                <label for="idtipoevento">Selecciona un Evento</label>
                                <select id="idtipoevento" class="form-control form-control-border">
                                    <option value="">Seleccione</option>
                                    <option value="1">Vacunación</option>
                                    <option value="2">Chequeo de rutina</option>
                                    <option value="3">Desparacitación</option>
                                    <option value="4">Intervención</option>
                                    <option value="5">Otros</option>
                                </select>
                            </div>
                        </div>
                            <!-- select personas -->
                        <div class="row">
                            <div class="col-md-12 mt-3">
                                <label for="información">Información</label>
                                <textarea class="form-control select2 form-control-border" id="informacion" cols="15" rows="3"></textarea>
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
                <p class="card-title" style="font-size: 22px">Lista de Eventos</p>
            </div>
            <div class="card-body">
                <table class="table" id="tablaEventos">
                    <thead>
                        <tr>
                            <th class="text-center">N°</th>
                            <th class="text-center">Mascota</th>
                            <th class="text-center">Tipo de Evento</th>
                            <th class="text-center">Fecha y Hora</th>
                            <th class="text-center">Informacion</th>
                        </tr>
                    </thead>
                    <tbody class="table" id="datosEventos">
                        <!-- Se carga de manera dinamica -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<br>

<script>
    $(document).ready(function(){

    $("#cancelar").click(function(){
        Swal.fire({
            icon: 'question',
            title: 'PATITAS APP',
            text: '¿Está seguro de cancelar el proceso?',
            text: 'Se borraran todos los datos de los campos completados',
            showCancelButton: true,
            cancelButtonText: 'NO',
            confirmButtonText: 'SI'
        }).then((result) => {
            if(result.isConfirmed){
                $("#formularioEventos")[0].reset();
            }
        });
        
    });

    function listarEventos(){
        $.ajax({
            url: 'controllers/Eventos.controller.php',
            type: 'GET',
            data: 'op=listarEventos',
            success: function(e){
                var tabla = $("#tablaEventos").DataTable();
                tabla.destroy();
                $("#datosEventos").html(e);
                $("#tablaEventos").DataTable({
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

    function registrarEvento(){
        let idmascota = $("#idmascota").val();
        let idtipoevento = $("#idtipoevento").val();
        let informacion = $("#informacion").val();

        if(idmascota == "" || idtipoevento == "" || informacion == ""){
            Swal.fire({
                icon: 'warning',
                title: 'Por favor complete todos los campos, son obligatorios'
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
                        'op'            : 'registrarEvento',
                        'idmascota'     : idmascota,
                        'idtipoevento'  : idtipoevento,
                        'informacion'   : informacion
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
                            $("#formularioEventos")[0].reset();
                            cargarMascota();
                            listarEventos();
                        }
                    });
                }
            });
        }

        
    }

    function cargarMascota(){
        $.ajax({
            url: 'controllers/Mascota.controller.php',
            type: 'GET',
            data: 'op=cargarMascotaEvento',
            success: function(e){
                $("#idmascota").html(e);
            }
        });
    }
    
    $("#guardar").click(registrarEvento);
    cargarMascota();
    listarEventos();
    });
</script>