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
		<div class="header-popular">인기검색어 띄울거임</div>
		<div class="header-blank"></div>
		<div class="header-member">
			<c:choose>
            	<c:when test="${ empty loginUser }">         
					<div class="member-likes"></div>
					<div class="member-notice"></div>
					<div class="member-picture"></div>
					<div class="member-nickname">
						<div class="member-nickname-blank"></div>
						<div class="member-nickname-profile" onClick="javascript:popOpen();"><img width=40 height=40 src="resources/images/member/basicUserProfile.png"> &nbsp;</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="member-likes mh"><i class="fa-solid fa-heart fa-lg"></i></div>
					<div class="member-notice mh"><i class="fa-regular fa-bell fa-lg"></i></div>
					<div class="member-picture mh">프사</div>
					<div class="member-nickname">${ loginUser.userNickname } 님 &nbsp;</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	
    <%-- modal 영역 --%>
    <div class="modal-bg" onClick="javascript:popClose();"></div>
    <div class="modal-wrap">
    	<button type="button">회원가입</button>
        <form action="login.me" method="post">
	        <label for="userId" class="mr-sm-2">ID : </label> <br>
	        <input type="text" class="form-control mb-2 mr-sm-2" placeholder="ID" name="userId" required> <br>
	        <label for="userPwd" class="mr-sm-2">Password : </label> <br>
	        <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Password" name="userPwd" required> <br>
	           
	        <button type="submit" class="btn btn-primary">로그인</button>
    	</form>
    	<button>ID/비밀번호찾기</button>
    	<button class="modal-close" onClick="javascript:popClose();">닫기</button>
    	
    	<br><br>
    	
    	네버 로그인 이랑 구글로그인
    	네버 로그인 이랑 구글로그인
    	
    	<br>
    	
    	아 언제하지
    	
    	<br><br>
    	
    	로그인하거라로그인하거라로그인하거라로그인하거라로그인하거라로그인하거라로그인하거라로그인하거라로그인하거라로그인하거라로그인하거라로그인하거라로그인하거라로그인하거라로그인하거라로그인하거라로그인하거라로그인하거라로그인하거라로그인하거라로그인하거라로그인하거라로그인하거라로그인하거라로그인하거라로그인하거라로그인하거라로그인하거라로그인하거라로그인하거라로그인하거라로그인하거라로그인하거라로그인하거라로그인하거라
    </div>
	<%-- modal 영역 --%>
	
	<script src="resources/js/common/header.js"></script>
</body>
</html>