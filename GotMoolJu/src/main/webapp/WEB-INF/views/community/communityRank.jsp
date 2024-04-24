<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/community/communityRank.css">
</head>
<body>
	<div class="town-rank-form">
		<div class="town-rank-main">
			<div class="town-rank-main-header centerY"><span style="color: purple"> &nbsp;명예의 전당&nbsp; </span> 에 등록된 유저들이에요 😎</div>
			<div class="town-rank-main-content no-scrollbar">
				<div class="town-rank-main-list">
					<%@ include file="./communityRankList.jsp" %>
				</div>
			</div>
		</div>
	</div>
	<script src="resources/js/community/communityRank.js"></script>
</body>
</html>