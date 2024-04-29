<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png"/>
<link rel="icon" type="image/png" href="../assets/img/favicon.png" />
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>갓물주</title>
<style>
	#memberlistClick:hover {
		cursor: pointer;
	}
	#announcementlistClick:hover{
		cursor: pointer;
	}
	#admAptlistClick:hover{
		cursor: pointer;
	}
	
</style>
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no" name="viewport"/>
<!-- <%-- Fonts and icons --%> -->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous"/>
<!-- <%-- CSS Files --%> -->
<link href="resources/assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="resources/assets/css/now-ui-dashboard.css?v=1.5.0" rel="stylesheet"/>
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
    
	<%-- 여기부터 --%>
	<div class="main-panel" id="main-panel">
      <%-- End Navbar --%>
		<div class="content">
			<div class="row">
				<div class="col-lg-4">
	            	<%-- 1번 card title --%>
	            	<%-- Q & A 시작 --%>
					<div class="card card-chart">
						<div id="miniQnaDivOpen">
							<div class="card-header">
				    			<a href="#" id="miniImpDivOpenBtn" class="card-category" style="text-decoration: none !important"> <i class="now-ui-icons arrows-1_refresh-69"></i> 개선의견</a>
	                			<h4 class="card-title">Q & A</h4>
	               				<%-- 리스트 버튼 --%>
				                <div class="dropdown">
				                  <a href="qnaList.ad" class="btn btn-round btn-outline-default dropdown-toggle btn-simple btn-icon no-caret">
				                  	<i class="now-ui-icons design_bullet-list-67"></i>
				                  </a>
				                  <%-- 실질적 작동 x --%>
						          <div class="dropdown-menu dropdown-menu-right" id="admQnaListgogo" onclick="">
						          	<a class="dropdown-item" href="#">Q & A 더보기</a>
						          </div>
				                </div>
							</div>
	              			<!-- 1번 card content -->
	              			<div class="card-body" style="margin: 15px 15px 10px 15px">
				                <div class="chart-area">
				                	<table class="table" id="miniQnaArea">
				                    	<thead class="text-primary">
					                    	<th style="width: 5%">No</th>
					                    	<th style="width: 5%">ID</th>
					                   		<th style="width: 30%">Title</th>
					                    	<th style="width: 30%">Date</th>
					                      	<th style="width: 5%" class="text-right">Secret</th>
					                    </thead>
				                    	<tbody id="admQnalistClick">
					                    	<c:forEach var="adQ" items="${ admQnaList }">
					                      		<tr>
							                        <td class="qno">${ adQ.qnaNo }</td>
							                        <td>${ adQ.qnaWriter }</td>
							                        <td>${ adQ.qnaTitle }</td>
							                        <td>${ adQ.qnaCreateDate }</td>
							                        <td class="text-right">
							                        	<c:if test="${ adQ.qnaType eq 1 }">
								                        	<i class="fa-solid fa-lock-open"></i>
								                    	</c:if>
								                    	<c:if test="${ adQ.qnaType eq 2 }">   
								                        	<i class="fa-solid fa-lock"></i>
								                    	</c:if>
						                        	</td>
					                      		</tr>
					                    	</c:forEach>
				                    	</tbody>
				                  	</table>
				                </div>
	              			</div>
						</div>
		   	    		<%-- Q & A 끝 --%>
		   	    
	            		<%-- 개선의견 시작 --%>
	            		<div id="miniImplDivOpen" style="display:none">
	          	  			<div class="card-header">
	                			<a href="#" id="miniQnaDivOpenBtn" class="card-category" style="text-decoration: none !important"> <i class="now-ui-icons arrows-1_refresh-69"></i> Q & A</a> &nbsp; &nbsp;
				    			<h4 class="card-title">개선의견</h4>
	                
	               				<%-- 리스트 버튼 --%>
	                			<div class="dropdown">
	                  				<a href="impList.ad" class="btn btn-round btn-outline-default dropdown-toggle btn-simple btn-icon no-caret">
	                   				<%-- data-toggle="dropdown" --%>
	                    				<i class="now-ui-icons design_bullet-list-67"></i>
	                  				</a>
	                  				<%-- 실질적 작동 x --%>
					                <div class="dropdown-menu dropdown-menu-right" id="admQnaListgogo" onclick="">
					                	<a class="dropdown-item" href="#">Q & A 더보기</a>
					                </div>
	                			</div>
	              			</div>
	              			<!-- 1번 card content -->
	              			<div class="card-body" style="margin: 15px 15px 10px 15px">
	                			<div class="chart-area">
	                				<table class="table" id="miniImpArea">
		                    			<thead class="text-primary">
					                    	<th style="width: 5%">No</th>
					                      	<th style="width: 5%">ID</th>
					                      	<th style="width: 75%">Content</th>
					                      	<th style="width: 5%" class="text-right">Secret</th>
					                    </thead>
		                    			<tbody id="admImplistClick">
			                    			<c:forEach var="adI" items="${ admImprovementList }">
			                      				<tr>
							                        <td class="ino">${ adI.impReplyNo }</td>
							                        <td>${ adI.impReplyWriter }</td>
							                        <td>${ adI.impReplyContent }</td>
							                        <td class="text-right">
								                        <c:if test="${ adI.impReplyType eq 'O' }">
									                        <i class="fa-solid fa-lock-open"></i>
									                    </c:if>
									                    <c:if test="${ adI.impReplyType eq 'S' }">   
									                        <i class="fa-solid fa-lock"></i>
									                    </c:if>
													</td>
						                   		</tr>
		                    				</c:forEach>
		                    			</tbody>
                  					</table>
                				</div>
           					</div>
	            		</div>
		          		<%-- 개선의견 끝 --%>
		              	<!-- 1번 card footer-->
		              	<div class="card-footer">
		                	<div class="stats">
		                  		<%-- <i class="now-ui-icons arrows-1_refresh-69"></i> Just Updated --%>
		                	</div>
		              	</div>
					</div>
				</div>
				<script>
			    	// A 버튼 클릭 이벤트
			      	document.getElementById("miniImpDivOpenBtn").addEventListener("click", function () {
			        document.getElementById("miniImplDivOpen").style.display = "block";
			        document.getElementById("miniQnaDivOpen").style.display = "none";
		      		});
			
			      	// B 버튼 클릭 이벤트
			      	document.getElementById("miniQnaDivOpenBtn").addEventListener("click", function () {
			        document.getElementById("miniQnaDivOpen").style.display = "block";
			        document.getElementById("miniImplDivOpen").style.display = "none";
			      	});
	    		</script>

          		<%-- 2번 card title--%>
          		<div class="col-lg-4 col-md-6">
            		<div class="card card-chart">
            			<%--  <div class="card-header"> --%>
            			<%-- <h5 class="card-category">Email Statistics</h5> --%>
                		<h6 class="card-title" style="color: #12192c; margin: 2%"><i style="color: #12192c;" class="fa-solid fa-house-chimney"></i> 갓물주 임직원</h6>
           				<%-- </div> --%>
              			<%-- 2번 card content--%>
              			<div class="card-body">
		               		<div class="chart-area">
		                		<div align="center">
		                 			<a target="_blank" href="https://github.com/angKH2nd">
		                 				<img width=150 height=150 src="resources/images/got/got_logo_big.jpg">
		                 			</a>
		                 		</div>
                			</div>
							<div style="margin-left:11%">
								<a target="_blank" href="https://github.com/nanokim"><img width=70 height=70 style="border-radius:25px; border: 2px solid #5d6faaaf" src="resources/images/member/got_nano.png"></a>
							  	<a target="_blank" href="https://github.com/Resong123456"><img width=70 height=70 style="border-radius:25px; border: 2px solid #5d6faaaf";" src="resources/images/member/got_eunsong.png"></a>
							  	<a target="_blank" href="https://github.com/minkyuu98"><img width=70 height=70 style="border-radius:25px; border: 2px solid #5d6faaaf;" src="resources/images/member/got_kyuu.jpg"></a>
							  	<a target="_blank" href="https://github.com/berrykiss"><img width=70 height=70 style="border-radius:25px; border: 2px solid #5d6faaaf;" src="resources/images/member/got_berry.jpg"></a>
							  	<a target="_blank" href="https://github.com/leessang96"><img width=70 height=70 style="border-radius:25px; border: 2px solid #5d6faaaf;" src="resources/images/member/got_lee.jpeg"></a>
							</div>                
           				</div>
              			<%-- 2번 card footer--%>
              			<div class="card-footer">
			            	<%-- <div class="stats">
			              		<i class="now-ui-icons ui-2_time-alarm"></i> Last 7 days 
			                	</div> --%>
              			</div>
           			</div>
       			</div>
          
         		<div class="col-lg-4 col-md-6" >
            		<%-- 3번 card title / 아파트 정보--%>
            		<div class="card card-chart">
              			<div class="card-header">
                			<h5 class="card-category">2024</h5>
                			<h4 class="card-title">아파트</h4>
                		<div class="dropdown">
                  			<a href="aptList.ad" class="btn btn-round btn-outline-default dropdown-toggle btn-simple btn-icon no-caret">
                    			<i class="now-ui-icons design_bullet-list-67"></i>
                  			</a>
                  			<%-- 실질작동x --%>
		                  	<div class="dropdown-menu dropdown-menu-right">
		                    	<a class="dropdown-item" href="#">Action</a>
		                    	<a class="dropdown-item" href="#">Another action</a>
		                    	<a class="dropdown-item" href="#">Something else here</a>
		                    	<a class="dropdown-item text-danger" href="#">Remove Data</a>
	                  		</div>
               			</div>
           			</div>
              		<%-- 3번 card content --%>
              		<div class="card-body" style="margin: 15px 15px 10px 15px">
                		<div class="chart-area">
                   			<table class="table" id="miniApartArea">
	                    		<thead class="text-primary">
			                    	<th style="width: 5%">Img</th>
			                      	<th style="width: 50%">Name</th>
			                      	<th style="width: 35%">Add</th>
			                      	<th style="width: 5%" class="text-right">Pay</th>
			                    </thead>
	                    		<tbody id="admAptlistClick">
		                  			<c:forEach var="adApt" items="${ admAptList }"> 
					                	<tr>
					                    	<input type="hidden" class="aptNo" name="aptNo" value="${ adApt.aptNo }">
					                    	<td style="width:30px; height:30px"><img src="${ adApt.aptImgUrl }"></td>
					                        <td>${ adApt.aptName }</td>
					                        <td>${ adApt.aptAddress }</td>
					                        <td class="text-right">${ adApt.aptSellingType }</td>
					                    </tr>
				                  	</c:forEach>
                    			</tbody>
                 			</table>
               			</div>
           			</div>
           			<script>
					    $(function(){
					        $("#miniApartArea tbody tr").click(function(){
					            // find를 사용하여 tr 내부에서 aptNo 클래스를 가진 요소를 찾고 해당 요소의 값을 가져옵니다.
					            var aptNo = $(this).find(".aptNo").val();
					            location.href = 'aptDetail.ad?aptNo=' + aptNo;
					        });
					    });
					</script>
              		<%-- 3번 card footer --%>
              		<div class="card-footer">
	                	<div class="stats">
	             			<%-- <i class="now-ui-icons arrows-1_refresh-69"></i> Just Updated --%>
	                	</div>
	              	</div>
           		</div>
       		</div>
       	</div>
        <%-- 하단 보드 2개 뭉친 div --%>
        <div class="row">
        	<%-- 4번 보드 감싸고 있는 div, 패딩 o --%> 
        	<div class="col-md-6">
            	<%-- 4번 보드--%>
            	<div class="card" style="height: 441px">
              		<%-- 4번 card title --%>
              		<div class="card-header">
                		<h4 class="card-title">회원</h4>
                		<a href="memberList.ad" class="card-category" style="float:right; text-decoration: none !important" >&lt; 더보기 &gt;</a>
					</div>
              		<%-- 4번 card content--%>
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
	                    			<c:forEach var="ad" items="${ admMemberList }">
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
                			<a href="announcementList.ad" class="card-category" style="float:right; text-decoration: none !important" >&lt; 더보기 &gt;</a>
                
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
                    				<tbody id="announcementlistClick">
           		      					<c:forEach var="ad" items="${ admAnnouncementList }">
		                      				<tr>
						                    	<td class="ano">${ ad.announcementNo }</td>
						                        <td>${ ad.announcementWriter }</td>
						                        <td>${ ad.announcementTitle }</td>
						                        <td>${ ad.announcementCreateDate }</td>
				                     		</tr>
	               						</c:forEach>
                   					</tbody>
               					</table>
               				</div>
           				</div>
           			</div>
	            	<script>
						$(function(){
							$("#miniAnnouncementArea>tbody>tr").click(function(){
				            	location.href = 'announcementDetail.ad?ano=' + $(this).children(".ano").text();
				            })
						})
					</script>
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
    <script src="resources/assets/js/now-ui-dashboard.min.js?v=1.5.0" type="text/javascript"
    ></script>
    <%-- Now Ui Dashboard DEMO methods, don't include it in your project! --%>
    <script src="resources/assets/demo/demo.js"></script>

    <%-- 푸터바 삽입--%> <%--
    <jsp:include page="../common/adminFooter.jsp" />
    --%>
  </body>
</html>
