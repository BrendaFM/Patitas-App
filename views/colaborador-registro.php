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
        <p class="card-title mt-2" style="font-size: 22px;">REGISTRO DE COLABORADORES</p>
    </div>
    <div class="card-body">
        <form action="" id="formulario-colaborador">
            
            <div class="form-group">
                    <label for="idpersona">Seleccione una persona</label>
                    <select id="idpersona" class="form-control form-control-border">
                        <!-- Se cargara de manera asincrona -->
                    </select>
            </div>
            <div class="form-group">
                <label for="nombreusuario">Nombre de usuario</label>
                <input type="text" id="nombreusuario" autocomplete="none" maxlength="30" class="form-control form-control-border">
            </div>
            <div class="form-group">
                <label for="clave">Contraseña</label>
                <input type="text" id="clave" class="form-control form-control-border">
            </div>
        </form>
    </div>
    <div class="card-footer text-right bg-white">
        <button id="cancelar" class="btn bg-gradient-secondary">Cancelar</button>
        <button id="guardar" class="btn bg-gradient-info">Guardar</button>
    </div>
    </div>

    <div class="card card-outline card-info">
            <div class="card-body text-center">
                <p>Si la persona no se encuentra registrada de clic al siguiente botón.</p>
                <a href="main.php?view=persona-registro" >
                    <button style=" font-size: 18px;" type="button" class="btn btn-sm bg-gradient-info float-center"><i class="fas fa-user-check"></i> &nbsp;Registra una persona</button>
                </a>
            </div>
    </div>

    <br>

    <div class="card card-outline card-info">
            <div class="card-body text-center">
                <p>Si ya tiene una cuenta de usuario y quiere hacerlo colaborador de clic al siguiente botón.</p>
                <a href="main.php?view=usuarios-lista" >
                    <button style=" font-size: 18px;" type="button" class="btn btn-sm bg-gradient-info float-center"><i class="fas fa-address-book"></i> &nbsp;Lista de Usuarios</button>
                </a>
            </div>
    </div>
</div>





<script>
    $(document).ready(function(){

        $("#cancelar").click(function(){
            $("#formulario-colaborador")[0].reset();
        });

        function cargarPersonas(){
			$.ajax({
				url: 'controllers/Persona.controller.php',
				type: 'GET',
				data: 'op=cargarPersonas',
				success: function(e){
					$("#idpersona").html(e)
				}
			});
		}


        function registrarColaborador(){
          let idpersona = $("#idpersona").val();
          let nombreusuario = $("#nombreusuario").val();
          var clave = $("#clave").val();

          if (idpersona == "" || nombreusuario == "" || clave == ""){
            Swal.fire({
                icon: 'warning',
                title: '¡Complete la información para poder registrarse!'
            });
          }else{
                Swal.fire({
                  icon: 'question',
                  title: 'RECORSEN',
                  text: '¿Está seguro de registrar un nuevo Colaborador?',
                  showCancelButton: true,
                  cancelButtonText: 'Cancelar',
                  confirmButtonText: 'Aceptar'
                }).then((result) => {
					if (result.isConfirmed){
						var datos = {
							'op'            : 'registrarColaborador',
							'idpersona'     : idpersona,
							'nombreusuario' : nombreusuario,
							'clave'       	: clave
						};

						$.ajax({
							url: 'controllers/Usuario.controller.php',
							type: 'GET',
							data: datos,
							success: function(e){
								Swal.fire("El proceso finalizó correctamente");
								$("#formulario-colaborador")[0].reset();
								cargarPersonas();
							}
						});
					} 
                });
          }
        }

        function listarUsuariosRegistrados(){
            $.ajax({
                url: 'controllers/Usuario.controller.php',
                type: 'GET', 
                data:  'op=listarUsuariosRegistrados',
                success: function(e) {
                    var tabla = $("#tablaUsuarios").DataTable();
                    tabla.destroy();
                    $("#datosUsuarios").html(e);
                    $("#tablaUsuarios").DataTable({
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


        $("#datosUsuarios").on("click", ".actualizar", function(){
        let idusuario = $(this).attr('data-idusuario');

            Swal.fire({
                icon: 'question',
                title: 'PATITAS APP',
                text: '¿Está seguro de hacer colaborador a este Usuario?',
                showCancelButton: true,
                cancelButtonText: 'Cancelar',
                confirmButtonText: 'Confirmar',
            }).then((result)=>{
                if(result.isConfirmed){
                    var datos = {
                        'op' : 'actualizarUsuariosAColaboradores',
                        'idusuario' : idusuario
                    };

                    $.ajax({
                        url: 'controllers/Usuario.controller.php',
                        type: 'GET',
                        data: datos,
                        success: function(e){
                            Swal.fire({
                                icon: 'success',
                                title: 'Actualizado correctamente'
                            });
                            listarUsuariosRegistrados();
                            cargarPersonas();
                        }
                    });
                }
            });
        });

        
        
        listarUsuariosRegistrados();
        cargarPersonas();
        $("#guardar").click(registrarColaborador);
    });
</script>