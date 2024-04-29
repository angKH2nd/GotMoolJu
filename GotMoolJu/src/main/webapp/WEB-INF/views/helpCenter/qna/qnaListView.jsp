<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<style>
.btn-format {
    background-color: #434d68;
    color: white;
    padding: 10px 24px;
    border: none;
    border-radius: 5px;
}

.btn-format:hover {
    background-color: #4CAF50;
}

</style>
<link rel="stylesheet" href="resources/css/helpCenter/qna/qnaListView.css">
</head>
<body>
	<input type="hidden" id="nickName" value="${loginUser.userNickname }">
    <div class="qna-top-area pd15"><button type="button" class="btn-format fb mh" id="insertQnaFormBtn">글쓰기</button></div>
   <div id="qnaList">
      <div class="qna-table-area pd15">
         <table class="qna_list_area">
            <thead>
               <tr>
                   <th>글제목</th>
                   <th width=80>작성자</th>
                   <th width=93>작성일</th>
                   <th width=40>답변</th>
               </tr>
            </thead>
            <tbody>
               
            </tbody>
         </table>
       </div>
       <%-- pagination 그리기 div --%>
       <div class="qna-pagination"></div>
   </div>
   
   <div id="qnaDetail">
       <%@ include file="qnaDetailView.jsp" %>
   </div>
   
   <div id="qnaInsert">
       <%@ include file="qnaInsertForm.jsp" %>
   </div>
   
   <div id="qnaUpdate">
       <%@ include file="qnaUpdateForm.jsp" %>
   </div>
      
   <script src="resources/js/helpCenter/qna/qnaListView.js"></script>
</body>
</html>