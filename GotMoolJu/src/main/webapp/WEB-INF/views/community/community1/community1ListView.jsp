<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/community/community1/community1ListView.css">
</head>
<body>
	<div class="community1-form">
		<div class="community1-main">
			여기 community1ListView.jsp임
			<button type="button" onclick="openCommunity1Detail('class1');">대충 상세보기1를 구현하고싶다면?</button>
			<button type="button" onclick="openCommunity1Detail('class2');">대충 상세보기2를 구현하고싶다면?</button>
		</div>
		
		<div class="community1-detail1 class1">
		    <%@ include file="./community1Detail1.jsp" %>
		</div>
		
		<div class="community1-detail2 class2">
			<%@ include file="./community1Detail2.jsp" %>
		</div>
	</div>
	<script src="resources/js/community/community1/community1ListView.js"></script>
	
	
</body>
</html>