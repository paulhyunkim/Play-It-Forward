function geoFindMe() {
  var output = document.getElementById("usermaplocation");

  if (!navigator.geolocation){
    output.innerHTML = "<p>Geolocation is not supported by your browser</p>";
    return;
  }

  function success(position) {
    var latitude  = playlist[4].user.lat;
    var longitude = playlist[4].user.lng;

    var img = new Image();
    img.src = "http://maps.googleapis.com/maps/api/staticmap?center=" + latitude + "," + longitude + "&zoom=14&size=300x300&sensor=false";

    output.innerHTML = "<p></p>";
    output.removeChild(output.childNodes[0]);
    output.appendChild(img);

  };

  function error() {
    output.innerHTML = "Unable to retrieve your location";
  };


  navigator.geolocation.getCurrentPosition(success, error);
}