<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <link
      rel="apple-touch-icon"
      sizes="76x76"
      href="../assets/img/apple-icon.png"
    />
    <link rel="icon" type="image/png" href="../assets/img/favicon.png" />
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>갓물주</title>
    <style>
	    #memberlistClick:hover {
		  cursor: pointer;
	}
    
    </style>
    <meta
      content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no"
      name="viewport"
    />
    <!-- <%-- Fonts and icons --%> -->
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
    <!-- <%-- CSS Files --%> -->
    <link href="resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link
      href="resources/assets/css/now-ui-dashboard.css?v=1.5.0"
      rel="stylesheet"
    />
    <!-- <%-- CSS Just for demo purpose, don't include it in your project --%> -->
    <link href="resources/assets/demo/demo.css" rel="stylesheet" />
  </head>
  <body>
    <!-- 메뉴바 삽입-->
    <%--
    <div style="float: left">
      <jsp:include page="../common/adminMenubar.jsp" />
    </div>
    <jsp:include page="../common/adminThinHeader.jsp" />
    --%>
	<!-- 여기부터 -->
	
    <div class="main-panel" id="main-panel">
      <!-- End Navbar -->
      <div class="content">
        <div class="row">
          <div class="col-lg-4">
            <!-- 1번 card title-->
            <div class="card card-chart">
              <div class="card-header">
                <h5 class="card-category">Global Sales</h5>
                <h4 class="card-title">Shipped Products</h4>
                <div class="dropdown">
                  <button
                    type="button"
                    class="btn btn-round btn-outline-default dropdown-toggle btn-simple btn-icon no-caret"
                    data-toggle="dropdown"
                  >
                    <i class="now-ui-icons loader_gear"></i>
                  </button>
                  <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <a class="dropdown-item" href="#">Something else here</a>
                    <a class="dropdown-item text-danger" href="#"
                      >Remove Data</a
                    >
                  </div>
                </div>
              </div>
              <!-- 1번 card content -->
              <div class="card-body">
                <div class="chart-area">
                  <canvas id="lineChartExample"></canvas>
                </div>
              </div>
              <!-- 1번 card footer-->
              <div class="card-footer">
                <div class="stats">
                  <i class="now-ui-icons arrows-1_refresh-69"></i> Just Updated
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <!-- 2번 card title-->
            <div class="card card-chart">
              <div class="card-header">
                <h5 class="card-category">2018 Sales</h5>
                <h4 class="card-title">All products</h4>
                <div class="dropdown">
                  <button
                    type="button"
                    class="btn btn-round btn-outline-default dropdown-toggle btn-simple btn-icon no-caret"
                    data-toggle="dropdown"
                  >
                    <i class="now-ui-icons loader_gear"></i>
                  </button>
                  <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <a class="dropdown-item" href="#">Something else here</a>
                    <a class="dropdown-item text-danger" href="#"
                      >Remove Data</a
                    >
                  </div>
                </div>
              </div>
              <!-- 2번 card content -->
              <div class="card-body">
                <div class="chart-area">
                  <canvas id="lineChartExampleWithNumbersAndGrid"></canvas>
                </div>
              </div>
              <!-- 2번 card footer-->
              <div class="card-footer">
                <div class="stats">
                  <i class="now-ui-icons arrows-1_refresh-69"></i> Just Updated
                </div>
              </div>
            </div>
          </div>

          <!-- 3번 card title-->
          <div class="col-lg-4 col-md-6">
            <div class="card card-chart">
              <div class="card-header">
                <h5 class="card-category">Email Statistics</h5>
                <h4 class="card-title">24 Hours Performance</h4>
              </div>
              <!-- 3번 card content-->
              <div class="card-body">
                <div class="chart-area">
                  <canvas id="barChartSimpleGradientsNumbers"></canvas>
                </div>
              </div>
              <!-- 3번 card footer-->
              <div class="card-footer">
                <div class="stats">
                  <i class="now-ui-icons ui-2_time-alarm"></i> Last 7 days
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 하단 보드 2개 뭉친 div-->
        <div class="row">
          <!-- 4번 보드 감싸고 있는 div, 패딩 o-->
          <div class="col-md-6">
            <!-- 4번 보드-->
            <div class="card" style="height: 441px">
              <!-- 4번 card title -->
              <div class="card-header">
                <h4 class="card-title">회원조회</h4>
                <a href="memberList.ad" class="card-category" style="float:right; text-decoration: none !important" >
                 &lt; 더보기 &gt;
                </a>
              </div>
              <!-- 4번 card content-->
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table" id="miniMemberArea">
                    <thead class="text-primary">
                      <th>No</th>
                      <th>ID</th>
                      <th>NICKNAME</th>
                      <th>phone</th>
                    </thead>
                    <tbody id="memberlistClick">
	                    <c:forEach var="ad" items="${ list }">
		                      <tr>
		                        <td class="mno">${ ad.userNo }</td>
		                        <td>${ ad.userId }</td>
		                        <td>${ ad.userNickname }</td>
		                        <td>${ ad.userPhone }</td>
		                      </tr>
						</c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
          
         <script>
			$(function(){
				$("#miniMemberArea>tbody>tr").click(function(){
	                  location.href = 'memberDetail.ad?mno=' + $(this).children(".mno").text();
	               })
			})
		</script>
			
          <!-- 5번 보드 감싸고 있는 div, 패딩 o-->
          <div class="col-md-6">
            <!-- 5번 보드-->
            <div class="card" style="height: 441px">
              <!-- 5번 card title -->
              <div class="card-header">
                <h4 class="card-title">공지사항</h4>
                <a href="#" class="card-category" style="float:right; text-decoration: none !important" >
                 &lt; 더보기 / function 달 예정, 가장 최신글이 가장 위에 보일 예정 &gt;
                </a>
              </div>
              <!-- 5번 card content-->
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table" id="miniAnnouncementArea">
                    <thead class="text-primary">
                      <th>No</th>
                      <th>작성자</th>
                      <th>제목</th>
                      <th>작성일</th>
                    </thead>
                    <tbody id="AnnouncementlistClick">
		                      <tr>
		                        <td class="ano">1</td>
		                        <td>관리자</td>
		                        <td>오픈! 갓물주!</td>
		                        <td>2024/03/26</td>
		                      </tr>
		                      <tr>
		                        <td class="ano">2</td>
		                        <td>관리자</td>
		                        <td>공지제목2!</td>
		                        <td>2024/03/27</td>
		                      </tr>
		                      <tr>
		                        <td class="ano">3</td>
		                        <td>관리자</td>
		                        <td>공지제목3!</td>
		                        <td>2024/03/28</td>
		                      </tr>
		                      <tr>
		                        <td class="ano">4</td>
		                        <td>관리자</td>
		                        <td>공지제목4!</td>
		                        <td>2024/03/29</td>
		                      </tr>
		                      <tr>
		                        <td class="ano">5</td>
		                        <td>관리자</td>
		                        <td>공지제목5!</td>
		                        <td>2024/03/30</td>
		                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
         </div>
       </div>
   </div>

    <%-- Core JS Files --%>
    <script src="resources/assets/js/core/jquery.min.js"></script>
    <script src="resources/assets/js/core/popper.min.js"></script>
    <script src="resources/assets/js/core/bootstrap.min.js"></script>
    <script src="resources/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
    <%-- Google Maps Plugin --%>
    <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
    <%-- Chart JS --%>
    <script src="resources/assets/js/plugins/chartjs.min.js"></script>
    <%-- Notifications Plugin --%>
    <script src="resources/assets/js/plugins/bootstrap-notify.js"></script>
    <%-- Control Center for Now Ui Dashboard: parallax effects, scripts for the
    example pages etc --%>
    <script
      src="resources/assets/js/now-ui-dashboard.min.js?v=1.5.0"
      type="text/javascript"
    ></script>
    <%-- Now Ui Dashboard DEMO methods, don't include it in your project! --%>
    <script src="resources/assets/demo/demo.js"></script>

    <%-- 푸터바 삽입--%> <%--
    <jsp:include page="../common/adminFooter.jsp" />
    --%>
  </body>
</html>
