<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/member/memberUpdatePwdForm.css">
</head>
<body>
	<div class="update-pwd-head centerXY">새로운 비밀번호 설정</div>
	<div class="update-pwd-body">
		<div class="update-pwd-area pd15">
			<table>
				<tr>
					<td></td>
					<td width=100></td>
				</tr>
				<tr>
					<td colspan=2 class="update-pwd-td-set">
						<input type="hidden" id="updatePwdUserId">
						<input type="password" name="updatePwd" id="updatePwd" class="update-pwd-input-outline" placeholder="새로운 비밀번호를 입력해주세요." required maxlength=12>
						<i class="fa-solid fa-key update-pwd-i-set"></i>
					</td>
				</tr>
				<tr style="height: 10px;">
					<td colspan=2 class="update-pwd-td-set">&nbsp;</td>
				</tr>
				<tr>
					<td colspan=2 class="update-pwd-td-set">
						<input type="password" name="updatePwdCheck" id="updatePwdCheck" class="update-pwd-input-outline" placeholder="새로운 비밀번호를 확인해주세요." required maxlength=12>
						<i class="fa-solid fa-key update-pwd-i-set"></i>
					</td>
				</tr>
				<tr style="height: 10px;">
					<td colspan=2 class="update-pwd-td-set">&nbsp;</td>
				</tr>
				<tr>
					<td colspan=2 class="update-pwd-td-set">
						<button type="button" class="update-pwd-btn br5 mh" id="updatePwdBtn" disabled onclick="updatePwd();">비밀번호 변경</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="update-pwd-bottom"></div>
	
   	<button type="button" class="modal-close mh" onClick="closeUpdatePwdForm();"><i class="fa-solid fa-xmark fa-xl"></i></button>
	<script src="resources/js/member/memberUpdatePwdForm.js"></script>
</body>
</html>