<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/etc/hotApt.css">
</head>
<body>
	<div class="hot-apt-form no-scrollbar">
		<div class="hot-apt-top pd15">
			<div class="hot-apt-previous fl mh" onclick="toggleEtcDiv('hotApt');"><i class="fa-solid fa-angle-left fa-lg"></i></div>
			<div class="hot-apt-title fl">지금 핫한 단지는?</div>
			<div class="hot-apt-cancel fl mh" onclick="cancelHotApt();"><b><i class="fa-solid fa-xmark fa-lg"></i></b></div>
		</div>
		<div class="hot-apt-center">
			<div class="hot-apt-text fs16 centerY">
				최근 가장 많이 본 단지 Top 10
			</div>
		</div>
		<div class="hot-apt-list-area pd15 no-scrollbar">
			<div class="hot-apt-list-thing">
				<div class="hot-apt-left fl">
					<div class="hot-apt-name">
						<div class="hot-apt-icon fl"></div>
						<div class="hot-apt-realName fl">여기 진짜 이름</div>
					</div>
					<div class="hot-apt-price">
						<div class="hot-apt-type fl">매매</div>
						<div class="hot-apt-realPrice fl">진짜가격</div>
					</div>
					<div class="hot-apt-address">주소</div>
					<div class="hot-apt-desc">설명</div>
				</div>
				<div class="hot-apt-right fl centerXY mh">이미지</div>
			</div>
		</div>
	</div>
	<script src="resources/js/etc/hotApt.js"></script>
</body>
</html>