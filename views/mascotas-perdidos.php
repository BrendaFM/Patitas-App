
<p class="h1 m-2" style="text-align:center">Mascotas Perdidas</p>
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
                text: 'Esta seguro de eliminar?',
                showCancelButton: true,
                cancelButtonText: 'Cancelar',
                confirmButtonText: 'Confirmar',
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
                                title: 'Eliminado correctamente'
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
