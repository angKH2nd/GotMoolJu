<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png" />
<link rel="icon" type="image/png" href="../assets/img/favicon.png" />
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>갓물주</title>
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no" name="viewport" />
<%--     Fonts and icons     --%>
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
<link href="resources/assets/css/now-ui-dashboard.css?v=1.5.0" rel="stylesheet" />
<%-- CSS Just for demo purpose, don't include it in your project --%>
<link href="resources/assets/demo/demo.css" rel="stylesheet" />
</head>
<body>
	<!-- 메뉴바 삽입-->
	<jsp:include page="common/adminMenubar.jsp" />

    <div class="wrapper">
      <div class="main-panel" id="main-panel">
        <!-- Navbar -->
        <!-- End Navbar -->

        <div class="content">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <!-- 흰색, 전체 페이지-->
                <div class="card-header">
                  <h5 class="title">타이틀</h5>
                  <p class="category">
                    소제목
                    <a href="#">소제목 옆의 링크</a>
                  </p>
                </div>
                <div class="card-body all-icons">
                  <!-- 하단, 흰색 보드 -->
                  <div class="row" style="border: 1px solid red">
                    여기에 내용 쓰기
                    <div style="width: 100%; height: 1200px"></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--   Core JS Files   -->
    <script src="resources/assets/js/core/jquery.min.js"></script>
    <script src="resources/assets/js/core/popper.min.js"></script>
    <script src="resources/assets/js/core/bootstrap.min.js"></script>
    <script src="resources/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
    <!--  Google Maps Plugin    -->
    <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
    <!-- Chart JS -->
    <script src="resources/assets/js/plugins/chartjs.min.js"></script>
    <!--  Notifications Plugin    -->
    <script src="resources/assets/js/plugins/bootstrap-notify.js"></script>
    <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
    <script
      src="resources/assets/js/now-ui-dashboard.min.js?v=1.5.0"
      type="text/javascript"
    ></script>
    <!-- Now Ui Dashboard DEMO methods, don't include it in your project! -->
    <script src="resources/assets/demo/demo.js"></script>

    <!-- 푸터바 삽입-->
    <jsp:include page="common/adminFooter.jsp" />
</body>
</html>