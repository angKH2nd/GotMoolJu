<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/member/memberLoginForm.css">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
	<div class="login-head">
   		<div class="login-logo centerXY">
   			<img width=130 height=130 style="padding-top: 60px;" src="resources/images/got/got_logo_big.jpg">
   		</div>
   		<div class="login-input">
  				<div class="login-id">
	        	<input type="text" class="form-control input-outline login-input-set mb-2 mr-sm-2 bdlg br5" placeholder="ID" name="userId" required value="${empty cookie.id.value ? '' : cookie.id.value}"> <br>
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
				    <input type="checkbox" ${empty cookie.id.value ? '' : 'checked'} name="rememberId" class="mh"><span>로그인 정보기억</span>
				</label>
   				<button type="button" class="id-pw-search mh" style="margin-left: 112px;" onClick="openSearchIdPwdForm();">아이디/비밀번호찾기</button>
   			</div>
   		</div>
    </div>
    <br>
    <div class="login-body">
    	<div style="padding-top: 80px;" align="center">
			<div id="naver_id_login"></div>
    		<img width=200 height=42.5 src="resources/images/social/kakao.png" onclick="kakaoLogin();" class="socialLogin">
    	</div>
    </div>
    <div class="login-bottom">
    	<span style="font-size: 14px;">계정이 없으신가요?</span> <button type="button" class="mh" onClick="openEnrollForm();"> 회원가입</button>
    	<button type="button" class="modal-close mh" onClick="closeLoginForm();"><i class="fa-solid fa-xmark fa-xl"></i></button>
    </div>
    
    <script src="resources/js/member/memberLoginForm.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
    //카카오로그인
    function kakaoLogin() {

      $.ajax({
          url: 'login/getKakaoAuthUrl',
          type: 'post',
          async: false,
          dataType: 'text',
          success: function (res) {
			// window.open(res, 'popup', 'width=500,height=750,left=700,top=150,statusbar=no,location=no,menubar=no,scrollbars=no,resizable=no');
            location.href = res;
          }
      });

    }

	
  	var naver_id_login = new naver_id_login("opjzzdCNjEas6y2mkSia", "http://localhost:8222/got/naver.me");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 3,45);
  	naver_id_login.setDomain("http://localhost:8222/got/");
  	naver_id_login.setState(state);
  	naver_id_login.init_naver_id_login();

	
  
    </script>
</body>
</html>