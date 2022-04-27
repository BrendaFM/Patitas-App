<?php
    require_once 'acceso-seguro.php';
?>
<p class="h1 m-2" style="text-align:center">Nuestras mascotas adoptadas</p>
<br>
<div class="row m-2" id='card-mascota'>

</div>
<script>
    $(document).ready(function (){

        function listarMascotasAdoptadas(){
            $.ajax({
                url: './controllers/Mascota.controller.php',
                type: 'GET',
                data: 'op=listarMascotasAdoptadas',
                success: function(result){
                    $("#card-mascota").html(result);
                }
            });
        }
        listarMascotasAdoptadas();
    });
</script>