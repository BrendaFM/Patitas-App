<?php
    require_once 'acceso-seguro.php';
    if($_SESSION['nivelacceso']!= "C"){
      echo "<strong>No tiene el nivel de acceso requerido</strong>";
      exit();
    }
?>
<div>
  <div style="margin-top: 1em;">
    <div class="col-md-12">
      <h4 style="text-align:center">Aqui encuentran las adopciones de nuestro Albergue</h4>
    </div>
  </div>

  <div class="row" style="margin-top: 3em;">
    <div class="col-md-6">
      <h3 style="text-align:center">Mascotas Adoptadas</h3>
    </div>
    <div class="col-md-6">
      <h3 style="text-align:center">Mascotas adoptadas este Año</h3>  
    </div>
  </div>
  
  <div class="row" style="margin-top: 1em;">
    <div class="col-md-6">
      <div style="position:relative; margin: auto; width:40vw; height:27vw">
        <canvas id="grafico-rtp"></canvas>
      </div>
    </div>
    
    <div class="col-md-6">
      <div style="position:relative; margin: auto; width:40vw; height:27vw">
        <canvas id="grafico-meses"></canvas>
      </div>
    </div>
  </div>
</div>

<script>
  const contexto = document.getElementById("grafico-rtp").getContext("2d");
  const grafico = new Chart(contexto, {
    type: 'line',
    data:{
      labels: [],
      datasets: [{
        label: 'Adopciones',
        data: [0,0,0],
        backgroundColor: listBackground,
        pointStyle: 'circle',
        pointRadius: 7,
        pointHoverRadius: 5,
        borderColor: listBorder,
        borderWidth: 2
      }
    ]},
    options: {
        scales : { y: {beginAtZero: true}},
        responsive: true,
        maintainAspectRatio: false
    }
  });
  let labelChart = [];
  let dataChart = [];

  function getData(){
    $.ajax({
      url: 'controllers/Mascota.controller.php',
      type: 'GET',
      data: 'op=reporteAdoptados',
      success: function (result){
        let datos = JSON.parse(result);

        datos.forEach(valor => {
          labelChart.push(valor["Año"]);
          dataChart.push(valor["Total Adoptados"]);
        });

        //Actualizando grafico
        grafico.data.labels = labelChart;
        grafico.data.datasets[0].data = dataChart;
        grafico.update();
      }
    });
  }
  getData();

  const contexto2 = document.getElementById("grafico-meses").getContext("2d");
  const grafico2 = new Chart(contexto2, {
    type: 'line',
    data:{
      labels: [],
      datasets: [{
        label: 'Adopciones',
        data: [0,0,0],
        backgroundColor: listBackground,
        pointStyle: 'circle',
        pointRadius: 7,
        pointHoverRadius: 5,
        borderColor: listBorder,
        borderWidth: 2
      }
    ]},
    options: {
        scales : { y: {beginAtZero: true}},
        responsive: true,
        maintainAspectRatio: false
    }
  });
  let labelChart2 = [];
  let dataChart2 = [];

  function getData2(){
    $.ajax({
      url: 'controllers/Mascota.controller.php',
      type: 'GET',
      data: 'op=reporteAdoptadosMeses',
      success: function (result){
        let datos = JSON.parse(result);

        datos.forEach(valor => {
          labelChart2.push(valor["Mes"]);
          dataChart2.push(valor["Total Adoptados"]);
        });

        //Actualizando grafico
        grafico2.data.labels = labelChart2;
        grafico2.data.datasets[0].data = dataChart2;
        grafico2.update();
      }
    });
  }
  getData2();

</script>

