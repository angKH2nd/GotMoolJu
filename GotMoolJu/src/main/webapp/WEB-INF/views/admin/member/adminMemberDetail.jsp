<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
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

     	<form id="adminDetailForm" method="post" action="memberDetail.ad" enctype="multipart/form-data">
		<input type="hidden" name="mno" value="${ m.userNo }">
    <div class="wrapper" style="height:auto">
      <div class="main-panel" id="main-panel">
        <div class="content">
          <div class="row">
            <div class="col-md-8">
              <div class="card">
                <div class="card-header">
                  <h5 class="title">Member Profile</h5>
	                </div>
	                <div class="card-body">
	                    <div class="row">
	                      <div class="col-md-5 pr-1">
	                        <div class="form-group">
	                          <label>Nickname</label>
	                          <input
	                            type="text"
	                            class="form-control"
	                            value="${ m.userNickname }"
	                            readonly
	                            style="background-color: whitesmoke"
	                          />
	                        </div>
	                      </div>
	                      <div class="col-md-3 px-1">
	                        <div class="form-group">
	                          <label>Name</label>
	                          <input
	                            type="text"
	                            class="form-control"
	                            value="${ m.userName }"
	                            readonly
	                            style="background-color: whitesmoke"
	                          />
	                        </div>
	                      </div>
	                      <div class="col-md-4 pl-1">
	                        <div class="form-group">
	                          <label for="exampleInputEmail1">ID</label>
	                          <input
	                            type="text"
	                            class="form-control"
	                            value="${ m.userId }"
	                            readonly
	                            style="background-color: whitesmoke"
	                          />
	                        </div>
	                      </div>
	                    </div>
	                    <div class="row">
	                      <div class="col-md-6 pr-1">
	                        <div class="form-group">
	                          <label>Phone</label>
	                          <input
	                            type="text"
	                            class="form-control"
	                            value="${ m.userPhone }"
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
	                            value="${ m.userEmail }"
	                            readonly
	                            style="background-color: whitesmoke"
	                          />
	                        </div>
	                      </div>
	                    </div>
	                    <div class="row">
	                      <div class="col-md-12">
	                        <div class="form-group">
	                          <label>Address</label>
	                          <input
	                            type="text"
	                            class="form-control"
	                            placeholder="Home Address"
	                            value="${ m.userAddress }"
	                            readonly
	                            style="background-color: whitesmoke"
	                          />
	                        </div>
	                      </div>
	                    </div>
	                    <div class="row">
	                      <div class="col-md-12">
	                        <div class="form-group">
	                          <label>❤Address</label>
	                          <input
	                            type="text"
	                            class="form-control"
	                            value="없음"
	                            readonly
	                            style="background-color: whitesmoke"
	                          />
	                        </div>
	                      </div>
	                    </div>
	                    <div class="row">
	                      <div class="col-md-4 pr-1">
	                        <div class="form-group">
	                          <label>Gender</label>
	                          <input
	                            type="text"
	                            class="form-control"
	                            value="${ m.userGender }"
	                            readonly
	                            style="background-color: whitesmoke"
	                          />
	                        </div>
	                      </div>
	                      <div class="col-md-4 px-1">
	                        <div class="form-group">
	                          <label>신고횟수</label>
	                          <input
	                            type="text"
	                            class="form-control"
	                            value="0"
	                            readonly
	                            style="background-color: whitesmoke"
	                          />
	                        </div>
	                      </div>

	                      <div class="col-md-4 pl-1">
	                        <div class="form-group">
	                          <label>Status</label>
	                          <select
	                            name="userStatus"
	                            class="form-control"
	                            id="statusSelect"
	                            onchange="changeColor()"
	                          >
	                            <option name="userStatus" value="Y" id="사용중" style="color: darkblue">
	                              사용중
	                            </option>
	                            <option name="userStatus" value="B" id="블랙리스트" style="color: darkgray">
	                              블랙리스트
	                            </option>
	                            <option name="userStatus" value="N" id="탈퇴" style="color: darkred">
	                              탈퇴
	                            </option>
	                            <option name="userStatus" value="A" id="관리자" style="color: darkgreen">
	                              관리자
	                            </option>
	                          </select>
	                          
	                        </div>
	                      </div>
	                    </div>
         	            
								                    
	                     <script>
							  window.onload = function() {
							    var userStatus = '${ m.userStatus }'; // 현재 고객의 status 값
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
	                      <div class="col-md-12" style="display: flex">
	                        <div style="width: 48%; height: 48%">
	                          <label>회원 가입일</label>
	                          <textarea
	                            rows="1"
	                            cols="30"
	                            class="form-control"
	                            readonly
	                            style="background-color: white"
	                          >${ m.userEnrollDate }</textarea>
	                        </div>
	                        <div style="width: 48%; height: 48%">
	                          <label>회원정보 수정일</label>
	                          <textarea
	                            rows="1"
	                            cols="30"
	                            class="form-control"
	                            readonly
	                            style="background-color: white"
	                          >${ m.userModifyDate }</textarea>
	                        </div>
	                      </div>
	                    </div>
	                  </form>
	                </div>
	              </div>
	            </div>
	            <div class="col-md-4">
	              <div class="card card-user">
	              	<c:choose>
	              	 <c:when test="${ m.userStatus eq 'A' }">
	                	<div class="image" style="background-color: darkgreen">
		             </c:when>
		             <c:when test="${ m.userStatus eq 'B' }">
	                	<div class="image" style="background-color: darkgray">
		             </c:when>
		             <c:when test="${ m.userStatus eq 'N' }">
	                	<div class="image" style="background-color: darkred">
		             </c:when>
		             <c:otherwise>
		             	<div class="image" style="background-color: darkblue">
		             </c:otherwise>
	                </c:choose>
	                </div>
	                <div class="card-body"  >
	                  <div class="author">
	                      <img
	                      	style="background-color: white"
	                        class="avatar border-gray"
	                        src="${ m.userUpdateName }"
	                        alt="..."
	                      />
	                      <h5 class="title">${ m.userNickname }</h5>
	                    <p class="description">${ m.userId }</p>
	                  </div>
	                  <p class="description text-center">${ m.userEmail }</p>
	                  <p class="description text-center">${ m.userEnrollDate }</p>
	                </div>
	                <hr />
	                <div class="button-container">
	                  <button
	                    href="#"
	                    class="btn btn-neutral btn-icon btn-round btn-lg"
	                  >
	                    <i class="fab fa-facebook-f"></i>
	                  </button>
	                  <button
	                    href="#"
	                    class="btn btn-neutral btn-icon btn-round btn-lg"
	                  >
	                    <i class="fab fa-twitter"></i>
	                  </button>
	                  <button
	                    href="#"
	                    class="btn btn-neutral btn-icon btn-round btn-lg"
	                  >
	                    <i class="fab fa-google-plus-g"></i>
	                  </button>
	                </div>
	              </div>
	             <!--  <div
	                id="detailFormUpdateClick"
	                style="background-color: #12192c; height: 30px; cursor: pointer; text-align: center"
	              >  -->
	<!--   <a href="#" id="detailFormUp" style="color: whitesmoke; text-align: center; text-decoration: none !important" onclick="updateLink()">저장</a>  -->
	                 
	                 <!-- 
	                  <script>
							function updateLink() {
							  var selectedStatus = document.getElementById('statusSelect').value;
							  var link = document.getElementById('detailFormUp');
							  link.href = "memberDetailUpdate.ad?mno=${ mno }&mStatus=${ m.userStatus }";
							}
						</script>
					 -->
	                <button
	                  id="detailFormUp"
	                  style="background-color: #12192c; color: whitesmoke;
	                  text-align: center;
	                  width:350px;
	                  text-decoration: none !important"
	                  onclick="updateLink();" 
	                  type="button"
	                  >저장</button>
	                   <input type="hidden" id="admUpdateUserNo" value=${ m.userNo }>
	                    
	              </div>
	              
	              
	              
	              
	              <script>
	              	function updateLink() {
	              		mno = $("#admUpdateUserNo").val();
	              		mStatus = $("#statusSelect").val();
	              		location.href = "memberDetailUpdate.ad?mno=" + mno + "&mStatus=" + mStatus;
	              	}
	              
	              	/*
	                document.addEventListener("DOMContentLoaded", function () {
	                  var clickableDiv = document.getElementById(
	                    "detailFormUpdateClick"
	                  );
	                  clickableDiv.addEventListener("click", function () {
	                    var link = this.querySelector("#detailFormUp");
	                    if (link) {
	                      location.href = link.href;
	                      
	                    }
	                  });
	                });
	              	*/
	              </script>
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
