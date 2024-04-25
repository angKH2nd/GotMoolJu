<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/etc/etc.css">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
	<div class="etc-outer">
		<div class="etc-menu1 pd15">
			<div class="etc-cancel">
				<div class="etc-cancel-blank"></div>
				<div class="etc-cancel-btn mh" onClick="cancelDiv()"><i class="fa-solid fa-xmark fa-lg"></i></div>
			</div>
			<div class="etc-profile">
				<div class="etc-profile-frame fl">
					<c:choose>
						<c:when test="${ loginUser.userId eq 'admin' }">
							<img class="brc" width=30 height=30 src="${ loginUser.userUpdateName }">
						</c:when>
						<c:otherwise>
							<img class="brc" width=50 height=50 src="${ loginUser.userUpdateName }">
						</c:otherwise>
					</c:choose>
				</div>
				<div class="etc-profile-edit fl">
					<div class="etc-profile-edit-title">
						<div class="etc-profile-edit-title-name fl fb">${ loginUser.userName }</div>
						<div class="etc-profile-edit-title-icon fl fb" style="padding-top: 5px;" onclick="openMemberUpdateForm();"><i class="fa-solid fa-user-pen fa-sm mh fl" style="padding-top: 8px;"></i> <div class="fl mh">편집</div></div>
					</div>
					<div class="etc-profile-edit-email">${ loginUser.userEmail }</div>
				</div>
			</div>
		</div>
		<div class="etc-menu2">
			<div class="bgh mh pd15 centerY">지금 핫한 단지는?</div>
			<div class="bgh mh pd15 centerY" onclick="openRank();">아파트 랭킹</div>
		</div>
		<div class="etc-menu3">
			<div class="bgh mh pd15 centerY">빠른 조회</div>
			<div class="bgh mh pd15 centerY">인기 검색어</div>
			<div class="bgh mh pd15 centerY" onclick="toggleEtcDiv('calculateTax');">세금계산기</div>
			<div class="bgh mh pd15 centerY" onclick="openCommunityHot();">핫이슈 모아보기</div>
		</div>
		<div class="etc-menu4">
			<div class="bgh mh pd15 centerY" onclick="toggleEtcDiv('insertImprovementIdeation');">개선의견 등록</div>
			<div class="bgh mh pd15 centerY" onclick="openHelpCenter();">고객센터</div>
			<div class="bgh mh pd15 centerY" onclick="toggleEtcDiv('introduceHowToUseGot');">이용안내</div>
			<div class="bgh mh pd15 centerY" onclick="openMemberDeleteForm();">회원탈퇴</div>
		</div>
		<div class="etc-menu5 mh" onclick="toggleEtcDiv('insertImprovementIdeation');">
			<img width=449 height=160 src="resources/images/advertisement/adv1.png">
		</div>
		<div class="etc-menu6 pd15">
			<div class="etc-menu6-title">갓물주 채널</div>
			<div class="etc-menu6-content">
				<div class="etc-sns fl mh centerXY hoverZ" onclick="openGithub();"><img width=30 height=30 src="resources/images/etc/github-logo.png"></div>
				<div class="etc-sns fl mh centerXY hoverZ" onclick="openNotion();"><img width=30 height=30 src="resources/images/etc/notion-logo.png"></div>
				<div class="etc-sns fl mh centerXY hoverZ" onclick="openYoutube();"><img width=45 height=45 src="resources/images/etc/youtube-logo.jpg"></div>
				<div class="etc-sns fl mh centerXY hoverZ" id="kakao-link-btn" onclick="kakaoShare();"><img width=30 height=30 src="resources/images/etc/kakaotalk-logo.png"></div>
				<div class="etc-sns fl mh centerXY hoverZ" onclick="openGot();"><img width=30 height=30 src="resources/images/got/got_logo_big.jpg"></div>
			</div>
		</div>
	</div>
	<script src="resources/js/etc/etc.js"></script>
</body>
</html>