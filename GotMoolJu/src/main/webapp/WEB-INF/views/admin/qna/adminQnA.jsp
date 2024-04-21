<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
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
		             <h6 style="margin-left: 86%; color: rightgray"> &lt; Q&A 개수 : ${ adminPi.listCount } &gt;</h6>
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
	                      <th>작성일</th>
	                      <th>답변</th>
	                      <th>공개</th> <%-- 🔒, 🔓 --%>
	                      <th class="text-right">게시</th> <%-- 게시여부 --%>
                      </thead>
                      <tbody id="adminQnAListClick1">
                      <c:forEach var="ad" items="${ admQnaList }">
		                 <tr name="adminQnAListClick2">
	                        <td class="qno" id="adminQ">${ ad.qnaNo }</td>
	                        <td>${ ad.qnaWriter }</td>
	                        <td>${ ad.qnaTitle }</td>
	                        <td>${ ad.qnaContent }</td>
	                        <c:choose>
	                        	<c:when test="${ ad.qnaModifyDate eq null }">
	                        		<td>${ ad.qnaCreateDate }</td>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<td>${ ad.qnaCreateDate } <br> (수정: ${ ad.qnaModifyDate })</td>
	                        	</c:otherwise>
	                        </c:choose>
	                        <c:choose>
	                        	<c:when test="${ ad.qnaAnswerStatus eq 'N' }">
	                        		<td>답변대기</td>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<td>답변완료</td>
	                        	</c:otherwise>
	                        </c:choose>
	                        <c:choose>
	                        	<c:when test="${ ad.qnaType eq 1 }">
	                        		<td>🔓</td>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<td>🔒</td>
	                        	</c:otherwise>
	                        </c:choose>
	                        <c:choose>
	                        	<c:when test="${ ad.qnaStatus eq 'Y' }">
	                        		<td class="text-right" style="color: blue">Y</td>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<td class="text-right" style="color: red">Y</td>
	                        	</c:otherwise>
	                        </c:choose>
		                 </tr>
		             </c:forEach>    
		             <%-- QNA_NO == QNA_ANSWER_REF_NO 일 시 그 아래 뜨게 --%>
		                 <tr name="adminQnAanswer" style="height:130px; background-color:rgb(246, 245, 255)">
		                 	<td></td>
		                 	<td colspan=2>관리자</td>
		                 	<td name="qnaAnswerContent">니가 알아봐!</td>
		                 	<td colspan=2>2024-02-28 <br>(수정: 2024-02-29)</td>
		                 	<td colspan=2 align="center"> <button style="float:right">수정하기 <%--or null일 시 답변하기 --%></button></td>
		                 </tr>
				     
	                     <%--
	                      <script>
	                      $(function(){
	                    	    $("#dd").click(function(){ // 클릭 이벤트가 발생했을 때
	                    	        console.log(list); // 콘솔에 메시지 출력
	                    	    });
	                    	});
	                      
	                      </script>
	                       --%>
                      </tbody>
                    </table>
                    
                    <%--
                    <td class="text-center">
                       <a href="announcementEnrollForm.ad" class="btn btn-round btn-primary" style="background-color: #12192c; float: right; color:whitesmoke">등록하기</a>
                    </td>
                     --%>
                  </div>
                  <br>
                  
                  <%--
                <script>
				$(function(){
					$("#>tr").click(function(){
						// console.log("눌림")
		                  location.href = 'announcementDetail.ad?ano=' + $(this).children(".ano").text();
		               })
				})
				</script>
				 --%>
			<script>
			$(function(){
			    $('tr[name="adminQnAListClick2"]').click(function(){
			        // 클릭된 요소의 바로 다음 요소 (adminQnAanswer)의 가시성 토글
			        $(this).next('tr[name="adminQnAanswer"]').toggle();
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
