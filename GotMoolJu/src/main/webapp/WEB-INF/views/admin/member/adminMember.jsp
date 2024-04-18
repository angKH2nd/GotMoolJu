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
<!-- 여기서부터 -->
     <div class="wrapper">
      <div class="main-panel" id="main-panel">
        <!-- End Navbar -->
        <div class="content">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header">
                  <h4 class="card-title">회원정보</h4>
                  <p class="category">
		             <h6 style="margin-left: 89%; color: rightgray"> &lt; 총 회원 :  ${ adminPi.listCount } &gt;</h6>
		           </p>
                </div>
                 <div
		            class="card-body all-icons"
		            style="margin-right: 4%; margin-left: 4%"
		          >
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table" id="memberList">
                      <thead class="text-primary">
	                      <th>No</th>
	                      <th>ID</th>
	                      <th>Nickname</th>
	                      <th>Name</th>
	                      <th>Address</th>
	                      <th>Phone</th>
	                      <th class="text-right">Status</th>
                      </thead>
                      <tbody id="memberlistClick1">
                        <c:forEach var="ad" items="${ admMemberList }">
	                      <tr>
	                        <td class="mno">${ ad.userNo }</td>
	                        <td>${ ad.userId }</td>
	                        <td>${ ad.userNickname }</td>
	                        <td>${ ad.userName }</td>
	                        <td>${ ad.userAddress }</td>
	                        <td>${ ad.userPhone }</td>
	                        <c:choose>
		                        <c:when test="${ ad.userStatus eq 'A' }">
		                        	<td class="text-right" style="color:darkgreen"> 관리자 </td>
		                        </c:when>
		                        <c:when test="${ ad.userStatus eq 'B' }">
		                        	<td class="text-right" style="color:darkgray"> 블랙리스트 </td>
		                        </c:when>
		                        <c:when test="${ ad.userStatus eq 'N' }">
		                        	<td class="text-right" style="color:darkred"> 탈퇴 </td>
		                        </c:when>
		                        <c:otherwise>
		                       		<td class="text-right" style="color:darkblue"> 사용중 </td>
		                        </c:otherwise>
	                        </c:choose>
	                      </tr>
						</c:forEach>
                      </tbody>
                    </table>
                  </div>
                
                <script>
				$(function(){
					$("#memberlistClick1>tr").click(function(){
						// console.log("눌림")
		                  location.href = 'memberDetail.ad?mno=' + $(this).children(".mno").text();
		               })
				})
				</script>
                
                
            <div id="pagingArea" style="float:right">
                <ul class="pagination">
                	
                	<c:choose>
                		<c:when test="${ adminPi.currentPage eq 1 }">
                   			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
                   		</c:when> 
                   		<c:otherwise>
                   			<li class="page-item"><a class="page-link" href="memberList.ad?cpage=${ adminPi.currentPage -1 }">Previous</a></li>
                   		</c:otherwise>
                   	</c:choose>
                   	
                   	<c:forEach var="p" begin="${ adminPi.startPage }" end="${ adminPi.endPage }">
                   		<li class="page-item"><a class="page-link" href="memberList.ad?cpage=${ p }">${ p }</a></li>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${ adminPi.currentPage eq adminPi.maxPage }">
							<li class="page-item disabled"><a class="page-link" href="">Next</a></li>
        				</c:when>
        				<c:otherwise>
        					<li class="page-item"><a class="page-link" href="memberList.ad?cpage=${ adminPi.currentPage + 1 }">Next</a></li>
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
