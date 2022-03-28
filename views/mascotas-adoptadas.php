
<p class="display-6 m-3" style="text-align:center">Nuestras mascotas adoptadas</p>

<div class="row m-2" id='card-mascota'>

</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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