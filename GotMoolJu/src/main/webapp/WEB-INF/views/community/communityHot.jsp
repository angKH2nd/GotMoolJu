<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/community/communityHot.css">
</head>
<body>
	<div class="town-hot-form">
		<div class="town-hot-main">
			<div class="town-hot-main-header centerY"><span style="color: red"> &nbsp;Hot&nbsp; </span> 한 소식을 모아볼 수 있어요 😜</div>
			<div class="town-hot-main-content no-scrollbar">
				<div class="town-hot-main-list">
					<%@ include file="./communityHotList.jsp" %>
				</div>
			</div>
		</div>
	</div>
	<script src="resources/js/community/communityHot.js"></script>
</body>
</html>