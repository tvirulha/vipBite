
$(document).ready( function() {
    function initialize()
    {
        var mapProp = {
            center:new google.maps.LatLng(51.508742,-0.120850),
            zoom:5,
            mapTypeId:google.maps.MapTypeId.ROADMAP
        };

        var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
    }

    function showRestaurantLocation(lat, long, title)
    {
        var mapProp = {
            center:new google.maps.LatLng(Lat,Long),
            zoom:5,
            mapTypeId:google.maps.MapTypeId.ROADMAP
        };

        var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);

        var latlong = new google.maps.LatLng(Lat, Long);

        var marker = new google.maps.Markers({position: latlong, title:title});

        marker.setMap(map);
    }

    google.maps.event.addDomListener(window, 'load', initialize);
});