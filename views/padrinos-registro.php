<!-- Registro de Padrinos -->
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
                <p class="card-title" style="font-size: 22px">Registro de Padrino</p>
            </div>
            <!-- /.card-header -->
            
            <div class="card-body">
                <form action="" id="formularioPadrino">
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
                                <label for="idpersona">Seleccione un padrino</label>
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
                <button type="button" class="btn bg-gradient-info" id="registrarPadrino">Guardar</button>
            </div>
            <!-- /.card-footer -->
        </div>
    </div>

    <div class="col-md-8">
        <div  class=" card card-outline card-info">
            <div class="card-header">
                <p class="card-title" style="font-size: 22px">Lista de Padrinos</p>
            </div>
            <div class="card-body">
                <table class="table" id="tablaPadrino">
                    <thead>
                        <tr>
                            <th class="text-center">id</th>
                            <th class="text-center">Padrino</th>
                            <th class="text-center">Mascota</th>
                            <th class="text-center">Operaciones</th>
                        </tr>
                    </thead>
                    <tbody class="table-info" id="datosPadrino">
                        <!-- Se carga de manera dinamica -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<br>
<script src="//cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.0.1/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.0.1/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.0.1/js/buttons.print.min.js"></script>

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
                $("#formularioPadrino")[0].reset();
            }
        });
        
    });

    function listarPadrino(){
        $.ajax({
            url: 'controllers/Padrino.controller.php',
            type: 'GET',
            data: 'op=listarPadrino',
            success: function(e){
                var tabla = $("#tablaPadrino").DataTable();
                tabla.destroy();
                $("#datosPadrino").html(e);
                $("#tablaPadrino").DataTable({
                    language: { url: '//cdn.datatables.net/plug-ins/1.10.24/i18n/Spanish.json' },
                    columnDefs: [
                    {
                        visible: true,
                        searchable: true
                    }
                    ],
                    dom: 'Bfrtip',
                    buttons: ['copy', 'print']
                });
            }
        });
    }

    function registrarPadrino(){
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
                        'op' : 'registrarPadrino',
                        'idpersona' : idpersona,
                        'idmascota' : idmascota
                    };

                    $.ajax({
                        url: 'controllers/Padrino.controller.php',
                        type: 'GET',
                        data: datos,
                        success: function(e){
                            Swal.fire({
                                icon: 'success',
                                title: 'Registrado correctamente'
                            });
                            $("#formularioPadrino")[0].reset();
                            cargarMascota();
                            listarPadrino();
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

    function cargarMascota(){
        $.ajax({
            url: 'controllers/Mascota.controller.php',
            type: 'GET',
            data: 'op=cargarMascotaPadrino',
            success: function(e){
                $("#idmascota").html(e);
            }
        });
    }

    $("#datosPadrino").on("click", ".eliminar", function(){
        let idpadrino = $(this).attr('data-idpadrino');

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
                    'op' : 'eliminarPadrino',
                    'idpadrino' : idpadrino
                };

                $.ajax({
                    url: 'controllers/Padrino.controller.php',
                    type: 'GET',
                    data: datos,
                    success: function(e){
                        Swal.fire({
                            icon: 'success',
                            title: 'Eliminado correctamente'
                        });
                        listarPadrino();
                    }
                });
            }
        });
    });

    cargarPersona();
    cargarMascota();
    $("#registrarPadrino").click(registrarPadrino);
    listarPadrino();
    });
</script>