<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/helpCenter/faq/faqListView.css">
<style>
.faq-question {
    cursor: pointer;
    font-weight: bold;
    margin-top: 10px;
}

.faq-answer {
    margin-left: 20px;
    margin-top: 5px;
    color: #333;
}
</style>


</head>
<body>
<div class="faq-form">
    <div id="faqList"></div>
    <div id="faqContent"></div>
</div>

<script>
$(document).ready(function() {
	
	/*
    function loadFaqs() {
        $.ajax({
            url: "list.faq",
            dataType: "json", 
            success: function(response) {
                console.log("received data", response);
                let faqsHtml = "";
                response.forEach(function(faq, index) {
                    faqsHtml += '<div class="faq-item">';
                    faqsHtml += '<div class="faq-question" data-index="' + index + '">' + faq.faqTitle + '</div>';
                    faqsHtml += '<div class="faq-answer" style="display:none;" id="answer-' + index + '">' + faq.faqContent + '</div>';
                    faqsHtml += '</div>';
                });

                $("#faqList").html(faqsHtml);

                $(".faq-question").click(function() {
                	alert("dd");
                    var $currentAnswer = $(this).next(".faq-answer");
                    	$(".faq-answer").slideUp();
                        //$(".faq-answer").not($currentAnswer).slideUp(); // 열린 답변 닫기
                        $currentAnswer.slideDown(); // 지금 click된 질문에 대한 답변 열기
                   
                });
            },
            error: function() {
                console.error('ajax communication failed');
            }
        });
    }
	
    loadFaqs();
	*/
});
</script>



<br><br>
여기 faqListView.jsp임
<script src="resources/js/helpCenter/faq/faqListView.js"></script>
</body>
</html>
