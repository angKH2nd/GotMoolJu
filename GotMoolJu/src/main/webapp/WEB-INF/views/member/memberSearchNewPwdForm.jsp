<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/member/memberSearchNewPwdForm.css">
</head>
<body>
	<div class="new-pwd-head centerXY">새로운 비밀번호 설정</div>
	<div class="new-pwd-body">
		<div class="new-pwd-area pd15">
			<table>
				<tr>
					<td></td>
					<td width=100></td>
				</tr>
				<tr>
					<td colspan=2 class="new-pwd-td-set">
						<input type="text" name="searchNewPwd" id="searchNewPwd" class="new-pwd-input-outline" placeholder="새로운 비밀번호를 입력해주세요." required maxlength=12>
						<i class="fa-solid fa-key new-pwd-i-set"></i>
					</td>
				</tr>
				<tr style="height: 10px;">
					<td colspan=2 class="new-pwd-td-set">&nbsp;</td>
				</tr>
				<tr>
					<td colspan=2 class="new-pwd-td-set">
						<input type="text" name="searchNewPwdCheck" id="searchNewPwdCheck" class="new-pwd-input-outline" placeholder="새로운 비밀번호를 확인해주세요." required maxlength=12>
						<i class="fa-solid fa-key new-pwd-i-set"></i>
					</td>
				</tr>
				<tr style="height: 10px;">
					<td colspan=2 class="new-pwd-td-set">&nbsp;</td>
				</tr>
				<tr>
					<td colspan=2 class="new-pwd-td-set">
						<button type="button" class="search-new-pwd-btn br5" id="searchNewPwdBtn" disabled onclick="searchNewPwd();">비밀번호 변경</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="new-pwd-bottom"></div>
	
	<button type="button" class="modal-before mh" onClick="beforeSearchNewPwdForm();"><i class="fa-solid fa-angle-left fa-xl"></i></button>
   	<button type="button" class="modal-close mh" onClick="closeSearchNewPwdForm();"><i class="fa-solid fa-xmark fa-xl"></i></button>
	<script src="resources/js/member/memberSearchNewPwdForm.js"></script>
</body>
</html>