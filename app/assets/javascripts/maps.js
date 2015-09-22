// function generateMap(lat, lon) {
//     var geocoder = new google.maps.Geocoder();
//     var latlon = new google.maps.LatLng(lat, lon);
//     var mapCanvas = document.getElementById('map');
//     var mapOptions = {
//       center: latlon,
//       zoom: 8,
//       mapTypeId: google.maps.MapTypeId.ROADMAP
//     }
//     var map = new google.maps.Map(mapCanvas, mapOptions);
//   }

var geocoder, map;

function codeAddress(address) {
    geocoder = new google.maps.Geocoder();
    geocoder.geocode({
        'address': address
    }, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            var myOptions = {
                zoom: 12,
                center: results[0].geometry.location,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            map = new google.maps.Map(document.getElementById("map"), myOptions);

            var marker = new google.maps.Marker({
                map: map,
                position: results[0].geometry.location
            });
        }
    });
}
