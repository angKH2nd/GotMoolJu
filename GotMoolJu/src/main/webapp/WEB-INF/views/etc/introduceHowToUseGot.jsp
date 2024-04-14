<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/etc/introduceHowToUseGot.css">
</head>
<body>
	<div class="introduce-outer">
		<div class="introduce-nav-area pd15">
			<div class="introduce-nav fl">
				<div class="introduce-bar" id="introduce-bar">
				    <ul>
				        <li class="mh introduceCompany-btn" onclick="toggleIntroduce('introduceCompany')">회사소개</li>
				        <li class="mh introduceTerms-btn" onclick="toggleIntroduce('introduceTerms')">이용약관</li>
				        <li class="mh introducePersonalInfo-btn" onclick="toggleIntroduce('introducePersonalInfo')">개인정보처리방침</li>
				    </ul>
				</div>
			</div>
			<div class="introduce-cancel fl">
				<div class="introduce-cancel-btn mh" onClick="cancelIntroduceHowToUseGot()"><i class="fa-solid fa-xmark fa-lg"></i></div>
			</div>
		</div>
		<div class="introduce-content pd15">
			<div class="introduce-bar-toggle">
			    <div class="introduceCompany"><%@ include file="introduceCompany.jsp" %></div>
			    <div class="introduceTerms"><%@ include file="introduceTerms.jsp" %></div>
			    <div class="introducePersonalInfo"><%@ include file="introducePersonalInfo.jsp" %></div>
			</div>
		</div>
	</div>
	<script src="resources/js/etc/introduceHowToUseGot.js"></script>
</body>
</html>