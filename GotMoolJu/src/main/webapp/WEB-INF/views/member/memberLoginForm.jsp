<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/member/memberLoginForm.css">
</head>
<body>
	<div class="login-head">
   		<div class="login-logo centerXY">
   			<img width=130 height=130 style="padding-top: 60px;" src="resources/images/got/got_logo_big.jpg">
   		</div>
   		<div class="login-input">
  				<div class="login-id">
	        	<input type="text" class="form-control input-outline login-input-set mb-2 mr-sm-2 bdlg br5" placeholder="ID" name="userId" required> <br>
	        	<i class="fa-solid fa-user login-i-id"></i>
  				</div>
  				<div class="login-pwd">
	        	<input type="password" class="form-control input-outline login-input-set mb-2 mr-sm-2 bdlg br5" placeholder="Password" name="userPwd" required autocomplete="off"> <br>
  					<i class="fa-solid fa-key login-i-pwd"></i>
  				</div>
   		</div>
   		<div class="login-btn">
        	<button type="submit" class="btn-primary br5 fb mh">로그인</button>
        	<div style="padding-top: 4px;">
        		<label class="checkbox-label">
				    <input type="checkbox" class="mh"><span>로그인 정보기억</span>
				</label>
   				<button type="button" class="id-pw-search mh" style="margin-left: 112px;" onClick="openSearchIdPwdForm();">아이디/비밀번호찾기</button>
   			</div>
   		</div>
    </div>
    <br>
    <div class="login-body">
    	<div style="padding-top: 80px;">
    		<img width=347 height=42.5 src="resources/images/social/naver.png">
    		<img width=348 height=42.5 src="resources/images/social/kakao.png">
    	</div>
    </div>
    <div class="login-bottom">
    	<span style="font-size: 14px;">계정이 없으신가요?</span> <button type="button" class="mh" onClick="openEnrollForm();"> 회원가입</button>
    	<button type="button" class="modal-close mh" onClick="closeLoginForm();"><i class="fa-solid fa-xmark fa-xl"></i></button>
    </div>
    
    <script src="resources/js/member/memberLoginForm.js"></script>
</body>
</html>