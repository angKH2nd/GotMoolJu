$(document).ready(function() {
    toggleHelpCenter('announcement');
});

//FAQ invoke function
function loadFaqs(){
 	$.ajax({
        url: "list.faq", // mapping in Controller
        success: function(response) {
            // console.log("date AJAX:", response);
			
            let faqsHtml= "";
            
            response.forEach(function(faq, index) {
            	 faqsHtml += '<div class="faq-item">';
                 faqsHtml += '<div class="faq-question pd15" data-index="' + index + '">' + '<i class="fa-solid fa-circle-question"></i> &nbsp; ' + faq.faqTitle + '</div>';
                 faqsHtml += '<div class="faq-answer pd15" style="display:none;" id="answer-' + index + '">' + '<i class="fa-solid fa-comment"></i> &nbsp; ' + faq.faqContent + '</div>';
                 faqsHtml += '</div>';
             });
           		
        	$("#faqList").html(faqsHtml);
        	
        	$(".faq-question").on("click", function(){
                var $currentAnswer = $(this).next(".faq-answer");
                if ($currentAnswer.is(':visible')) {
                   $currentAnswer.slideUp(); 
               }else{
                $(".faq-answer").not($currentAnswer).slideUp();
                $currentAnswer.slideDown(); // 지금 click된 질문에 대한 답변 열기
        	    }
        	});
        },
        error: function() {
            alert('통신 실패');
        }
    });
}

function formatWriterName(name) {
    if (name.length <= 4) {
        return name; // 이름의 길이가 4 이하인 경우 변환할 필요 x
    } else {
        // 첫 4글자와 나머지를 *로 대체한 문자열 생성
        return name.substring(0, 4) + "**";
    }
}

//QNA invoke function
function loadQna(pageNumber) {
    $.ajax({
        url: "list.qna",
        data: { cpage: pageNumber },
        success: function(response) {
            let qna = response.qnaList;
            let pageInfo = response.qnaPageInfo;
           
            updateTable(qna);
            createPagination(pageInfo);
        },
        error: function(xhr, status, error) {
            console.error("AJAX failed:", status, error);
        }
    });
}

function updateTable(qna) {
    let qnaHtml = "";
    for (let i in qna) {
        let formattedWriter = formatWriterName(qna[i].qnaWriter);
	        qnaHtml += `<tr id="${qna[i].qnaNo}" class="bgh mh">`;
	        qnaHtml += `<td style="text-align: left;">${qna[i].qnaType == 2 ? '<i class="fa-solid fa-lock"></i> ' : ''}${qna[i].qnaTitle}</td>`;
	        qnaHtml += `<td>${formattedWriter}</td>`;
	        qnaHtml += `<td>${qna[i].qnaCreateDate}</td>`;
	        qnaHtml += `<td>${qna[i].qnaAnswerStatus === 'N' ? '대기' : '완료'}</td></tr>`;
    }
    $("#qnaList tbody").html(qnaHtml);
}

function createPagination(pageInfo) {
    let paginationHTML = "";
    if (pageInfo.currentPage > 1) {
        paginationHTML += '<li class="qpage-item"><a class="page-link" href="#" onclick="event.preventDefault(); loadQna(' + (pageInfo.currentPage - 1) + ')"><i class="fa-solid fa-angle-left"></i></a></li>';
    }
    for (let p = pageInfo.startPage; p <= pageInfo.endPage; p++) {
        paginationHTML += '<li class="qpage-item ' + (p === pageInfo.currentPage ? 'active' : '') + '"><a class="page-link" href="#" onclick="event.preventDefault(); loadQna(' + p + ')">' + p + '</a></li>';
    }
    if (pageInfo.currentPage < pageInfo.maxPage) {
        paginationHTML += '<li class="qpage-item"><a class="page-link" href="#" onclick="event.preventDefault(); loadQna(' + (pageInfo.currentPage + 1) + ')"><i class="fa-solid fa-angle-right"></i></a></li>';
    }
    $(".qna-pagination").html(paginationHTML);
}

function toggleHelpCenter(divClass) {
    var divs = document.querySelectorAll('.helpCenter-bar-toggle > div');
    divs.forEach(function(div) {
        div.style.display = 'none';
    });

    var selectedDiv = document.querySelector('.' + divClass);
    if (selectedDiv) {
        selectedDiv.style.display = 'block';
    }

    // 버튼 색상 변경
    var buttons = document.querySelectorAll('.helpCenter-bar li');
    buttons.forEach(function(button) {
        button.style.color = '#bebebe';
    });
    var selectedButton = document.querySelector('.' + divClass + '-btn');
    if (selectedButton) {
        selectedButton.style.color = 'black';
    }
}
