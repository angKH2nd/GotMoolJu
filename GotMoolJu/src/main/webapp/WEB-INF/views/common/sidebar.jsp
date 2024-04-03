<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/common/sidebar.css">
<%-- icon --%>
<script src="https://kit.fontawesome.com/4dc2c036ac.js" crossorigin="anonymous"></script>
<%-- jQuery 라이브러리 --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<link rel="icon" sizes="32x32" type="image/png" href="resources/images/got/got_logo.ico">
<body>
	<div class="sidebar" id="sidebar">
	    <ul>
	        <li onclick="toggleDiv('home')">
	        	<div class="icon-area"><i class="fa-solid fa-house fa-xl"></i></div>
	        	<div class="text-area">홈</div>
        	</li>
	        <li onclick="cancelDiv()">
	        	<div class="icon-area"><i class="fa-solid fa-map fa-xl"></i></div>
	        	<div class="text-area">지도</div>
        	</li>
	        <li onclick="toggleDiv('member')">
	        	<div class="icon-area"><i class="fa-solid fa-user fa-xl"></i></div>
	        	<div class="text-area">회원</div>
	        </li>
	        <li onclick="toggleDiv('comunity')">
	        	<div class="icon-area"><i class="fa-solid fa-comments fa-xl"></i></div>
	        	<div class="text-area">커뮤니티</div>
	        </li>
	        <li onclick="toggleDiv('helpcenter')">
	        	<div class="icon-area"><i class="fa-solid fa-headphones fa-xl"></i></div>
	        	<div class="text-area">고객센터</div>
	        </li>
	        <li onclick="toggleDiv('chart')">
	        	<div class="icon-area"><i class="fa-solid fa-chart-line fa-xl"></i></div>
	        	<div class="text-area">차트</div>
	        </li>
	        <li onclick="toggleDiv('loan')">
	        	<div class="icon-area"><i class="fa-solid fa-sack-dollar fa-xl"></i></div>
	        	<div class="text-area">대출</div>
	        </li>
	        <li onclick="toggleDiv('etc')">
	        	<div class="icon-area"><i class="fa-solid fa-bars fa-xl"></i></div>
	        	<div class="text-area">기타</div>
	        </li>
	    </ul>
	</div>
	<div class="sidebar-toggle">
	    <div class="homediv">홈 눌림</div>
	    <div class="member"><%@include file="../member/mypage.jsp" %></div>
	    <div class="comunity">커뮤 눌림</div>
	    <div class="helpcenter">고객 눌림</div>
	    <div class="chart">차트 눌림</div>
	    <div class="loan">대출 눌림</div>
	    <div class="etc">기타 눌림</div>
	</div>
    <script src="resources/js/common/sidebar.js"></script>
</body>
</html>