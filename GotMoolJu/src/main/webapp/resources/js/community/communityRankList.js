function selectTownRankList() {
	$.ajax ({
		url: "townRankList.cm",
		dataType: "json",
		success: function(response) {
			if(response.length > 0){
				var rankHtml = '';
				for(let i = 0; i < response.length; i++){
					var crown = 'crown' + i;
					rankHtml += `
								 <div class="town-rank-thing pd15 br5">
								 	<div class="town-rank-icon centerY fl"><i class="fa-solid fa-crown ${crown}"></i></div>
								 	<div class="town-rank-img centerY fl"><img width=40 height=40 class="brc" src="${response[i].townWriterImg}"></div>
								 	<div class="town-rank-nickname centerY fl">${response[i].townWriter}</div>
								 	<div class="town-rank-blank centerY fl"></div>
								 	<div class="town-rank-count centerY fl">${response[i].townStar}</div>
								 	<div class="town-rank-text centerY fl">점</div>
								 </div>
								`
				}
				$(".town-rank-main-rank-list-area").html(rankHtml);
			}else {
				var noRankHtml = '';
				
				noRankHtml = `
							  <div class="centerXY" style="display: flex; flex-direction: column;">
							  	  <br><br>
							  	  아직 명예의 전당에 등록된 유저가 없어요 😥 <br>
							  	  동네소식을 작성 해 보아요! <br><br>
							  	  
							  	  <span class="mh fb" onclick="toggleCommunity('town');" style="color: #434d68">동네소식 둘러보기</span>
							  	  <br><br>
							  </div>
							`;
				
				$(".town-rank-main-rank-list-area").html(noRankHtml);
			}
		}, error: function() {
			swal("커뮤니티 조회 실패!", "관리자에게 문의해주세요", 'warning');
		}
	})
}
