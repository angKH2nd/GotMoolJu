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

    <div class="main-panel" id="main-panel">
      <%-- Navbar --%>
      <%-- End Navbar --%>

      <div class="content">
        <div class="card">
          <%-- 흰색, 전체 페이지 --%>
          <div class="card-header">
            <h5 class="title" style="margin: 1%">회원정보</h5>
            <p class="category">
             <h6 style="margin-left: 90%; color: rightgray"> &lt; 총 회원 :  ${ pi.listCount } &gt;</h6>
            </p>
             
            
          </div>
          <div
            class="card-body all-icons"
            style="margin-right: 4%; margin-left: 4%"
          >
            <%-- 하단, 흰색 보드 --%>
            <div class="row">
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table" id="memberList">
                    <thead class="text-primary">
                      <th>No</th>
                      <th>ID</th>
                      <th>NICKNAME</th>
                      <th>NAME</th>
                      <th>address</th>
                      <th>phone</th>
                      <th class="text-right">status</th>
                    </thead>
                    <tbody>
	                    <c:forEach var="ad" items="${ list }">
	                      <tr>
	                        <td>${ ad.userNo }</td>
	                        <td>${ ad.userId }</td>
	                        <td>${ ad.userNickname }</td>
	                        <td>${ ad.userName }</td>
	                        <td>${ ad.userAddress }</td>
	                        <td>${ ad.userPhone }</td>
	                        <c:choose>
		                        <c:when test="${ ad.userStatus eq 'A' }">
		                        	<td class="text-right" style="color:green"> 관리자 </td>
		                        </c:when>
		                        <c:when test="${ ad.userStatus eq 'B' }">
		                        	<td class="text-right" style="color:darkgray"> 블랙리스트 </td>
		                        </c:when>
		                        <c:when test="${ ad.userStatus eq 'N' }">
		                        	<td class="text-right" style="color:red"> 탈퇴 </td>
		                        </c:when>
		                        <c:otherwise>
		                       		<td class="text-right" style="color:blue"> 사용중 </td>
		                        </c:otherwise>
	                        </c:choose>
	                      </tr>
						</c:forEach>
                    </tbody>
                  </table>
                </div>
                
                <script>
				$(function(){
					$("#memberList>tbody>tr").click(function(){
		                  location.href = 'memberDetail.ad?mno=' + $(this).children(".mno").text();
		               })
				})
			
			
				</script>
                
                
            <div id="pagingArea" style="float:right">
                <ul class="pagination">
                	
                	<c:choose>
                		<c:when test="${ pi.currentPage eq 1 }">
                   			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
                   		</c:when> 
                   		<c:otherwise>
                   			<li class="page-item"><a class="page-link" href="list.bo?cpage=${ pi.currentPage -1 }">Previous</a></li>
                   		</c:otherwise>
                   	</c:choose>
                   	
                   	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                   		<li class="page-item"><a class="page-link" href="list.bo?cpage=${ p }">${ p }</a></li>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
							<li class="page-item disabled"><a class="page-link" href="">Next</a></li>
        				</c:when>
        				<c:otherwise>
        					<li class="page-item"><a class="page-link" href="list.bo?cpage=${ pi.currentPage + 1 }">Next</a></li>
        				</c:otherwise>
        			</c:choose>
                </ul>
            </div>
            
              </div>
              <div style="width: 100%; height: auto"></div>
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
