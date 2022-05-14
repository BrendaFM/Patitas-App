<?php
    require_once 'datatable.php';
    require_once 'acceso-seguro.php';
    if($_SESSION['nivelacceso']!= "C"){
        echo "<strong>No tiene el nivel de acceso requerido</strong>";
        exit();
    }
?>

<!-- Registro de Mascotas Duenos -->
<div class="row">
    <div class="col-md-4">
        <div class="small-box bg-info">
            <div class="inner">
                <h3>RECUERDA</h3>
                <p>"Hasta que no hayas amado a un animal, una parte de tu alma permanecerá dormida."</p>
            </div>
            <div class="icon">
                <i class="fas fa-paw"></i>
            </div>
        </div>

        <div class=" card card-outline card-info">
            <div class="card-header">
                <p class="card-title" style="font-size: 22px">Registro de Mascotas Encontradas</p>
                
            </div>
            <!-- /.card-header -->
            
            <div class="card-body">
                <form action="" id="formularioDueno">
                    <div class="form-group">
                        <div class="row">
                            <!-- select mascotas -->
                            <div class="col-md-12">
                                <label for="idmascotaperdida">Selecciona una Mascota</label>
                                <select id="idmascotaperdida" class="form-control form-control-border">
                                </select>
                            </div>
                        </div>
                            <!-- select personas -->
                        <div class="row">
                            <div class="col-md-12 mt-3">
                                <label for="idpersona">Seleccione una persona</label>
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
                <button type="button" class="btn bg-gradient-info" id="registrarMascotaDueno">Guardar</button>
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
        <div  class=" card card-outline card-info">
            <div class="card-header">
                <p class="card-title" style="font-size: 22px">Mascotas encontradas</p>
                <a href="main.php?view=mascotas-perdidos">
                    <button style="background-color: white;" type="button" class="btn btn-lg float-right"><i class="fas fa-arrow-circle-left"></i> &nbsp;Volver atrás</button>
                </a>
            </div>
            <div class="card-body table-responsive">
                <table class="table" id="tablaMascotaDueno">
                    <thead>
                        <tr>
                            <th class="text-center">id</th>
                            <th class="text-center">Dueño</th>
                            <th class="text-center">Teléfono</th>
                            <th class="text-center">Animal</th>
                            <th class="text-center">Nombre</th>
                            <th class="text-center">Genero</th>
                            <th class="text-center">Fecha</th>
                        </tr>
                    </thead>
                    <tbody class="table" id="datosMascotaDueno">
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

    function listarMascotaDueno(){
        $.ajax({
            url: 'controllers/Mascota.controller.php',
            type: 'GET',
            data: 'op=listarMascotaDueno',
            success: function(e){
                var tabla = $("#tablaMascotaDueno").DataTable();
                tabla.destroy();
                $("#datosMascotaDueno").html(e);
                $("#tablaMascotaDueno").DataTable({
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

    function registrarMascotaDueno(){
        let idpersona = $("#idpersona").val();
        let idmascotaperdida = $("#idmascotaperdida").val();

        if(idpersona == "" || idmascotaperdida == ""){
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
                        'op' : 'registrarMascotaDueno',
                        'idpersona' : idpersona,
                        'idmascotaperdida' : idmascotaperdida
                    };

                    $.ajax({
                        url: 'controllers/Mascota.controller.php',
                        type: 'GET',
                        data: datos,
                        success: function(e){
                            Swal.fire({
                                icon: 'success',
                                title: 'Registrado correctamente'
                            });
                            $("#formularioDueno")[0].reset();
                            cargarMascotaPerdida();
                            listarMascotaDueno();
                        }
                    });
                }
            });
        }

        
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

    function cargarMascotaPerdida(){
        $.ajax({
            url: 'controllers/Mascota.controller.php',
            type: 'GET',
            data: 'op=cargarMascotaPerdida',
            success: function(e){
                $("#idmascotaperdida").html(e);
            }
        });
    }

    cargarPersona();
    cargarMascotaPerdida();
    $("#registrarMascotaDueno").click(registrarMascotaDueno);
    listarMascotaDueno();
    });
</script>