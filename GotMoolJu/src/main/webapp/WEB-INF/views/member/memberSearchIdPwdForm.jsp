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
	<div class="id-pwd-head centerXY">아이디 / 비밀번호찾기</div>
	<div class="id-pwd-body">
		<div class="id-pwd-btn">
			<div class="id-select-btn fl"><button type="button" class="fb mh" onclick="openIdForm();"><strong>아이디 찾기</strong></button></div>
			<div class="pwd-select-btn fl"><button type="button" class="fb mh" onclick="openPwdForm();"><strong>비밀번호 찾기</strong></button></div>
		</div>
		<div class="id-area pd15">
			<table>
				<tr>
					<td></td>
					<td width=100></td>
				</tr>
				<tr>
					<td colspan=2 class="id-pwd-td-set">
						<input type="text" name="searchIdName" id="searchIdName" class="id-pwd-input-outline" placeholder="이름을 입력해주세요." required maxlength=3>
						<i class="fa-solid fa-user id-pwd-i-set"></i>
					</td>
				</tr>
				<tr style="height: 10px;">
					<td colspan=2 class="id-pwd-td-set">&nbsp;</td>
				</tr>
				<tr>
					<td colspan=2 class="id-pwd-td-set">
						<input type="number" name="searchIdPhone" id="searchIdPhone" class="id-pwd-input-outline" placeholder="휴대폰 번호를 입력해주세요." required maxlength=11>
						<i class="fa-solid fa-phone id-pwd-i-set"></i>
						<button type="button" class="sms-btn br5" id="sendIdSms" onclick="sendIdSms();" disabled>인증발송</button>
					</td>
				</tr>
				<tr style="height: 10px;">
					<td colspan=2 class="id-pwd-td-set">&nbsp;</td>
				</tr>
				<tr>
					<td colspan=2 class="id-pwd-td-set" id="validateSmsTr">
						<input type="number" name="validateIdPhone" id="validateIdPhone" class="id-pwd-input-outline" placeholder="인증번호를 입력해주세요." required maxlength=4 onkeyup="checkIdSmsInput()">
						<input type="hidden" id="validateIdPhoneOrigin">
						<i class="fa-solid fa-envelope id-pwd-i-set"></i>
						<button type="button" id="validateIdPhoneBtn" class="sms-btn br5" onclick="validateIdSms();" disabled>인증확인</button>
					</td>
				</tr>
				<tr>
					<td colspan=2 class="id-pwd-td-set">&nbsp;</td>
				</tr>
				<tr>
					<td colspan=2 class="id-pwd-td-set">
						<button type="button" class="search-id-btn br5 mh" id="searchIdBtn" disabled onclick="searchId();">아이디 찾기</button>
					</td>
				</tr>
			</table>
		</div>
		<div class="pwd-area pd15">
			<table>
				<tr>
					<td></td>
					<td width=100></td>
				</tr>
				<tr>
					<td colspan=2 class="id-pwd-td-set">
						<input type="text" name="searchPwdId" id="searchPwdId" class="id-pwd-input-outline" placeholder="아이디를 입력해주세요." required maxlength=10>
						<i class="fa-solid fa-user id-pwd-i-set"></i>
					</td>
				</tr>
				<tr style="height: 10px;">
					<td colspan=2 class="id-pwd-td-set">&nbsp;</td>
				</tr>
				<tr>
					<td colspan=2 class="id-pwd-td-set">
						<input type="number" name="searchPwdPhone" id="searchPwdPhone" class="id-pwd-input-outline" placeholder="휴대폰 번호를 입력해주세요." required maxlength=11>
						<i class="fa-solid fa-phone id-pwd-i-set"></i>
						<button type="button" class="sms-btn br5" id="sendPwdSms" onclick="sendPwdSms();" disabled>인증발송</button>
					</td>
				</tr>
				<tr style="height: 10px;">
					<td colspan=2 class="id-pwd-td-set">&nbsp;</td>
				</tr>
				<tr>
					<td colspan=2 class="id-pwd-td-set" id="validateSmsTr">
						<input type="number" name="validatePwdPhone" id="validatePwdPhone" class="id-pwd-input-outline" placeholder="인증번호를 입력해주세요." required maxlength=4 onkeyup="checkPwdSmsInput()">
						<input type="hidden" id="validatePwdPhoneOrigin">
						<i class="fa-solid fa-envelope id-pwd-i-set"></i>
						<button type="button" id="validatePwdPhoneBtn" class="sms-btn br5 mh" onclick="validatePwdSms();">인증확인</button>
					</td>
				</tr>
				<tr>
					<td colspan=2 class="id-pwd-td-set">&nbsp;</td>
				</tr>
				<tr>
					<td colspan=2 class="id-pwd-td-set">
						<button type="button" class="search-pwd-btn br5 mh" id="searchPwdBtn" disabled onclick="openNewPwdForm();">비밀번호 찾기</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="id-pwd-bottom"></div>
	
	<button type="button" class="modal-before mh" onClick="beforeSearchIdPwdForm();"><i class="fa-solid fa-angle-left fa-lg"></i></button>
   	<button type="button" class="modal-close mh" onClick="closeSearchIdPwdForm();"><i class="fa-solid fa-xmark fa-xl"></i></button>
	<script src="resources/js/member/memberSearchIdPwdForm.js"></script>
</body>
</html>