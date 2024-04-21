<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/community/communityStar.css">
</head>
<body>
	<div class="town-star-form">
		<div class="town-star-main">
			<div class="town-star-main-header centerY"><span style="color: orange"> &nbsp;즐겨찾기&nbsp; </span> 한 소식을 모아볼 수 있어요 🤩</div>
			<div class="town-star-main-content no-scrollbar">
				<div class="town-star-main-list">
					<%@ include file="./communityStarList.jsp" %>
				</div>
			</div>
		</div>
	</div>
	<script src="resources/js/community/communityStar.js"></script>
</body>
</html>