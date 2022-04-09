<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de personas</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../dist/css/adminlte.min.css">

</head>
<body>
<style>
    body{
        background-image: url(../img/perro-fondo);
        background-repeat: repeat;
        background-size: 32.5%;
    }
    .container{
        margin-top: 7.8%;
        margin-bottom:7.8%
    }
</style>
<div class="container">
        <div class="card card-outline card-info">
            <div class="card-header">
                <p class="card-title mt-2" style="font-size: 22px;">REGISTRO DE PERSONAS</p>
                <a href="../index.php">
                    <button style="background-color: white;" type="button" class="btn btn-lg float-right"><i class="fas fa-arrow-circle-left"></i> &nbsp;Volver atrás</button>
                </a>
            </div>
            <div class="card-body">
                <form action="" id="formulario-persona">
                    <div class="form-group">
                        <label for="apellidos">Apellidos</label>
                        <input type="text" id="apellidos" autocomplete="none" maxlength="30" class="form-control form-control-border">
                    </div>
                    <div class="form-group">
                        <label for="nombres">Nombres</label>
                        <input type="text" id="nombres" autocomplete="none" maxlength="30" class="form-control form-control-border">
                    </div>
                    <div class="form-group">
                            <label for="tipodoc">Tipo de documento</label>
                            <select id="tipodoc" class="form-control form-control-border">
                                <option value="">Seleccione</option>
                                <option value="C">Carnet de Extrangería</option>
                                <option value="D">DNI</option>
                            </select>
                        </div>
                    <div class="form-group">
                        <label for="numdoc">Número de documento</label>
                        <input type="text" id="numdoc" maxlength="8" class="form-control form-control-border">
                    </div>
                    <div class="form-group">
                        <label for="direccion">Direccion</label>
                        <input type="text" id="direccion" maxlength="40" class="form-control form-control-border">
                    </div>
                    <div class="form-group">
                        <label for="telefono">Teléfono</label>
                        <input type="text" id="telefono" maxlength="9" class="form-control form-control-border">
                    </div>
                </form>
            </div>
            <div class="card-footer text-right bg-white">
                <button id="cancelar" class="btn bg-gradient-secondary">Cancelar</button>
                <button id="guardar" class="btn bg-gradient-info">Guardar</button>
            </div>
        </div>


</div>
<!-- jQuery -->
<!-- <script src="../plugins/jquery/jquery.min.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
  $(document).ready(function(){

    $("#cancelar").click(function(){
        $("#formulario-persona")[0].reset();
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
                        url: '../controllers/Persona.controller.php',
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

    $("#guardar").click(guardarDatos);

  });
</script>
</body>
</html>
