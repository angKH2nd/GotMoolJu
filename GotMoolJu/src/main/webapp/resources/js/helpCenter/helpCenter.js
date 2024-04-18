
$(document).ready(function() {
    toggleHelpCenter('announcement');
});

//FAQ invoke function
		function loadFaqs(){
			 	$.ajax({
		            url: "list.faq", // mapping in Controller
		            success: function(response) {
		                console.log("date AJAX:", response);
						
		                let faqsHtml= "";
		                
		                response.forEach(function(faq, index) {
		                	 faqsHtml += '<div class="faq-item">';
		                     faqsHtml += '<div class="faq-question" data-index="' + index + '">' + faq.faqTitle + '</div>';
		                     faqsHtml += '<div class="faq-answer" style="display:none;" id="answer-' + index + '">' + faq.faqContent + '</div>';
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


//QNA invoke function
function loadQna(){
    $.ajax({
        url: "list.qna",
        success: function(response){
            console.log("Data AJAX:", response);

            let qnaHtml = ""; 
            for (let i = 0; i < response.length; i++) { 
               
                qnaHtml += "<tr>";
                
                if (response[i].qnaType == 2) {
                    qnaHtml += "<td>비밀글</td>"; // 비밀글
                } else {
                    qnaHtml += "<td>일반글</td>"; // 일반글
                }
                            
                qnaHtml += "<td>" + response[i].qnaWriter + "</td>"
                        + "<td>" + response[i].qnaTitle + "</td>"
                        + "<td>" + response[i].qnaCreateDate + "</td>";
                            
                if (response[i].qnaAnswerStatus === 'N') {
                    qnaHtml += "<td>답변대기중</td>"; // 답변완료전
                } else {		
                    qnaHtml += "<td>답변완료</td>"; // 답변완료
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




	
	
	


