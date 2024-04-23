<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/homeTown/homeTown.css">
</head>
<body>
	<div class="homeTown-outer">
		<c:choose>
			<c:when test="${not empty loginUser}">
				<input type="hidden" id="homeTownLoginCheck" value="${loginUser.userNo}">
			</c:when>
			<c:otherwise>
				<input type="hidden" id="homeTownLoginCheck" value="n">
			</c:otherwise>
		</c:choose>
		<div class="homeTown-nav-area pd15">
			<div class="homeTown-nav fl">
				갓물주 에서 바로 볼 수 있는 매물
			</div>
			<div class="homeTown-cancel fl">
				<div class="homeTown-cancel-btn mh" onClick="cancelDiv()"><i class="fa-solid fa-xmark fa-lg"></i></div>
			</div>
		</div>
		<div class="homeTown-content">
			<div class="homeTown-title">
				<div class="homeTown-count fl">
					<div class="homeTown-count-head">
						<div class="homeTown-count-head-num fl">${ aptCount }</div>
						<div class="homeTown-count-head-text fl">개</div>
					</div>
					<div class="homeTown-count-comment" id="currentTime"></div>
				</div>
				<div class="homeTown-blank fl"></div>
				<div class="homeTown-find fl mh"><img width=70 height=60 src="resources/images/got/got_logo_big.jpg"></div>
			</div>
			<div class="homeTown-search pd15" onclick="toggleHomeTownDiv('searchApt');"><input class="home-search-bar-design br5 mh" type="text" value="찾으시는 매물이 있으신가요?" readonly><i class="fa-solid fa-magnifying-glass" id="home-search-bar-design-i"></i></div>
			<div class="homeTown-weather pd15"><%@ include file="./weather.jsp" %></div> 
			<div class="homeTown-town pd15">
				<div class="homeTown-town-title centerY">
					<div class="homeTown-town-title-text fl">인기 동네소식 사진</div>
					<div class="homeTown-town-title-link fl"></div>
				</div>
				<div class="homeTown-town-pictures">
					<div class="homeTown-town-pictures-top"></div>
					<div class="homeTown-town-pictures-img">
						
					</div>
				</div>
			</div>
			<div class="homeTown-news pd15">
				<div class="homeTown-news-title centerY">부동산 최신 뉴스를 한번에!</div>
				<div class="homeTown-news-content no-scrollbar">
					<ul class="news-list">
						<li><img width=50 height=50 class="brc mh" src="resources/images/homeTown/news_naver.png" onclick="openAptNews(1);"></li>
						<li><img width=50 height=50 class="brc mh" src="resources/images/homeTown/news_daum.png" onclick="openAptNews(2);"></li>
						<li><img width=50 height=50 class="brc mh" src="resources/images/homeTown/news_google.png" onclick="openAptNews(3);"></li>
						<li><img width=50 height=50 class="brc mh" src="resources/images/homeTown/news_seoul.png" onclick="openAptNews(4);"></li>
						<li><img width=50 height=50 class="brc mh" src="resources/images/homeTown/news_edaily.png" onclick="openAptNews(5);"></li>
						<li><img width=50 height=50 class="brc mh" src="resources/images/homeTown/news_chosun.png" onclick="openAptNews(6);"></li>
						<li><img width=50 height=50 class="brc mh" src="resources/images/homeTown/news_korea.png" onclick="openAptNews(7);"></li>
						<li><img width=50 height=50 class="brc mh" src="resources/images/homeTown/news_money.png" onclick="openAptNews(8;"></li>
						<li><img width=50 height=50 class="brc mh" src="resources/images/homeTown/news_moneyToday.png" onclick="openAptNews(9);"></li>
			        </ul>
			        <div class="news-slide-buttons">
					    <button class="news-prev-btn fb brc mh"><i class="fa-solid fa-angle-left"></i></button>
					    <button class="news-next-btn fb brc mh"><i class="fa-solid fa-angle-right"></i></button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script src="resources/js/homeTown/homeTown.js"></script>
</body>
</html>