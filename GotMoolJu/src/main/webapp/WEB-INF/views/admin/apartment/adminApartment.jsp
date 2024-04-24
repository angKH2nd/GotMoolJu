<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
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
	    #aptListClick1:hover {
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
                  <h4 class="card-title">부동산정보</h4>
                  <p class="category">
		             <h6 style="margin-left: 89%; color: rightgray"> &lt; 총 개수 :  # &gt;</h6>
		          </p>
                </div>
                 <div
		            class="card-body all-icons"
		            style="margin-right: 4%; margin-left: 4%"
		          >
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table" id="admAptList">
                      <thead class="text-primary">
	                      <th>No</th>
	                      <th>Image</th>
	                      <th>Apt Name</th>
	                      <th>Ex</th>
	                      <th>Payment</th>
	                      <th>Price</th>
	                      <th>Ex2</th>
	                      <th>Status</th>
	                      <th class="text-right"></th>
                      </thead>
                      <tbody id="aptListClick1">
	                      <tr>
	                        <td class="pno">1000</td>
	                        <td>
                            	<img style="width: 100px; height: 100px;" src="https://d1774jszgerdmk.cloudfront.net/512/acef62d1-6d73-46f7-bb3a-0ef26c9e3157" alt="">
                          	</td>
	                        <td>목동우성2차</td>
	                        <td>고층, 106.16m², 관리비 26만</td>
	                        <td>매매</td>
	                        <td>12억</td>
	                        <td>입구동 편의시설접근 좋음 로얄동 로얄층 거실확장 주인거주상태좋음</td>
	                        <td>Y</td>
                        	<td class="text-right"><a style="color:red; border-radius: 20px"><i class="fa-solid fa-trash-can"></i></a></td>
	                      </tr>
	                      <tr>
	                        <td class="pno">1001</td>
	                        <td>
                            	<img style="width: 100px; height: 100px;" src="https://d1774jszgerdmk.cloudfront.net/512/438410c9-11f1-48b6-8747-458d9b0a7fc0" alt="">
                          	</td>
	                        <td>목동우성2차</td>
	                        <td>18층, 106.16m², 관리비 26만</td>
	                        <td>매매</td>
	                        <td>10억9000</td>
	                        <td>최선호동 세안고매매, 구수리 목동학군 봉영중 목동고</td>
	                        <td>Y</td>
                        	<td class="text-right"><a style="color:red; border-radius: 20px"><i class="fa-solid fa-trash-can"></i></a></td>
	                      </tr>
                      </tbody>
                    </table>
                  </div>
                
                <%--
                <script>
				$(function(){
					$("#aptListClick1>tr").click(function(){
						// console.log("눌림")
		                  location.href = 'AptDetail.ad?pno=' + $(this).children(".pno").text();
		               })
				})
				</script>
                 --%>
                
            <div id="pagingArea" style="float:right">
                <ul class="pagination">
                	
                	<c:choose>
                		<c:when test="${ adminPi.currentPage eq 1 }">
                   			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
                   		</c:when> 
                   		<c:otherwise>
                   			<li class="page-item"><a class="page-link" href="aptList.ad?cpage=${ adminPi.currentPage -1 }">Previous</a></li>
                   		</c:otherwise>
                   	</c:choose>
                   	
                   	<c:forEach var="p" begin="${ adminPi.startPage }" end="${ adminPi.endPage }">
                   		<li class="page-item"><a class="page-link" href="aptList.ad?cpage=${ p }">${ p }</a></li>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${ adminPi.currentPage eq adminPi.maxPage }">
							<li class="page-item disabled"><a class="page-link" href="">Next</a></li>
        				</c:when>
        				<c:otherwise>
        					<li class="page-item"><a class="page-link" href="aptList.ad?cpage=${ adminPi.currentPage + 1 }">Next</a></li>
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
