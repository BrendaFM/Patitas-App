<div>
  <div style="margin-top: 1em;">
    <div class="col-md-12">
      <h3 style="text-align:center">Mascotas Adoptadas</h3>
    </div>
  </div>
  <div class="row" style="margin-top: 3em;">
    <div class="col-md-12">
      <div style="position:relative; margin: auto; width:70vw; height:35vw">
        <canvas id="grafico-rtp"></canvas>
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
</script>