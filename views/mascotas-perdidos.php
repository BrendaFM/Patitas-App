<?php
    require_once 'acceso-seguro.php';
?>
<p class="h1 m-2" style="text-align:center">Mascotas Perdidas</p>

<br>
<a class="btn bg-gradient-secondary" style="float: right;"href="main.php?view=dueno-encontrado-registro">Encontraste al dueño de una mascota?</a>
<br>
<br>
<div class="row m-2" id='card-mascota'>

</div>
<script>
    $(document).ready(function (){

        function listarMascotasPerdidos(){
            $.ajax({
                url: './controllers/Mascota.controller.php',
                type: 'GET',
                data: 'op=listarMascotasPerdidos',
                success: function(result){
                    $("#card-mascota").html(result);
                }
            });
        }

        $("#card-mascota").on("click", ".eliminar", function(){
            let idmascotaperdida = $(this).attr('data-idmascota');

            Swal.fire({
                icon: 'question',
                title: 'PATITAS APP',
                text: '¿Esta mascota fue encontrada?',
                showCancelButton: true,
                cancelButtonText: 'No',
                confirmButtonText: 'Sí',
            }).then((result)=>{
                if(result.isConfirmed){
                    var datos = {
                        'op' : 'eliminarMascotaPerdido',
                        'idmascotaperdida' : idmascotaperdida
                    };

                    $.ajax({
                        url: 'controllers/Mascota.controller.php',
                        type: 'GET',
                        data: datos,
                        success: function(e){
                            Swal.fire({
                                icon: 'success',
                                title: 'Proceso terminado'
                            });
                            listarMascotasPerdidos();
                        }
                    });
                }
            });
        });

        listarMascotasPerdidos();
    });
</script>
