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
        <div class="qna-detail-area pd15">
            <table>
                <thead>
                    <tr>
                        <td style="height: 45px;"><i class="fa-solid fa-circle-question"></i> 질문 내용</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="width: 100%; height: 45px; border-bottom: 0.5px solid #434d68;"></td>
                    </tr>
                </tbody>
            </table>
                  
            <input id="qna-number" type="hidden" name="qno">
            <input id="qna-writer" type="hidden" name="qwriter">
	            
	                
            <div class="qna-detail-head-area">
			    <script>
					let qnaWriter = $("#qna-writer").val();
				</script>
							
			    <c:if test="${loginUser.userNickname eq qnaWriter }"> </c:if>
			    <div class="qna-detail-btn-update">
			        <a class="qna-btn btn-primary fl br5 mh" onclick="updateForm($('#qna-number').val());" style="margin-right: 5px;">수정하기</a>
			        <a class="qna-btn btn-danger fl br5 mh" onclick="deleteQna($('#qna-number').val());" style="background-color: #4CAF50; color: white;">삭제하기</a>
			    </div>
	            <div id ="qna-sample" style="margin-top: 10px;" class="br5 mh"><button id="closeQnaDetailBtn" class="mh fb">목록으로</button></div>
	        </div>
                 
        <script>
            function deleteQna(){
               if(confirm("문의 사항 삭제하시겠습니까?")){
                  let qnaNo=$("#qna-number").val();
                  $.ajax({
                      url: "delete.qna",
                      data:{qno: qnaNo},
                      success: function(response){
                    	  swal("Q&A 삭제 성공!", "문의사항이 삭제되었습니다", 'success');
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
    </div>
</body>
</html>