<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <meta name="viewport" content="initial-scale=1.0">
<div id="map"></div>
    <script>
      var map;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -34.397, lng: 150.644},
          zoom: 8
        });
      }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDHfHAHCwsvcl4OYvchu2bhQ9Q2A2_Sb84&callback=initMap"
    async defer></script> -->
   
    <script type="text/javascript">
    
    function getLocation() {
  	if (navigator.geolocation) { // GPS를 지원하면
    	navigator.geolocation.watchPosition(function(position) {
    	window.open("https://www.google.com/maps/search/pc방/"+position.coords.latitude+",+"+position.coords.longitude,"나의 추억들","width=500, height=500, scrollbars=yes, resizable=no");
    	initMap(position.coords.latitude, position.coords.longitude );
    	
    }, function(error) {
      console.error(error);
    }, {
      	enableHighAccuracy: true,
      	maximumAge: 0,
      	timeout: Infinity
    	});
  	}else {
    	alert('GPS를 지원하지 않습니다');
  	}
	}
	getLocation();

	function initMap(latitude, longitude) {
    	map = new google.maps.Map(document.getElementById('map'), {
      		center: {lat: latitude, lng: longitude},
      		zoom: 17
    	});
	}
</script>
 <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDHfHAHCwsvcl4OYvchu2bhQ9Q2A2_Sb84" async defer></script>
<div id="map" style="border: 1px solid; width:200px; height:250px;"></div>