$(document).ready(function() {
	/* ------------- 상세보기와 관련된 영역 ------------- */
    // tr을 클릭했을 때의 이벤트 리스너 추가
    $("#qnaList tbody").on("click", "tr", function() {
        // 클릭한 tr의 id(qnaNo) 가져오기
        let qnaNo = $(this).attr("id");
        
        // qnaDetail 영역에 해당 qnaNo에 대한 상세 정보를 보여주는 함수 호출
        showQnaDetail(qnaNo);
    });
    
    // qnaDetail 영역에서 닫기 버튼 클릭 시 이벤트 리스너 추가
    $("#qnaDetail").on("click", "#closeQnaDetailBtn", function() {
        $("#qnaDetail").hide(); // qnaDetail 영역을 숨김
        $("#qnaList").show(); // qnaList 영역을 보여줌
    });
    /* ------------- 상세보기와 관련된 영역 ------------- */
    
    /* ------------- 글쓰기와 관련된 영역 ------------- */
    $("#insertQnaFormBtn").on("click", function() {
        showQnaInsert();
    });
    
    // qnaInsert 영역에서 닫기 버튼 클릭 시 이벤트 리스너 추가
    $("#qnaInsert").on("click", "#closeQnaInsertBtn", function() {
        $("#qnaInsert").hide(); // qnaInsert 영역을 숨김
        $("#qnaList").show(); // qnaList 영역을 보여줌
    });
    /* ------------- 글쓰기와 관련된 영역 ------------- */
});

// 상세 정보를 보여주는 함수 정의
function showQnaDetail(qnaNo) {
    // qnaNo에 해당하는 상세 정보를 가져오는 AJAX 호출
	//let qnaDetailInfo = qnaNo;
		$.ajax({
			url: "detail.qna",
			data: {qno:qnaNo},
			success: function(result){
				console.log(result);
				// 성공한 경우 => qnaDetailView.jsp 내에 해당 ajax 조회 결과 (qna 상세정보) 기입해주기 (qna-detail-area 는 예시)
				if(result.qnaType == 2){
					$(".qna-detail-area tbody td").html(비밀글입니다);
				}else{
					$(".qna-detail-area tbody td").html(result.qnaContent);
					$("#qna-number").val(result.qnaNo);
				}
			}, error: function(){
				console.log('error');
			}
		});
	
    $("#qnaList").hide(); // 리스트 숨기기
    $("#qnaDetail").show(); // 상세보기 열기
}

// 글쓰기를 보여주는 함수 정의
function showQnaInsert() {
    $("#qnaList").hide(); // 리스트 숨기기
    $("#qnaInsert").show(); // 글쓰기 열기
}