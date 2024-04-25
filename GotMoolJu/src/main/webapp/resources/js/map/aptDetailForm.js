function cancelApt() {
	cancelAptDetailDiv();
	toggleDiv('re');
}

function dips(){

	let icon = document.getElementById('heartIcon');

	let userNo = $("#userNo").val();
	let aptNo = $(".apt-detail-info1").text();

	console.log(userNo);
	console.log(aptNo);

	$.ajax({
		url:"checkLike.me",
		data:{
			dibsUserNo: userNo,
			dibsAptNo: aptNo
		},
		success:function(result){

			if(result == 0){ // 찜 등록 => 색 빨강, db 추가
				insertLike(userNo, aptNo, icon);
			}else if(result == 1){ // 이미 찜이 되어있음 => 찜 해제 => 색 비우고 db 삭제
				deleteLike(userNo, aptNo, icon);
			}

		},
		error:function(){
			console.log("좋아요 하트 클릭 함수 실패 ㅋ ㅠ")
		}

	})
}


function insertLike(userNo, aptNo, icon){
	$.ajax({
		url:"insertLike.me",
		data:{
			dibsUserNo: userNo,
			dibsAptNo: aptNo
		},
		success:function(result){
			if(result > 0){
				icon.classList.remove('fa-regular');
                icon.classList.add('fa-solid');
                $("#heartIcon").css("color", "#ea0b2c");
			}
		},
		error:function(){
			console.log("insert실패")
		}
	})
}

function deleteLike(userNo, aptNo, icon){

	$.ajax({
		url:"deleteLike.me",
		data:{
			dibsUserNo: userNo,
			dibsAptNo: aptNo
		},
		success:function(result){
			if(result > 0){
				icon.classList.remove('fa-solid');
                icon.classList.add('fa-regular');
                $("#heartIcon").css("color", "");
			}
		},
		error:function(){
			console.log("delete실패")
		}
	})
}
