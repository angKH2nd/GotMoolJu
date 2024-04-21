<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/map/aptDetailForm.css">
</head>
<body>
	<div class="apt-detail-form-outer no-scrollbar">
		<div class="apt-detail-form-outer-top pd15">
			<div class="apt-detail-form-top-previous centerY mh fl" onclick="cancelAptDetailDiv();"><i class="fa-solid fa-angle-left fa-lg"></i></div>
			<div class="apt-detail-form-top-title centerXY fl"></div>
			<div class="apt-detail-form-top-cancel centerY mh fl"><i class="fa-solid fa-heart"></i></div>
			<div class="apt-detail-form-top-cancel centerY mh fl"><i class="fa-regular fa-share-from-square"></i></div>
			<div class="apt-detail-form-top-cancel centerY mh fl" onclick="cancelApt();"><i class="fa-solid fa-xmark fa-lg"></i></div>
		</div>
		<div class="apt-detail-form-outer-content no-scrollbar">
			<input type="hidden" id="aptDetailNo">
			<div class="apt-detail-imgs">
				<div class="apt-slideshow-container">
			    </div>
			    <a class="aptPrev" onclick="plusSlides(-1)">&#10094;</a>
			    <a class="aptNext" onclick="plusSlides(1)">&#10095;</a>
			</div>
			<div class="apt-detail-head pd15 centerY fb"></div>
			<div class="apt-detail-introduce pd15">
				<div class="apt-detail-introduce-title fb">매물</div>
				<div class="apt-detail-introduce-content"></div>
			</div>
			<div class="apt-detail-info pd15">
				<div class="apt-detail-info-title centerY fb">매물정보</div>
				<div class="apt-detail-info-content">
					<div class="apt-detail-info-icon">
						<div class="apt-detail-info-icon1 fl centerXY">
							<div class="apt-detail-info-icon1-i centerXY"><i class="fa-solid fa-handshake fa-2xl"></i></div>
							<div class="apt-detail-info-icon1-text"></div>
						</div>
						<div class="apt-detail-info-iconB fl"></div>
						<div class="apt-detail-info-icon2 fl centerXY">
							<div class="apt-detail-info-icon2-i centerXY"><i class="fa-solid fa-coins fa-2xl"></i></div>
							<div class="apt-detail-info-icon2-text"></div>
						</div>
						<div class="apt-detail-info-iconB fl"></div>
						<div class="apt-detail-info-icon3 fl centerXY">
							<div class="apt-detail-info-icon3-i centerXY"><i class="fa-solid fa-ruler-vertical fa-2xl"></i></div>
							<div class="apt-detail-info-icon3-text"></div>
						</div>
					</div>
					<div class="apt-detail-info-things centerY">
						<div class="apt-detail-info-things-left centerY fl"><i class="fa-solid fa-circle-info"></i> &nbsp; 이런 특징이 있어요!</div>
						<div class="apt-detail-info-things-right centerY fl">
							<div class="apt-detail-info-things1 bdlg br5 centerY pd5 fl"></div>
							<div class="apt-detail-info-things2 bdlg br5 centerY pd5 fl"></div>
							<div class="apt-detail-info-things3 bdlg br5 centerY pd5 fl"></div>
						</div>
					</div>
					<div class="apt-detail-info-text">
						<table>
							<tr>
								<td width=150>매물번호</td>
								<td class="apt-detail-info1"></td>
							</tr>
							<tr>
								<td>건물이름</td>
								<td class="apt-detail-info2"></td>
							</tr>
							<tr>
								<td>전용면적</td>
								<td class="apt-detail-info3"></td>
							</tr>
							<tr>
								<td>공급면적</td>
								<td class="apt-detail-info4"></td>
							</tr>
							<tr>
								<td>방 수/욕실 수</td>
								<td class="apt-detail-info5"></td>
							</tr>
							<tr>
								<td>현관유형</td>
								<td class="apt-detail-info6"></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="apt-detail-memo pd15">
				<div class="apt-detail-memo-title centerY fb">
					매물소개
				</div>
				<div class="apt-detail-memo-content">
					
				</div>
			</div>
		</div>
	</div>
	<script src="resources/js/map/aptDetailForm.js"></script>
</body>
</html>