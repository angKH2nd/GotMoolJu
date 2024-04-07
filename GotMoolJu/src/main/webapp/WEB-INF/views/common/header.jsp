<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/common/header.css">
</head>
<body>
	<div class="common_header">
		<div class="header-toggle"></div>
		<div class="header-popular">
			<div class="popular-title fl"><i class="fa-solid fa-fire"></i> 인기 검색어</div>
			<div class="block fl">
			    <ul id="ticker">
			        <li><button type="button"><span>1</span> 리상룡의 내집마련기 </button></li>
			        <li><button type="button"><span>2</span> 조원이 많아서 행복해요 </button></li>
			        <li><button type="button"><span>3</span> 마라탕 먹고싶다 </button></li>
			        <li><button type="button"><span>4</span> 오늘 날씨 아따 좋다잉 </button></li>
			        <li><button type="button"><span>5</span> 위대하신 리상룡 수령동지를 위해</button></li>
			        <li><button type="button"><span>6</span> 학원에 변태가 나타났다 </button></li>
			        <li><button type="button"><span>7</span> 아 더 이상 쓸 말 없는데 </button></li>
			        <li><button type="button"><span>8</span> 대충 인기검색어 8위임 </button></li>
			        <li><button type="button"><span>9</span> 타꼬야끼도 먹고 싶네 </button></li>
			        <li><button type="button"><span>10</span> 근데 떡볶이도 좋은데 어쩌지 </button></li>
			    </ul>
			</div>
		</div>
		<div class="header-blank"></div>
		<div class="header-member">
			<c:choose>
            	<c:when test="${ empty loginUser }">         
					<div class="member-likes"></div>
					<div class="member-notice"></div>
					<div class="member-picture"></div>
					<div class="member-nickname">
						<div class="member-nickname-blank"></div>
						<div class="member-nickname-profile" onClick="openLogin();"><img width=40 height=40 src="resources/images/member/basicUserProfile.png"> &nbsp;</div>
					</div>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${ loginUser.userId eq 'admin' }">
							<div class="member-admin mh"><a class="tdna" href="main.ad">관리자 전환</a></div>
							<div class="member-picture mh centerXY"><img class="brc" width=30 height=30 src="${ loginUser.userUpdateName }"></div>
							<div class="member-nickname">${ loginUser.userNickname } 님 &nbsp;</div>
						</c:when>
						<c:otherwise>
							<div class="member-likes mh"><i class="fa-solid fa-heart fa-lg"></i></div>
							<div class="member-notice mh"><i class="fa-regular fa-bell fa-lg"></i></div>
							<div class="member-picture mh centerXY"><img class="brc" width=40 height=40 src="${ loginUser.userUpdateName }"></div>
							<div class="member-nickname">${ loginUser.userNickname } 님 &nbsp;</div>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<%-- 모달 배경 --%>	
    <div class="modal-bg" onClick="closeBg();"></div>

    <%-- 로그인 modal 영역 --%>
    <form action="login.me" method="post">
    <div class="modal-wrap pd15">
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
		        	<input type="password" class="form-control input-outline login-input-set mb-2 mr-sm-2 bdlg br5" placeholder="Password" name="userPwd" required> <br>
   					<i class="fa-solid fa-key login-i-pwd"></i>
   				</div>
    		</div>
    		<div class="login-btn">
	        	<button type="submit" class="btn-primary br5 fb mh">로그인</button>
	        	<div style="padding-top: 4px;">
	        		<label class="checkbox-label">
					    <input type="checkbox" class="mh"><span>로그인 정보기억</span>
					</label>
    				<button type="button" class="id-pw-search mh" style="margin-left: 112px;">아이디/비밀번호찾기</button>
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
	    	<button type="button" class="modal-close mh" onClick="closeLogin();"><i class="fa-solid fa-xmark fa-xl"></i></button>
	    </div>
    </div>
    </form>
	<%-- 로그인 modal 영역 --%>
	
	<%-- 회원가입 modal 영역 --%>
    <form action="insert.me" method="post">
    <div class="modal-enroll-wrap no-scrollbar pd15">
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
				        <input type="password" name="userPwd" placeholder="비밀번호를 입력해주세요." maxlength="12" required class="enroll-input-set bdlg">
				        <i class="fa-solid fa-key enroll-i-set"></i>
				    </td>
   				</tr>
    			
    			<tr>
    				<td colspan="3" class="enroll-td-set">
				        <input type="password" name="userPwdCheck" placeholder="비밀번호를 다시 입력해주세요." maxlength="12" required class="enroll-input-set bdlg enroll-border-bottom">
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
    	
    	<button type="button" class="modal-before mh" onClick="beforeEnroll();"><i class="fa-solid fa-angle-left fa-xl"></i></button>
    	<button type="button" class="modal-close mh" onClick="closeLogin();"><i class="fa-solid fa-xmark fa-xl"></i></button>
    </div>
    </form>
	<%-- 회원가입 modal 영역 --%>
	
	<script src="resources/js/common/header.js"></script>
</body>
</html>