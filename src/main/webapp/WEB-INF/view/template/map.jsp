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
    var map;
    var infowindow;
    function getLocation() {
  	if (navigator.geolocation) { // GPS를 지원하면
    	navigator.geolocation.watchPosition(function(position) {
    	//window.open("https://www.google.com/maps/search/pc방/"+position.coords.latitude+",+"+position.coords.longitude,"나의 추억들","width=500, height=500, scrollbars=yes, resizable=no");
		//현재는 시청
    	initMap(position.coords.latitude, position.coords.longitude );
    	//ktds 
	//	initMap(37.483500, 127.003759 );
    	
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
		var pyrmont = {lat: latitude, lng: longitude};
    	 geocoder = new google.maps.Geocoder();
    	  geocoder.geocode({'latLng': pyrmont}, function(results, status) {
    		      if (status == google.maps.GeocoderStatus.OK) {
    				if (results[0]) {
    					var address_nm = results[0].formatted_address;
    					document.getElementById('map_addr').innerHTML = address_nm;
    				}
    		      } else {
    		        	
    		      }
    	});
    	map = new google.maps.Map(document.getElementById('map'), {
      		center: pyrmont,
      		zoom: 16
    	});
	}
	
	function performSearch() {
		  var request = {
		    bounds: map.getBounds(),
		    name: 'pc방'
		  };
		  service.radarSearch(request, callback);
	}
	
	function callback(results, status) {
        if (status === google.maps.places.PlacesServiceStatus.OK) {
          for (var i = 0; i < results.length; i++) {
        	  alert(results[i].name+"");
        	  	addMarker(results[i]);	        		  
          }
        }
	 }
	
	 function addMarker(place) {
	 	var marker = new google.maps.Marker({
		    map: map,
		    position: place.geometry.location,
		    icon: {
		      url: 'https://developers.google.com/maps/documentation/javascript/images/circle.png',
		      anchor: new google.maps.Point(10, 10),
		      scaledSize: new google.maps.Size(20, 20)
		    }
	  	});

		 google.maps.event.addListener(marker, 'click', function() {
		    service.getDetails(place, function(result, status) {
		      if (status !== google.maps.places.PlacesServiceStatus.OK) {
		        console.error(status);
		        return;
		      }
		      infoWindow.setContent(result.name);
		      infoWindow.open(map, marker);
		    });
		  });
		}
</script>
 <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDHfHAHCwsvcl4OYvchu2bhQ9Q2A2_Sb84&libraries=places" async defer></script>
<div id="map_addr" style="border: 1px solid; width:200px; height:250px; font-size:10pt;"></div>
<div id="map" style="border: 1px solid; width:200px; height:250px;"></div>
