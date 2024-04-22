<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩에서 제공하고 있는 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- JavaScript -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<link rel="stylesheet" href="resources/css/helpCenter/qna/qnaInsertForm.css">
</head>
<body>
	<div class="qna-insert-form">
			<div class="qna-insert-head-area">
				<!-- <input type="hidden" id="qna-writer-nickname" value=""> -->
			
				<div id="qna-insert-close-btn"><button id="closeQnaInsertBtn">qna 글쓰기 닫기</button></div>
			</div>
				<br>
			<div class="qna-insert-area">
					<label>
					  	<input type="radio" name="visibility" value="secret" checked> 비밀글
					</label>
					<label>
					  	<input type="radio" name="visibility" value="not-secret"> 일반글
					</label>
					<br>
						<div class="qna-title" >문의제목 <input id="qna-title-input" value=""></div>
					<br>	
						<div class="qna-content">문의내용<textarea id="qna-content-input" maxlength="100" style="display: block;"></textarea></div>
					<br>		
					<div class="qna-insert-btn" style="background-color: #4CAF50; color: white; padding: 10px 24px; border: none; border-radius: 4px; cursor: pointer;">등록</div>
				
						<input type="hidden" id="qna-writer-no" value=${ loginUser.userNo }>
			</div>
			
					<script>
					
						$(document).on("click", ".qna-insert-btn", function(){
							var visibility = $("input[name='visibility']:checked").val();
							var qnaType = (visibility == "secret") ? 2 : 1;

							$.ajax({
								url: "insert.qna",
								data: {
									qnaWriter:$("#qna-writer-no").val(),
									qnaTitle:$("#qna-title-input").val(),
									qnaContent:$("#qna-content-input").val(),
									qnaType:qnaType
									},
									success: function(status){
										console.log(status);
										if(status =="success"){
											alert("회원님의 문의 사항이 성공적으로 등록되었습니다")
											
										}
									},
									error: function(xhr,status, error){
										console.error(error);
									}
							});
						});
					
					
					</script>
			
	</div>
	
</body>
</html>