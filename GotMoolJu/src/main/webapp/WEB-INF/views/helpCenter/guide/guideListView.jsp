<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>

<!-- The callback parameter is required, so we use console.debug as a noop -->
    <script async src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAVzqsZGFKQsGydE94T4Gcv951HswEwBT0&callback=initMap&libraries=maps,marker&v=beta">
    </script>
   <style>
	  html, body {
	    height: 100%;
	    margin: 0;
	    padding: 0;
	  }
	  #map {
	    height: 500px; /* Высота карты */
	  }
	</style>

<link rel="stylesheet" href="resources/css/helpCenter/guide/guideListView.css">
</head>
<body>

	<div id="map"></div>

  <script>
    function initMap() {
        var center = {lat: 37.496391, lng: 127.033829}; // center of the map
        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 14,
            center: center
        });
        new google.maps.Marker({
            position: center,
            map: map,
            title: 'My location'
        });
    }
    </script>
	


	여기 guideListView.jsp임
	<script src="resources/js/helpCenter/guide/guideListView.js"></script>
</body>
</html>