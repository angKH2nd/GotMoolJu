function selectTownList() {
	$.ajax ({
		url: "townList.cm",
		dataType: "json",
		success: function(response) {
			var myTownStarArr = [];
			
			if(response.myTownStarList !== undefined){
				var myTownStarList = JSON.parse(response.myTownStarList);
				for(let i = 0; i < myTownStarList.length; i++){
					myTownStarArr.push(myTownStarList[i].townStarRefNo);
				}
			}
			
			var townList = JSON.parse(response.townList);
			
			let townListHtml= "";
			
            $(townList).each(function(index, town) {
            	townListHtml += `
                    <div class="town-main-post pd15" id="${town.townNo}">
                        <div class="town-post-profile">
                            <div class="town-post-profile-img centerXY fl"><img class="brc" width=45 height=45 src="${town.townWriterImg}"></div>
                            <div class="town-post-profile-nickname centerY fl">${town.townWriter}</div>
                        </div>
                        <div class="town-post-title mh centerY" onclick="changeTownDetail(${town.townNo});">${town.townTitle}</div>
                        <div class="town-post-content mh" onclick="changeTownDetail(${town.townNo});">${town.townContent}</div>
                `;
                
                // town.townThumbnail이 null이 아닌 경우에만 이미지를 표시
                if (town.townThumbnail !== undefined) {
                    townListHtml += `
                        <div class="town-post-thumbnail mh br5" onclick="changeTownDetail(${town.townNo});"><img width=419 height=230 class="br5" src="${town.townThumbnail}"></div>
                    `;
                }
                
                townListHtml += `<div class="town-post-bottom">`;
                
                if (myTownStarArr.includes(town.townNo)) { // 즐겨찾기한 경우
	                townListHtml += `
	                            <div class="town-post-star fl mh yellowStar" onclick="updateTownStar(${town.townNo});">
	                                <div class="town-post-star-i centerY fl"><i class="fa-regular fa-star"></i></div>
	                                <div class="town-post-star-num centerY fl">${town.townStar}</div>
	                            </div>`
                }else { // 즐겨찾기하지 않은 경우
                	townListHtml += `
	                            <div class="town-post-star fl mh" onclick="updateTownStar(${town.townNo});">
	                                <div class="town-post-star-i centerY fl"><i class="fa-regular fa-star"></i></div>
	                                <div class="town-post-star-num centerY fl">${town.townStar}</div>
	                            </div>`
                }
                            
                townListHtml += `
                            <div class="town-post-likes fl mh" onclick="updateTownLikes(${town.townNo});">
                                <div class="town-post-likes-i centerY fl"><i class="fa-regular fa-thumbs-up"></i></div>
                                <div class="town-post-likes-num centerY fl">${town.townLikes}</div>
                            </div>
                            <div class="town-post-reply fl mh" onclick="changeTownDetail(${town.townNo});">
                                <div class="town-post-reply-i centerY fl"><i class="fa-solid fa-comment-dots"></i></div>
                                <div class="town-post-reply-num centerY fl">${town.townReplyCount}</div>
                            </div>
                            <div class="town-post-count fl mh" onclick="changeTownDetail(${town.townNo});">
                                <div class="town-post-count-i centerY fl"><i class="fa-solid fa-arrow-pointer"></i></div>
                                <div class="town-post-count-num centerY fl">${town.townClick}</div>
                            </div>
                            <div class="town-post-blank fl"></div>
                            <div class="town-post-date fl">
                                <div class="town-post-date-i centerY fl"><i class="fa-solid fa-pen"></i></div>
                                <div class="town-post-date-num centerY fl">${town.townModifyDate}</div>
                            </div>
                        </div>
                    </div>
                `;
            })
        	$(".town-main-list-area").html(townListHtml);
		}, error: function() {
			swal("커뮤니티 조회 실패!", "관리자에게 문의해주세요", 'warning');
		}
	})
}

function updateTownLikes(no) {
	$.ajax({
		url: "updateTownLikes.cm",
		data: {
			townNo: no,
		},
		success: function(result) {
			if(result > 0) {
				selectTownList();
			}else {
				swal("커뮤니티 좋아요 실패!", "관리자에게 문의해주세요", 'warning');
			}
		}, error: function() {
			swal("커뮤니티 좋아요 실패!", "관리자에게 문의해주세요", 'warning');
		}
	});
}

function updateTownStar(no) {
	$.ajax({
		url: "updateTownStar.cm",
		data: {
			townNo: no,
		},
		success: function(result) {
			if(result === 1) {
				selectTownList();
			}else {
				swal("커뮤니티 즐겨찾기 실패!", "관리자에게 문의해주세요", 'warning');
			}
		}, error: function() {
			swal("커뮤니티 즐겨찾기 실패!", "관리자에게 문의해주세요", 'warning');
		}
	});
}
