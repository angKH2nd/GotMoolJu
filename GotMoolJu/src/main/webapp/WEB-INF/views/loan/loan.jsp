<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/loan/loanbar.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
	<div class="loan-form no-scrollbar">
		<div class="loan-top pd15">
			<div class="loan-top-title centerXY fl">은행별 전세대출 금리</div>
			<div class="loan-top-cancel fl" onClick="cancelDiv()"><i class="fa-solid fa-xmark fa-lg"></i></div>
		</div>
		<div class="loan-center pd15">
			<div class="loan-center-title">대출실행금액</div>
			<div class="loan-center-circle centerXY bdlg br5 pd15">
				<canvas id="circleChart" width="370" height="370"></canvas>
			</div>
		</div>
		<div class="loan-x pd15">
			<div class="loan-x-title">대출금리</div>
			<div class="loan-x-chart">
				차트
			</div>
		</div>
		<div class="loan-list pd15">
		</div>
	</div>
	
	<script src="resources/js/loan/loan.js"></script>
</body>
</html>