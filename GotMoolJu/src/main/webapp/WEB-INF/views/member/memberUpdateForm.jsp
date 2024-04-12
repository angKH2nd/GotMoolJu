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
			<div class="member-update-form-previous fl mh" onclick="toggleMypageDiv('updateMemberForm')"><i class="fa-solid fa-angle-left fa-xl"></i></div>
			<div class="member-update-form-title fl">프로필 관리</div>
			<div class="member-update-form-logout fl mh"><button class="btn-format mh" onclick="openDeleteMemberForm();"><b>회원탈퇴</b></button></div>
		</div>
		<div class="member-update-form-picture centerXY">
			<img class="brc mh" width=60 height=60 src="${ loginUser.userUpdateName }">
			<i class="fa-solid fa-camera mh"></i>
		</div>
		<div class="member-update-form-profile pd15">
			<div class="cannot-update-form br15 pd15">
				<div class="cannot-update-name">
					<div class="cannot-update-name-title fs12">이름</div>
					<div class="cannot-update-name-content fs16">${ loginUser.userName }</div>
				</div>
				<div class="cannot-update-id">
					<div class="cannot-update-id-title fs12">아이디</div>
					<div class="cannot-update-id-content fs16">${ loginUser.userId }</div>
				</div>
			</div>
			<div class="can-update-form">
				<table>
					<tr style="height: 10px; font-size: 12px;"><td>닉네임</td></tr>
					<tr style="height: 50px;"><td><input class="fs16 bdlg br5 input-outline" type="text" name="updateNickname" placeholder="닉네임을 입력해주세요." maxlength="15" required value="${ loginUser.userNickname }"></td></tr>
					<tr style="height: 10px;"><td>&nbsp;</td></tr>
					
					<tr style="height: 10px; font-size: 12px;"><td>전화번호</td></tr>
					<tr style="height: 50px;">
						<td class="update-td-set">
							<input class="fs16 bdlg br5 input-outline update-input-set" type="text" name="updatePhone" placeholder="'-' 포함 전화번호를 입력해주세요." maxlength="13" required value="${ loginUser.userPhone }">
							<button type="button" class="update-btn-get br5">인증하기</button>
						</td>
					</tr>
					<tr style="height: 10px;"><td>&nbsp;</td></tr>
					
					<tr style="height: 10px; font-size: 12px;"><td>이메일</td></tr>
					<tr style="height: 50px;">
						<td class="update-td-set">
							<input class="fs16 bdlg br5 input-outline" type="text" name="updateEmail" placeholder="이메일을 입력해주세요." maxlength="40" required value="${ loginUser.userEmail }">
							<button type="button" class="update-btn-get br5">인증하기</button>
						</td>
					</tr>
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
			<div class="member-save-outline br15 centerXY">저장</div>
		</div>
		<div class="member-delete-btn pd15 mh">
			<div class="member-delete-outline br15">
				<div class="member-delete-title fl">회원탈퇴</div>
				<div class="member-delete-next fl">&gt;</div>
			</div>
		</div>
	</div>
	
	<script src="resources/js/member/memberUpdateForm.js"></script>
</body>
</html>