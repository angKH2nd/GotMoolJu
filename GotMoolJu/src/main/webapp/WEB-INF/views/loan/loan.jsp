<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/loan/loanbar.css">
</head>
<body>
	여기는 대출임
	
	<div class="loanbar" id="loanbar">
	    <ul>
	        <li onclick="toggleLoan('loan1')">loan list 1</li>
	        <li onclick="toggleLoan('loan2')">loan list 2</li>
	        <li onclick="toggleLoan('loan3')">loan list 3</li>
	        <li onclick="toggleLoan('loan4')">loan list 4</li>
	    </ul>
	</div>
	<div class="loanbar-toggle">
	    <div class="loan1">loan 1 눌림</div>
	    <div class="loan2">loan 2 눌림</div>
	    <div class="loan3">loan 3 눌림</div>
	    <div class="loan4">loan 4 눌림</div>
	</div>
	<script src="resources/js/loan/loan.js"></script>
</body>
</html>