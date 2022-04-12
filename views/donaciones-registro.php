<div class="container">
    <div class="card card-outline card-info">
        <div class="card-header">
            <p class="card-title mt-2" style="font-size: 22px">Registro de Donaciones</p>
            <a href="main.php?view=grafico-donaciones">
                <button style="background-color: white;" type="button" class="btn btn-lg float-right"><i class="far fa-chart-bar"></i> &nbsp;Ver Gráfico</button>
            </a>
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
            <button id="cancelar" class="btn bg-gradient-secondary">Cancelar</button>
            <button id="guardar" class="btn bg-gradient-info">Guardar</button>
        </div>
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

<script>
  $(document).ready(function(){

    $("#cantidad").mask('99999,99', {reverse: false});

    $("#cancelar").click(function(){
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

    function guardarDatos(){
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

    $("#guardar").click(guardarDatos);
    cargarPersonasTotal();

  });
</script>