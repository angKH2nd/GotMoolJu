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
		<div class="etc-menu1">
			<div class="etc-cancel">
				<div class="etc-cancel-blank"></div>
				<div class="etc-cancel-btn mh" onClick="cancelDiv()"><i class="fa-solid fa-xmark fa-lg"></i></div>
			</div>
			<div class="etc-profile">
				<div class="etc-profile-frame fl"></div>
				<div class="etc-profile-edit fl">
					<div class="etc-profile-edit-title">
						<div class="etc-profile-edit-title-name fl fb">${ loginUser.userName }</div>
						<div class="etc-profile-edit-title-icon fl fb"><i class="fa-solid fa-user-pen mh"></i> 편집</div>
					</div>
					<div class="etc-profile-edit-email">${ loginUser.userEmail }</div>
				</div>
			</div>
		</div>
		<div class="etc-menu2">
			<div class="bgh mh">주요메뉴1</div>
			<div class="bgh mh">주요메뉴2</div>
			<div class="bgh mh">주요메뉴3</div>
		</div>
		<div class="etc-menu3">
			<div class="bgh mh">서브메뉴1</div>
			<div class="bgh mh">서브메뉴2</div>
			<div class="bgh mh">서브메뉴3</div>
			<div class="bgh mh">서브메뉴4</div>
			<div class="bgh mh">서브메뉴5</div>
			<div class="bgh mh">서브메뉴6</div>
			<div class="bgh mh">서브메뉴7</div>
		</div>
		<div class="etc-menu4">44444
		</div>
		<div class="etc-menu5">SNS 공유</div>
	</div>
	<script src="resources/js/etc/etc.js"></script>
</body>
</html>