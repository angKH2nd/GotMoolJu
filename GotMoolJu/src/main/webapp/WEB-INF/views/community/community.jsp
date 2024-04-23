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
				        <li class="mh town-btn" onclick="toggleCommunity('town'); selectTownList();">동네소식</li>
				        <li class="mh communityStar-btn" onclick="toggleCommunity('communityStar'); selectTownStarList();">즐겨찾기</li>
				        <li class="mh communityHot-btn" onclick="toggleCommunity('communityHot'); selectTownHotList();">핫이슈</li>
				        <li class="mh communityRank-btn" onclick="toggleCommunity('communityRank'); selectTownRankList();">명예의 전당</li>
				    </ul>
				</div>
			</div>
			<div class="community-cancel fl">
				<div class="community-cancel-btn mh" onClick="cancelDiv()"><i class="fa-solid fa-xmark fa-lg"></i></div>
			</div>
		</div>
		<div class="community-content">
			<div class="community-bar-toggle">
			    <div class="town"><%@ include file="town.jsp" %></div>
			    <div class="communityStar"><%@ include file="communityStar.jsp" %></div>
			    <div class="communityHot"><%@ include file="communityHot.jsp" %></div>
			    <div class="communityRank"><%@ include file="communityRank.jsp" %></div>
			</div>
		</div>
	</div>
	<script src="resources/js/community/community.js"></script>
</body>
</html>