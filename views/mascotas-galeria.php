<?php
    require_once 'acceso-seguro.php';
?>
<p class="h1 m-2" style="text-align:center">Mascotas que pasaron por nuestro albergue</p>
<br>
<div class="row m-2" id='galeria'>

</div>
<script>
    $(document).ready(function (){

        function listarMascotasGaleria(){
            $.ajax({
                url: './controllers/Mascota.controller.php',
                type: 'GET',
                data: 'op=listarMascotasGaleria',
                success: function(result){
                    $("#galeria").html(result);
                }
            });
        }
        listarMascotasGaleria();
    });
</script>
