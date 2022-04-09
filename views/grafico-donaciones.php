<div>
  <div style="margin-top: 1em;">
    <div class="col-md-12">
      <h4 style="text-align:center">Aqui encuentran las donaciones a nuestro Albergue</h4>
    </div>
  </div>

  <div class="row" style="margin-top: 3em;">
    <div class="col-md-6">
      <h3 style="text-align:center">Dinero Donado por Año</h3>
    </div>
    <div class="col-md-6">
    <h3 style="text-align:center">Comida Donada por Año</h3>    
    </div>
  </div>
  
  <div class="row" style="margin-top: 1em;">
    <div class="col-md-6">
      <div style="position:relative; margin: auto; width:40vw; height:27vw">
        <canvas id="grafico-rtp1"></canvas>
      </div>
    </div>
    
    <div class="col-md-6">
      <div style="position:relative; margin: auto; width:40vw; height:27vw">
        <canvas id="grafico-rtp2"></canvas>
      </div>
    </div>
  </div>
</div>

<script>
  const contexto1 = document.getElementById("grafico-rtp1").getContext("2d");
  const grafico1 = new Chart(contexto1, {
    type: 'line',
    data:{
      labels: [],
      datasets: [{
        label: 'Soles',
        data: [0,0,0],
        backgroundColor: listBackground,
        pointStyle: 'circle',
        pointRadius: 7,
        pointHoverRadius: 5,
        borderColor: listBorder,
        borderWidth: 2
      }]
    },
    options: {
      scales : { y: {beginAtZero: true}},
      responsive: true,
      maintainAspectRatio: false
    }
  });

  let labelChart1 = [];
  let dataChart1 = [];

  function getData(){
    $.ajax({
      url: 'controllers/Apoyo.controller.php',
      type: 'GET',
      data: 'op=reportesoles',
      success: function (result){
        let datos = JSON.parse(result);

        datos.forEach(valor => {
          labelChart1.push(valor["AÑO"]);
          dataChart1.push(valor["Total Soles"]);
        });

        //Actualizando grafico
        grafico1.data.labels = labelChart1;
        grafico1.data.datasets[0].data = dataChart1;
        grafico1.update();
      }
    });
  }
  getData();
</script>

<script>
  const contexto2 = document.getElementById("grafico-rtp2").getContext("2d");
  const grafico2 = new Chart(contexto2, {
    type: 'line',
    data:{
      labels: [],
      datasets: [{
        label: 'Kg',
        data: [0,0,0],
        backgroundColor: listBackground,
        borderColor: listBorder,
        pointStyle: 'circle',
        pointRadius: 7,
        pointHoverRadius: 5,
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

  function getData(){
    $.ajax({
      url: 'controllers/Apoyo.controller.php',
      type: 'GET',
      data: 'op=reportekilos',
      success: function (result){
        let datos = JSON.parse(result);

        datos.forEach(valor => {
          labelChart2.push(valor["AÑO"]);
          dataChart2.push(valor["Total Kg."]);
        });

        //Actualizando grafico
        grafico2.data.labels = labelChart2;
        grafico2.data.datasets[0].data = dataChart2;
        grafico2.update();
      }
    });
  }
  getData();
</script>