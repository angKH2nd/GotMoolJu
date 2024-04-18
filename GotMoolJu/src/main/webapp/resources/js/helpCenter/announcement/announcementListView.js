//announcement Page loading function
function loadPage(pageNumber) {
        // console.log("page loading:", pageNumber);
        $.ajax({
            url: "list.an", // mapping in Controller
            data: {
                cpage: pageNumber
            },
            success: function(response) {
                // console.log("date format AJAX:", response);
				let announcement = response.anList;
				let pageInfo = response.anPageInfo;
                
                let value = "";
                for (let i in announcement) {
                    value += "<tr class=\"mh bgh\">"
                            + "<td>" + announcement[i].announcementNo + "</td>"
                            + "<td style=\"text-align: left; padding-left: 10px;\">" + announcement[i].announcementTitle + "</td>"
                            + "<td>" + announcement[i].announcementCreateDate + "</td>"
                            + "</tr>";
                    value += "<tr class='announcementContent' style='display: none;'>"
                        + "<td colspan='3' style=\"text-align: left; padding-left: 5px;\">" + "<i class=\"fa-solid fa-circle-exclamation\" style=\"margin-right: 14px;\"></i>" + announcement[i].announcementContent + "</td>"
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
            paginationHTML += '<li class="page-item"><a class="page-link" href="#" onclick="event.preventDefault(); loadPage(' + (pi.currentPage - 1) + ')"><i class="fa-solid fa-angle-left"></i></a></li>';
        }
        for (let p = pi.startPage; p <= pi.endPage; p++) {
            paginationHTML += '<li class="page-item ' + (p === pi.currentPage ? 'active' : '') + '"><a class="page-link" href="#" onclick="event.preventDefault(); loadPage(' + p + ')">' + p + '</a></li>';
        }
        if (pi.currentPage < pi.maxPage) {
            paginationHTML += '<li class="page-item"><a class="page-link" href="#" onclick="event.preventDefault(); loadPage(' + (pi.currentPage + 1) + ')"><i class="fa-solid fa-angle-right"></i></a></li>';
        }
        $(".announcement-pagination").html(paginationHTML);
    }

    // Document ready is still needed for the click event binding
$(document).ready(function() {
    $(document).on('click', '#announcementList tbody tr:not(.announcementContent)', function() {
        $('.announcementContent').not($(this).next('.announcementContent')).hide();
        $(this).next('.announcementContent').toggle(); 
    });
});

