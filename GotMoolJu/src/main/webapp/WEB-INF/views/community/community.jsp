<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/community/community.css">
</head>
<body>
	<div class="community-outer">
		<div class="community-nav-area pd15">
			<div class="community-nav fl">
				<div class="community-bar" id="community-bar">
				    <ul>
				        <li class="mh community1-btn" onclick="toggleCommunity('community1')">커뮤1</li>
				        <li class="mh community2-btn" onclick="toggleCommunity('community2')">커뮤2</li>
				        <li class="mh community3-btn" onclick="toggleCommunity('community3')">커뮤3</li>
				        <li class="mh community4-btn" onclick="toggleCommunity('community4')">커뮤4</li>
				    </ul>
				</div>
			</div>
			<div class="community-cancel fl">
				<div class="etc-cancel-btn mh" onClick="cancelDiv()"><i class="fa-solid fa-xmark fa-lg"></i></div>
			</div>
		</div>
		<div class="community-content pd15">
			<div class="community-bar-toggle">
			    <div class="community1"><%@ include file="community1/community1ListView.jsp" %></div>
			    <div class="community2 community2-container"><%@ include file="community2/community2ListView.jsp" %></div>
			    <div class="community3"><%@ include file="community3/community3ListView.jsp" %></div>
			    <div class="community4"><%@ include file="community4/community4ListView.jsp" %></div>
			</div>
		</div>
	</div>
	<script src="resources/js/community/community.js"></script>
</body>
</html>