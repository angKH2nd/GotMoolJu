<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/member/mypage.css">
</head>
<body>
	<div class="mypage-outer no-scrollbar">
		<div class="mypage-header pd15">
			<div class="mypage-header-bar fl">
				<div class="mypage-picture centerXY fl"><img class="brc" width=30 height=30 src="${ loginUser.userUpdateName }"></div>
				<div class="mypage-name centerXY fl fb">${ loginUser.userName }</div>
				<div class="mypage-edit centerXY fl mh"><i class="fa-solid fa-user-pen fa-sm fl"></i><span style="font-size: 12px; padding-top: 5px;">수정</span></div>
				<div class="mypage-blank fl"></div>
			</div>
			<div class="mypage-cancel fl">
				<div class="mypage-cancel-btn mh" onClick="cancelDiv()"><i class="fa-solid fa-xmark fa-lg"></i></div>
			</div>
		</div>
		<div class="mypage-body1">
			<div class="mypage-alert-area pd15">
				<div class="mypage-likes br5 pd20">
					<div class="mypage-likes-icon centerXY fl"><i class="fa-solid fa-heart fa-lg"></i></div>
					<div class="mypage-likes-title centerY fl">찜 목록</div>
					<div class="mypage-likes-content fl">
						<div class="mypage-likes-count centerXY fl">6</div>
						<div class="mypage-likes-count-name centerXY fl"> 건</div>
					</div>
					<div class="mypage-likes-more centerXY fl"><i class="fa-solid fa-angles-right fa-lg"></i></div>
				</div>
				<div class="mypage-notices br5 pd20">알림</div>
			</div>
			<div class="mypage-recent-area"><%@ include file="./memberRecentRe.jsp" %></div>
		</div>
		<div class="mypage-body2">바디2</div>
		<div class="mypage-body3">바디3</div>
	</div>
	<script src="resources/js/member/mypage.js"></script>
</body>
</html>