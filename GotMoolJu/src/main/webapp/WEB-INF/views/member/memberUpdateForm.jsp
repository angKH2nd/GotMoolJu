<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/member/memberUpdateForm.css">
</head>
<body>
	<div class="member-update-form no-scrollbar">
		<div class="member-update-form-top pd15">
			<div class="member-update-form-previous fl mh" onclick="toggleMypageDiv('updateMemberForm')"><i class="fa-solid fa-angle-left fa-lg"></i></div>
			<div class="member-update-form-title fl">프로필 관리</div>
			<div class="member-update-form-delete fl mh"><button class="btn-format mh" onclick="openDeleteMemberForm();"><b>회원탈퇴</b></button></div>
		</div>
		<div class="member-update-form-picture centerXY" id="profilePicture">
			<img class="brc mh" width=60 height=60 src="${ loginUser.userUpdateName }">
			<i class="fa-solid fa-camera mh"></i>
			<input type="file" id="updateProfileImg" style="display: none;">
		</div>
		<div class="member-update-form-profile pd15">
			<div class="cannot-update-form br15 pd15">
				<div class="cannot-update-name">
					<div class="cannot-update-name-title fs12">이름</div>
					<input type="hidden" id="updateName" value="${ loginUser.userName }">
					<c:choose>
						<c:when test="${ loginUser.userGender eq 'M' }">
							<div class="cannot-update-name-content fs16">${ loginUser.userName } (남)</div>
						</c:when>
						<c:otherwise>
							<div class="cannot-update-name-content fs16">${ loginUser.userName } (여)</div>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="cannot-update-id">
					<div class="cannot-update-id-title fs12">아이디</div>
					<div class="cannot-update-id-content fs16">${ loginUser.userId }</div>
				</div>
			</div>
			<div class="can-update-form">
				<input type="hidden" id="originProfileImg" value="${ loginUser.userUpdateName }">
				<input type="hidden" id="originNickname" value="${ loginUser.userNickname }">
				<input type="hidden" id="originPhone" value="${ loginUser.userPhone }">
				<input type="hidden" id="originEmail" value="${ loginUser.userEmail }">
				<input type="hidden" id="originAddress" value="${ loginUser.userAddress }">
				<table>
					<tr style="height: 10px; font-size: 12px;"><td>닉네임</td></tr>
					<tr style="height: 50px;"><td><input class="fs16 bdlg br5 input-outline" type="text" id="updateNickname" name="updateNickname" placeholder="닉네임을 입력해주세요." maxlength="15" required value="${ loginUser.userNickname }"></td></tr>
					<tr style="height: 10px;"><td>&nbsp;</td></tr>
					
					<tr style="height: 10px; font-size: 12px;"><td>전화번호</td></tr>
					<tr style="height: 50px;">
						<td class="update-td-set">
							<input class="fs16 bdlg br5 input-outline update-input-set" type="text" id="updatePhone" name="updatePhone" placeholder="'-' 포함 전화번호를 입력해주세요." maxlength="13" required value="${ loginUser.userPhone }">
							<button type="button" id="updatePhoneSmsBtn" class="update-btn-get br5" disabled>인증하기</button>
						</td>
					</tr>
					
					<tr>
						<td colspan=2 class="update-td-set" id="validateUpdateSmsTr">
							<input type="number" name="validateUpdatePhone" id="validateUpdatePhone" class="fs16 bdlg br5 input-outline update-input-set" placeholder="인증번호를 입력해주세요." required maxlength=4>
							<input type="hidden" id="validateUpdatePhoneOrigin">
							<button type="button" id="validateUpdatePhoneSmsBtn" class="update-btn-get br5 mh" disabled>인증확인</button>
						</td>
					</tr>
					<tr style="height: 10px;" id="validateUpdateSmsTr"><td>&nbsp;</td></tr>
					
					<tr style="height: 10px;"><td>&nbsp;</td></tr>
					
					<tr style="height: 10px; font-size: 12px;"><td>이메일</td></tr>
					<tr style="height: 50px;">
						<td class="update-td-set">
							<input class="fs16 bdlg br5 input-outline" type="text" id="updateEmail" name="updateEmail" placeholder="이메일을 입력해주세요." maxlength="40" required value="${ loginUser.userEmail }">
							<button type="button" id="updateEmailSmsBtn" class="update-btn-get br5">인증하기</button>
						</td>
					</tr>
					
					<tr>
						<td colspan=2 class="update-td-set" id="validateUpdateEmailSmsTr">
							<input type="number" name="validateUpdateEmail" id="validateUpdateEmail" class="fs16 bdlg br5 input-outline update-input-set" placeholder="인증번호를 입력해주세요." required maxlength=6>
							<input type="hidden" id="validateUpdateEmailOrigin">
							<button type="button" id="validateUpdateEmailSmsBtn" class="update-btn-get br5 mh" disabled>인증확인</button>
						</td>
					</tr>
					<tr style="height: 10px;" id="validateUpdateEmailSmsTr"><td>&nbsp;</td></tr>
					
					<tr style="height: 10px;"><td>&nbsp;</td></tr>
					
					<tr style="height: 10px; font-size: 12px;"><td>주소</td></tr>
					<tr style="height: 50px;">
						<td class="update-td-set">
							<input class="fs16 bdlg br5 input-outline" type="text" id="updateAddress" name="updateAddress" placeholder="주소를 입력해주세요." maxlength="40" readonly value="${ loginUser.userAddress }">
							<button type="button" onclick="updateMemberAddress()" class="enroll-btn-search br5">주소검색</button>
						</td>
					</tr>
					<tr style="height: 10px;"><td>&nbsp;</td></tr>
					
					<tr style="height: 10px; font-size: 12px;"><td>변경할 주소</td></tr>
					<tr style="height: 50px;">
						<td>
							<input class="fs16 bdlg br5 input-outline" id="update_postcode" type="text" name="updateAddressPost" placeholder="우편번호" readonly>
							<input class="fs16 bdlg br5 input-outline" id="update_address" type="text" name="updateAddressNormal" placeholder="주소" readonly>
							<input class="fs16 bdlg br5 input-outline" id="update_detailAddress" type="text" name="updateAddressDetail" placeholder="상세주소" readonly>
							<input class="fs16 bdlg br5 input-outline" id="update_extraAddress" type="text" name="updateAddressExtra" placeholder="참고항목" readonly>
						</td>
					</tr>
					<tr style="height: 10px;"><td>&nbsp;</td></tr>
				</table>
			</div>
		</div>
		<div class="member-save-btn pdlr15 mh">
			<div class="member-save-outline br15 centerXY"><button type="button" id="update-submit-btn" class="member-update-btn br10 mh fb" style="width: 100%; height: 100%; border: none;" onclick="updateMember();">저장</button></div>
		</div>
		<br>
		<div class="member-update-pwd-btn pdlr15 mh">
			<div class="member-save-outline br15 centerXY"><button type="button" id="member-update-pwd-btn" class="member-update-pwd-btn br10 mh fb" style="width: 100%; height: 100%; border: none;" onclick="openUpdatePwdForm();">비밀번호변경</button></div>
		</div>
		<br>
	</div>
	
	<script src="resources/js/member/memberUpdateForm.js"></script>
</body>
</html>