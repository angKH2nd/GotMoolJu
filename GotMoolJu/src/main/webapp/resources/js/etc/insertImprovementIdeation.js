function cancelInsertImprovementIdeation() {
	toggleEtcDiv('insertImprovementIdeation');
	cancelDiv();
}

function deleteImpReply() {
    swal({
		text : "삭제 하시겠습니까?",
		buttons: ["취소" , "삭제"],
		closeOnClickOutside : false // 백그라운드 클릭해도 안 꺼지도록
	})
	.then(function(result){
        if(result){
        	console.log(result);
        }
        
	})
}

$(document).ready(function() {
	var start = 0;
    var loadCount = 5;

	function loadComments() {
		$.ajax({
	     	url: "impList.etc",
	      	success: function (list) {
	      		let value = "";
	
	      		for(let i = start; i < Math.min(start + loadCount, list.length); i++){
	      			if(list[i].impReplyStatus === 'Y'){
						if(list[i].impReplyWriter === $("#improvement-nickname").val()){
			      			value += `
		      						<div class="improvement-reply">
										<div class="improvement-reply-profile">
											<div class="improvement-reply-profile-img fl centerXY"><img width=25 height=25 class="brc" src="${list[i].impReplyProfile}"></div>
											<div class="improvement-reply-profile-nickname fl centerY">${list[i].impReplyWriter}</div>
											<div class="improvement-reply-blank fl"></div>
											<div class="improvement-edit fl centerXY mh"><i class="fa-solid fa-pen"></i></div>
											<div class="improvement-delete fl centerXY mh" onclick="deleteImpReply();"><i class="fa-solid fa-trash"></i></div>
										</div>
										<div class="improvement-reply-content"><textarea readonly>${list[i].impReplyContent}</textarea></div>
										<div class="improvement-reply-date">
											<div class="improvement-date fl centerY">${list[i].impReplyModifyDate}</div>
											<div class="improvement-alert fl centerY"><button type="button" class="btn-format mh"><i class="fa-solid fa-person-military-pointing fa-sm"></i> 신고</button></div>
											<div class="improvement-blank fl"></div>
											<div class="improvement-finger fl">
												<div class="improvement-finger-likes fl bdlg centerY mh"><i class="fa-solid fa-thumbs-up" style="color: red; padding-left: 5px; text-align: left;"></i><span style="text-align: right; width: 27px; font-size: 14px; padding-right: 3px;" class="fb"> ${list[i].impReplyLikes}</span></div>
												<div class="improvement-finger-dislikes fl bdlg centerY mh"><i class="fa-solid fa-thumbs-down" style="color: blue; padding-left: 5px; text-align: left;"></i><span style="text-align: right; width: 27px; font-size: 14px; padding-right: 3px;" class="fb"> ${list[i].impReplyDislikes}</span></div>
											</div>
										</div>
									</div>
			      					`
			      		}else {
			      			if(list[i].impReplyType === 'O'){
				      			value += `
			      						<div class="improvement-reply">
											<div class="improvement-reply-profile">
												<div class="improvement-reply-profile-img fl centerXY"><img width=25 height=25 class="brc" src="${list[i].impReplyProfile}"></div>
												<div class="improvement-reply-profile-nickname fl centerY">${list[i].impReplyWriter}</div>
												<div class="improvement-reply-blank fl"></div>
												<div class="improvement-edit fl centerXY mh"></div>
												<div class="improvement-delete fl centerXY mh"></div>
											</div>
											<div class="improvement-reply-content">${list[i].impReplyContent}</div>
											<div class="improvement-reply-date">
												<div class="improvement-date fl centerY">${list[i].impReplyModifyDate}</div>
												<div class="improvement-alert fl centerY"><button type="button" class="btn-format mh"><i class="fa-solid fa-person-military-pointing fa-sm"></i> 신고</button></div>
												<div class="improvement-blank fl"></div>
												<div class="improvement-finger fl">
													<div class="improvement-finger-likes fl bdlg centerY mh"><i class="fa-solid fa-thumbs-up" style="color: red; padding-left: 5px; text-align: left;"></i><span style="text-align: right; width: 27px; font-size: 14px; padding-right: 3px;" class="fb"> ${list[i].impReplyLikes}</span></div>
													<div class="improvement-finger-dislikes fl bdlg centerY mh"><i class="fa-solid fa-thumbs-down" style="color: blue; padding-left: 5px; text-align: left;"></i><span style="text-align: right; width: 27px; font-size: 14px; padding-right: 3px;" class="fb"> ${list[i].impReplyDislikes}</span></div>
												</div>
											</div>
										</div>
				      					`
			      			}else {
			      				value += `
			      						<div class="improvement-reply">
											<div class="improvement-reply-profile">
												<div class="improvement-reply-profile-img fl centerXY"><img width=25 height=25 class="brc" src="${list[i].impReplyProfile}"></div>
												<div class="improvement-reply-profile-nickname fl centerY">${list[i].impReplyWriter}</div>
												<div class="improvement-reply-blank fl"></div>
												<div class="improvement-edit fl centerXY mh"></div>
												<div class="improvement-delete fl centerXY mh"></div>
											</div>
											<div class="improvement-reply-content"><i class="fa-solid fa-lock"></i>비밀 댓글입니다.</div>
											<div class="improvement-reply-date">
												<div class="improvement-date fl centerY">${list[i].impReplyModifyDate}</div>
												<div class="improvement-alert fl centerY"><button type="button" class="btn-format mh"></div>
												<div class="improvement-blank fl"></div>
												<div class="improvement-finger fl">
													<div class="improvement-finger-likes fl bdlg centerY mh"></div>
													<div class="improvement-finger-dislikes fl bdlg centerY mh"></div>
												</div>
											</div>
										</div>
				      					`
			      			}
			      		}
			      	}else {
			      		value += `
	      						<div class="improvement-reply">
									<div class="improvement-reply-profile">
										<div class="improvement-reply-profile-img fl centerXY"><img width=25 height=25 class="brc" src="${list[i].impReplyProfile}"></div>
										<div class="improvement-reply-profile-nickname fl centerY">${list[i].impReplyWriter}</div>
										<div class="improvement-reply-blank fl"></div>
										<div class="improvement-edit fl centerXY mh"></div>
										<div class="improvement-delete fl centerXY mh"></div>
									</div>
									<div class="improvement-reply-content"><i class="fa-solid fa-lock"></i>댓글이 삭제되었습니다.</div>
									<div class="improvement-reply-date">
										<div class="improvement-date fl centerY">${list[i].impReplyModifyDate}</div>
										<div class="improvement-alert fl centerY"></div>
										<div class="improvement-blank fl"></div>
										<div class="improvement-finger fl">
											<div class="improvement-finger-likes fl bdlg centerY mh"></div>
											<div class="improvement-finger-dislikes fl bdlg centerY mh"></div>
										</div>
									</div>
								</div>
		      					`
			      	}
	      		}
	      		$(".improvement-list-area").append(value);
	            start += loadCount;
	
	            if (start >= list.length) {
	                $("#loadMoreBtn").hide();
	            }
	      	}, error: function () {
	      		console.log('개선 의견 조회 실패');
	        }
	    })
    }
    
    loadComments();

    $("#loadMoreBtn").click(function() {
        loadComments();
    });
})