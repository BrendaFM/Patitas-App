<html>
  <head>
    <title>Simple Map</title>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>

  </head>
  <body>
    <div id="map"></div>

    <style>
        #map {
        height: 400px;
        /* The height is 400 pixels */
        width: 100%;
        /* The width is the width of the web page */
        }
    </style>

    <!-- 
     The `defer` attribute causes the callback to execute after the full HTML
     document has been parsed. For non-blocking uses, avoiding race conditions,
     and consistent behavior across browsers, consider loading using Promises
     with https://www.npmjs.com/package/@googlemaps/js-api-loader.
    -->
    <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDZNG1_kSwSqism_JCD5spvQesIHRvzUvs&callback=initMap&v=weekly"
      defer
    ></script>
  </body>

  <script>
      // Initialize and add the map
    function initMap() {
      // The location of Uluru
      const uluru = { lat: -25.344, lng: 131.031 };
      // The map, centered at Uluru
      const map = new google.maps.Map(document.getElementById("map"), {
        zoom: 4,
        center: uluru,
      });
      // The marker, positioned at Uluru
      const marker = new google.maps.Marker({
        position: uluru,
        map: map,
      });
    }

    window.initMap = initMap;
  </script>
</html>