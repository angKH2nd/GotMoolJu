<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/community/communityTownDetailForm.css">
</head>
<body>
	<div class="town-detail-form no-scrollbar">
		<input type="hidden" id="town-detail-form-townNo">
		<div class="town-detail-member pd15">
			<div class="town-detail-member-img centerY fl"></div>
			<div class="town-detail-member-nickname centerY fl"></div>
			<div class="town-detail-member-click centerY fl">조회&nbsp;<span id="town-detail-member-click-count"></span></div>
		</div>
		<div class="town-detail-title pd15 centerY"></div>
		<div class="town-detail-content pd15">
			<textarea class="fb" readonly></textarea>
		</div>
		<div class="town-detail-picture pd15">사진자리임</div>
		<div class="town-detail-bottom">
			<div class="town-detail-bottom-star pd15 mh fl" onclick="moveUpdateTownStar();">
				<div class="town-detail-bottom-star-icon centerXY fl"><i class="fa-regular fa-star"></i></div>
				<div class="town-detail-bottom-star-text centerY fl">즐겨찾기</div>
				<div class="town-detail-bottom-star-count centerY fl"></div>
			</div>
			<div class="town-detail-bottom-blank fl"></div>
			<div class="town-detail-bottom-likes pd15 mh fl" onclick="moveUpdateTownLikes();">
				<div class="town-detail-bottom-likes-icon centerXY fl"><i class="fa-regular fa-thumbs-up"></i></div>
				<div class="town-detail-bottom-likes-text centerXY fl">좋아요</div>
				<div class="town-detail-bottom-likes-count centerY fl"></div>
			</div>
			<div class="town-detail-bottom-blank fl"></div>
			<div class="town-detail-bottom-reply pd15 mh fl">
				<div class="town-detail-bottom-reply-icon centerXY fl"><i class="fa-solid fa-comment-dots"></i></div>
				<div class="town-detail-bottom-reply-text centerXY fl">댓글</div>
				<div class="town-detail-bottom-reply-count centerY fl"></div>
			</div>
		</div>
		<div class="town-detail-reply no-scrollbar">
			<div class="town-detail-reply-head"></div>
			<div class="town-detail-reply-insert pd20">
				<div class="town-detail-reply-insert-input fl"><input type="text" class="br5 fb" placeholder="댓글을 입력해주세요." maxlength=35></div>
				<div class="town-detail-reply-insert-icon centerXY fl" onclick="insertTownReply();"><i class="fa-solid fa-paper-plane mh"></i></div>
			</div>
			<div class="town-detail-reply-head"></div>
			<div class="town-detail-reply-content">
				 
			</div>
		</div>
	</div>
	
	<button type="button" class="community-back-button mh" onclick="changeTownDetail(0);"><i class="fa-solid fa-rotate-left hoverZ"></i></button>
	
	<script src="resources/js/community/communityTownDetailForm.js"></script>
</body>
</html>