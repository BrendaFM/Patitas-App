<?php
    require_once 'acceso-seguro.php';
?>
<p class="h1 m-2" style="text-align:center">Mascotas Perdidas</p>

<br>

<?php 
if($_SESSION['nivelacceso'] == 'C'){
    echo'
    <a class="btn bg-gradient-secondary" style="float: right;"href="main.php?view=dueno-encontrado-registro">Encontraste al dueño de una mascota?</a>
    <br>
    ';  
}
?>
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

        listarMascotasPerdidos();
    });
</script>
