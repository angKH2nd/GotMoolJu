<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/etc/insertImprovementIdeation.css">
</head>
<body>
	<div class="improvement-form no-scrollbar">
		<input type="hidden" id="improvement-nickname" value="${ loginUser.userNickname }">
		<input type="hidden" id="loadCount" value="5">
		<c:choose>
			<c:when test="${ not empty loginUser }">
				<input type="hidden" id="isLogin" value="${ loginUser.userNo }">		
			</c:when>
			<c:otherwise>
				<input type="hidden" id="isLogin" value="blank">
			</c:otherwise>
		</c:choose>
		
		<div class="improvement-top pd15">
			<div class="improvement-previous fl mh" onclick="toggleEtcDiv('insertImprovementIdeation');"><i class="fa-solid fa-angle-left fa-xl"></i></div>
			<div class="improvement-title fl">개선의견 등록</div>
			<div class="improvement-cancel fl mh" onclick="cancelInsertImprovementIdeation();"><b><i class="fa-solid fa-xmark fa-lg"></i></b></div>
		</div>
		<div class="improvement-center">
			<%--
			<div class="improvement-annoucement centerY">
				개선 및 불편 의견은 하단 댓글창에 남겨주세요!
			</div>
			 --%>
			<div class="improvement-img pd15">
				<img width=419 height=140 src="resources/images/advertisement/adv6.png">
			</div>
			<div class="improvement-text fs16 centerY">
				갓물주가 대한민국 대표 부동산플랫폼으로 나아갈 수 있도록 고객님들의 솔직한 의견을 남겨주세요!
			</div>
		</div>
		<div class="improvement-reply-area pd15 no-scrollbar">
			<div class="improvement-input-area">
				<div class="improvement-input-title">의견 <span id="improvement-reply-total-count"></span></div>
				<div class="improvement-input-content"><textarea onkeyup="countHowLong();"></textarea></div>
				<div class="improvement-input-insert">
					<div class="improvement-input-count fl"><span id="improvement-input-count-span">0</span>/100</div>
					<div class="improvement-input-secret fl mh" onclick="changeSecret();"><i class="fa-solid fa-lock-open"></i></div>
					<input type="hidden" id="isSecret" value="O">
					<div class="improvement-input-insert-btn fl mh">등록</div>
				</div>
			</div>
			<div class="improvement-list-area">
				
			</div>
		</div>
		<div class="improvement-more-btn-area pd15">
			<button type="button" id="loadMoreBtn" class="btn-format mh"><i class="fa-solid fa-angle-down"></i> 더보기 <i class="fa-solid fa-angle-down"></i></button>
			<button type="button" id="collapseBtn" class="btn-format mh"><i class="fa-solid fa-angle-up"></i> 접기 <i class="fa-solid fa-angle-up"></i></button>
		</div>
	</div>
	<script src="resources/js/etc/insertImprovementIdeation.js"></script>
</body>
</html>