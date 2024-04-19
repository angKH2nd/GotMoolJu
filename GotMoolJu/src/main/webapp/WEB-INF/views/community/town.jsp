<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/community/town.css">
</head>
<body>
	<div class="town-form">
		<div class="town-main">
			<div class="town-main-header centerY">내가 알고있는 <span style="color: #4373f4"> &nbsp;지역 소식, 꿀팁&nbsp; </span> 을 나눠보세요😘</div>
			<div class="town-main-content no-scrollbar">
				<div class="town-main-list">
					<%@ include file="./communityTownList.jsp" %>
				</div>
				<div class="town-main-insert">
					<%@ include file="./communityTownInsertForm.jsp" %>
				</div>
			</div>
		</div>
	</div>
	<script src="resources/js/community/town.js"></script>
</body>
</html>