<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<style>
	@font-face {
	    font-family: 'Pretendard-Regular';
    	src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    	font-weight: 900;
	    font-style: normal;
	}
	body {
		font-family: 'Pretendard-Regular';
	}
</style>
<body>
	<c:if test="${ not empty alertMsg }">
		<script>
			alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>

	<div class="sidebar" id="sidebar">
	    <ul>
	        <li onclick="toggleDiv('home')" data-target="home">
	        	<div class="icon-area"><img width=40 height=40 style="padding-top: 20px;" src="resources/images/got/got_logo_big.jpg"></div>
        	</li>
       		<c:choose>
       			<c:when test="${ empty loginUser }">  
       				<li onClick="javascript:popOpen();" data-target="member">
		        		<div class="icon-area" style="margin: 0"><img style="margin-top: 10px;" width=40 height=40 src="resources/images/member/basicUserProfile.png"></div>
            			<div class="text-area" style="padding: 0 0 10px 0;">회원</div>
            		</li>
            	</c:when>
            	<c:otherwise>
            		<li onclick="toggleDiv('member')" data-target="member">
		        		<div class="icon-area">쌔삥</div>
		        		<div class="text-area" style="padding: 0 0 10px 0">회원</div>
		        	</li>
            	</c:otherwise>
           	</c:choose>
	        <li onclick="cancelDiv()" data-target="map">
	        	<div class="icon-area"><i class="fa-solid fa-map fa-xl"></i></div>
	        	<div class="text-area">지도</div>
        	</li>
	        <li onclick="toggleDiv('re')" data-target="re">
	        	<div class="icon-area"><i class="fa-solid fa-house fa-xl"></i></div>
	        	<div class="text-area">상세보기</div>
        	</li>
	        <li onclick="toggleDiv('rank')" data-target="rank">
	        	<div class="icon-area"><i class="fa-solid fa-chart-line fa-xl"></i></div>
	        	<div class="text-area">차트</div>
	        </li>
	        <li onclick="toggleDiv('loan')" data-target="loan">
	        	<div class="icon-area"><i class="fa-solid fa-sack-dollar fa-xl"></i></div>
	        	<div class="text-area">대출</div>
	        </li>
	        <c:choose>
       			<c:when test="${ empty loginUser }">  
       				<li onClick="javascript:popOpen();" data-target="community">
            	</c:when>
            	<c:otherwise>
            		<li onclick="toggleDiv('community')" data-target="community">
            	</c:otherwise>
           	</c:choose>
        		<div class="icon-area"><i class="fa-solid fa-comments fa-xl"></i></div>
        		<div class="text-area">커뮤니티</div>
	        </li>
           	<c:choose>
       			<c:when test="${ empty loginUser }">  
       				<li onClick="javascript:popOpen();" data-target="helpCenter">
            	</c:when>
            	<c:otherwise>
            		<li onclick="toggleDiv('helpCenter')" data-target="helpCenter">
            	</c:otherwise>
           	</c:choose>
           		<div class="icon-area"><i class="fa-solid fa-headphones fa-xl"></i></div>
	        	<div class="text-area">고객센터</div>
	        </li>
	        <c:choose>
       			<c:when test="${ empty loginUser }">  
       				<li onClick="javascript:popOpen();" data-target="etc">
            	</c:when>
            	<c:otherwise>
            		<li onclick="toggleDiv('etc')" data-target="etc">
            	</c:otherwise>
           	</c:choose>
	        	<div class="icon-area"><i class="fa-solid fa-bars fa-xl"></i></div>
	        	<div class="text-area">기타</div>
	        </li>
	        <c:if test="${ not empty loginUser }">
		        <a href="logout.me" class="tdna" style="color: black;">
		        	<li>
		        		<div class="icon-area"><i class="fa-solid fa-right-from-bracket fa-xl"></i></div>
		        		<div class="text-area">로그아웃</div>
		        	</li>
		        </a>
	        </c:if>
	    </ul>
	</div>
	<div class="sidebar-toggle">
	    <div class="home">홈 눌림</div>
	    <div class="re">상세보기 눌림</div>
	    <div class="member"><%@ include file="../member/mypage.jsp" %></div>
	    <div class="rank"><%@ include file="../rank/rank.jsp" %></div>
	    <div class="loan"><%@ include file="../loan/loan.jsp" %></div>
	    <div class="community"><%@ include file="../community/community.jsp" %></div>
	    <div class="helpCenter"><%@ include file="../helpCenter/helpCenter.jsp" %></div>
	    <div class="etc"><%@ include file="../etc/etc.jsp" %></div>
	</div>
    <script src="resources/js/common/sidebar.js"></script>
</body>
</html>