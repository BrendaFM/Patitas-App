
<p class="display-6 m-3" style="text-align:center">Todas las mascotas del albergue</p>

    <div class="row m-2" id='card-mascota'>

    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
