<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/etc/etc.css">
</head>
<body>
	<div class="etc-outer">
		<div class="etc-menu1 pd15">
			<div class="etc-cancel">
				<div class="etc-cancel-blank"></div>
				<div class="etc-cancel-btn mh" onClick="cancelDiv()"><i class="fa-solid fa-xmark fa-lg"></i></div>
			</div>
			<div class="etc-profile">
				<div class="etc-profile-frame centerXY fl">
					<c:choose>
						<c:when test="${ loginUser.userId eq 'admin' }">
							<img class="brc" width=30 height=30 src="${ loginUser.userUpdateName }">
						</c:when>
						<c:otherwise>
							<img class="brc" width=50 height=50 src="${ loginUser.userUpdateName }" style="padding-bottom: 30px;">
						</c:otherwise>
					</c:choose>
				</div>
				<div class="etc-profile-edit fl">
					<div class="etc-profile-edit-title">
						<div class="etc-profile-edit-title-name fl fb">${ loginUser.userName }</div>
						<div class="etc-profile-edit-title-icon fl fb" style="padding-top: 5px;"><i class="fa-solid fa-user-pen fa-sm mh fl" style="padding-top: 8px;"></i> <div class="fl mh">편집</div></div>
					</div>
					<div class="etc-profile-edit-email">${ loginUser.userEmail }</div>
				</div>
			</div>
		</div>
		<div class="etc-menu2">
			<div class="bgh mh pd15 centerY">구해줘 마이 홈!</div>
			<div class="bgh mh pd15 centerY">지금 핫한?</div>
			<div class="bgh mh pd15 centerY">이달의 떡상</div>
		</div>
		<div class="etc-menu3">
			<div class="bgh mh pd15 centerY">빠른 조회</div>
			<div class="bgh mh pd15 centerY">세금계산기</div>
			<div class="bgh mh pd15 centerY">서브메뉴1</div>
			<div class="bgh mh pd15 centerY">서브메뉴2</div>
			<div class="bgh mh pd15 centerY">서브메뉴3</div>
		</div>
		<div class="etc-menu4">
			<div class="bgh mh pd15 centerY">개선의견 등록</div>
			<div class="bgh mh pd15 centerY">고객센터</div>
			<div class="bgh mh pd15 centerY">이용안내</div>
		</div>
		<div class="etc-menu5">44444
		</div>
		<div class="etc-menu6">SNS 공유</div>
	</div>
	<script src="resources/js/etc/etc.js"></script>
</body>
</html>