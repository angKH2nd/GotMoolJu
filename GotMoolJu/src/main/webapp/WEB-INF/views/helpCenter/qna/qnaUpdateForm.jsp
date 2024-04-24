<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩에서 제공하고 있는 스타일 -->
    <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- JavaScript -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
</head>
<body>

	<div class="qna-update-form">
	
	
			<label>
			  	<input id="secret" type="radio" name="visibility" value=""> 비밀글
			</label>
			<label>
			  	<input id="non-secret" type="radio" name="visibility" value=""> 일반글
			</label>
			<br>
				<div class="qna-title" >문의제목 <input id="qna-update-title-input" value=""></div>
			<br>	
				<div class="qna-content">문의내용<textarea id="qna-update-content-input" value="" maxlength="100" style="display: block;"></textarea></div>
			<br>		
			<div align="center">
			    <button class="qna-btn btn-primary" onclick="updateQna()">등록</button>
				<button class="qna-btn btn-danger" onclick="returnDetail()">취소</button>
			</div>
							
				<input type="hidden" id="qna-writer-no" value=${ loginUser.userNo }>
				<input type="hidden" id="qna-update-no" value="">
				

	
	</div>
	
	<script>
	
	 function updateQna() {
		 var visibility = $("input[name='visibility']:checked").val();
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
                 		console.log(status);
                 		if(status =="success"){
               		  		alert("문의사항 수정되었습니다");
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