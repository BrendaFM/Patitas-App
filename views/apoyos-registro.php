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
                <button id="cancelarP" class="btn bg-gradient-secondary">Cancelar</button>
                <button id="guardarP" class="btn bg-gradient-info">Guardar</button>
            </div>
        </div>

        <div class="card card-outline card-info">
            <div class="card-header">
                <p class="card-title" style="font-size: 22px">Registro de Voluntarios</p>
            </div>
            <div class="card-body">
                <form action="" id="formulario-apoyo">
                <div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label for="idpersona">Selecciona una Persona</label>
                                    <select id="idpersona" class="form-control form-control-border mb-2">

                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-7">
                                    <label for="idtipoapoyo" class="mt-2">Seleccione un tipo de apoyo</label>
                                    <select id="idtipoapoyo" class="form-control form-control-border">
                                        <option value="">Seleccione</option>
                                        <option value="1">Comida</option>
                                        <option value="2">Monetario</option>
                                        <option value="3">Otros</option>
                                    </select>
                                </div>
                                <div class="col-md-5">
                                    <label for="cantidad" class="mt-2">Cantidad</label>
                                    <input id="cantidad" class="form-control form-control-border" placeholder="Solo para apoyo de comida o monetario">
                                </div>
                            </div>
                            <div class="row">
                                <div class=" col-md-12">
                                    <label for="descripcion" class="mt-2">Descripcion de Acciones</label>
                                    <textarea class="form-control form-control-border" id="descripcion" cols="15" rows="5"></textarea>
                                </div>
                            </div>
                        </div>
                    
                </form>
            </div>
            <div class="card-footer text-right bg-white">
                <button id="cancelarA" class="btn bg-gradient-secondary">Cancelar</button>
                <button id="guardarA" class="btn bg-gradient-info">Guardar</button>
            </div>
        </div>
        <br>
</div>

<!-- jQuery -->
<!-- <script src="../plugins/jquery/jquery.min.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<script>
  $(document).ready(function(){

    $("#cantidad").mask('99999,99', {reverse: false});
    $("#cancelarP").click(function(){
        $("#formulario-persona")[0].reset();
    });

    $("#cancelarA").click(function(){
        $("#formulario-apoyo")[0].reset();
    });

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

    function guardarPersona(){
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

    function guardarApoyo(){
        let idpersona = $("#idpersona").val();
        let idtipoapoyo = $("#idtipoapoyo").val();
        let cantidad = $("#cantidad").val();
        let descripcion = $("#descripcion").val();

        if (idpersona == "" || idtipoapoyo == "" || cantidad == "" || descripcion == ""){
            Swal.fire({
                icon: 'warning',
                title: '¡Por favor complete los campos solicitados!'
            });
        }else{
            Swal.fire({
                icon: 'question',
                title: 'Patitas App',
                text: '¿Está seguro guardar a esta este registro?',
                showCancelButton: true,
                cancelButtonText: 'Cancelar',
                confirmButtonText: 'Aceptar'
            }).then((result) => {
                if (result.isConfirmed){
                
                    var datos = {
                        'op'             : 'registrarApoyo',
                        'idpersona'      : idpersona,
                        'idtipoapoyo'    : idtipoapoyo,
                        'cantidad'       : cantidad,
                        'descripcion'    : descripcion
                    };

                    $.ajax({
                        url: 'controllers/Apoyo.controller.php',
                        type: 'GET',
                        data: datos,
                        success: function(e){
                            Swal.fire("El proceso finalizó correctamente");
                            $("#formulario-apoyo")[0].reset();
                        }
                    });
                } 
            }); 
        } 
    }

    $("#guardarP").click(guardarPersona);
    $("#guardarA").click(guardarApoyo);
    cargarPersonasTotal();

  });
</script>