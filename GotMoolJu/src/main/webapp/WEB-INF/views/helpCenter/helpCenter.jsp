<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/helpCenter/helpCenter.css">
</head>
<body>
	<div class="helpCenter-outer">
		<div class="help-nav-area pd15">
			<div class="help-nav fl">
				<div class="helpCenter-bar" id="helpCenter-bar">
				    <ul>
				        <li class="mh announcement-btn" onclick="toggleHelpCenter('announcement')">공지사항</li>
				        <li class="mh faq-btn" onclick="toggleHelpCenter('faq'); loadFaqs()">자주묻는질문</li>
				        <li class="mh qna-btn" onclick="toggleHelpCenter('qna'); loadQna()">Q&A</li>
				        <li class="mh guide-btn" onclick="toggleHelpCenter('guide')">가이드</li>
				    </ul>
				</div>
			</div>
			<div class="help-cancel fl">
				<div class="help-cancel-btn mh" onClick="cancelDiv()"><i class="fa-solid fa-xmark fa-lg"></i></div>
			</div>
		</div>
		<div class="help-content">
			<div class="helpCenter-bar-toggle">
			    <div class="announcement"><%@ include file="announcement/announcementListView.jsp" %></div>
			    <div class="faq faq-container no-scrollbar"><%@ include file="faq/faqListView.jsp" %></div>
			    <div class="qna"><%@ include file="qna/qnaListView.jsp" %></div>
			    <div class="guide"><%@ include file="guide/guideListView.jsp" %></div>
			</div>
		</div>
	</div>
	<script src="resources/js/helpCenter/helpCenter.js"></script>
</body>
</html>