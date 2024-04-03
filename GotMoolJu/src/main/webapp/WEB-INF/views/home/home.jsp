<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/home/home.css">
</head>
<link rel="icon" sizes="32x32" type="image/png" href="resources/images/got/got_logo.ico">
<body>
	<div class="outer">
		<div class="left-side">
	        <%@include file="../common/sidebar.jsp" %>
	    </div>
	    <div class="right-side">
	        <div class="header-side">
	        	<%@include file="../common/header.jsp" %>
	        </div>
	        <div class="map-side">
	        	<%@include file="../common/map.jsp" %>
	        </div>
	        <div class="footer-side">
	        	<%@include file="../common/footer.jsp" %>
	        </div>
	    </div>
	</div>
	<script src="resources/js/home/home.js"></script>
</body>
</html>