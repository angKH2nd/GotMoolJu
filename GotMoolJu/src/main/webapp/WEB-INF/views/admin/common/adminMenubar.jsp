<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://kit.fontawesome.com/4dc2c036ac.js" crossorigin="anonymous"></script>
<!DOCTYPE html>
<style>
.sidebar-wrapper .nav li.active {
  background-color: white;
  color: #2CA8FF;
}

.sidebar-wrapper .nav li.active i {
  color: #2CA8FF;
}

.sidebar-wrapper .nav li:hover {
  background-color: #f1f1f1;
}
</style>

<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="icon" type="image/png" href="../assets/img/favicon.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>갓물주</title>
    <meta
      content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no"
      name="viewport"
    />
    <!-- <%--     Fonts and icons     --%> -->
    <link
      href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
      rel="stylesheet"
    />
    <!-- <%--     필요 없는 듯
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous" /> 
--%> -->
    <!-- <%-- CSS Files 필수--%> -->
    <link href="resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link
      href="resources/assets/css/now-ui-dashboard.css?v=1.5.0"
      rel="stylesheet"
    />
    <!-- <%-- CSS Just for demo purpose, don't include it in your project --%> -->
    <link href="resources/assets/demo/demo.css" rel="stylesheet" />
    <!-- 있으면 업그레이드가 가장 아래로 내려가짐-->
  </head>
  <body>
      <div class="sidebar" data-color="gotmoolju">
        <!-- <%--
        Tip 1: You can change the color of the sidebar using: data-color="gotmoolju | blue | green | orange | red | yellow"
    	  --%> -->
        <div class="logo">
          <a href="home.got" class="simple-text logo-mini">
            <img style="width:30px; height: 30px;" src="resources/assets/img/got-white-logo.png">
          </a>
          <a href="home.got" class="simple-text logo-normal">
            GootMoolJu
          </a>
        </div>
        <div class="sidebar-wrapper" id="sidebar-wrapper">
          <ul class="nav">
            <!-- active임 원래 -->
            <li class="active1" id="gotmoolju-sidebar-gogo1">
              <a href="main.ad">
                <i class="now-ui-icons text_align-left"></i>
                <p>메인화면</p>
              </a>
            </li>
            <li>
              <a href="memberList.ad">
                <i class="now-ui-icons business_badge"></i>
                <p>회원</p>
              </a>
            </li>
            <li>
              <a href="aptList.ad">
                <i class="now-ui-icons travel_istanbul"></i>
                <p>부동산</p>
              </a>
            </li>
            <li id="gotmoolju-sidebar-gogo4">
              <a href="qnaList.ad">
                <i class="now-ui-icons ui-1_send"></i>
                <p>Q&A</p>
              </a>
            </li>
            <li>
              <a href="impList.ad">
                <i class="now-ui-icons ui-2_like"></i>
                <p>개선의견</p>
              </a>
            </li>
            <li id="gotmoolju-sidebar-gogo6">
              <a href="announcementList.ad">
                <i class="now-ui-icons business_bulb-63"></i>
                <p>공지사항</p>
              </a>
            </li>
            <li class="active-pro">
              <a href="logout.me">
                <i class="now-ui-icons media-1_button-power"></i>
                <p>로그아웃</p>
              </a>
            </li>
          </ul>
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
    
 <script>
$(document).ready(function() {
  // 현재 URL에 따라 해당 메뉴 항목 활성화
  var currentUrl = window.location.href;
  $(".sidebar-wrapper .nav li a").each(function() {
    if ($(this).attr("href") === currentUrl) {
      $(this).parent().addClass("active");
      $(this).parent().css("background-color", "white");
    }
  });

  // 메뉴 항목 클릭 이벤트 처리
  $(".sidebar-wrapper .nav li").click(function() {
    // 모든 메뉴 항목의 active 클래스 제거
    $(".sidebar-wrapper .nav li").removeClass("active");
    
    // 클릭된 메뉴 항목에 active 클래스 추가
    $(this).addClass("active");
    
    // 모든 메뉴 항목의 백그라운드 색상 제거
    $(".sidebar-wrapper .nav li").css("background-color", "");
    
    // 클릭된 메뉴 항목의 백그라운드 색상을 유지
    $(this).css("background-color", "white");
    
    // 현재 URL 업데이트
    window.history.pushState({}, "", $(this).find("a").attr("href"));
  });
});
</script>
  </body>
</html>
