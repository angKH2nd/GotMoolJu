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
function loadQna(){
    $.ajax({
        url: "list.qna",
        success: function(response){
            // console.log("Data AJAX:", response);

            let qnaHtml = ""; 
            for (let i = 0; i < response.length; i++) { 
                qnaHtml += `<tr id="${response[i].qnaNo}" class="bgh mh">`;
                
                // qnaWriter를 포맷하여 가져오기
                let formattedWriter = formatWriterName(response[i].qnaWriter);
                
                if (response[i].qnaType == 2) {
                	// 비밀글
                	qnaHtml += "<td style=\"text-align: left; padding-left: 5px;\">" + "<i class=\"fa-solid fa-lock\"></i> " + response[i].qnaTitle + "</td>"
                        	+ "<td>" + formattedWriter + "</td>"
                        	+ "<td>" + response[i].qnaCreateDate + "</td>";
                } else {
                	// 일반글
                	qnaHtml += "<td style=\"text-align: left; padding-left: 5px;\">" + response[i].qnaTitle + "</td>"
                        	+ "<td>" + formattedWriter + "</td>"
                        	+ "<td>" + response[i].qnaCreateDate + "</td>";
                }
                            
                if (response[i].qnaAnswerStatus === 'N') {
                    qnaHtml += "<th>대기</th>"; // 답변완료전
                } else {		
                    qnaHtml += "<th>완료</th>"; // 답변완료
                }
                
                qnaHtml += "</tr>";
            }

            $("#qnaList tbody").html(qnaHtml); // tbody에다 데이터 삽입
        },
        error: function(xhr, status, error) {
            console.error("AJAX failed:", status, error);
        }
    });
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
