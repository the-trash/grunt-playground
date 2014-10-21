(function() {
  this.GMap = (function() {
    return {
      init: function() {
        var map, mapCenter, mapOptions, marker_1, marker_2;
        mapCenter = new google.maps.LatLng(-25.363882, 131.044922);
        marker_1 = new google.maps.LatLng(-25.36, 131.06);
        marker_2 = new google.maps.LatLng(-25.37, 131.04);
        mapOptions = {
          zoom: 12,
          mapMaker: false,
          panControl: false,
          zoomControl: false,
          scaleControl: false,
          mapTypeControl: false,
          streetViewControl: false,
          center: mapCenter
        };
        map = new google.maps.Map(document.getElementById('google_map'), mapOptions);
        new MarkerWithLabel({
          labelContent: "1",
          labelClass: "label_class",
          labelAnchor: new google.maps.Point(10, 45),
          map: map,
          position: marker_1,
          title: 'Marker 1',
          icon: './assets/imgs/marker_wave.png'
        });
        return new MarkerWithLabel({
          labelContent: "2",
          labelClass: "label_class",
          labelAnchor: new google.maps.Point(10, 45),
          map: map,
          position: marker_2,
          title: 'Marker 2',
          icon: './assets/imgs/marker_blue.png'
        });
      }
    };
  })();

  $(function() {
    return GMap.init();
  });

}).call(this);
