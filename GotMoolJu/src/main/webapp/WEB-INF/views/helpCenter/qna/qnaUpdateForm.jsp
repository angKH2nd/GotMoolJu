<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/helpCenter/qna/qnaUpdateForm.css">
</head>
<body>
	<div class="qna-update-form">
		<div class="qna-update-head-area">
			궁금한 사항에 대해 문의를 남겨보아요 😙!
		</div>
		<div class="qna-update-area">
			<div class="qna-update-area-icon">
				<div class="icon-i-notice-area fl"><i class="fa-solid fa-circle-info"></i> 비밀글 작성도 가능해요!</div>
				<div class="update-visibility-toggle fl mh" id="update-visibility-toggle">
		            <i class="fas fa-lock"></i>
		            <i class="fas fa-lock-open"></i>
		        </div>
		        <input type="hidden" id="update-visibility-input" name="update-visibility" value="secret">
		        <div class="update-visibility-text fl">비밀글</div>
	        </div>
	        <div class="qna-update-area-title">
				<div class="qna-title-update" style="text-align: left;">문의제목</div>
				<div class="qna-title-input-update"><input id="qna-update-title-input" placeholder="문의제목을 입력해주세요"></div>
	        </div>
	        <div class="qna-update-area-content">
	        	<div class="qna-content-update" style="text-align: left;">문의내용</div>
	        	<div class="qna-content-input-update"><textarea id="qna-update-content-input" maxlength="100" style="display: block;" placeholder="문의내용을 입력해주세요"></textarea></div>
	        </div>
			<div class="qna-update-btn mh br5" style="height: 45px;"><button class="qna-btn btn-primary mh" style="height: 20px;" onclick="updateQna()">등록</button></div>
			<div id="qna-update-close-btn" class="qna-update-close-btn mh br5"><button class="qna-btn btn-danger mh" onclick="returnDetail()">취소</button></div>
		
			<input type="hidden" id="qna-writer-no" value=${ loginUser.userNo }>
			<input type="hidden" id="qna-update-no">
		</div>
	</div>
	
	<script>
		$(document).ready(function() {
			document.querySelector('.update-visibility-toggle .fa-lock-open').style.display = 'none';
		    $('#update-visibility-toggle').click(function() {
		        var visibilityInput = document.getElementById('update-visibility-input');
		        var visibilityText = document.querySelector('.update-visibility-text');
		        var lockIcon = document.querySelector('.update-visibility-toggle .fa-lock');
		        var unlockIcon = document.querySelector('.update-visibility-toggle .fa-lock-open');
	
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
	
		function updateQna() {
			var visibility = $("#update-visibility-input").val();
			var qnaType = (visibility == "secret") ? 2 : 1;
	        $.ajax({
	            url: "update.qna",
	            data: {
	            	    qnaNo:$("#qna-update-no").val(),	
	            	 	qnaTitle:$("#qna-update-title-input").val(),
	            	 	qnaContent:$("#qna-update-content-input").val(),
	            	 	qnaType:qnaType,
	            },
	            success: function(status) {
	                 if(status =="success"){
	                 	 swal("Q&A 수정 성공!", "문의사항이 수정되었습니다", 'success');
	                 	 toggleHelpCenter('qna');
	                 	 loadQna();
	                 }
			         $("#qnaUpdate").hide();
			         $("#qnaList").show();
			    },
			    error: function(xhr, status, error) {
	                 console.log(status); // error 났을 때도 status확인
	                 console.log(error); 
	            }
			});
		};
		
		function returnDetail(){
    	    $("#qnaUpdate").hide();
		    $("#qnaDetail").show();
		}
	</script>
</body>
</html>