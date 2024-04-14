<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/member/memberDeleteForm.css">
</head>
<body>
	<div class="delete-head centerXY">회원탈퇴</div>
	<div class="delete-body">
		<div class="delete-area pd15">
			<table>
				<tr>
					<td></td>
					<td width=100></td>
				</tr>
				<tr>
					<td colspan=2 class="delete-pwd-td-set">
						<input type="password" name="deletePwd" id="deletePwd" class="delete-pwd-input-outline" placeholder="비밀번호를 입력해주세요." required maxlength=12>
						<i class="fa-solid fa-key delete-pwd-i-set"></i>
					</td>
				</tr>
				<tr style="height: 10px;">
					<td colspan=2 class="delete-pwd-td-set">&nbsp;</td>
				</tr>
				<tr>
					<td colspan=2 class="delete-pwd-td-set">
						<input type="password" name="deletePwdCheck" id="deletePwdCheck" class="delete-pwd-input-outline" placeholder="비밀번호를 확인해주세요." required maxlength=12>
						<i class="fa-solid fa-key delete-pwd-i-set"></i>
					</td>
				</tr>
				<tr style="height: 10px;">
					<td colspan=2 class="delete-pwd-td-set">&nbsp;</td>
				</tr>
				<tr style="height: 50px; color: red">
					<th colspan=2 class="delete-pwd-td-set fs12">탈퇴 후에는 계정이 삭제되며 복구되지 않습니다.</th>
				</tr>
				<tr>
					<td colspan=2 class="delete-pwd-td-set">
						<button type="button" class="delete-pwd-btn br10 mh" id="deletePwdBtn" disabled onclick="deleteMember();">회원탈퇴</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="delete-bottom"></div>
	
   	<button type="button" class="modal-close mh" onClick="closeDeleteMemberForm();"><i class="fa-solid fa-xmark fa-xl"></i></button>

	<script src="resources/js/member/memberDeleteForm.js"></script>
</body>
</html>