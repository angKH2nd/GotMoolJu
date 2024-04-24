<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/helpCenter/qna/qnaDetailView.css">
<style>

#qnaUpdate {
   display: none;
}
</style>
<link rel="stylesheet" href="resources/css/helpCenter/qna/qnaDetailView.css">
 <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩에서 제공하고 있는 스타일 -->
    <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- JavaScript -->
   <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

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
                      <tr>
                          <td width="80"></td>
                      </tr>
                  </tbody>
              </table>
                  
            <input id="qna-number" type="hidden" name="qno" value="">
            <input id="qna-writer" type="hidden" name="qwriter" value="">
            
                   <div id ="qna-sample"><button id="closeQnaDetailBtn">qna 상세 정보 닫기</button></div>
                
               <div class="qna-detail-head-area">
		                 <script>
						
							let qnaWriter = $("#qna-writer").val();
						
						</script>
						
		                 <c:if test="${loginUser.userNickname eq qnaWriter }"> </c:if>
			                 <div>
			                    <a class="qna-btn btn-primary" onclick="updateForm($('#qna-number').val())">qna 수정하기</a>
			                    <a class="qna-btn btn-danger" onclick="deleteQna($('#qna-number').val());">qna 삭제하기</a>
			                </div>
		               
                 </div>
                 
                 <script>
                 function deleteQna(){
                    if(confirm("문의 사항 삭제하시겠습니까?")){
                       let qnaNo=$("#qna-number").val();
                       $.ajax({
                          url: "delete.qna",
                           data:{qno: qnaNo},
                           
                           success: function(response){
                              console.log("qnaNo:" , qnaNo);
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
                 }
                 
                 function updateForm(){
                	    $("#qnaDetail").hide();
                	    $("#qnaUpdate").show();
                	    let qnaNo = $("#qna-number").val();
                	    $.ajax({
                	        url: "detail.qna",
                	        data: { qno: qnaNo },
                	        success: function(response){
                	            console.log("다시 한조한 결과:", response);
                	            $("#qna-update-title-input").val(response.qnaTitle);
                	            $("#qna-update-content-input").val(response.qnaContent);
                	            $("#qna-update-no").val(response.qnaNo);
                	           // $("input[name='visibility']").prop("checked", false);
                	            if(response.qnaType == "2"){
                	            	$("#secret").prop("checked", true).val("secret");
                	            } else {
                	                // qnaType "2" 아닐 때
                	                $("#non-secret").prop("checked", true).val("non-secret");
                	            }
                	        }
                	    });
                	}

                 
               </script>
          
          </div>
          <br>    
      
    </div>
      
</body>
</html>