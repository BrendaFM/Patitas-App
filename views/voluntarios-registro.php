<?php
    require_once 'acceso-seguro.php';
    if($_SESSION['nivelacceso']!= "C"){
        echo "<strong>No tiene el nivel de acceso requerido</strong>";
        exit();
    }
?>
<!-- Registro de voluntarios -->
<div class="container">
    <div class=" card card-outline card-info">
        <div class="card-header">
            <p class="card-title mt-2" style="font-size: 22px">Registro de Voluntarios</p>
            <a href="main.php?view=voluntarios-lista">
                <button style="background-color: white;" type="button" class="btn btn-lg float-right"><i class="fas fa-clipboard-list"></i> &nbsp;Listar en tabla</button>
            </a>
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
    <div class="card card-outline card-info">
            <div class="card-body text-center">
                <p>Si la persona no se encuentra registrada de clic al siguiente botón.</p>
                <a href="main.php?view=persona-registro" >
                    <button style=" font-size: 18px;" type="button" class="btn btn-sm bg-gradient-info float-center"><i class="fas fa-user-check"></i> &nbsp;Registra una persona</button>
                </a>
            </div>
    </div>
</div> 
<!-- fin de registro de voluntario -->

<script>
  $(document).ready(function(){

    $("#cancelarAccion").click(function(){
        $("#formularioVoluntario")[0].reset();
    });

    function cargarVoluntario(){
        $.ajax({
            url: 'controllers/Voluntario.controller.php',
            type: 'GET',
            data: 'op=cargarVoluntario',
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
                            cargarVoluntario(); 
                        }
                    });
                }
            });
        }

        
    }
    
    cargarVoluntario(); 

    $("#registrarVoluntario").click(registrarVoluntario);

  });
</script>