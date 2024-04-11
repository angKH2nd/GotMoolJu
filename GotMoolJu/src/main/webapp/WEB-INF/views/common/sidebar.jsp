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
<%-- sweetalert --%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
       				<li onClick="openLoginForm();" data-target="member">
		        		<div class="icon-area" style="margin: 0"><img style="margin-top: 10px;" class="brc" width=40 height=40 src="resources/images/etc/smile.png"></div>
            			<div class="text-area" style="padding: 0 0 10px 0;">마이페이지</div>
            		</li>
            	</c:when>
            	<c:otherwise>
            		<c:choose>
            			<c:when test="${ loginUser.userId eq 'admin' }">
		            		<li onclick="toggleDiv('member')" data-target="member">
				        		<div class="icon-area" style="margin: 0"><img style="margin-top: 10px;" class="brc" width=30 height=30 src="${ loginUser.userUpdateName }"></div>
				        		<div class="text-area" style="padding: 0 0 10px 0">관리자</div>
				        	</li>
			        	</c:when>
			        	<c:otherwise>
			        		<li onclick="toggleDiv('member')" data-target="member">
				        		<div class="icon-area" style="margin: 0"><img style="margin-top: 10px;" class="brc" width=40 height=40 src="${ loginUser.userUpdateName }"></div>
				        		<div class="text-area" style="padding: 0 0 10px 0">마이페이지</div>
				        	</li>
			        	</c:otherwise>
		        	</c:choose>
            	</c:otherwise>
           	</c:choose>
	        <li onclick="openMap()" data-target="map" class="map-option">
	        	<div class="icon-area"><i class="fa-solid fa-map fa-xl"></i></div>
	        	<div class="text-area">지도</div>
        	</li>
        	<%-- 상세보기는 좌측 리스트에 노출시키지는 않는 것으로
	        <li onclick="toggleDiv('re')" data-target="re">
	        	<div class="icon-area"><i class="fa-solid fa-house fa-xl"></i></div>
	        	<div class="text-area">상세보기</div>
        	</li>
        	 --%>
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
       				<li onClick="openLoginForm();" data-target="community">
            	</c:when>
            	<c:otherwise>
            		<li onclick="toggleDiv('community')" data-target="community">
            	</c:otherwise>
           	</c:choose>
        		<div class="icon-area commu-area" style="margin: 7px 0 0 0;">
        			<div class="community-wrap">
					    <div class="community-circle">
						    <div class="wave-one"></div>
						    <div class="wave-two"></div>
						    <div class="wave-three"></div>
						    <div class="wave-four"></div>
						    
						    <i class="fas fa-moon"></i>
						    <i class="fas fa-moon community-blur"></i>
						    
						    <div class="community-star">
						        <i class="fas fa-asterisk community-star1"></i>
						        <i class="fas fa-asterisk community-star2"></i>
						        <i class="fas fa-asterisk community-star3"></i>
						        <i class="fas fa-asterisk community-star4"></i>
						        <i class="fas fa-asterisk community-star5"></i>
						    </div>
					    </div>
					</div>
        		</div>
        		<div class="text-area" style="padding-bottom: 15px;">커뮤니티</div>
	        </li>
           	<c:choose>
       			<c:when test="${ empty loginUser }">  
       				<li onClick="openLoginForm();" data-target="helpCenter">
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
       				<li onClick="openLoginForm();" data-target="etc">
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
	
	<%-- 사이드바 관련 토글 --%>
	<div class="sidebar-toggle">
	    <div class="home"><%@ include file="../homeTown/homeTown.jsp" %></div>
	    <div class="re">상세보기 눌림</div>
	    <div class="member"><%@ include file="../member/mypage.jsp" %></div>
	    <div class="rank"><%@ include file="../rank/rank.jsp" %></div>
	    <div class="loan"><%@ include file="../loan/loan.jsp" %></div>
	    <div class="community"><%@ include file="../community/community.jsp" %></div>
	    <div class="helpCenter"><%@ include file="../helpCenter/helpCenter.jsp" %></div>
	    <div class="etc"><%@ include file="../etc/etc.jsp" %></div>
	</div>
	
	<%-- 마이페이지 관련 토글 --%>
	<div class="mypage-toggle">
		<div class="updateMemberForm"><%@ include file="../member/memberUpdateForm.jsp" %></div>
		<div class="memberDibsList"><%@ include file="../member/memberDibsList.jsp" %></div>
		<div class="memberNoticeList"><%@ include file="../member/memberNoticeList.jsp" %></div>
	</div>
	
    <script src="resources/js/common/sidebar.js"></script>
</body>
</html>