<?php 
session_start(); 

if (isset($_SESSION['acceso'])){
  if ($_SESSION['acceso'] == true){
    //Si tiene la sesión activa, entonces NO puedes estar acá
    header('Location:main.php');
  }
}

?>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="views/css/diseño.css">
<div class="login-reg-panel">
	<div class="login-info-box">
		<h2>Ya tiene una cuenta?</h2>
		<p>Navega con nosotros</p>
		<label id="label-register" for="log-reg-show">Iniciar Sesión</label>
		<input type="radio" name="active-log-panel" id="log-reg-show"  checked="checked">
	</div>
						
	<div class="register-info-box">
		<h2>No tiene una cuenta?</h2>
		<p>Es rápido y fácil</p>
		<label id="label-login" for="log-login-show">Registrarse</label>
		<input type="radio" name="active-log-panel" id="log-login-show">
	</div>
						
	<div class="white-panel">
		<div class="login-show">
			<h2>Inicio de Sesión</h2>
			<input type="text" placeholder="Usuario" id="usuariologin">
			<input type="password" placeholder="Contraseña" id="clavelogin">
			<input type="button" value="Login" id="login">
		</div>
		<form action="" id="formularioRegistro">
			<div class="register-show">
				<h2>Registro</h2>
				<select id="idpersona">
				</select>
				<input id="nombreusuario" type="text" placeholder="Nombre de usuario">
				<input id="clave" type="text" placeholder="Contraseña">
				<input id="registro-usuario" type="button" value="Registar Usuario" class="m-1">
				<a href="views/personas-registro-index.php" type="button" class="m-1">Registrar Persona</a>
			</div>
		</form>
	</div>
</div>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
	$(document).ready(function(){
		$('.login-info-box').fadeOut();
		$('.login-show').addClass('show-log-panel');

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

		function iniciarSesion(){
			if ($("#usuariologin").val() != "" && $("#clavelogin").val() != ""){

				$.ajax({
					url: 'controllers/Usuario.controller.php',
					type: 'GET',
					data: {
						op          	: 'login',
						nombreusuario   : $("#usuariologin").val(),
						clave			: $("#clavelogin").val()
					},
					success: function (result){
						if ($.trim(result) == ""){
							//Nos vamos al dashboard
							window.location.href = 'main.php'
						}else{
							alert(result);
						}
					}
				});
			}
      	}


		function registrarUsuario(){
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
                  text: '¿Está seguro de registrar un nuevo Usuario?',
                  showCancelButton: true,
                  cancelButtonText: 'Cancelar',
                  confirmButtonText: 'Aceptar'
                }).then((result) => {
					if (result.isConfirmed){
						var datos = {
							'op'            : 'registrarUsuario',
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
								$("#formularioRegistro")[0].reset();
							}
						});
					} 
                });
          }
        }
		cargarPersonas();
		$("#login").click(iniciarSesion);
		$("#registro-usuario").click(registrarUsuario);

	});

	$('.login-reg-panel input[type="radio"]').on('change', function() {
		if($('#log-login-show').is(':checked')) {
			$('.register-info-box').fadeOut(); 
			$('.login-info-box').fadeIn();
			$('.white-panel').addClass('right-log');
			$('.register-show').addClass('show-log-panel');
			$('.login-show').removeClass('show-log-panel');
			
		}
		else if($('#log-reg-show').is(':checked')) {
			$('.register-info-box').fadeIn();
			$('.login-info-box').fadeOut();
			$('.white-panel').removeClass('right-log');
			$('.login-show').addClass('show-log-panel');
			$('.register-show').removeClass('show-log-panel');
		}
	});


</script>