<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/member/memberDibsList.css">
</head>
<body>
	<div class="member-dibs-form no-scrollbar">
		<div class="member-dibs-form-top pd15">
			<div class="member-dibs-form-previous fl mh" onclick="toggleMypageDiv('memberDibsList')"><i class="fa-solid fa-angle-left fa-lg"></i></div>
			<div class="member-dibs-form-title fl">찜 목록</div>
			<div class="member-dibs-form-blank fl mh"></div>
		</div>
		<div class="member-dibs-form-content"></div>
	</div>
	
	<script src="resources/js/member/memberDibsList.js"></script>
</body>
</html>