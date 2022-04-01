<p class="h1 m-2" style="text-align:center">Filtro de mascotas</p>
<br>
<div class="card-body table-responsive pad">
    <div class="btn-group btn-group-toggle" data-toggle="buttons">
        
        <label class="btn btn-secondary active">
            <input type="radio" value="1" name="options" id="perros" autocomplete="off" checked> Perros
        </label>
        <label class="btn btn-secondary">
            <input type="radio" value="2" name="options" id="gatos" autocomplete="off"> Gatos
        </label>
        <label class="btn btn-secondary">
            <input type="radio" value="H" name="options" id="hembras" autocomplete="off"> Hembras
        </label>
        <label class="btn btn-secondary">
            <input type="radio"value="M" name="options" id="machos" autocomplete="off"> Machos
        </label>
        <label class="btn btn-secondary">
            <input type="radio" value="S" name="options" id="esterilizado" autocomplete="off"> Esterilizados
        </label>
        <label class="btn btn-secondary">
            <input type="radio" value="N" name="options" id="noesterilizado" autocomplete="off"> No esterilizados
        </label>
    </div>
</div>

<div class="row m-2" id='mascota'>
</div>

<script>
    $(document).ready(function (){

        function Perros(){
            var datosEnviar = {
                'op'            : 'MascotaTipo',
                'idanimal'      : $("#perros").val(),
            };
            $.ajax({
                url: './controllers/Mascota.controller.php',
                type: 'GET',
                data: datosEnviar,
                success: function(result){
                    $("#mascota").html(result);
                }
            });
        }
        
        function Gatos(){
            var datosEnviar = {
                'op'            : 'MascotaTipo',
                'idanimal'      : $("#gatos").val(),
            };
            $.ajax({
                url: './controllers/Mascota.controller.php',
                type: 'GET',
                data: datosEnviar,
                success: function(result){
                    $("#mascota").html(result);
                }
            });
        }

        function Hembras(){
            var datosEnviar = {
                'op'            : 'MascotaGenero',
                'genero'        : $("#hembras").val(),
            };
            $.ajax({
                url: './controllers/Mascota.controller.php',
                type: 'GET',
                data: datosEnviar,
                success: function(result){
                    $("#mascota").html(result);
                }
            });
        }

        function Machos(){
            var datosEnviar = {
                'op'            : 'MascotaGenero',
                'genero'        : $("#machos").val(),
            };
            $.ajax({
                url: './controllers/Mascota.controller.php',
                type: 'GET',
                data: datosEnviar,
                success: function(result){
                    $("#mascota").html(result);
                }
            });
        }

        function Esterilizados(){
            var datosEnviar = {
                'op'            : 'MascotaEsterilizacion',
                'esterilizacion' : $("#esterilizado").val(),
            };
            $.ajax({
                url: './controllers/Mascota.controller.php',
                type: 'GET',
                data: datosEnviar,
                success: function(result){
                    $("#mascota").html(result);
                }
            });
        }
        
        function NoEsterilizados(){
            var datosEnviar = {
                'op'            : 'MascotaEsterilizacion',
                'esterilizacion'        : $("#noesterilizado").val(),
            };
            $.ajax({
                url: './controllers/Mascota.controller.php',
                type: 'GET',
                data: datosEnviar,
                success: function(result){
                    $("#mascota").html(result);
                }
            });
        }

        $("#perros").click(Perros);
        $("#gatos").click(Gatos);
        $("#hembras").click(Hembras);
        $("#machos").click(Machos);
        $("#esterilizado").click(Esterilizados);
        $("#noesterilizado").click(NoEsterilizados);
        
    });
</script>