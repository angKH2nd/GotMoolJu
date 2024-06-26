<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="icon" sizes="32x32" type="image/png" href="../../../../resources/images/got/got_logo.ico">

<link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png" />
<link rel="icon" type="image/png" href="../assets/img/favicon.png" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>갓물주</title>
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no" name="viewport" />
<!-- <%--     Fonts and icons     --%> -->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
<!-- <%--     필요 없는 듯
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous" /> 
--%> -->
<!-- <%-- CSS Files 필수--%> -->
<link href="resources/assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="resources/assets/css/now-ui-dashboard.css?v=1.5.0" rel="stylesheet" />
<!-- <%-- CSS Just for demo purpose, don't include it in your project --%> -->
<link href="resources/assets/demo/demo.css" rel="stylesheet" /> <!-- 있으면 업그레이드가 가장 아래로 내려가짐-->
</head>
<body>
		<div class="wrapper" style="height:auto">
        <div class="main-panel" id="main-panel">
          <!-- Navbar -->
          <nav
            class="navbar navbar-expand-lg navbar-transparent bg-primary navbar-absolute"
          >
            <div class="container-fluid">
              <div class="navbar-wrapper">
                <div class="navbar-toggle">
                  <button type="button" class="navbar-toggler">
                    <span class="navbar-toggler-bar bar1"></span>
                    <span class="navbar-toggler-bar bar2"></span>
                    <span class="navbar-toggler-bar bar3"></span>
                  </button>
                </div>
                <a class="navbar-brand" href="main.ad">GotMoolJu</a>
              </div>
            <button
              class="navbar-toggler"
              type="button"
              data-toggle="collapse"
              data-target="#navigation"
              aria-controls="navigation-index"
              aria-expanded="false"
              aria-label="Toggle navigation">
              <span class="navbar-toggler-bar navbar-kebab"></span>
              <span class="navbar-toggler-bar navbar-kebab"></span>
              <span class="navbar-toggler-bar navbar-kebab"></span>
            </button>
            <div
              class="collapse navbar-collapse justify-content-end"
              id="navigation">
              <form>
                <!-- <%-- 상단 search --%> -->
                <div class="input-group no-border">
                  <input
                    type="text"
                    value=""
                    class="form-control"
                    placeholder="Search..."
                  />
                  <!-- 상단 search 돋보기 -->
                  <div class="input-group-append">
                    <div class="input-group-text">
                      <i class="now-ui-icons ui-1_zoom-bold"></i>
                    </div>
                  </div>
                </div>
              </form>
              <!-- 상단 search 옆 아이콘들  -->
              <ul class="navbar-nav" >
                <li class="nav-item">
                  <a class="nav-link" href="#pablo">
                    <i class="now-ui-icons media-2_sound-wave"></i>
                    <p>
                      <span class="d-lg-none d-md-block">Stats</span>
                    </p>
                  </a>
                </li>
                <li class="nav-item dropdown">
                  <a
                    class="nav-link dropdown-toggle"
                    id="navbarDropdownMenuLink"
                    data-toggle="dropdown"
                    aria-haspopup="true"
                    aria-expanded="false"
                  >
                    <i class="now-ui-icons location_world"></i>
                    <p>
                      <span class="d-lg-none d-md-block">Some Actions</span>
                    </p>
                  </a>
                  <div
                    class="dropdown-menu dropdown-menu-right"
                    aria-labelledby="navbarDropdownMenuLink"
                  >
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <a class="dropdown-item" href="#">Something else here</a>
                  </div>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#pablo">
                    <i class="now-ui-icons users_single-02"></i>
                    <p>
                      <span class="d-lg-none d-md-block">Account</span>
                    </p>
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </nav>
        <!-- <%-- End Navbar --%> 상단 파란 부분-->
        <div
          class="panel-header panel-header-sm"
        ></div>
        </div>
    </div>
    <!-- <%--   Core JS Files   --%> -->
    <script src="resources/assets/js/core/jquery.min.js"></script>
    <script src="resources/assets/js/core/popper.min.js"></script>
    <script src="resources/assets/js/core/bootstrap.min.js"></script>
    <script src="resources/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
    <!-- <%--  Google Maps Plugin    --%> -->
    <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
    <!-- <%-- Chart JS --%> -->
    <script src="resources/assets/js/plugins/chartjs.min.js"></script>
    <!-- <%--  Notifications Plugin    --%> -->
    <script src="resources/assets/js/plugins/bootstrap-notify.js"></script>
    <!-- <%-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc --%> -->
    <script
      src="resources/assets/js/now-ui-dashboard.min.js?v=1.5.0"
      type="text/javascript"
    ></script>
    <!-- <%-- Now Ui Dashboard DEMO methods, don't include it in your project! --%> -->
    <script src="resources/assets/demo/demo.js"></script>
</body>
</html>