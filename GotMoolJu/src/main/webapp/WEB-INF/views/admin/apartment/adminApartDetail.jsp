<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <link
      rel="icon"
      sizes="32x32"
      type="image/png"
      href="resources/images/got/got_logo.ico"
    />
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

   	<form id="adminAptDetailForm" method="post" action="aptDetail.ad" enctype="multipart/form-data">
	<input type="hidden" name="aptNo" value="#">
    <div class="wrapper" style="height:auto">
      <div class="main-panel" id="main-panel">
        <div class="content">
          <div class="row">
            <div class="col-md-8">
              <div class="card">
                <div class="card-header">
                  <h5 class="title">Apart Profile</h5>
	                </div>
	                <div class="card-body">
	                    <div class="row">
	                      <div class="col-md-5 pr-1">
	                        <div class="form-group">
	                          <label>Name</label>
	                          <input
	                            type="text"
	                            class="form-control"
	                            value="#에스제이팰리스" 
	                            readonly
	                            style="background-color: whitesmoke"
	                          />
	                      </div>
	                     </div> 
	                      <div class="col-md-3 px-1">
	                        <div class="form-group">
	                          <label>아파트 층고 / 평수 / 관리비</label>
	                          <input
	                            type="text"
	                            class="form-control"
	                            value="12층, 32.99m², 관리비 10만"
	                            readonly
	                            style="background-color: whitesmoke"
	                          />
	                        </div>
	                      </div>
	                      <div class="col-md-4 pl-1">
	                        <div class="form-group">
	                          <label for="exampleInputEmail1">Price</label>
	                          <input
	                            type="text"
	                            class="form-control"
	                            value="3000/100 (월세)"
	                            readonly
	                            style="background-color: whitesmoke"
	                          />
	                        </div>
	                      </div>
	                    </div>
	                    <div class="row">
	                      <div class="col-md-6 pr-1">
	                        <div class="form-group">
	                          <label>Address</label>
	                          <input
	                            type="text"
	                            class="form-control"
	                            value="서울특별시 영등포구 도림동 1동 1203호"
	                            readonly
	                            style="background-color: whitesmoke"
	                          />
	                        </div>
	                      </div>
	                      <div class="col-md-6 pl-1">
	                        <div class="form-group">
	                          <label>Email</label>
	                          <input
	                            type="email"
	                            class="form-control"
	                            readonly
	                            style="background-color: whitesmoke"
	                          />
	                        </div>
	                      </div>
	                    </div>
	                    <div class="row">
	                      <div class="col-md-12">
	                        <div class="form-group">
	                          <label>아파트 소개말</label>
	                          <input
	                            type="text"
	                            class="form-control"
	                            placeholder="Home Address"
	                            value="실평수11평 인기있는타입 무융자 6월입주 전입가능"
	                            readonly
	                            style="background-color: whitesmoke"
	                          />
	                        </div>
	                      </div>
	                    </div>
	                    <div class="row">
	                      <div class="col-md-4 pr-1">
	                        <div class="form-group">
	                          <label>Room size / apt_provision_size</label>
	                          <input
	                            type="text"
	                            class="form-control"
	                            value="26.16 / 32.99"
	                            readonly
	                            style="background-color: whitesmoke"
	                          />
	                        </div>
	                      </div>
	                      <div class="col-md-4 px-1">
	                        <div class="form-group">
	                          <label>apt_tags</label>
	                          <input
	                            type="text"
	                            class="form-control"
	                            value="주차,보안/안전"
	                            readonly
	                            style="background-color: whitesmoke"
	                          />
	                        </div>
	                      </div>

	                      <div class="col-md-4 px-1">
	                        <div class="form-group">
	                          <label>apt_beds / apt_bath / apt_entrance_type</label>
	                          <input
	                            type="text"
	                            class="form-control"
	                            value="방: 1 / 화장실: 1 / 계단식"
	                            readonly
	                            style="background-color: whitesmoke"
	                          />
	                        </div>
	                      </div>
	                    </div>
         	            
								                    
	                     <script>
							  window.onload = function() {
							    var userStatus = '${ adminM.userStatus }'; // 현재 고객의 status 값
							    document.querySelector('#statusSelect').value = userStatus;
							  }
						  </script>
	                    <script>
	                      function changeColor() {
	                        var select = document.getElementById("statusSelect");
	                        var selectedColor =
	                          select.options[select.selectedIndex].style.color;
	                        select.style.color = selectedColor;
	                      }
	                      
	                     
	                    </script>
	                   
	                    <div class="row">
	                      <div class="col-md-12">
	                        <div>
	                        <%-- #글자 센터로 보내기 --%>
	                          <label>apt_memo</label>
	                          <textarea
	                            rows="5"
	                            cols="30"
	                            class="form-control"
	                            readonly
	                            align="center"
	                            style="background-color: white; text-align: center""
	                          >"중개로 이윤을 남기기 보단, 사람을 남기길 원하는 박임빈 중개사입니다.
								거짓없이 중개 할 것을 약속합니다
								
								[ 매물특징 ]
								
								▶위치는:  신도림역 도보 10분 , 버스정류장 건물바로앞에있어서 버스이용시 역까지 3분거리
								
								▶입주는:  6월20일 이후 협의
								
								▶주차는: 주차가능(기계식)
								
								▶관리비는: 월10만원(전기.가스.수도별도)
								
								▶용도는: 오피스텔 (전입가능)
								
								▶설 명: 
								19년 준공된 신축 투룸 오피스텔
								 전입가능 귀한투룸월세
								대형마트,생활편리시설 다양하게 분포
								거실사이즈 나오는 귀한투룸
								해당세대 무융자 안전한건물"</textarea>
	                        </div>
	                      </div>
	                    </div>
	                  </form>
	                </div>
	              </div>
	            </div>
	            <div class="col-md-4">
	              <div class="card card-user">
	                </div>
	                <div class="card-body"  >
	                  <div class="author">
	                      <img
	                      	style="background-color: white"
	                        class="avatar border-gray"
	                        src="https://d1774jszgerdmk.cloudfront.net/512/a360602f-6dc3-47aa-a018-4232456fe2ec"
	                        alt="..."
	                      />
	                      <%-- 이미지2 / 여러가지, 넘어갈 수 있으면 좋을 듯?
	                      <img
	                      	style="background-color: white"
	                        class="avatar border-gray"
	                        src="https://d1774jszgerdmk.cloudfront.net/512/a360602f-6dc3-47aa-a018-4232456fe2ec,https://d1774jszgerdmk.cloudfront.net/512/85efacaf-39a6-47ac-b041-afbb345c874f,https://d1774jszgerdmk.cloudfront.net/512/646d8893-dc89-4883-94d0-bf4be9982df7,https://d1774jszgerdmk.cloudfront.net/512/8982b12a-5a18-4efc-b4eb-981fb8b12684,https://d1774jszgerdmk.cloudfront.net/512/c6a02023-d866-4a5e-a066-adc0e838627c"
	                        alt="..."
	                      />
	                      --%>
	                  </div> <br>
	                  <p class="description text-center">No.40020304</p>
	                  <p class="description text-center">2022-11-22</p>
	                </div>
	                <hr>
	                <div class="button-container">
	                </div>
	              </div>
	              </div>
	            </div>
	       </div>
	    </div>
      </div>
    </div>
   </form>
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

    <%-- 푸터바 삽입 --%>

    <jsp:include page="../common/adminFooter.jsp" />
  </body>
</html>
