<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/etc/calculateTax.css">
</head>
<body>
	<div class="calculate-form no-scrollbar">
		<div class="calculate-top pd15">
			<div class="calculate-previous fl mh" onclick="toggleEtcDiv('calculateTax');"><i class="fa-solid fa-angle-left fa-lg"></i></div>
			<div class="calculate-title fl">세금계산기</div>
			<div class="calculate-cancel fl mh" onclick="cancelCalculateTax();"><b><i class="fa-solid fa-xmark fa-lg"></i></b></div>
		</div>
		<div class="calculate-center">
			<div class="calculate-img pd15">
				<img width=419 height=140 src="resources/images/advertisement/adv3.png">
			</div>
			<div class="calculate-text fs16 centerY">
				민규(남)가 만들어주는 세금계산기
			</div>
		</div>
		<div class="calculate-body no-scrollbar">
			<div class="calculate-form pd15">
				
				<br><br><br><br><br>
				<img src="resources/images/etc/taxImage.png" style="width: 100%; height: 20%;" alt="">
				<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
				<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
			</div>
		</div>
	</div>
	<script src="resources/js/etc/calculateTax.js"></script>
</body>
</html>