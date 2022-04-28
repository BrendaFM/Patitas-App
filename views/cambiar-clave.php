<?php

    require_once 'acceso-seguro.php';

?>

<div class="container">
    <div class=" card card-outline card-info">
        <div class="card-header">
            <p class="card-title mt-2" style="font-size: 22px">Cambiar Contraseña</p>
        </div>
        <!-- /.card-header -->
        
         <div class="card-body">
            <form action="" id="formularioActualizarContraseña">
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-12">
                            <label for="claveactual">Contraseña Actual</label>
                            <input type="text" class="form-control form-control-border" id="claveactual" placeholder="Escriba su contraseña actual">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="clavenueva">Contraseña Nueva</label>
                    <input type="text" class="form-control form-control-border" id="clavenueva" placeholder="Escriba su nueva contraseña">
                </div>
                <div class="form-group">
                    <label for="clavenuevaconfirmada">Confirmar contraseña nueva</label>
                    <input type="text" class="form-control form-control-border" id="clavenuevaconfirmada" placeholder="Repita su nueva contraseña">
                </div>
            </form>
        </div>
        <!-- /.card-body -->
         <div class="card-footer text-right bg-white">
            <button type="reset" class="btn bg-gradient-secondary " id="cancelar">Cancelar</button>
            <button type="button" class="btn bg-gradient-info" id="cambiarclave">Actualizar</button>
        </div>
        <!-- /.card-footer -->
    </div>
</div> 

<script>
    $(document).ready(function(){

        function resetearFormulario(){
            $("#formularioActualizarContraseña")[0].reset();
        }

        function actualizarClave(){
            const claveActual = $("#claveactual").val();
            const claveNueva = $("#clavenueva").val();
            const claveNuevaConfirmada = $("#clavenuevaconfirmada").val();

            if(claveActual == "" || claveNueva == "" || claveNuevaConfirmada == ""){
                Swal.fire({
                    icon: 'warning',
                    title: '¡Por favor complete los campos!'
                });
            }else{
                if(claveNueva != claveNuevaConfirmada){ // faltaria validacion para cuando la clave actual no es correcta
                    Swal.fire({
                        icon: 'warning',
                        title: '¡Las nuevas contraseñas no coinciden!'
                    });
                }else{
                    Swal.fire({
                        icon: 'question',
                        title: 'Patitas App',
                        text: '¿Está seguro de cambiar la contraseña?',
                        showCancelButton: true,
                        cancelButtonText: 'Cancelar',
                        confirmButtonText: 'Aceptar'
                    }).then((result) => {
                        if (result.isConfirmed){
                            $.ajax({
                                url: 'controllers/Usuario.controller.php',
                                type: 'GET',
                                data: {
                                    'op' : 'actualizarClave',
                                    'claveActual' : claveActual,
                                    'claveNueva' : claveNueva 
                                },
                                success: function(result){
                                    if($.trim(result) == "OK"){
                                        resetearFormulario();
                                    }else{
                                        Swal.fire({
                                            icon: 'warning',
                                            title: '¡Las contraseña actual es incorrecta!'
                                        });
                                        $("#claveactual").focus();
                                    }
                                }
                            });
                        }
                    });
                }
            }
        }

        $("#cambiarclave").click(actualizarClave);
        $("#cancelar").click(resetearFormulario);
    });
</script>