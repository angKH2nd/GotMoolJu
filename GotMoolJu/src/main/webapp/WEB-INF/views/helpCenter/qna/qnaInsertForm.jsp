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
			궁금한 사항에 대해 문의를 남겨보아요 😙!
		</div>
		<div class="qna-insert-area">
			<div class="qna-insert-area-icon">
				<div class="icon-i-notice-area fl"><i class="fa-solid fa-circle-info"></i> 비밀글 작성도 가능해요!</div>
				<div class="visibility-toggle fl mh" id="visibility-toggle">
		            <i class="fas fa-lock"></i>
		            <i class="fas fa-lock-open"></i>
		        </div>
		        <input type="hidden" id="visibility-input" name="visibility" value="secret">
		        <div class="visibility-text fl">비밀글</div>
	        </div>
	        <div class="qna-insert-area-title">
				<div class="qna-title" style="text-align: left;">문의제목</div>
				<div class="qna-title-input"><input id="qna-title-input" placeholder="문의제목을 입력해주세요"></div>
	        </div>
	        <div class="qna-insert-area-content">
	        	<div class="qna-content" style="text-align: left;">문의내용</div>
	        	<div class="qna-content-input"><textarea id="qna-content-input" maxlength="100" style="display: block;" placeholder="문의내용을 입력해주세요"></textarea></div>
	        </div>
			<div class="qna-insert-btn mh br5">등록</div>
			<div id="qna-insert-close-btn" class="qna-insert-close-btn mh br5"><button id="closeQnaInsertBtn" class="btn-format fb mh">목록으로</button></div>
		
			<input type="hidden" id="qna-writer-no" value=${ loginUser.userNo }>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			document.querySelector('.visibility-toggle .fa-lock-open').style.display = 'none';
		    $('#visibility-toggle').click(function() {
		        var visibilityInput = document.getElementById('visibility-input');
		        var visibilityText = document.querySelector('.visibility-text');
		        var lockIcon = document.querySelector('.visibility-toggle .fa-lock');
		        var unlockIcon = document.querySelector('.visibility-toggle .fa-lock-open');
	
		        if (visibilityInput.value === 'secret') {
		            visibilityInput.value = 'not-secret';
		            visibilityText.textContent = '일반글';
		            lockIcon.style.display = 'none'; // 잠긴 자물쇠 아이콘 숨김
		            unlockIcon.style.display = 'inline-block'; // 열린 자물쇠 아이콘 표시
		        } else {
		            visibilityInput.value = 'secret';
		            visibilityText.textContent = '비밀글';
		            lockIcon.style.display = 'inline-block'; // 잠긴 자물쇠 아이콘 표시
		            unlockIcon.style.display = 'none'; // 열린 자물쇠 아이콘 숨김
		        }
		    });
		});
	
		$(document).on("click", ".qna-insert-btn", function(){
			// var visibility = $("input[name='visibility']:checked").val();
			var visibility = $("#visibility-input").val();
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
					if(status =="success"){
						swal("Q&A 등록 성공!", "회원님의 문의 사항이 성공적으로 등록되었습니다", 'success');
						$("#closeQnaInsertBtn").click();
					}
					$("#qna-title-input").val('');
					$("#qna-content-input").val('');
				},
				error: function(xhr,status, error){
					console.error(error);
				}
			});
		});
	</script>
</body>
</html>