function moveUpdateTownLikes(){
	var no = $("#town-detail-form-townNo").val();
	updateTownLikes(no);
	changeTownDetail(0);
	changeTownDetail(no);
	decreaseTownClick(no);
}

function moveUpdateTownStar(){
	var no = $("#town-detail-form-townNo").val();
	updateTownStar(no);
	changeTownDetail(0);
	changeTownDetail(no);
	decreaseTownClick(no);
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

function changeTownDelete(no) {
	swal({
		text : "삭제 하시겠습니까?",
		buttons: ["취소" , "삭제"],
		closeOnClickOutside : false // 백그라운드 클릭해도 안 꺼지도록
	})
	.then(function(result){
        if(result){
        	$.ajax({
        		url: "deleteTown.cm",
        		data: {townNo:no},
        		success: function (result) {
        			if(result > 0) {
        				swal('동네소식 삭제 성공!', '성공적으로 동네소식이 삭제되었습니다.', 'success')
        				.then(function() {
				            changeTownDetail(0);
				        })
        			}else {
        				swal('동네소식 삭제 실패!', '관리자에게 문의해주세요', 'warning');
        			}
        		}, error: function () {
        			swal('동네소식 삭제 실패!', '관리자에게 문의해주세요', 'warning');
        		}
        	})
        }
	})
}

function changeTownUpdate(no){
	var list = document.querySelector('.town-main-list');
    var detail = document.querySelector('.town-main-detail');
	var insert = document.querySelector('.town-main-insert');
	var update = document.querySelector('.town-main-update');
	
    list.style.display = 'none';
    detail.style.display = 'none';
    insert.style.display = 'none';
    update.style.display = 'block';
    if(no !== 0){
    	selectTownUpdate(no);
    }
}

function selectTownUpdate(no){
	$.ajax({
		url: "selectTownDetail.cm",
		data: {townNo:no},
		success: function(data){
			var townDetail = JSON.parse(data.townDetail);
			$(".community-update-button").css('display', 'none');
			$(".community-delete-button").css('display', 'none');
			
			$(".town-update-title-input").val(townDetail.townTitle);
			$(".town-update-content-text").val(townDetail.townContent);
			
			$("#townUpdateNo").val(townDetail.townNo);
			
			document.getElementById('town-update-textarea-count').textContent = document.querySelector('.town-update-content-text').value.length;
		}, error: function(){
			console.log("동네소식 수정 열람 실패");
		}
	});
}