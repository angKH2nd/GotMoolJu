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
	  #helpMap {
	    height: 500px;
	  }
	</style>

<link rel="stylesheet" href="resources/css/helpCenter/guide/guideListView.css">
</head>
<body>

	<div id="helpMap"></div>

  <script>
    function initMap() {
        var center = {lat: 37.496391, lng: 127.033829};
        var map = new google.maps.Map(document.getElementById('helpMap'), {
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
    
    <div class="pd15">
    	로드뷰를 참고해서 임장 소모임을 모집해 보는 것은 어떨까요? 😙
  	</div>
   	<div class="pd15 mh" onclick="moveToCommunityFromGuide();">
    	커뮤니티 바로가기
   	</div>

	<script src="resources/js/helpCenter/guide/guideListView.js"></script>
</body>
</html>