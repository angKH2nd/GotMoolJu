<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>

 <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩에서 제공하고 있는 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- JavaScript -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	<link rel="stylesheet" href="resources/css/helpCenter/qna/qnaDetailView.css">
</head>
<body>
 			<script>
            
            function deleteQna(){
            	let qnaNo = $("#qna-number").val();
        		$.ajax({
					url: "delete.qna",
					data: {qno:qnaNo},

					success: function(response){
					console.log("qnaNo:", qnaNo);
						alert("문의사항 삭제되었습니다");
						console.log(response);
						$("#qnaDetail").hide();
						  $("#qnaList").show();
					},
					error: function(){
						console.log('error');
					}
				});
        	}
            
            function updateQna() {
            	let qnaNo = $("#qna-number").val();
                $.ajax({
                    url: "update.qna",
                    data: { qno: qnaNo },
                    success: function(response) {
                        alert("문의사항 수정되었습니다");
                        console.log(response);
                        $("#qnaDetail").hide();
                        $("#qnaList").show();
                    },
                    error: function() {
                        console.log('error');
                    }
                });
            }
             	
            </script>
            
 		
	<div class="qna-detail-form">
			<div class="qna-detail-area">
			
			<table>
			<thead>
				<tr>
					<th width="80">질문 내용</th>
				
				</tr>
			</thead>
			<tbody>
			
			
			</tbody>
					<td width="80"></td>
					<input id="qna-number" type="hidden" name="qno" value="">
					
			</table>
			
			<div id="qna-sample"><button id="closeQnaDetailBtn">qna 상세 정보 닫기</button></div>
			<div id="qna-edit"><button id="editQnaDetailBtn" onclick ="updateQna($('#qna-number').val())">qna 정보 수정</button></div>
            <div id="qna-delete"><button id="deleteQnaDetailBtn" onclick="deleteQna($('#qna-number').val());">qna 삭제</button></div>
		            
				
				<div class="qna-detail-head-area">
				</div>
				
				<!-- 
				<c:out value="${loginUser.userNickname}" />
				<c:out value="${q.qnaWriter}" />
				 
				
				<c:if test="${ not empty loginUser && loginUser.userNickname eq q.qnaWriter }">
				    <div align="center">
				        <!-- кнопки "수정하기" и "삭제하기" -->
				        <!-- 수정하기, 삭제하기 버튼은 이글이 본인글일 경우만 보여져야됨
				        <a class="qna-btn btn-primary" onclick="updateQna();" >수정하기</a>
				        <a class="qna-btn btn-danger" onclick="deleteQna();" >삭제하기</a>
				    </div>
				</c:if>
				-->
	
					</div>
		
		            <br><br>
           <!--  
           <form id="postForm" action="" method="post">
            	<input type="hidden" name="bno" value="${b.boardNo }">
            	<input type="hidden" name="filePath" value="${b.changeName }">
            </form> 
            --> 
            
           
	</div>
</body>
</html>