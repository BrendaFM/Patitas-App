<p class="h1 m-2" style="text-align:center">Todas las mascotas del albergue</p>
<br>
<div class="row m-2" id='card-mascota'>

</div>
<script>
    $(document).ready(function (){

        function listarMascotas(){
            $.ajax({
                url: './controllers/Mascota.controller.php',
                type: 'GET',
                data: 'op=listarMascotas',
                success: function(result){
                    $("#card-mascota").html(result);
                }
            });
        }
        listarMascotas();
    });
</script>
