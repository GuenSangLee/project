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
   
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyDHfHAHCwsvcl4OYvchu2bhQ9Q2A2_Sb84&sencor=ture">  
</script>  
<script type="text/javascript">  
 
	var kyun ="";
	var map;
	var marker;
	var formated_address2;
	var temp_x;
	var temp_y;
	var value1;
	var pyrmont;
	$(document).ready(function() {   
	 
	 
	         
	  navigator.geolocation.getCurrentPosition(function(position){
		 /*  pyrmont = {lat: position.coords.latitude, lng: position.coords.longitude}; */
		   pyrmont = {lat: 37.615258, lng:  126.715688}; 
		  
		 console.log(position);
	  		var latlng = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
	        var myOptions = {   
	              zoom : 12,   
	              center : latlng,   
	              mapTypeId : google.maps.MapTypeId.ROADMAP   
	        }   
	        map = new google.maps.Map(document.getElementById("map"), myOptions);   
	        marker = new google.maps.Marker({   
	            position : latlng,    
	            map : map   
	        });   
	    }); 
	 });   
	 
	 
	GoogleMap = {
	        /* 초기화. */
	        initialize : function() {
	            this.input = document.getElementById("GoogleMap_input");
	            this.address = document.getElementById("GoogleMap_addr");
	            this.geocoder = new google.maps.Geocoder();
	            this.infowindow = new google.maps.InfoWindow();
	                
	       
	        }
	    }
	    window.onload = function(){
	        GoogleMap.initialize();
	    }
	 
	 
	function insertText()
	{
		var tempName = window.top.dialogArguments;
		tempName.userName = value1;
		tempName.changeText();
	}
	 
	 
	function modalCancel()
	{
	  var tempName = window.dialogArguments;
	  tempName.changeText(); 
	}
	function parentClose(){
		window.top.close();
	}
	function newWin(){
		window.open("test.html","","");
	}
	function modalclose(){
		self.close();
	}
	 
	 
	 
	 
	clss = {
	    a: function () {  
	map.setCenter(kyun);
	marker.setPosition(kyun);
	marker.setAnimation(google.maps.Animation.DROP);
	$('#address').html(formated_address2);   
    $('#lat').html(temp_x);   
    $('#lng').html(temp_y);
	value1 = temp_x+','+temp_y;
	}
}
 
 
</script>

<div id="map" style="border: 1px solid; width:200px; height:250px;"></div>
