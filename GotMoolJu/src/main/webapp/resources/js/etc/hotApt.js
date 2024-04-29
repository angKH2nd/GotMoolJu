function cancelHotApt() {
	toggleEtcDiv('hotApt');
	cancelDiv();
}


$(function(){
	$.ajax({
		url:"selectHotList.ma",
		success:function(data){
			
			let hotList = "";

			for(let i=0; i<data.length; i++){

				var tempStr = "";

				switch(i){
					case 0 :
						tempStr = `<img src="resources/images/etc/rank1.png" width=25 height=25>`;
						break;
					case 1 :
						tempStr = `<img src="resources/images/etc/rank2.png" width=25 height=25>`;
						break;
					case 2 :
						tempStr = `<img src="resources/images/etc/rank3.png" width=25 height=25>`;
						break;
					default : 
						tempStr = `<img src="resources/images/etc/rankNormal.jpg" width=25 height=25>`;
						break;
					}


				hotList += `
							<div class="hot-apt-list-thing">
								<div class="hot-apt-left fl">
									<div class="hot-apt-name">
										<div class="hot-apt-icon fl">${tempStr}</div>
										<div class="hot-apt-realName fl">이름 ${data[i].aptName}</div>
									</div>
									<div class="hot-apt-price">
										<div class="hot-apt-type fl">${data[i].aptSellingType}</div>
										<div class="hot-apt-realPrice fl">가격 ${data[i].aptPrice}</div>
									</div>
									<div class="hot-apt-address">주소 ${data[i].aptAddress}</div>
									<div class="hot-apt-desc">설명 ${data[i].aptDesc}</div>
								</div>
								<div class="hot-apt-right fl centerXY mh"><img class="br5" src='${data[i].aptImgUrl}' width=130 height=129></div>
							</div>
						   `;


				$(".hot-apt-list-area").html(hotList);
				/*
				switch(i){
				case 0 :
					$(".hot-apt-icon").html(`<img src="resources/images/etc/rank1.png" width=25 height=25>`); 
					break;
				case 1 :
					$(".hot-apt-icon").html(`<img src="resources/images/etc/rank2.png" width=25 height=25>`); 
					break;
				case 2 :
					$(".hot-apt-icon").html(`<img src="resources/images/etc/rank3.png" width=25 height=25>`); 
					break;
				default : 
					$(".hot-apt-icon").html(`<img src="resources/images/etc/rankNormal.jsp" width=25 height=25>`); 
					break;
				}

				$(".hot-apt-realName").html(data[i].aptName);
				$(".hot-atp-type").html(data[i].aptSellingType);
				$(".hot-apt-realPrice").html(data[i].aptPrice);
				$(".hot-apt-address").html(data[i].aptAddress);
				$(".hot-apt-desc").html(data[i].aptDesc);
				$(".hot-apt-right").html(`<img class="br5" src= ${data[i].aptImgUrl} width=130 height=129>`);
				*/

				/*
				if(i=0){
					hotList += `
								<div class="hot-apt-list-thing">
									<div class="hot-apt-left fl">
										<div class="hot-apt-name">
											<div class="hot-apt-icon fl"><img src="resources/images/etc/rank1.png" alt=""></div>
											<div class="hot-apt-realName fl">이름 ${data[i].aptName}</div>
										</div>
										<div class="hot-apt-price">
											<div class="hot-apt-type fl">${data[i].aptSellingType}</div>
											<div class="hot-apt-realPrice fl">가격 ${data[i].aptPrice}</div>
										</div>
										<div class="hot-apt-address">주소 ${data[i].aptAddress}</div>
										<div class="hot-apt-desc">설명 ${data[i].aptMemo}</div>
									</div>
									<div class="hot-apt-right fl centerXY mh"><img src='${data[i].aptImgUrl}'></div>
								</div>
							   `
				}else if(i=1){
					
				}
				*/		   
			}

		},
		error:function(){
			console.log("조회수 top 10 아파트 조회 실패")
		}
	})
})