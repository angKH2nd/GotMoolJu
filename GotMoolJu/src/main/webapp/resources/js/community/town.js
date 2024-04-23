function changeTownArea() {
    var list = document.querySelector('.town-main-list');
    var detail = document.querySelector('.town-main-detail');
    var insert = document.querySelector('.town-main-insert');

    if (list.style.display === 'none') {
        list.style.display = 'block';
        detail.style.display = 'none';
        insert.style.display = 'none';
        $(".town-btn").click();
    } else {
        list.style.display = 'none';
        detail.style.display = 'none';
        insert.style.display = 'block';
    }
    
    resetCommunityDiv();
}

function changeTownDetail(no) {
	var list = document.querySelector('.town-main-list');
    var detail = document.querySelector('.town-main-detail');
	var insert = document.querySelector('.town-main-insert');
	
    if (list.style.display === 'none') {
        list.style.display = 'block';
        detail.style.display = 'none';
        insert.style.display = 'none';
        $(".town-btn").click();
    } else {
        list.style.display = 'none';
        detail.style.display = 'block';
        insert.style.display = 'none';
        if(no !== 0){
        	$.ajax({ // 조회수 증가
        		url: "increaseTownClick.cm",
        		data: {townNo:no},
        		success: function(result){
        			if(result > 0){
        				selectTownDetail(no);
        			}else {
        				swal("동네소식 상세조회 실패!", "관리자에게 문의해주세요", 'warning');
        			}
        		}, error: function(){
        			swal("동네소식 상세조회 실패!", "관리자에게 문의해주세요", 'warning');
        		}
        	})
        }
    }
}

function selectTownDetail(no){
	$.ajax({
		url: "selectTownDetail.cm",
		data: {townNo:no},
		success: function(result){
			var townDetail = JSON.parse(result.townDetail);
			var townReplyList = JSON.parse(result.townReplyList);
			
			if(result.isMyStarTown === 'true'){ // 즐겨찾기한 게시물인 경우
				$(".town-detail-bottom-star-icon").html(`<i class="fa-regular fa-star" style="color: orange"></i>`);
			}else { // 즐겨찾기 아닌 경우
				$(".town-detail-bottom-star-icon").html(`<i class="fa-regular fa-star"></i>`);
			}
			
			var value = "";
			if(townReplyList.length > 0){ // 댓글 있는 경우
				for(let i = 0; i < townReplyList.length; i++){
					value += `
							   <div class="town-detail-reply-thing pd15">
							 	   <div class="town-detail-reply-thing-head">
							 		   <div class="town-detail-reply-thing-img centerXY fl"><img class="brc" width=25 height=25 src="${townReplyList[i].townReplyWriterImg}"></div>
							 		   <div class="town-detail-reply-thing-nickname centerY fl">${townReplyList[i].townReplyWriter}</div>
							 		   <div class="town-detail-reply-thing-date centerY fl">${townReplyList[i].townReplyModifyDate}</div>
							 	   </div>
							 	   <div class="town-detail-reply-thing-content centerY">${townReplyList[i].townReplyContent}</div>
							   </div>
							 `
				}
				$(".town-detail-reply-content").html(value);
			}else { // 댓글 없는 경우
				value += `
						   <div class="town-detail-reply-content-no-reply centerXY">
							   등록된 댓글이 없습니다. <br>
							   댓글로 커뮤니티를 풍성하게 채워주세요 😜!
						   </div>
						 `;
			}
			$(".town-detail-reply-content").html(value);
			
			$("#town-detail-form-townNo").val(townDetail.townNo);
			
			$(".town-detail-title").html(townDetail.townTitle);
			$(".town-detail-member-img").html(`<img width=25 height=25 class="brc" src="${townDetail.townWriterImg}">`);
			$(".town-detail-member-nickname").html(townDetail.townWriter);
			$("#town-detail-member-click-count").html(townDetail.townClick);
			$(".town-detail-content>textarea").val(townDetail.townContent);
			
			$(".town-detail-bottom-star-count").html(townDetail.townStar);
			$(".town-detail-bottom-likes-count").html(townDetail.townLikes);
			$(".town-detail-bottom-reply-count").html(townDetail.townReplyCount);
			
		}, error: function(){
			swal("동네소식 상세조회 실패!", "관리자에게 문의해주세요", 'warning');
		}
	});
}