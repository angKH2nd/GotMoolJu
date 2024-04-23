function selectTownHotList() {
	$.ajax ({
		url: "townHotList.cm",
		dataType: "json",
		success: function(response) {
			if(JSON.parse(response.townList).length === 0){
				var noHotHtml = '';
				
				noHotHtml = `
							  <div class="centerXY" style="display: flex; flex-direction: column;">
							  	  <br><br>
							  	  아직 Hot한 소식이 없어요 😥 <br>
							  	  동네소식을 작성 해 보아요! <br><br>
							  	  
							  	  <span class="mh fb" onclick="toggleCommunity('town');" style="color: #434d68">동네소식 둘러보기</span>
							  	  <br><br>
							  </div>
							`;
				
				$(".town-hot-main-hot-list-area").html(noHotHtml);
			}else {
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
	                    <div class="town-hot-main-post pd15" id="${town.townNo}">
	                        <div class="town-hot-post-profile">
	                            <div class="town-hot-post-profile-img centerXY fl"><img class="brc" width=45 height=45 src="${town.townWriterImg}"></div>
	                            <div class="town-hot-post-profile-nickname centerY fl">${town.townWriter}</div>
	                            <div class="town-hot-post-profile-hot centerY fl">Hot!</div>
	                        </div>
	                        <div class="town-hot-post-title mh centerY" onclick="moveToTownAndDetail(${town.townNo});">${town.townTitle}</div>
	                        <div class="town-hot-post-content mh" onclick="moveToTownAndDetail(${town.townNo});">${town.townContent}</div>
	                `;
	                
	                // town.townThumbnail이 null이 아닌 경우에만 이미지를 표시
	                if (town.townThumbnail !== undefined) {
	                    townListHtml += `
	                        <div class="town-hot-post-thumbnail mh br5" onclick="moveToTownAndDetail(${town.townNo});"><img width=419 height=230 src="${town.townThumbnail}"></div>
	                    `;
	                }
	                
	                townListHtml += `<div class="town-hot-post-bottom">`;
	                
	                if (myTownStarArr.includes(town.townNo)) { // 즐겨찾기한 경우
		                townListHtml += `
		                            <div class="town-hot-post-hot fl mh yellowStar" onclick="updateTownHotStar(${town.townNo});">
		                                <div class="town-hot-post-hot-i centerY fl"><i class="fa-regular fa-star"></i></div>
		                                <div class="town-hot-post-hot-num centerY fl">${town.townStar}</div>
		                            </div>`
	                }else { // 즐겨찾기하지 않은 경우
	                	townListHtml += `
		                            <div class="town-hot-post-hot fl mh" onclick="updateTownHotStar(${town.townNo});">
		                                <div class="town-hot-post-hot-i centerY fl"><i class="fa-regular fa-star"></i></div>
		                                <div class="town-hot-post-hot-num centerY fl">${town.townStar}</div>
		                            </div>`
	                }
	                            
	                townListHtml += `
	                            <div class="town-hot-post-likes fl mh" onclick="updateTownHotLikes(${town.townNo});">
	                                <div class="town-hot-post-likes-i centerY fl"><i class="fa-regular fa-thumbs-up"></i></div>
	                                <div class="town-hot-post-likes-num centerY fl">${town.townLikes}</div>
	                            </div>
	                            <div class="town-hot-post-reply fl mh" onclick="moveToTownAndDetail(${town.townNo});">
	                                <div class="town-hot-post-reply-i centerY fl"><i class="fa-solid fa-comment-dots"></i></div>
	                                <div class="town-hot-post-reply-num centerY fl">${town.townReplyCount}</div>
	                            </div>
	                            <div class="town-hot-post-count fl mh" onclick="moveToTownAndDetail(${town.townNo});">
	                                <div class="town-hot-post-count-i centerY fl"><i class="fa-solid fa-arrow-pointer"></i></div>
	                                <div class="town-hot-post-count-num centerY fl">${town.townClick}</div>
	                            </div>
	                            <div class="town-hot-post-blank fl"></div>
	                            <div class="town-hot-post-date fl">
	                                <div class="town-hot-post-date-i centerY fl"><i class="fa-solid fa-pen"></i></div>
	                                <div class="town-hot-post-date-num centerY fl">${town.townModifyDate}</div>
	                            </div>
	                        </div>
	                    </div>
	                `;
	            })
	        	$(".town-hot-main-hot-list-area").html(townListHtml);
	        }
		}, error: function() {
			swal("커뮤니티 조회 실패!", "관리자에게 문의해주세요", 'warning');
		}
	})
}

function updateTownHotStar(no){
	updateTownStar(no);
	cancelDiv();
	toggleDiv('community');
	selectTownHotList();
}

function updateTownHotLikes(no){
	updateTownLikes(no);
	selectTownHotList();
}