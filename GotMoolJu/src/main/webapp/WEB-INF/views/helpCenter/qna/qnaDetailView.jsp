<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/helpCenter/qna/qnaDetailView.css">
</head>
<body>
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
			</table>
				
				<div class="qna-detail-head-area">
				</div>
				
				<!-- 
				<c:out value="${loginUser.userNickname}" />
				<c:out value="${q.qnaWriter}" />
				 -->
				
				<c:if test="${ not empty loginUser && loginUser.userNickname eq q.qnaWriter }">
				    <div align="center">
				        <!-- кнопки "수정하기" и "삭제하기" -->
				        <a class="qna-btn btn-primary" onclick="updateQna();" >수정하기</a>
				        <a class="qna-btn btn-danger" onclick="deleteQna();" >삭제하기</a>
				    </div>
				</c:if>
	
					</div>
		
					<div id="qna-sample"><button id="closeQnaDetailBtn">qna 상세 정보 닫기</button></div>
					<div id="qna-edit"><button id="editQnaDetailBtn">qna 정보 수정</button></div>
					<div id="qna-delete"><button id="deleteQnaDetailBtn">qna 삭제</button></div>
		
				<c:if test="${ loginUser.userNickname eq q.qnaWriter }">
		            <div align="center">
		                <!-- 수정하기, 삭제하기 버튼은 이글이 본인글일 경우만 보여져야됨 -->
			                <a class="qna-btn btn-primary" onclick="updateQna("editQna(${q })");" >수정하기</a> <!-- 요기에 href="" 를 작성하면 get방식이기 떄문에 노출된다. -->
			                <a class="qna-btn btn-danger" onclick="deleteQna();" >삭제하기</a>
		            </div>
		         </c:if>   
		            <br><br>
           <!--  
           <form id="postForm" action="" method="post">
            	<input type="hidden" name="bno" value="${b.boardNo }">
            	<input type="hidden" name="filePath" value="${b.changeName }">
            </form> 
            --> 
            
            <script>
            
            function updateQna(qnaNo) {
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
             	function deleteQna(qnaNo){
            		$.ajax({
						url: "delete.qna",
						data: {qno: qnaNo},
						success: function(response){
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
            </script>
 		
	</div>
</body>
</html>