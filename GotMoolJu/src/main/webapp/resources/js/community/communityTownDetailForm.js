function moveUpdateTownLikes(){
	var no = $("#town-detail-form-townNo").val();
	updateTownLikes(no);
	changeTownDetail(0);
	changeTownDetail(no);
}

function moveUpdateTownStar(){
	var no = $("#town-detail-form-townNo").val();
	updateTownStar(no);
	changeTownDetail(0);
	changeTownDetail(no);
}

function insertTownReply() {
	var no = $("#town-detail-form-townNo").val()
	$.ajax({
		url: "insertTownReply.cm",
		data: {
			townNo: no,
			townReplyContent: $(".town-detail-reply-insert-input>input").val(),
		},
		success: function(result){
			if(result > 0){
				swal("커뮤니티 댓글 등록 성공!", "커뮤니티를 풍성하게 채워주셔서 감사합니다", 'success');
				changeTownDetail(0);
				changeTownDetail(no);
			}else {
				swal("커뮤니티 댓글 등록 실패!", "관리자에게 문의해주세요", 'warning');
			}
		}, error: function(){
			swal("커뮤니티 댓글 등록 실패!", "관리자에게 문의해주세요", 'warning');
		}
	});
}