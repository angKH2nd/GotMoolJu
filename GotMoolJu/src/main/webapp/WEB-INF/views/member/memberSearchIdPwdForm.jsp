<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/member/memberSearchIdPwdForm.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<div>
		<br><br><br>
		아이디/비번찾기 구현할 예정
		
		<input type="text" name="userPhone" id="userPhone">
		
		<button type="button" onclick="sendSms();">인증</button>
		
		<div id="sms-result"></div>
	</div>
	
	<button type="button" class="modal-before mh" onClick="beforeSearchIdPwdForm();"><i class="fa-solid fa-angle-left fa-xl"></i></button>
   	<button type="button" class="modal-close mh" onClick="closeSearchIdPwdForm();"><i class="fa-solid fa-xmark fa-xl"></i></button>
	<script src="resources/js/member/memberSearchIdPwdForm.js"></script>
</body>
</html>