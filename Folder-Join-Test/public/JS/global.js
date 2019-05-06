
// Initialize and add the map
function initMap() {
  // The location of Uluru
  var uluru = {lat: 51.5074, lng: 0.1278};
  var uluru2 = {lat: 45, lng: 0.1278};
  var uluru3 = {lat: 56.2639, lng: 9.5018};
  var uluru4 = {lat: 41.8719, lng: 12.5674};
  var uluru5 = {lat: 39.0742, lng: 21.8243};
  // The map, centered at Uluru
  var map = new google.maps.Map(
      document.getElementById('map'), {zoom: 4, center: uluru});
  // The marker, positioned at Uluru
  var marker = new google.maps.Marker({position: uluru, map: map});
  var marker2 = new google.maps.Marker({position: uluru2, map: map});
  var marker3 = new google.maps.Marker({position: uluru3, map: map});
  var marker4 = new google.maps.Marker({position: uluru4, map: map});
  var marker5 = new google.maps.Marker({position: uluru5, map: map});
}
