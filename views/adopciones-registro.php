<?php
    require_once 'datatable.php';
?>

<div class="row">
    <div class="col-md-4">
        <div class="small-box bg-info">
            <div class="inner">
                <h3>RECUERDA</h3>
                <p>"Adopta un perro, es la única forma de escoger un familiar y la mejor de conseguir un amigo fiel…"</p>
            </div>
            <div class="icon">
                <i class="fas fa-paw"></i>
            </div>
        </div>

        <div class=" card card-outline card-info">
            <div class="card-header">
                <p class="card-title" style="font-size: 22px">Registro de Adopciones</p>
            </div>
            <!-- /.card-header -->
            
            <div class="card-body">
                <form action="" id="formularioAdopciones">
                    <div class="form-group">
                        <div class="row">
                            <!-- select mascotas -->
                            <div class="col-md-12">
                                <label for="idmascota">Selecciona una Mascota</label>
                                <select id="idmascota" class="form-control form-control-border">
                                </select>
                            </div>
                        </div>
                            <!-- select personas -->
                        <div class="row">
                            <div class="col-md-12 mt-3">
                                <label for="idpersona">Seleccione un Persona</label>
                                <select id="idpersona" class="form-control form-control-border">
                                </select>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <!-- /.card-body -->
            <div class="card-footer text-right bg-white">
                <button type="reset" class="btn bg-gradient-secondary " id="cancelar">Cancelar</button>
                <button type="button" class="btn bg-gradient-info" id="registrarAdopcion">Guardar</button>
            </div>
            <!-- /.card-footer -->
        </div>

        <div class="card card-outline card-info">
            <div class="card-body text-center">
                <p>Si la persona no se encuentra registrada de clic al siguiente botón.</p>
                <a href="main.php?view=persona-registro" >
                    <button style=" font-size: 18px;" type="button" class="btn btn-sm bg-gradient-info float-center"><i class="fas fa-user-check"></i> &nbsp;Registra una persona</button>
                </a>
            </div>
        </div>
    </div>

    <div class="col-md-8">
        <div  class=" card card-outline card-info ">
            <div class="card-header">
                <p class="card-title mt-2" style="font-size: 22px">Lista de Adopción</p>
                <a href="main.php?view=grafico-adoptados">
                    <button style="background-color: white;" type="button" class="btn btn-lg float-right"><i class="far fa-chart-bar"></i> &nbsp;Ver Gráfico</button>
                </a>
            </div>
            <div class="card-body table-responsive">
                <table class="table" id="tablaAdopcion">
                    <thead>
                        <tr>
                            <th class="text-center">N°</th>
                            <th class="text-center">Adoptante</th>
                            <th class="text-center">Tipo de Mascota</th>
                            <th class="text-center">Mascota</th>
                            <th class="text-center">Fecha</th>
                            <th class="text-center">Operación</th>
                        </tr>
                    </thead>
                    <tbody  id="datosAdopcion">
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
            $("#formularioAdopciones")[0].reset();
        });

        function listarAdopcion(){
            $.ajax({
                url: 'controllers/Adopcion.controller.php',
                type: 'GET',
                data: 'op=listarAdopcion',
                success: function(e){
                    var tabla = $("#tablaAdopcion").DataTable();
                    tabla.destroy();
                    $("#datosAdopcion").html(e);
                    $("#tablaAdopcion").DataTable({
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

        $("#datosAdopcion").on("click", ".devolvermascota", function(){
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
                        'op' : 'devolverMascota',
                        'idmascota' : idmascota
                    };

                    $.ajax({
                        url: 'controllers/Adopcion.controller.php',
                        type: 'GET',
                        data: datos,
                        success: function(e){
                            Swal.fire({
                                icon: 'success',
                                title: 'Eliminado correctamente'
                            });
                            listarAdopcion();
                            cargarMascota();
                        }
                    });
                }
            });
        });

        function cargarMascota(){
            $.ajax({
                url: 'controllers/Mascota.controller.php',
                type: 'GET',
                data: 'op=cargarMascotaAdopcion',
                success: function(e){
                    $("#idmascota").html(e);
                }
            });
        }

        function cargarPersona(){
            $.ajax({
                url: 'controllers/Persona.controller.php',
                type: 'GET',
                data: 'op=cargarPersonasTotal',
                success: function(e){
                    $("#idpersona").html(e);
                }
            });
        }

        function registrarAdopcion(){
            let idpersona = $("#idpersona").val();
            let idmascota = $("#idmascota").val();

            if(idpersona == "" || idmascota == ""){
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
                            'op' : 'registrarAdopcion',
                            'idpersona' : idpersona,
                            'idmascota' : idmascota
                        };

                        $.ajax({
                            url: 'controllers/Adopcion.controller.php',
                            type: 'GET',
                            data: datos,
                            success: function(e){
                                Swal.fire({
                                    icon: 'success',
                                    title: 'Registrado correctamente'
                                });
                                $("#formularioAdopciones")[0].reset();
                                cargarMascota();
                                listarAdopcion();
                            }
                        });
                    }
                });
            }
        }
        
        $("#registrarAdopcion").click(registrarAdopcion);
        cargarMascota();
        cargarPersona();
        listarAdopcion();
    });

</script>