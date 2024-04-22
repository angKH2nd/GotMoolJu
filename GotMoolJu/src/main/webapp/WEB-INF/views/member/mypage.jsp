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
				<div class="mypage-edit centerXY fl mh" onclick="toggleMypageDiv('updateMemberForm');"><i class="fa-solid fa-user-pen fa-sm fl"></i><span style="font-size: 12px; padding-top: 5px;">수정</span></div>
				<div class="mypage-blank fl"></div>
			</div>
			<div class="mypage-cancel fl">
				<div class="mypage-cancel-btn mh" onClick="cancelDiv();"><i class="fa-solid fa-xmark fa-lg"></i></div>
			</div>
		</div>
		<div class="mypage-body1">
			<div class="mypage-alert-area pd15">
				<div class="mypage-dibs br5 mh" onclick="toggleMypageDiv('memberDibsList');">
					<div class="mypage-dibs-icon centerXY fl"><i class="fa-solid fa-heart fa-lg"></i></div>
					<div class="mypage-dibs-title centerY fl">찜 목록</div>
					<div class="mypage-dibs-content fl">
						<div class="mypage-dibs-count centerXY fl">6</div>
						<div class="mypage-dibs-count-name centerXY fl"> 건</div>
					</div>
					<div class="mypage-dibs-more centerXY fl"><i class="fa-solid fa-angles-right fa-lg"></i></div>
				</div>
				<div class="mypage-notices br5 mh" onclick="toggleMypageDiv('memberNoticeList');">
					<div class="mypage-notices-icon centerXY fl"><i class="fa-solid fa-bell fa-lg"></i></div>
					<div class="mypage-notices-title centerY fl">알림 목록</div>
					<div class="mypage-notices-content fl">
						<div class="mypage-notices-count centerXY fl">9</div>
						<div class="mypage-notices-count-name centerXY fl"> 건</div>
					</div>
					<div class="mypage-notices-more centerXY fl"><i class="fa-solid fa-angles-right fa-lg"></i></div>
				</div>
			</div>
			<div class="mypage-recent-area"><%@ include file="./memberRecentRe.jsp" %></div>
		</div>
		<div class="mypage-body2 pd15">
			<div class="mypage-star-head br5 mh" onclick="openMyStar();">
				<div class="mypage-star-icon centerXY fl"><i class="fa-solid fa-star fa-lg"></i></div>
				<div class="mypage-star-title centerY fl">지금까지 내가 모은 별</div>
				<div class="mypage-star-content fl">
					<div class="mypage-star-count centerXY fl"></div>
					<div class="mypage-star-count-name centerXY fl"> 개</div>
				</div>
				<div class="mypage-star-more centerXY fl"><i class="fa-solid fa-angles-right fa-lg"></i></div>
			</div>
			<div class="mypage-star-content-popular br5">
				<div class="mypage-star-popular-title fb">가장 인기있는 내 글 🤩</div>
				<div class="mypage-star-popular-community">
					<div class="mypage-popular-top">
						<div class="mypage-popular-top-profile centerXY fl"><img width=40 height=40 class="brc" src="${ loginUser.userUpdateName }"></div>
						<div class="mypage-popular-top-nickname centerY fl"> &nbsp; ${ loginUser.userNickname }</div>
						<div class="mypage-popular-top-go centerY fl mh" onclick="openMyStar();"><i class="fa-solid fa-arrow-up-right-from-square"></i></div>
					</div>
					<div class="mypage-popular-center">
						<div class="mypage-popular-center-title centerY"></div>
					</div>
					<div class="mypage-popular-bottom">
						<div class="mypage-popular-star fl">
							<div class="mypage-popular-star-icon centerY fl"><i class="fa-solid fa-star"></i></div>
							<div class="mypage-popular-star-count centerY fl"></div>
						</div>
						<div class="mypage-popular-likes fl">
							<div class="mypage-popular-likes-icon centerY fl"><i class="fa-regular fa-thumbs-up"></i></div>
							<div class="mypage-popular-likes-count centerY fl"></div>
						</div>
						<div class="mypage-popular-reply fl">
							<div class="mypage-popular-reply-icon centerY fl"><i class="fa-solid fa-comment-dots"></i></div>
							<div class="mypage-popular-reply-count centerY fl"></div>
						</div>
						<div class="mypage-popular-click fl">
							<div class="mypage-popular-click-icon centerY fl"><i class="fa-solid fa-arrow-pointer"></i></div>
							<div class="mypage-popular-click-count centerY fl"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="mypage-body3 pd15">뭘넣지..? 바디3</div>
	</div>
	
	<script src="resources/js/member/mypage.js"></script>
</body>
</html>