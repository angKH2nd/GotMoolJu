<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://kit.fontawesome.com/4dc2c036ac.js" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
  <head>

    <link rel="icon" sizes="32x32" type="image/png" href="resources/images/got/got_logo.ico">
    <link rel="icon" type="image/png" href="../assets/img/favicon.png" />
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>갓물주</title>
    <style>
	    #adminQnAListClick1:hover {
		  cursor: pointer;
		  
		}
		#statusNcolor{
			color: lightgray;
		}
			
		
    </style>
    <meta
      content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no"
      name="viewport"
    />
    <%-- Fonts and icons --%>
    <link
      href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.7.1/css/all.css"
      integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
      crossorigin="anonymous"
    />
    <%-- CSS Files --%>
    <link href="resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link
      href="resources/assets/css/now-ui-dashboard.css?v=1.5.0"
      rel="stylesheet"
    />
    <%-- CSS Just for demo purpose, don't include it in your project --%>
    <link href="resources/assets/demo/demo.css" rel="stylesheet" />
  </head>
  <body>
    <%-- 메뉴바 삽입 --%>

    <div style="float: left">
      <jsp:include page="../common/adminMenubar.jsp" />
    </div>
    <jsp:include page="../common/adminThinHeader.jsp" />
 
<!-- 여기서부터 -->
     <div class="wrapper">
      <div class="main-panel" id="main-panel">
        <!-- End Navbar -->
        <div class="content">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header">
                  <h4 class="card-title">Q & A</h4>
                  <p class="category">
		             <h6 style="margin-left: 86%; color:#12192c"> &lt; Q & A 개수 : ${ adminPi.listCount } &gt;</h6>
		           </p>
                </div>
                 <div
		            class="card-body all-icons"
		            style="margin-right: 4%; margin-left: 4%"
		          >
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table" id="adminQnAList">
                      <thead class="text-primary">
	                      <th>No</th>
	                      <th>Writer</th>
	                      <th>Title</th>
	                      <th style="width:45%">Content</th>
	                      <th>Date</th>
	                      <th>Answer</th>
	                      <th>Public</th>
	                      <th>Status</th>
	                      <th class="text-right"></th>
                      </thead>
                      <tbody id="adminQnAListClick1">
                      <c:forEach var="ad" items="${ admQnaList }">
		                 <tr name="adminQnAListClick2">
		                 	<c:if test="${ ad.qnaStatus eq 'Y' }">
	                        	<td class="qno" id="adminQ" name="qnaNo">${ ad.qnaNo }</td>
	                        	<td>${ ad.qnaWriter }</td>
	                        	<td>${ ad.qnaTitle }</td>
	                        	<td style="width:45%">${ ad.qnaContent }</td>
	                        </c:if>
	                        <c:if test="${ ad.qnaStatus eq 'N' }">
	                        	<td class="qno" id="adminQ" style="color:lightgray">${ ad.qnaNo }</td>
	                        	<td id="statusNcolor">${ ad.qnaWriter }</td>
	                        	<td id="statusNcolor">${ ad.qnaTitle }</td>
	                        	<td style="width:45%;" id="statusNcolor">${ ad.qnaContent }</td>
	                        </c:if>
	                        <c:choose>
	                        	<c:when test="${ ad.qnaModifyDate eq null }">
	                        		<td>${ ad.qnaCreateDate }</td>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<c:if test="${ ad.qnaStatus eq 'Y' }">
	                        			<td>${ ad.qnaCreateDate } <br> (수정: ${ ad.qnaModifyDate })</td>
	                        		</c:if>
	                        		<c:if test="${ ad.qnaStatus eq 'N' }">
	                        			<td id="statusNcolor">${ ad.qnaCreateDate } <br> (수정: ${ ad.qnaModifyDate })</td>
	                        		</c:if>
	                        	</c:otherwise>
	                        </c:choose>
	                        <c:choose>
	                        	<c:when test="${ ad.qnaAnswerStatus eq 'N' }">
	                        		<c:if test="${ ad.qnaStatus eq 'Y' }">
	                        			<td style="color:red">답변대기</td>
	                        		</c:if>
	                        		<c:if test="${ ad.qnaStatus eq 'N' }">
	                        			<td id="statusNcolor">답변대기</td>
	                        		</c:if>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<td id="statusNcolor">답변완료</td>
	                        	</c:otherwise>
	                        </c:choose>
	                        <c:choose>
	                        	<c:when test="${ ad.qnaType eq 1 }">
	                        		<td name="qnaType"><i class="fa-solid fa-lock-open"></i></td> <%-- 일반 --%> 
	                        	</c:when>
	                        	<c:otherwise>
	                        		<td name="qnaType"><i class="fa-solid fa-lock"></i></td> <%-- 비밀 --%>
	                        	</c:otherwise>
	                        </c:choose>
	                        <c:choose>
	                        	<c:when test="${ ad.qnaStatus eq 'Y' }">
	                        		<td style="color: blue" align="center">Y</td>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<td style="color: red" align="center">N</td>
	                        	</c:otherwise>
	                        </c:choose>
	                        <%-- 휴지통 아이콘 / 삭제하기 --%>
	                        <c:if test="${ ad.qnaStatus eq 'Y' }">
	                        	<td class="text-right" onclick="moveToDeleteQna(${ ad.qnaNo });"><a style="color:red; border-radius: 20px"><i class="fa-solid fa-trash-can"></i></a></td>
	                        </c:if>
	                        <c:if test="${ ad.qnaStatus eq 'N' }">
	                        	<td class="text-right"></td>
	                        </c:if>
	                        
	                        <script>
		                        function moveToDeleteQna(qno){
		                        	if (confirm("Q&A를 삭제하시겠습니까?")) {
	                        			location.href = "qnaListDelete.ad?qno=" + qno;
		                        	}else{
		                        		
		                        	}
	                        	}
	                        </script>
		                 </tr>
		                 
                <%-- 답글 --%> 
			    <tr name="adminQnAanswer" style="height:130px; background-color:rgb(246, 245, 255)">
				<c:forEach var="adA" items="${ admQnaAnswerList }">
					<c:if test="${ ad.qnaNo eq adA.qnaAnswerRefNo && ad.qnaAnswerStatus eq 'Y'}">
						<c:if test="${ ad.qnaStatus eq 'Y' }">
							<td></td>
	                 		<td colspan=2>${ adA.qnaAnswerWriter }</td>
	                 		<td>
	                 			<textarea readonly id="qnaAnswerContent${ad.qnaNo}" name="qnaAnswerContent" style="resize:none; width: 600px; height: 100px; background-color: #f3f3f3">${ adA.qnaAnswerContent }</textarea>
	                 		</td>
	                 		<td colspan=3>${ adA.qnaAnswerCreateDate }
		                 		<c:if test="${ adA.qnaAnswerModifyDate ne null}">
		                 			 <br> (수정: ${ adA.qnaAnswerModifyDate })
		                 		</c:if>
	                 		</td>
	                 	</c:if>
	                 	<c:if test="${ ad.qnaStatus eq 'N' }">
	                 		<td></td>
	                 		<td id="statusNcolor" colspan=2>${ adA.qnaAnswerWriter }</td>
	                 		<td id="statusNcolor">${ adA.qnaAnswerContent }  <br> (삭제된 문의글입니다.)</td>
	                 		<td id="statusNcolor" colspan=3>${ adA.qnaAnswerCreateDate } <br> (수정: ${ adA.qnaAnswerModifyDate })</td>
	                 	</c:if>
			         </c:if>        
	            </c:forEach>
	                <c:if test="${ ad.qnaAnswerStatus eq 'N'}">
	                	<td name="qno"></td>
	                	<%-- 답글 작성자, 안 보임 --%>
		                <td colspan=2 name="qnaAnswerWriter"></td>
		                
		                <%-- 답글 내용 / 작성해주세요. --%>
		                <td> 
		                	<c:if test="${ ad.qnaStatus eq 'Y' }">
		                		<textarea id="qnaAnswerContent${ad.qnaNo}" name="qnaAnswerContent" style="resize:none; width: 600px; height: 100px;" placeholder="댓글을 입력해 주세요."></textarea>
		                	</c:if>
		                	<c:if test="${ ad.qnaStatus eq 'N' }">
		                		<textarea id="statusNcolor" style="resize:none; width: 600px; height: 100px; border: 1px solid darkgray; background-color: f3f3f3; readonly">삭제된 문의글입니다.</textarea>
		                	</c:if>
		                </td>
		                <td colspan="3" name="qnaAnswerCreateDate"></td>
                	</c:if>
                		<input type="hidden" id="qnaTypeValue" value="${ad.qnaType}">
		                <c:choose>
		                 	<c:when test="${ ad.qnaAnswerStatus eq 'N' }">
		                 		<%-- 작성하기 이모지, 아이콘 --%>
		                 		<c:if test="${ ad.qnaStatus eq 'Y' }">
		                 			<td colspan=2 align="center" onclick="moveToEnrollQna(${ ad.qnaNo }); connect();"> 
		                 				<a style="float:right; color:blue; border-radius: 20px"><i class="fa-solid fa-paper-plane"></i></a>
									</td> 
									
									<!-- 알림보내는 메시지 -->
									<div>
										<input type="hidden" id="msg" value="회원님 질문에 답변이 등록 되었습니다" class="form-control"/>
									
									</div>
									
									<script>
										function moveToEnrollQna(qno){
				                        	if (confirm("등록하시겠습니까?")) {
				                        		var contentId = "#qnaAnswerContent" + qno;
				                        	    var content = $(contentId).val();
				                        	   
				                        	    let msg= $('input#msg').val();
				                        	    socket.send(msg);
			                        			
				                        	    location.href = "qnaAnswerEnroll.ad?qno=" + qno + "&qnaAnswerContent=" + content + "&qnaType=" + $("#qnaTypeValue").val();
				                        	}else{
				                        		
				                        	}
			                        	}
									</script>
									
									<script>
									var socket = null;
									function connect(){
										console.log("tttttt")
										var ws = new WebSocket("ws://localhost:8222/qnaAnswerEnroll.ad?qno=" + qno);
										socket = ws;
										
										ws.onopen = function(){
											console.log('info: connection opened.');
										};
										
										ws.onmessage = function(event){
											console.log("RecieveMessage:",event.data+'\n');
										};
										
										ws.onclose = function (event){
											console.log('Info: connection closed.');
										};
										
										ws.onerror = function(err){
											console.log('Error:', err);
										};
									}
									
									
									
									
									
									</script>
		                		</c:if>
		                		<c:if test="${ ad.qnaStatus eq 'N' }">
		                			<td colspan=2 align="center"> 
		                 				<a style="float:right; color:blue; border-radius: 20px"></a>
		                			</td>
		                		</c:if>
		                	</c:when>
		                	<c:otherwise>
			                	<%-- 수정하기 이모지, 아이콘 --%>
			                	<c:if test="${ ad.qnaStatus eq 'Y' }">
			                		<td colspan=2 align="center" id="updateChangeQnaArea">
		                				<a style="float:right; border-radius: 20px" onclick="moveToUpdateQna(${ ad.qnaNo })"><i class="fa-regular fa-pen-to-square"></i></a>
		                			</td>
		                			<script>
			                			function moveToUpdateQna(qno) {
			                		        var contentId = "#qnaAnswerContent" + qno;
	
			                		        $(contentId).prop("readonly", false);
	
			                		        $(contentId).css("background-color", "white");
	
			                		        changeUpdateQnaIcon(qno);
			                		    }
			                		    
			                		    function changeUpdateQnaIcon(qno) {
			                		        var qnaHtml = `
			                		            <a style="float:right; border-radius: 20px" onclick="moveToRealUpdateQna(${ ad.qnaNo })"><i class="fa-solid fa-floppy-disk"></i></a>
			                		        `;
			                		        $("#updateChangeQnaArea").html(qnaHtml);
			                		    }
			                		    
			                		    function moveToRealUpdateQna(qno) {
			                		        var contentId = "#qnaAnswerContent" + qno;
			                		        location.href = "qnaAnswerUpdate.ad?qno=" + qno + "&qnaAnswerContent=" + $(contentId).val();
			                		    }
		                			</script>
		                		</c:if>
	                			<c:if test="${ ad.qnaStatus eq 'N' }">
	                				<td colspan=2 align="center" ></td>
	                			</c:if>
		                	</c:otherwise>
		                </c:choose>
					 </tr>
					</c:forEach>  			
                      </tbody>
                    </table>
                  </div>
                  <br>
			<script>
			$(function(){
			    // 초기에 adminQnAanswer 요소를 숨김
			    $('tr[name="adminQnAanswer"]').hide();

			    $('tr[name="adminQnAListClick2"]').click(function(){
			        // 클릭된 요소의 바로 다음 요소 (adminQnAanswer)의 가시성 토글
			        if ($(this).next('tr[name="adminQnAanswer"]').is(':hidden')) {
			            $(this).next('tr[name="adminQnAanswer"]').show();
			        } else {
			            $(this).next('tr[name="adminQnAanswer"]').hide();
			        }
			    });
			});
		    </script>
		 

				               
            <div id="pagingArea" style="float:right">
                <ul class="pagination">
                	
                	<c:choose>
                		<c:when test="${ adminPi.currentPage eq 1 }">
                   			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
                   		</c:when> 
                   		<c:otherwise>
                   			<li class="page-item"><a class="page-link" href="qnaList.ad?cpage=${ adminPi.currentPage -1 }">Previous</a></li>
                   		</c:otherwise>
                   	</c:choose>
                   	
                   	<c:forEach var="p" begin="${ adminPi.startPage }" end="${ adminPi.endPage }">
                   		<li class="page-item"><a class="page-link" href="qnaList.ad?cpage=${ p }">${ p }</a></li>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${ adminPi.currentPage eq adminPi.maxPage }">
							<li class="page-item disabled"><a class="page-link" href="">Next</a></li>
        				</c:when>
        				<c:otherwise>
        					<li class="page-item"><a class="page-link" href="qnaList.ad?cpage=${ adminPi.currentPage + 1 }">Next</a></li>
        				</c:otherwise>
        			</c:choose>
                </ul>
            </div>
              
            
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
 </div>  
    <%--   Core JS Files   --%>
    <script src="resources/assets/js/core/jquery.min.js"></script>
    <script src="resources/assets/js/core/popper.min.js"></script>
    <script src="resources/assets/js/core/bootstrap.min.js"></script>
    <script src="resources/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
    <%--  Google Maps Plugin    --%>
    <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
    <%-- Chart JS --%>
    <script src="resources/assets/js/plugins/chartjs.min.js"></script>
    <%--  Notifications Plugin    --%>
    <script src="resources/assets/js/plugins/bootstrap-notify.js"></script>
    <%-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc --%>
    <script
      src="resources/assets/js/now-ui-dashboard.min.js?v=1.5.0"
      type="text/javascript"
    ></script>
    <%-- Now Ui Dashboard DEMO methods, don't include it in your project! --%>
    <script src="resources/assets/demo/demo.js"></script>

    <%-- 푸터바 삽입 --%>

    <jsp:include page="../common/adminFooter.jsp" />
  </body>
</html>
