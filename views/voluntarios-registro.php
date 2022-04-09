<div class="container">
        <div class="card card-outline card-info">
            <div class="card-header">
                <p class="card-title" style="font-size: 22px;">REGISTRO DE PERSONAS</p>
            </div>
            <div class="card-body">
                <form action="" id="formulario-persona">
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <input type="text" id="apellidos" autocomplete="none" maxlength="30" class="form-control form-control-border" placeholder="Apellidos">
                        </div>
                        <div class="col-md-6 form-group">
                            <input type="text" id="nombres" autocomplete="none" maxlength="30" class="form-control form-control-border" placeholder="Nombres">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 form-group">
                                <select id="tipodoc" class="form-control form-control-border">
                                    <option value="">Tipo de documento</option>
                                    <option value="C">Carnet de Extrangería</option>
                                    <option value="D">DNI</option>
                                </select>
                            </div>
                        <div class="col-md-6 form-group">
                            <input type="text" id="numdoc" maxlength="8" class="form-control form-control-border" placeholder="Número de documento">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <input type="text" id="direccion" maxlength="40" class="form-control form-control-border" placeholder="Direccion">
                        </div>
                        <div class="col-md-6 form-group">
                            <input type="text" id="telefono" maxlength="9" class="form-control form-control-border" placeholder="Teléfono">
                        </div>
                    </div>
                    
                </form>
            </div>
            <div class="card-footer text-right bg-white">
                <button id="cancelar" class="btn bg-gradient-secondary">Cancelar</button>
                <button id="guardar" class="btn bg-gradient-info">Guardar</button>
            </div>
        </div>
</div>

<!-- Registro de voluntarios -->
<div class="container">
    <div class=" card card-outline card-info">
        <div class="card-header">
            <p class="card-title" style="font-size: 22px">Registro de Voluntarios</p>
        </div>
        <!-- /.card-header -->
        
         <div class="card-body">
            <form action="" id="formularioVoluntario">
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-12">
                            <label for="idpersona">Selecciona una Persona</label>
                            <select id="idpersona" class="form-control form-control-border">
                            </select>
                        </div>
                    </div>
                </div>

            <div class="form-group">
                <label for="descripcionvol">Descripcion de Acciones</label>
                <textarea class="form-control select2 form-control-border" id="descripcionvol" cols="15" rows="4"></textarea>
            </div>
            </form>
        </div>
        <!-- /.card-body -->
         <div class="card-footer text-right bg-white">
            <button type="reset" class="btn bg-gradient-secondary " id="cancelarAccion">Cancelar</button>
            <button type="button" class="btn bg-gradient-info" id="registrarVoluntario">Guardar</button>
        </div>
        <!-- /.card-footer -->
    </div>
  <br>
</div> 
<!-- fin de registro de voluntario -->


<!-- jQuery -->
 <!-- <script src="plugins/jquery/jquery.min.js"></script>  -->

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<!-- Bootstrap 4 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
  $(document).ready(function(){

    $("#cancelar").click(function(){
        $("#formulario-persona")[0].reset();
    });

    $("#cancelarAccion").click(function(){
        $("#formularioVoluntario")[0].reset();
    });

    function guardarDatos(){
        let apellidos = $("#apellidos").val();
        let nombres = $("#nombres").val();
        let tipodoc = $("#tipodoc").val();
        let numdoc = $("#numdoc").val();
        let direccion = $("#direccion").val();
        let telefono = $("#telefono").val();

        if (apellidos == "" || nombres == "" || tipodoc == "" || numdoc == "" || direccion == "" || telefono == ""){
            Swal.fire({
                icon: 'warning',
                title: '¡Por favor complete los campos solicitados!'
            });
        }else{
            Swal.fire({
                icon: 'question',
                title: 'Patitas App',
                text: '¿Está seguro guardar a esta persona?',
                showCancelButton: true,
                cancelButtonText: 'Cancelar',
                confirmButtonText: 'Aceptar'
            }).then((result) => {
                if (result.isConfirmed){
                
                    var datos = {
                        'op'            : 'registrarPersona',
                        'apellidos'     : apellidos,
                        'nombres'       : nombres,
                        'tipodoc'       : tipodoc,
                        'numdoc'        : numdoc,
                        'direccion'     : direccion,
                        'telefono'      : telefono
                    };

                    $.ajax({
                        url: 'controllers/Persona.controller.php',
                        type: 'GET',
                        data: datos,
                        success: function(e){
                            Swal.fire("El proceso finalizó correctamente");
                            $("#formulario-persona")[0].reset();
                        }
                    });
                } 
            }); 
        } 
    }

    function cargarPersonasTotal(){
        $.ajax({
            url: 'controllers/Persona.controller.php',
            type: 'GET',
            data: 'op=cargarPersonasTotal',
            success: function(e){
                $("#idpersona").html(e)
            }
        });
    }

    function registrarVoluntario(){
        let idpersona = $("#idpersona").val();
        let descripcionvol = $("#descripcionvol").val();

        if ( idpersona == "" || descripcionvol == "" ){
            Swal.fire({
                icon: 'warning',
                title: '¡Por favor complete los campos solicitados!'
            });
        }else{
            Swal.fire({
                icon: 'question',
                title: 'Patitas App',
                text: '¿Está seguro guardar a este Voluntario?',
                showCancelButton: true,
                cancelButtonText: 'Cancelar',
                confirmButtonText: 'Aceptar'
            }).then((result) => {
                if(result.isConfirmed){
                    var datos = {
                        'op' : 'registrarVoluntario',
                        'idpersona' : idpersona,
                        'descripcionvol' : descripcionvol
                    };

                    $.ajax({
                        url: 'controllers/Voluntario.controller.php',
                        type: 'GET',
                        data: datos,
                        success: function(e){
                            Swal.fire("El proceso finalizó correctamente");
                            $("#formularioVoluntario")[0].reset();
                        }
                    });
                }
            });
        }

        
    }
    
    cargarPersonasTotal(); 

    $("#registrarVoluntario").click(registrarVoluntario);
    $("#guardar").click(guardarDatos);

  });
</script>