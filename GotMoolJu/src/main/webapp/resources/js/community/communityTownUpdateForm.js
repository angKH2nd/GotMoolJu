// 파일 업로드 및 미리보기 기능 구현
function uploadCommunityUpdateFiles() {
    const fileInputs = document.querySelectorAll('.uploadCommunityUpdateFileInput');

    // 파일 입력 상자가 비어 있는지 확인
    for (const fileInput of fileInputs) {
        if (!fileInput.value) {
            fileInput.click();
            break; // 빈 파일 입력 상자를 열고 종료
        }
    }
}

function calTownUpdateContentLength() {
	var textLength = document.querySelector('.town-update-content-text').value.length;
    document.getElementById('town-update-textarea-count').textContent = textLength;
}

// 파일을 선택할 때 이벤트 처리
function handleUpdateFileInputChange(inputIndex) {
    const fileInput = document.getElementById('uploadCommunityUpdateFileInput' + inputIndex);
    const previewImage = document.getElementById('town-update-preview-image' + inputIndex);

    if (fileInput && previewImage && fileInput.files && fileInput.files[0]) {
        const reader = new FileReader();
        reader.onload = function(event) {
            previewImage.src = event.target.result; // 미리보기에 이미지 표시
            previewImage.parentElement.classList.add('show'); // 미리보기 이미지 칸을 보이도록 설정
        };
        reader.readAsDataURL(fileInput.files[0]); // 파일 읽기
    }
}

// 이미지 삭제 기능 구현
function removeUpdateImage(index) {
    const previewImage = document.getElementById('town-update-preview-image' + index);
    
    if (previewImage) {
        previewImage.src = '#'; // 이미지 삭제
        previewImage.parentElement.classList.remove('show'); // 미리보기 이미지 칸을 숨기도록 설정
        const fileInput = document.getElementById('uploadCommunityUpdateFileInput' + index);
        if (fileInput) {
            fileInput.value = ''; // 파일 입력 값 초기화
        }
    }
}

// 파일 입력 창이 한 번에 하나만 열리도록 보장
document.addEventListener("DOMContentLoaded", function() {
    const fileInputs = document.querySelectorAll('.community-update-file-input');
    fileInputs.forEach(function(input) {
        input.addEventListener('click', function() {
            this.value = null;
        });
    });
});

function updateTown() {
	if($(".town-update-title-input").val() !== '' && $(".town-update-content-text").val() !== ''){ // 제목, 내용 등 필수항목 잘 작성한 경우
		// FormData 객체 생성
    	var townFormData = new FormData();
		
		// 이미지 파일을 선택한 경우에만 townFormData에 추가
	    const fileInputs = document.querySelectorAll('.uploadCommunityUpdateFileInput');
        fileInputs.forEach(function(fileInput, index) {
            if (fileInput.files.length > 0) {
                townFormData.append('updateTownImgFile' + index, fileInput.files[0]);
            }
        });
		
		townFormData.append('townNo', $("#townUpdateNo").val()); 
		townFormData.append('townTitle', $(".town-update-title-input").val()); 
		townFormData.append('townContent', $(".town-update-content-text").val()); 

		$.ajax({
			url: "updateTown.cm",
			type: "POST",
			data: townFormData,
			processData: false, // processData를 false로 설정하여 FormData를 변환하지 않도록
            contentType: false, // contentType을 false로 설정하여 기본 contentType을 사용하지 않도록
			success: function(result){
				if(result > 0){
					swal("동네소식 수정 성공!", "작성해주셔서 감사합니다", 'success');
				}else {
					swal("동네소식 수정 실패!", "관리자에게 문의해주세요", 'warning');
				}
				selectMemberMypageStar();
				backToTownList();
				$(".town-btn").click();
			}, error: function(){
				swal("동네소식 수정 실패!", "관리자에게 문의해주세요", 'warning');
			}
		});
	}else { // 그 외
		swal("동네소식 수정 실패!", "제목과 내용 등 필수 입력사항을 입력해주세요.", 'warning');
	}
}

function backToTownList(){
	document.querySelector('.town-main-list').style.display = 'block';
	document.querySelector('.town-main-detail').style.display = 'none';
	document.querySelector('.town-main-insert').style.display = 'none';
	document.querySelector('.town-main-update').style.display = 'none';
}