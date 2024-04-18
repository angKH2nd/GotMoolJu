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
        // qnaDetail 영역을 숨김
        $("#qnaDetail").hide();
        // qnaList 영역을 보여줌
        $("#qnaList").show();
    });
    /* ------------- 상세보기와 관련된 영역 ------------- */
    
    /* ------------- 글쓰기와 관련된 영역 ------------- */
    $("#insertQnaFormBtn").on("click", function() {
        showQnaInsert();
    });
    
    // qnaInsert 영역에서 닫기 버튼 클릭 시 이벤트 리스너 추가
    $("#qnaInsert").on("click", "#closeQnaInsertBtn", function() {
        // qnaInsert 영역을 숨김
        $("#qnaInsert").hide();
        // qnaList 영역을 보여줌
        $("#qnaList").show();
    });
    /* ------------- 글쓰기와 관련된 영역 ------------- */
});

// 상세 정보를 보여주는 함수 정의
function showQnaDetail(qnaNo) {
    // qnaNo에 해당하는 상세 정보를 가져오는 AJAX 호출
	let qnaDetailInfo = qnaNo;
	
	$(".qna-detail-area").html(qnaDetailInfo);

    // AJAX 호출 성공 시 해당 내용을 qnaDetail 영역에 보여주고, qnaList 영역은 숨김
    // 아래는 임시로 닫기 버튼만 추가한 것
    let detailHtml = "<div>상세 정보</div><button id=\"closeQnaDetailBtn\">닫기</button>";
    $("#qna-sample").html(detailHtml);
    $("#qnaList").hide();
    $("#qnaDetail").show();
}

// 글쓰기를 보여주는 함수 정의
function showQnaInsert() {
    // 아래는 임시로 닫기 버튼만 추가한 것
    let insertHtml = "<div>qna문의작성 구간</div><button id=\"closeQnaInsertBtn\">닫기</button>";
    $("#qna-insert-close-btn").html(insertHtml);
    $("#qnaList").hide();
    $("#qnaInsert").show();
}