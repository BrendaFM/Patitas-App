<?php
    require_once 'acceso-seguro.php';
    if($_SESSION['nivelacceso']!= "C"){
        echo "<strong>No tiene el nivel de acceso requerido</strong>";
        exit();
    }
?>
<div class="container">
    <div class="card card-outline card-info">
        <div class="card-header">
            <p class="card-title mt-2" style="font-size: 22px;">REGISTRO DE PERSONAS</p>
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

        $("#guardar").click(guardarDatos);
    });
</script>