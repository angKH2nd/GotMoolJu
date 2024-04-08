<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/member/memberEnrollForm.css">
</head>
<body>
	<div class="enroll-head centerXY">회원가입</div>
   	<div class="enroll-body">
   		<table>
   			<tr style="height: 25px;">
   				<td width=30>&nbsp;</td>
   				<td width=228>&nbsp;</td>
   				<td width=90>&nbsp;</td>
   			</tr>
   			
   			<tr>
			    <td colspan="3" class="enroll-td-set">
			        <input type="text" name="userId" placeholder="ID를 입력해주세요." maxlength="10" required class="enroll-input-set bdlg enroll-border-top">
			        <i class="fa-solid fa-user enroll-i-set"></i>
			    </td>
			</tr>
   			
   			<tr>
   				<td colspan="3" class="enroll-td-set">
			        <input type="password" name="userPwd" placeholder="비밀번호를 입력해주세요." maxlength="12" required autocomplete="off" class="enroll-input-set bdlg">
			        <i class="fa-solid fa-key enroll-i-set"></i>
			    </td>
  				</tr>
   			
   			<tr>
   				<td colspan="3" class="enroll-td-set">
			        <input type="password" name="userPwdCheck" placeholder="비밀번호를 다시 입력해주세요." maxlength="12" required autocomplete="off" class="enroll-input-set bdlg enroll-border-bottom">
			        <i class="fa-solid fa-key enroll-i-set"></i>
			    </td>
  				</tr>
  				
  				<tr style="height: 10px;"><td colspan="3"></td></tr>
  				
  				<tr>
			    <td colspan="3" class="enroll-td-set">
			        <input type="text" name="userName" placeholder="이름을 입력해주세요." maxlength="3" required class="enroll-input-set bdlg enroll-border-top">
			        <i class="fa-solid fa-id-card enroll-i-set"></i>
			    </td>
			</tr>
   			
   			<tr>
   				<td colspan="3" class="enroll-td-set">
			        <input type="text" name="userNickname" placeholder="닉네임을 입력해주세요." maxlength="15" required class="enroll-input-set bdlg">
			        <i class="fa-solid fa-star enroll-i-set"></i>
			    </td>
  				</tr>
  				
  				<tr>
   				<td colspan="3" class="enroll-td-set">
			        <input type="email" name="userEmail" placeholder="이메일을 입력해주세요." maxlength="40" required class="enroll-input-set bdlg">
			        <i class="fa-solid fa-envelope enroll-i-set"></i>
			        <button type="button" class="enroll-btn-search br5">인증하기</button>
			    </td>
  				</tr>
  				
  				<tr>
   				<td colspan="3" class="enroll-td-set">
   					<div class="enroll-input-set bdlg" style="line-height: 42.5px; width: 308px;">
    					<input type="radio" name="userGender" id="Male" value="M" required>
                    	<label for="Male" style="font-size: 14px;">남자</label> &nbsp;&nbsp;
                    	<input type="radio" name="userGender" id="Female" value="F" required>
                    	<label for="Female" style="font-size: 14px;">여자</label><br>
				        <i class="fa-solid fa-venus-mars fa-sm enroll-i-set"></i>
				    </div>
			    </td>
  				</tr>
  				
   			<tr>
   				<td colspan="3" class="enroll-td-set">
			        <input type="text" name="userPhone" placeholder="'-' 포함 전화번호를 입력해주세요." maxlength="13" required class="enroll-input-set bdlg enroll-border-bottom">
			        <i class="fa-solid fa-phone enroll-i-set"></i>
			    </td>
  				</tr>
  				
  				<tr style="height: 10px;"><td colspan="3"></td></tr>
  				
  				<tr>
			    <td colspan="3" class="enroll-td-set">
			        <input id="sample6_postcode" type="text" name="userAddressPost" placeholder="우편번호" readonly class="bdlg enroll-border-top enroll-input-set">
			        <i class="fa-solid fa-compass enroll-i-set"></i>
			        <button type="button" onclick="sample6_execDaumPostcode()" class="enroll-btn-search br5">주소검색</button>
			        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			    </td>
			</tr>
   			
   			<tr>
   				<td colspan="3" class="enroll-td-set">
			        <input id="sample6_address" type="text" name="userAddressNormal" placeholder="주소" readonly class="enroll-input-set bdlg enroll-border-bottom">
			        <i class="fa-solid fa-home enroll-i-set"></i>
			    </td>
  				</tr>
   			
   			<tr>
   				<td colspan="3" class="enroll-td-set">
			        <input  id="sample6_detailAddress" type="text" name="userAddressDetail" placeholder="상세주소" required class="enroll-input-set bdlg enroll-border-bottom">
			        <i class="fa-solid fa-location-dot fa-lg enroll-i-set"></i>
			    </td>
  				</tr>
   			
   			<tr>
   				<td colspan="3" class="enroll-td-set">
			        <input  id="sample6_extraAddress" type="text" name="userAddressExtra" placeholder="참고항목" readonly class="enroll-input-set bdlg enroll-border-bottom">
			        <i class="fa-solid fa-signs-post enroll-i-set"></i>
			    </td>
  				</tr>
  				
   			<tr style="height: 25px;"><td colspan=3>&nbsp;</td></tr>
   		</table>
   	</div>
   	<div class="enroll-bottom">
   		<div class="enroll-submit-btn fl"><button type="submit" id="enroll-submit-btn" class="btn-format mh" disabled>가입하기</button></div>
   		<div class="enroll-reset-btn fl"><button type="reset" class="btn-format mh">초기화</button></div>
   	</div>
   	
   	<button type="button" class="modal-before mh" onClick="beforeEnrollForm();"><i class="fa-solid fa-angle-left fa-xl"></i></button>
   	<button type="button" class="modal-close mh" onClick="closeLoginForm();"><i class="fa-solid fa-xmark fa-xl"></i></button>
   	<script src="resources/js/member/memberEnrollForm.js"></script>
</body>
</html>