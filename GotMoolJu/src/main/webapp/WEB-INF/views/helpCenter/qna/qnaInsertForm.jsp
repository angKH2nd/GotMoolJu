<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/helpCenter/qna/qnaInsertForm.css">
</head>
<body>
	<div class="qna-insert-form">
		<div class="qna-insert-head-area">
			Q&A 문의를 남겨보아요!
		</div>
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
			
			<div id="qna-insert-close-btn"><button id="closeQnaInsertBtn" class="btn-format">목록으로</button></div>
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