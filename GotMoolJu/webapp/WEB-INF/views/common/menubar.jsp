<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="assets/css/common/menubar.css">
</head>
<body>
	<div class="menubar">
		<div class="l-navbar" id="navbar">
	        <nav class="nav">
	            <div>
	                <div class="nav__brand">
	                    <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
	                    <a href="home.got" class="nav__logo">Got물주</a>
	                </div>
	                <div class="nav__list">
	                    <a href="home.got" class="nav__link active">
	                        <ion-icon name="home-outline" class="nav__icon"></ion-icon>
	                        <span class="nav_name">홈</span>
	                    </a>
	                    <a href="#" class="nav__link">
	                        <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
	                        <span class="nav_name">Messenger</span>
	                    </a>
	
	                    <div href="#" class="nav__link collapse">
	                        <ion-icon name="folder-outline" class="nav__icon"></ion-icon>
	                        <span class="nav_name">Projects</span>
	
	                        <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
	
	                        <ul class="collapse__menu">
	                            <a href="#" class="collapse__sublink">Data</a>
	                            <a href="#" class="collapse__sublink">Group</a>
	                            <a href="#" class="collapse__sublink">Members</a>
	                        </ul>
	                    </div>
	
	                    <a href="#" class="nav__link">
	                        <ion-icon name="pie-chart-outline" class="nav__icon"></ion-icon>
	                        <span class="nav_name">Analytics</span>
	                    </a>
	                    
	                    <a href="#" class="nav__link">
	                        <ion-icon name="people-outline" class="nav__icon"></ion-icon>
	                        <span class="nav_name">마이페이지</span>
	                    </a>
	                    
	                </div>
	                <a href="#" class="nav__link">
	                    <ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
	                    <span class="nav_name">로그아웃</span>
	                </a>
	            </div>
	        </nav>
	    </div>
	</div>

    <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <script src="assets/js/common/menubar.js"></script>
</body>
</html>