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
            <p class="card-title mt-2" style="font-size: 22px">Registro de Gastos</p>
            <a href="main.php?view=donaciones-registro">
                <button style="background-color: white;" type="button" class="btn btn-lg float-right"><i class="fas fa-arrow-circle-left"></i>&nbsp;Volver</button>
            </a>
        </div>
        <div class="card-body">
            <form action="" id="formulario-gastos">
            <div class="form-group">
                        <div class="row">
                            <div class="col-md-12 form-group">
                                <label for="">Usuario</label>
                                <input disabled=»disabled» class="form-control" codigo="<?=$_SESSION['idusuario']?>" id="idusuario" value="<?=$_SESSION['apellidos'] . ' ' . $_SESSION['nombres']?>" type="text">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-7">
                                <label for="idtipoapoyo" class="mt-2">Seleccione un tipo de apoyo</label>
                                <select id="idtipoapoyo" class="form-control form-control-border">
                                    <option value="">Seleccione</option>
                                    <option value="1">Comida</option>
                                    <option value="2">Monetario</option>
                                </select>
                            </div>
                            <div class="col-md-5">
                                <label for="cantidadsalida" class="mt-2">Cantidad</label>
                                <input id="cantidadsalida" class="form-control form-control-border" placeholder="Solo para apoyo de comida o monetario">
                            </div>
                        </div>
                        <div class="row">
                            <div class=" col-md-12">
                                <label for="descripcion" class="mt-2">¿En qué gastó?</label>
                                <textarea class="form-control form-control-border" id="descripcion" cols="15" rows="5"></textarea>
                            </div>
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

<script>
  $(document).ready(function(){

    $("#cantidadsalida").mask('99999,99', {reverse: false});

    $("#cancelar").click(function(){
        $("#formulario-gastos")[0].reset();
    });

    function guardarDatos(){
        let idusuario = $("#idusuario").attr('codigo');
        let idtipoapoyo = $("#idtipoapoyo").val();
        let cantidadsalida = $("#cantidadsalida").val();
        let descripcion = $("#descripcion").val();

        if (idusuario == "" || idtipoapoyo == "" || descripcion == "" || cantidadsalida == ""){
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
                        'op'             : 'registrarGasto',
                        'idusuario'      : idusuario,
                        'idtipoapoyo'    : idtipoapoyo,
                        'cantidadsalida' : cantidadsalida,
                        'descripcion'    : descripcion
                    };

                    $.ajax({
                        url: 'controllers/Gastos.controller.php',
                        type: 'GET',
                        data: datos,
                        success: function(e){
                            Swal.fire("El proceso finalizó correctamente");
                            $("#formulario-gastos")[0].reset();
                        }
                    });
                } 
            }); 
        } 
    }

    $("#guardar").click(guardarDatos);

  });
</script>