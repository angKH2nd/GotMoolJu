<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/helpCenter/helpCenter.css">
</head>
<body>
	<div class="help-center-outer">
		<div class="help-center-menu1">
			<div class="help-center-cancel">
				<div class="help-center-cancel-blank"></div>
				<div class="help-center-cancel-btn mh" onClick="cancelDiv()"><i class="fa-solid fa-xmark fa-lg"></i></div>
			</div>
			<div class="help-center-profile"></div>
		</div>
		<div class="help-center-menu2">
			<c:if test="${ not empty loginUser }">
				메뉴2 자리이긴 한데 급한대로 여기에 로그아웃 했음 <br><br>
				<a href="logout.me">로그아웃</a>
			</c:if>
		</div>
		<div class="help-center-menu3">메뉴3</div>
		<div class="help-center-menu4">광고</div>
		<div class="help-center-menu5">SNS 공유</div>
	</div>
	<script src="resources/js/helpCenter/helpCenter.js"></script>
</body>
</html>