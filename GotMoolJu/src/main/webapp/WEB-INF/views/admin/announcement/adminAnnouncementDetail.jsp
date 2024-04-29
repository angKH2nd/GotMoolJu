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
	    #memberlistClick1:hover {
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
    
	 <form id="adminAnnoDetailForm" method="post" action="announcementDetail.ad">
	 <input type="hidden" name="ano" value="${ adminA.announcementNo }">
	  <!-- 여기서부터 -->
	   <div class="wrapper">
	    <div class="main-panel" id="main-panel" >
	      <!-- End Navbar -->
	      <div class="content">
	        <div class="row">
	          <div class="col-md-8 ml-auto mr-auto">
	            <div class="card card-upgrade">
	              <div class="card-header text-center">
	                <h4 class="card-title">공지사항</h3>
	                <p class="card-category">${ adminA.announcementCreateDate }<br>조회수: ${ adminA.announcementCount }</p>
	              </div>
	              <div class="card-body">
	                <div class="table-responsive table-upgrade" style="height:600px">
	                  <table class="table" >
	                    <thead>
	                      <th>Title</th>
	                      <th>
	                      	<c:choose>
	                      		<c:when test="${ adminA.announcementStatus eq 'Y' }">
	                      			<input id="anno-content" class="anno-content" type="text" value="${ adminA.announcementTitle }" style="width:80%; border-radius: 40px; font-size: 18px; padding-left: 15px; border: 2px solid #12192c;" readonly>
	                      		</c:when>
	                      		<c:otherwise>
	                      			<input id="anno-content" class="anno-content" type="text" value="${ adminA.announcementTitle }" style="width:80%; border-radius: 40px; font-size: 18px; padding-left: 15px; background-color: #f1f1f1; border: 2px solid #12192c;" readonly>
	                      		</c:otherwise>
	                      	</c:choose>
	                      </th>
	                    </thead>
	                    <tbody>
	                      <tr>
	                        <td>Content</td>
	                        <td>
	                          <c:choose>
	                            <c:when test="${ adminA.announcementStatus eq 'Y' }">
	                              <textarea id="anno-content" class="anno-content" style="width:80%; height: 380px; border-radius: 25px; font-size: 15px; padding: 15px; resize: none; border: 2px solid #12192c;" readonly> ${ adminA.announcementContent } </textarea>
	                            </c:when>
	                            <c:otherwise>
	                              <textarea id="anno-content" class="anno-content" style="width:80%; height: 380px; border-radius: 25px; font-size: 15px; padding: 15px; resize: none; background-color: #f1f1f1; border: 2px solid #12192c;" readonly> ${ adminA.announcementContent } </textarea>
	                            </c:otherwise>
	                          </c:choose>
	                        </td>
	                      </tr>
	                      <tr>
	                      	<td>
	                      		<a href="announcementList.ad" class="btn btn-round btn-default" style="position: absolute; bottom: -50px; right: 475px; background-color:#12192c; color:whitesmoke;">목록가기</a>
	                      	</td>
	                        <td>
	                          <c:if test="${ adminA.announcementStatus eq 'Y' }">
	                            <a onclick="adminPostFormSubmit(1)" class="btn btn-round btn-default" style="position: absolute; bottom: -50px; right: 580px; background-color:#12192c; color:whitesmoke;">수정하기</a>
	                          </c:if>  
	                        </td>
	                        <td>
	                          <c:choose>
	                            <c:when test="${ adminA.announcementStatus eq 'Y' }">
	                              <a onclick="adminPostFormSubmit(2)" class="btn btn-round btn-primary" style="background-color:#12192c; color:whitesmoke; position: absolute; bottom: -50px; right: 370px;">삭제하기</a>
	                            </c:when>
	                            <c:otherwise>
	                              <a onclick="adminPostFormSubmit(3)" class="btn btn-round btn-primary" style="background-color:#12192c; color:whitesmoke; position: absolute; bottom: -50px; right: 370px;">복구하기</a>
	                                <!--
	                                <a onclick="adminPostFormSubmit(3)" class="btn btn-round btn-primarys" style="background-color:#ffffff; border: 2px solid rgb(0, 12, 0); color:whitesmoke; position: absolute; bottom: -50px; right: 15px;">
	                                  <img width="40px" height="40px" src="resources/images/admin/revive2.png" alt="">
	                                </a>
	                                -->
	                            </c:otherwise>
	                          </c:choose>
	                        </td>
	                      </tr>
	                    </tbody>
	                  </table>
	                  <script>
	                    function adminPostFormSubmit(num){
	                      if(num == 1){ // 수정하기 클릭 시 
	                        $("#adminAnnoDetailForm").attr("action", "announcementUpdateForm.ad").submit();
	                      }else if(num == 2){ // 삭제하기 클릭 시
	                        if(confirm('삭제하시겠습니까?')){ // 사용자에게 삭제 여부를 묻는 confirm 대화상자 표시
	                                $("#adminAnnoDetailForm").attr("action", "announcementDelete.ad").submit();
	                          alert("정상적으로 삭제되었습니다.")
	                            }
	                      }else if(num == 3){ // 복구
	                        if(confirm('복구하시겠습니까?')){
	                          $("#adminAnnoDetailForm").attr("action", "announcementRevive.ad").submit();
	                          alert("정상적으로 복구되었습니다.")
	                        }
	                      }
	                    }	
	                  </script>
	                </div>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	 </form>
    
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
