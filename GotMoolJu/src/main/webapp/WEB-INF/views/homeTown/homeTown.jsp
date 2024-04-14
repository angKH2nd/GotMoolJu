<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/homeTown/homeTown.css">
</head>
<body>
	<div class="homeTown-outer">
		<div class="homeTown-nav-area pd15">
			<div class="homeTown-nav fl">
				갓물주 에서 바로 볼 수 있는 매물
			</div>
			<div class="homeTown-cancel fl">
				<div class="homeTown-cancel-btn mh" onClick="cancelDiv()"><i class="fa-solid fa-xmark fa-lg"></i></div>
			</div>
		</div>
		<div class="homeTown-content">
			<div class="homeTown-title">
				<div class="homeTown-count fl">
					<div class="homeTown-count-head">
						<div class="homeTown-count-head-num fl">2,505,192</div>
						<div class="homeTown-count-head-text fl">개</div>
					</div>
					<div class="homeTown-count-comment" id="currentTime"></div>
				</div>
				<div class="homeTown-blank fl"></div>
				<div class="homeTown-find fl mh"><img width=70 height=60 src="resources/images/got/got_logo_big.jpg"></div>
			</div>
			<div class="homeTown-search pd15" onclick="toggleHomeTownDiv('searchApt');"><input class="home-search-bar-design br5 mh" type="text" value="찾으시는 매물이 있으신가요?" readonly><i class="fa-solid fa-magnifying-glass" id="home-search-bar-design-i"></i></div>
			<div class="homeTown-weather pd15"><%@ include file="./weather.jsp" %></div> 
			<div class="homeTown-content1 pd15">content1 예정</div> 
		</div>
	</div>
	
	<script src="resources/js/homeTown/homeTown.js"></script>
</body>
</html>