function cancelInsertImprovementIdeation() {
	toggleEtcDiv('insertImprovementIdeation');
	cancelDiv();
}

/* -------------- 수정 삭제 관련 -------------- */
$(document).on("click", ".improvement-delete .fa-trash", function() {
    var impReplyNo = $(this).closest('.improvement-delete').data("imp-reply-no"); // 해당 요소의 imp-reply-no 속성값 가져오기
    deleteImpReply(impReplyNo); // 가져온 impReplyNo를 deleteImpReply 함수에 전달
});

$(document).on("click", ".improvement-edit .fa-pen", function() {
    var textarea = $(this).closest('.improvement-reply').find('textarea');
    textarea.prop('readonly', false);
    $(this).closest('.improvement-edit').html(`<i class="fa-solid fa-floppy-disk"></i>`);
});

$(document).on("click", ".improvement-edit .fa-floppy-disk", function() {
	var replyElement = $(this).closest('.improvement-reply');
    var impReplyNo = replyElement.find('.improvement-delete').data("imp-reply-no");
    var impReplyContent = replyElement.find('.improvement-reply-content>textarea').val();
    updateImpReply(impReplyNo, impReplyContent);
	var textarea = $(this).closest('.improvement-reply').find('textarea');
    textarea.prop('readonly', true);
    $(this).closest('.improvement-edit').html(`<i class="fa-solid fa-pen"></i>`);
});

function deleteImpReply(no) {
    swal({
		text : "삭제 하시겠습니까?",
		buttons: ["취소" , "삭제"],
		closeOnClickOutside : false // 백그라운드 클릭해도 안 꺼지도록
	})
	.then(function(result){
        if(result){
        	$.ajax({
        		url: "deleteImpList.etc",
        		data: {impReplyNo:no},
        		success: function (result) {
        			if(result > 0) {
        				swal('개선의견 삭제 성공!', '성공적으로 개선의견이 삭제되었습니다.', 'success')
        				.then(function() {
				            loadComments(0, $("#loadCount").val());
				        })
        			}else {
        				swal('개선의견 삭제 실패!', '관리자에게 문의해주세요', 'warning');
        			}
        		}, error: function () {
        			swal('개선의견 삭제 실패!', '관리자에게 문의해주세요', 'warning');
        		}
        	})
        }
	})
}

function updateImpReply(no, content) {
	$.ajax({
		url: "updateImpList.etc",
		data: {
			impReplyNo:no,
			impReplyContent:content
		},
		success: function (result) {
			if(result > 0) {
				swal('개선의견 수정 성공!', '성공적으로 개선의견이 수정되었습니다.', 'success')
				.then(function() {
		            loadComments(0, $("#loadCount").val());
		        })
			}else {
				swal('개선의견 수정 실패!', '관리자에게 문의해주세요', 'warning');
			}
		}, error: function () {
			swal('개선의견 수정 실패!', '관리자에게 문의해주세요', 'warning');
		}
	})
}

/* -------------- 수정 삭제 관련 -------------- */

/* -------------- 좋아요 싫어요 관련 -------------- */
$(document).on("click", ".improvement-can-select", function() {
	var impReplyChoose = $(this).closest('.improvement-can-select').data("imp-reply-choose");
	var impReplyNo = $(this).closest('.improvement-can-select').data("reply-no");
	
	updateImpReplyChoose(impReplyNo, impReplyChoose);
})

function updateImpReplyChoose(no, choose) {
	$.ajax({
		url: "updateImpReplyChoose.etc",
		data: {
			impReplyNo:no,
			impReplyChoose:choose
		},
		success: function (result) {
			if(result !== 1){
				swal('업데이트 실패!', '관리자에게 문의해주세요', 'warning');
			}
			toggleDiv('etc');
			toggleDiv('etc');
			toggleEtcDiv('insertImprovementIdeation');
		}, error: function () {
			swal('업데이트 실패!', '관리자에게 문의해주세요', 'warning');
		}
	});
}
/* -------------- 좋아요 싫어요 관련 -------------- */

function loadComments(impStart, loadCount) {
	$.ajax({
     	url: "impList.etc",
      	success: function (data) {
      		var myImp = JSON.parse(data.myImp);
      		var impList = JSON.parse(data.impList);
      		
      		var myImpArr = []; // 좋아요 싫어요 표시한 게시글 번호
      		var myImpArr2 = []; // 좋아요 싫어요 상태 값
      		
      		for(let i = 0; i < myImp.length; i++){
      			myImpArr[i] = myImp[i].impChooseReplyNo;
      			myImpArr2[i] = myImp[i].impChooseStatus;
      		}
      		
      		let value = "";

      		for(let i = impStart; i < Math.min(impStart + loadCount, impList.length); i++){
      			if(impList[i].impReplyStatus === 'Y'){ // 게시글이 게시중일 때
					if(impList[i].impReplyWriter === $("#improvement-nickname").val()){ // 작성자 본인일 때
		      			value += `
	      						<div class="improvement-reply">
									<div class="improvement-reply-profile">
										<div class="improvement-reply-profile-img fl centerXY"><img width=25 height=25 class="brc" src="${impList[i].impReplyProfile}"></div>
										<div class="improvement-reply-profile-nickname fl centerY">${impList[i].impReplyWriter}</div>
										<div class="improvement-reply-blank fl"></div>
										<div class="improvement-edit fl centerXY mh"><i class="fa-solid fa-pen"></i></div>
										<div class="improvement-delete fl centerXY mh" data-imp-reply-no="${impList[i].impReplyNo}"><i class="fa-solid fa-trash"></i></div>
									</div>
									<div class="improvement-reply-content"><textarea readonly>${impList[i].impReplyContent}</textarea></div>
									<div class="improvement-reply-date">
										<div class="improvement-date fl centerY">${impList[i].impReplyModifyDate}</div>
										<div class="improvement-alert fl centerY"><button type="button" class="btn-format mh"><i class="fa-solid fa-person-military-pointing fa-sm"></i> 신고</button></div>
										<div class="improvement-blank fl"></div>
										<div class="improvement-finger fl">
											<div class="improvement-finger-likes fl bdlg centerY"><i class="fa-solid fa-thumbs-up" style="color: red; padding-left: 5px; text-align: left;"></i><span style="text-align: right; width: 27px; font-size: 14px; padding-right: 3px;" class="fb"> ${impList[i].impReplyLikes}</span></div>
											<div class="improvement-finger-dislikes fl bdlg centerY"><i class="fa-solid fa-thumbs-down" style="color: blue; padding-left: 5px; text-align: left;"></i><span style="text-align: right; width: 27px; font-size: 14px; padding-right: 3px;" class="fb"> ${impList[i].impReplyDislikes}</span></div>
										</div>
									</div>
								</div>
		      					`
		      		}else { // 작성자 본인이 아닐 때
		      			if(impList[i].impReplyType === 'O'){ // 비밀 댓글이 아닐 때
		      				let matchFound = false;
		      				let matchValue;
		      				let matchStatus;
		      				
		      				for(let j = 0; j < myImpArr.length; j++){
		      					if(myImpArr[j] === impList[i].impReplyNo){
		      						matchFound = true;
		      						matchValue = myImpArr[j];
		      						matchStatus = myImpArr2[j];
		      						
		      						break;
		      					}
		      				}
		      				
	      					if(matchFound){ // 좋아요 싫어요 체크되었을 때
	      						if(matchStatus == 1){ // 좋아요
	      							value += `
				      						<div class="improvement-reply">
												<div class="improvement-reply-profile">
													<div class="improvement-reply-profile-img fl centerXY"><img width=25 height=25 class="brc" src="${impList[i].impReplyProfile}"></div>
													<div class="improvement-reply-profile-nickname fl centerY">${impList[i].impReplyWriter}</div>
													<div class="improvement-reply-blank fl"></div>
													<div class="improvement-edit fl centerXY"></div>
													<div class="improvement-delete fl centerXY"></div>
												</div>
												<div class="improvement-reply-content">${impList[i].impReplyContent}</div>
												<div class="improvement-reply-date">
													<div class="improvement-date fl centerY">${impList[i].impReplyModifyDate}</div>
													<div class="improvement-alert fl centerY"></div>
													<div class="improvement-blank fl"></div>
													<div class="improvement-finger fl">
														<div class="improvement-finger-likes improvement-can-select improvement-choose-likes fl bdlg centerY mh" data-imp-reply-choose=1 data-reply-no=${impList[i].impReplyNo}><i class="fa-solid fa-thumbs-up" style="color: red; padding-left: 5px; text-align: left;"></i><span style="text-align: right; width: 27px; font-size: 14px; padding-right: 3px;" class="fb"> ${impList[i].impReplyLikes}</span></div>
														<div class="improvement-finger-dislikes improvement-can-select fl bdlg centerY mh" data-imp-reply-choose=2 data-reply-no=${impList[i].impReplyNo}><i class="fa-solid fa-thumbs-down" style="color: blue; padding-left: 5px; text-align: left;"></i><span style="text-align: right; width: 27px; font-size: 14px; padding-right: 3px;" class="fb"> ${impList[i].impReplyDislikes}</span></div>
													</div>
												</div>
											</div>
					      					`
	      						}else { // 싫어요
	      							value += `
				      						<div class="improvement-reply">
												<div class="improvement-reply-profile">
													<div class="improvement-reply-profile-img fl centerXY"><img width=25 height=25 class="brc" src="${impList[i].impReplyProfile}"></div>
													<div class="improvement-reply-profile-nickname fl centerY">${impList[i].impReplyWriter}</div>
													<div class="improvement-reply-blank fl"></div>
													<div class="improvement-edit fl centerXY"></div>
													<div class="improvement-delete fl centerXY"></div>
												</div>
												<div class="improvement-reply-content">${impList[i].impReplyContent}</div>
												<div class="improvement-reply-date">
													<div class="improvement-date fl centerY">${impList[i].impReplyModifyDate}</div>
													<div class="improvement-alert fl centerY"></div>
													<div class="improvement-blank fl"></div>
													<div class="improvement-finger fl">
														<div class="improvement-finger-likes improvement-can-select fl bdlg centerY mh" data-imp-reply-choose=1 data-reply-no=${impList[i].impReplyNo}><i class="fa-solid fa-thumbs-up" style="color: red; padding-left: 5px; text-align: left;"></i><span style="text-align: right; width: 27px; font-size: 14px; padding-right: 3px;" class="fb"> ${impList[i].impReplyLikes}</span></div>
														<div class="improvement-finger-dislikes improvement-can-select improvement-choose-dislikes fl bdlg centerY mh" data-imp-reply-choose=2 data-reply-no=${impList[i].impReplyNo}><i class="fa-solid fa-thumbs-down" style="color: blue; padding-left: 5px; text-align: left;"></i><span style="text-align: right; width: 27px; font-size: 14px; padding-right: 3px;" class="fb"> ${impList[i].impReplyDislikes}</span></div>
													</div>
												</div>
											</div>
					      					`
	      						}
			      			}else { // 좋아요 싫어요 체크하지 않았을 때
			      				value += `
			      						<div class="improvement-reply">
											<div class="improvement-reply-profile">
												<div class="improvement-reply-profile-img fl centerXY"><img width=25 height=25 class="brc" src="${impList[i].impReplyProfile}"></div>
												<div class="improvement-reply-profile-nickname fl centerY">${impList[i].impReplyWriter}</div>
												<div class="improvement-reply-blank fl"></div>
												<div class="improvement-edit fl centerXY"></div>
												<div class="improvement-delete fl centerXY"></div>
											</div>
											<div class="improvement-reply-content">${impList[i].impReplyContent}</div>
											<div class="improvement-reply-date">
												<div class="improvement-date fl centerY">${impList[i].impReplyModifyDate}</div>
												<div class="improvement-alert fl centerY"></div>
												<div class="improvement-blank fl"></div>
												<div class="improvement-finger fl">
													<div class="improvement-finger-likes improvement-can-select fl bdlg centerY mh" data-imp-reply-choose=1 data-reply-no=${impList[i].impReplyNo}><i class="fa-solid fa-thumbs-up" style="color: red; padding-left: 5px; text-align: left;"></i><span style="text-align: right; width: 27px; font-size: 14px; padding-right: 3px;" class="fb"> ${impList[i].impReplyLikes}</span></div>
													<div class="improvement-finger-dislikes improvement-can-select fl bdlg centerY mh" data-imp-reply-choose=2 data-reply-no=${impList[i].impReplyNo}><i class="fa-solid fa-thumbs-down" style="color: blue; padding-left: 5px; text-align: left;"></i><span style="text-align: right; width: 27px; font-size: 14px; padding-right: 3px;" class="fb"> ${impList[i].impReplyDislikes}</span></div>
												</div>
											</div>
										</div>
				      					`
			      			}
		      			}else { // 비밀 댓글일 때
		      				value += `
		      						<div class="improvement-reply">
										<div class="improvement-reply-profile">
											<div class="improvement-reply-profile-img fl centerXY"><img width=25 height=25 class="brc" src="${impList[i].impReplyProfile}"></div>
											<div class="improvement-reply-profile-nickname fl centerY">${impList[i].impReplyWriter}</div>
											<div class="improvement-reply-blank fl"></div>
											<div class="improvement-edit fl centerXY"></div>
											<div class="improvement-delete fl centerXY"></div>
										</div>
										<div class="improvement-reply-content"><i class="fa-solid fa-lock"></i> 비밀 댓글입니다.</div>
										<div class="improvement-reply-date">
											<div class="improvement-date fl centerY">${impList[i].impReplyModifyDate}</div>
											<div class="improvement-alert fl centerY"></div>
											<div class="improvement-blank fl"></div>
											<div class="improvement-finger fl">
											</div>
										</div>
									</div>
			      					`
		      			}
		      		}
		      	}else { // 게시글이 삭제되었을 때
		      		value += `
      						<div class="improvement-reply">
								<div class="improvement-reply-profile">
									<div class="improvement-reply-profile-img fl centerXY"><img width=25 height=25 class="brc" src="${impList[i].impReplyProfile}"></div>
									<div class="improvement-reply-profile-nickname fl centerY">${impList[i].impReplyWriter}</div>
									<div class="improvement-reply-blank fl"></div>
									<div class="improvement-edit fl centerXY"></div>
									<div class="improvement-delete fl centerXY"></div>
								</div>
								<div class="improvement-reply-content">댓글이 삭제되었습니다.</div>
								<div class="improvement-reply-date">
									<div class="improvement-date fl centerY">${impList[i].impReplyModifyDate}</div>
									<div class="improvement-alert fl centerY"></div>
									<div class="improvement-blank fl"></div>
									<div class="improvement-finger fl">
									</div>
								</div>
							</div>
	      					`
		      	}
      		}
      		$(".improvement-list-area").html(value);
            impStart += loadCount;

            if (impStart >= impList.length) {
                $("#loadMoreBtn").hide();
            	$("#collapseBtn").show();
            }else {
            	$("#collapseBtn").hide();
                $("#loadMoreBtn").show();
            }
      	}, error: function () {
      		swal('개선의견 조회 실패!', '관리자에게 문의해주세요', 'warning');
        }
    })
}

$(document).ready(function() {
	if($("#isLogin").val() !== 'blank'){
		$("#collapseBtn").hide();
	
	    loadComments(0, $("#loadCount").val());
	
	    $("#loadMoreBtn").click(function() {
	    	let originCount = $("#loadCount").val();
	    	$("#loadCount").val(originCount + 5);
	        loadComments(0, $("#loadCount").val());
	        $(this).hide();
	        $("#collapseBtn").show();
	    });
	    
	    $("#collapseBtn").click(function() {
	    	$(".improvement-list-area").empty();
	    	$("#loadCount").val(5);
	        loadComments(0, $("#loadCount").val());
	        $(this).hide();
	        $("#loadMoreBtn").show();
	    });
	}
})