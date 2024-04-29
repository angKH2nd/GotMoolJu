<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no" name="viewport"/>
<%-- Fonts and icons --%>
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous"/>
<%-- CSS Files --%>
<link href="resources/assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="resources/assets/css/now-ui-dashboard.css?v=1.5.0" rel="stylesheet"/>
<%-- CSS Just for demo purpose, don't include it in your project --%>
<link href="resources/assets/demo/demo.css" rel="stylesheet" />
</head>
<body>
    <%-- 메뉴바 삽입 --%>
    <div style="float: left">
    	<jsp:include page="../common/adminMenubar.jsp" />
    </div>
    <jsp:include page="../common/adminThinHeader.jsp" />
	<%-- 여기서부터 --%>
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
		             				<h6 style="margin-left: 89%; color: rightgray"> &lt; <i class="fa-solid fa-building" style="color:darkblue"></i> :  ${ adminAptPi.listCount } &gt;</h6>
		          				</p>
                			</div>
		                    <div class="card-body all-icons" style="margin-right: 4%; margin-left: 4%">
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
							                    <th class="text-right"></th>
	                      					</thead>
	                      					<tbody id="aptListClick1">
		                      					<c:forEach var="aapt" items="${ admAptList }">
			                      					<tr>
			                        					<td class="pno">${ aapt.aptNo }</td>
								                        <td>
							                            	<img style="width: 100px; height: 100px;" style="border-radius: 5px;" src="${ aapt.aptImgUrl }" alt="">
							                          	</td>
								                        <td>${ aapt.aptName }</td>
								                        <td>${ aapt.aptDesc }</td>
								                        <td>${ aapt.aptSellingType }</td>
								                        <td>${ aapt.aptPrice }</td>
								                        <td>${ aapt.aptIntroduce }</td>
							                        	<td class="text-right"><a style="color:red; border-radius: 20px" onclick="confirmAptDelete(${aapt.aptNo})"><i class="fa-solid fa-trash-can"></i></a></td>
			                      					</tr>
		                      					</c:forEach>
	                      					</tbody>
	                   					</table>
	                  				</div>
	                  				
				                    <script>
				                        function confirmAptDelete(no){
					                        var confirmDelete = confirm("삭제하시겠습니까?");
					                        if (confirmDelete) {
					                        	// 확인을 눌렀을 때 컨트롤러에 삭제 요청을 보낼 수 있도록 구현
					                        	location.href = "deleteApt.ad?aptNo=" + no;
				                        	}
				                        }
				                    </script>
	                
				                    <script>
				                    	$(function(){
				                        	$("#aptListClick1>tr").click(function(){
				                        		location.href = 'aptDetail.ad?pno=' + $(this).children(".aptNo").text();
			                        		})
		                        		})
				                    </script>
	                  
	                  				<div id="pagingArea" style="float:right">
	                  					<ul class="pagination">
	                  						<c:choose>
	                  							<c:when test="${ adminAptPi.currentPage eq 1 }">
	                  								<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
	                 							</c:when> 
	                            				<c:otherwise>
	                              					<li class="page-item"><a class="page-link" href="aptList.ad?cpage=${ adminAptPi.currentPage -1 }">Previous</a></li>
	                            				</c:otherwise>
	                          				</c:choose>
	                          				<c:forEach var="p" begin="${ adminAptPi.startPage }" end="${ adminAptPi.endPage }">
	                          					<li class="page-item"><a class="page-link" href="aptList.ad?cpage=${ p }">${ p }</a></li>
			                          		</c:forEach>
			                          
			                          		<c:choose>
			                            		<c:when test="${ adminAptPi.currentPage eq adminAptPi.maxPage }">
			                              			<li class="page-item disabled"><a class="page-link" href="">Next</a></li>
			                            		</c:when>
			                            		<c:otherwise>
			                              			<li class="page-item"><a class="page-link" href="aptList.ad?cpage=${ adminAptPi.currentPage + 1 }">Next</a></li>
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
