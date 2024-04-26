<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/homeTown/searchApt.css">
<style>
	#search-outer{
		width: 100%;
		height: 100%;
		border: 1px solid blue;
	}
	#search-area{
		height: 20%;
		display: flex;
	}
	#search-result{
		height: 80%;
	}
</style>
</head>
<body>
	<div onclick="cancelHomeTownDiv();">
		searchApt.jsp 입니다
	</div>

	<div id="search-outer">
		<div id="search-area">
			<select name="search" id="search">
				<option value="apt" selected>아파트</option>
				<option value="address">지역</option>
			</select>
			<input type="text">
			<button>검색</button>
		</div>
		<div id="search-result">

		</div>


	</div>


	<script src="resources/js/homeTown/searchApt.js"></script>
</body>
</html>