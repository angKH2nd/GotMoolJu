<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/helpCenter/announcement/announcementListView.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
</head>
<body>
	<div class="announcement-content">
        <div class="announcement-innerOuter pd15">
            <!-- 로그인후 상태일 경우만 보여지는 글쓰기 버튼-->
            <c:if test="${loginUser.userId == 'admin'  }">
         		<a class="announcement-btn btn-secondary btn-sm" style="float: right" href="enrollForm.an">글쓰기</a>
           	</c:if>
            
            <table id="announcementList" class="announcement-table table-hover" align="center">
                <thead>
                    <tr>
	                    <th width=25>#</th>
	                    <th>제목</th>
	                    <th width=95>작성일</th>
                    </tr>
                </thead>
                <tbody>
	               <c:forEach var="a" items="${ announcementList }">
                        <tr class="mh bgh">
	                        <td>${ a.announcementNo }</td>
	                        <td style="text-align: left; padding-left: 10px;">${ a.announcementTitle }</td>
	                        <td>${ a.announcementCreateDate }</td>
	                    </tr>
	                    <tr class="announcementContent1 mh dn">
			                <td colspan="3" style="text-align: left; padding-left: 5px;">
			                    <div><i class="fa-solid fa-circle-exclamation" style="margin-right: 12px;"></i> ${a.announcementContent}</div>
			                </td>
			            </tr>
                    </c:forEach>
                </tbody>
            </table>
            
            <script>
				$(document).ready(function(){
					$("#announcementList>tbody>tr:not(.announcementContent1)").click(function() {
			            $(".announcementContent1").not($(this).next('.announcementContent1')).hide();
						$(this).next('.announcementContent1').toggle();
					});
				});
			</script>
			
			<!-- paging area -->
			<div id="announcement-pagingArea">
                <ul class="announcement-pagination centerX" style="padding-left: 165px;">
                	<c:choose>
					    <c:when test="${announcementPi.currentPage eq 1 }">
					        <li class="page-item disabled dn"><a class="page-link" href="javascript:void(0);"><i class="fa-solid fa-angle-left"></i></a></li>
					    </c:when>
					    <c:otherwise>
					        <li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="loadPage(${announcementPi.currentPage - 1})"><i class="fa-solid fa-angle-left"></i></a></li>
					    </c:otherwise>
					</c:choose>
					<c:forEach var="p" begin="${announcementPi.startPage }" end="${announcementPi.endPage }">
					    <li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="loadPage(${p})">${p}</a></li>
					</c:forEach>
					<c:choose>
					    <c:when test="${announcementPi.currentPage eq announcementPi.maxPage }">
					        <li class="page-item disabled"><a class="page-link" href="javascript:void(0);"><i class="fa-solid fa-angle-right"></i></a></li>
					    </c:when>
					    <c:otherwise>
					        <li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="loadPage(${announcementPi.currentPage + 1})"><i class="fa-solid fa-angle-right"></i></a></li>
					    </c:otherwise>
					</c:choose>
                </ul>
            </div>
           
           <script>
           		/*
			    function loadPage(pageNumber) {
			        console.log("page loading:", pageNumber);
			        $.ajax({
			            url: "list.an", // mapping in Controller
			            data: {
			                cpage: pageNumber
			            },
			            success: function(response) {
			                console.log("date format AJAX:", response);
							let announcement = response.anList;
							let pageInfo = response.anPageInfo;
			                
			                let value = "";
			                for (let i in announcement) {
			                    value += "<tr>"
			                            + "<td>" + announcement[i].announcementTitle + "</td>"
			                            + "<td>" + announcement[i].announcementCreateDate + "</td>"
			                            + "<td>" + announcement[i].announcementCount + "</td>"
			                            + "</tr>";
			                    value += "<tr class='announcementContent' style='display: none;'>"
			                        + "<td colspan='3'>" + announcement[i].announcementContent + "</td>"
			                        + "</tr>";        
			                }
			                $('#announcementList tbody').html(value);
			                updatePagination(pageInfo);
			            },
			            error: function() {
			                alert('통신 실패');
			            }
			        });
			    }
			    
			    function updatePagination(pi) {
			        let paginationHTML = "";
			        if (pi.currentPage > 1) {
			            paginationHTML += '<li class="page-item"><a class="page-link" href="#" onclick="event.preventDefault(); loadPage(' + (pi.currentPage - 1) + ')">Previous</a></li>';
			        }
			        for (let p = pi.startPage; p <= pi.endPage; p++) {
			            paginationHTML += '<li class="page-item ' + (p === pi.currentPage ? 'active' : '') + '"><a class="page-link" href="#" onclick="event.preventDefault(); loadPage(' + p + ')">' + p + '</a></li>';
			        }
			        if (pi.currentPage < pi.maxPage) {
			            paginationHTML += '<li class="page-item"><a class="page-link" href="#" onclick="event.preventDefault(); loadPage(' + (pi.currentPage + 1) + ')">Next</a></li>';
			        }
			        $(".announcement-pagination").html(paginationHTML);
			    }
			
			    // Document ready is still needed for the click event binding
				$(document).ready(function() {
					$(document).on('click', '#announcementList tbody tr:not(.announcementContent)', function() {
					    $(this).next('.announcementContent').toggle();  // Теперь переключает следующий tr с классом .announcementContent
					});
				});
				*/
			
			</script>
			
		</div>
	</div>

	<script src="resources/js/helpCenter/announcement/announcementListView.js"></script>
</body>
</html>