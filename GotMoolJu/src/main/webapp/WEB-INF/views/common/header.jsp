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
		<div class="header-toggle" onclick="openSearchApt();"><input class="search-bar-design br5 mh" type="text" value="찾으시는 매물이 있으신가요?" readonly><i class="fa-solid fa-magnifying-glass" id="search-bar-design-i"></i></div>
		<div class="header-popular">
			<div class="popular-title fl"><i class="fa-solid fa-fire"></i> 인기 검색어</div>
			<div class="block fl">
			    <ul id="ticker">
			        <li><button type="button" class="hoverZ"><span>1</span> 리상룡의 내집마련기 </button></li>
			        <li><button type="button" class="hoverZ"><span>2</span> 조원이 많아서 행복해요 </button></li>
			        <li><button type="button" class="hoverZ"><span>3</span> 마라탕 먹고싶다 </button></li>
			        <li><button type="button" class="hoverZ"><span>4</span> 오늘 날씨 아따 좋다잉 </button></li>
			        <li><button type="button" class="hoverZ"><span>5</span> 위대하신 리상룡 수령동지를 위해</button></li>
			        <li><button type="button" class="hoverZ"><span>6</span> 학원에 변태가 나타났다 </button></li>
			        <li><button type="button" class="hoverZ"><span>7</span> 아 더 이상 쓸 말 없는데 </button></li>
			        <li><button type="button" class="hoverZ"><span>8</span> 대충 인기검색어 8위임 </button></li>
			        <li><button type="button" class="hoverZ"><span>9</span> 타꼬야끼도 먹고 싶네 </button></li>
			        <li><button type="button" class="hoverZ"><span>10</span> 근데 떡볶이도 좋은데 어쩌지 </button></li>
			    </ul>
			</div>
		</div>
		<div class="header-blank"></div>
		<div class="header-member">
			<c:choose>
            	<c:when test="${ empty loginUser }">         
					<div class="member-likes hoverZ"></div>
					<div class="member-notice hoverZ"></div>
					<div class="member-picture hoverZ"></div>
					<div class="member-nickname">
						<div class="member-nickname-blank"></div>
						<div class="member-nickname-profile" onClick="openLoginForm();"><img width=40 height=40 src="resources/images/etc/smile.png" style="margin-left: 40px;"> &nbsp;</div>
					</div>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${ loginUser.userId eq 'admin' }">
							<div class="member-admin mh hoverZ"><a class="tdna" href="main.ad" style="color: black;">관리자 전환</a></div>
							<div class="member-picture mh centerXY hoverZ"><img class="brc" width=30 height=30 src="${ loginUser.userUpdateName }"></div>
							<div class="member-nickname">${ loginUser.userNickname } 님 &nbsp;</div>
						</c:when>
						<c:otherwise>
							<div class="member-likes mh centerXY hoverZ" onclick="openDibs();"><i class="fa-solid fa-heart fa-lg"></i></div>
							<div class="member-notice mh centerXY hoverZ" onclick="openNotice();"><i class="fa-regular fa-bell fa-lg"></i></div>
							<div class="member-picture mh centerXY hoverZ" onclick="toggleDiv('member')"><img class="brc" width=40 height=40 src="${ loginUser.userUpdateName }"></div>
							<div class="member-nickname">${ loginUser.userNickname } &nbsp; 님 &nbsp;</div>
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
	    	<%@ include file="../member/memberLoginForm.jsp" %>
	    </div>
    </form>
	<%-- 로그인 modal 영역 --%>
	
	<%-- 회원가입 modal 영역 --%>
    <form action="insert.me" method="post">
	    <div class="modal-enroll-wrap no-scrollbar pd15">
	    	<%@ include file="../member/memberEnrollForm.jsp" %>
	    </div>
    </form>
	<%-- 회원가입 modal 영역 --%>
	
	<%-- 아이디/비밀번호 찾기 영역 --%>
    <div class="modal-searchIdPwd-wrap no-scrollbar">
    	<%@ include file="../member/memberSearchIdPwdForm.jsp" %>
    </div>
    
    <%-- 비밀번호 찾기 - 신규 비밀번호 설정 영역 --%>
    <div class="modal-searchNewPwd-wrap no-scrollbar">
    	<%@ include file="../member/memberSearchNewPwdForm.jsp" %>
	</div>
	
	<%-- 회원 탈퇴 영역 --%>
	<div class="modal-delete-wrap no-scrollbar">
    	<%@ include file="../member/memberDeleteForm.jsp" %>
	</div>
	
	<%-- 비밀번호 변경 영역 --%>
	<div class="modal-update-pwd-wrap no-scrollbar">
    	<%@ include file="../member/memberUpdatePwdForm.jsp" %>
	</div>
	
	<%-- 세금계산기 영역 --%>
	<div class="modal-ref-wrap no-scrollbar">
		<img style="border-radius: 20px;" class="pd15" width=770 height=520 src="resources/images/etc/taxImage.png">
	</div>
	
	<script src="resources/js/common/header.js"></script>
</body>
</html>