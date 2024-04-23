// 파일 업로드 및 미리보기 기능 구현
function uploadCommunityFiles() {
    const fileInputs = document.querySelectorAll('.uploadCommunityFileInput');

    // 파일 입력 상자가 비어 있는지 확인
    for (const fileInput of fileInputs) {
        if (!fileInput.value) {
            fileInput.click();
            break; // 빈 파일 입력 상자를 열고 종료
        }
    }
}

function calTownContentLength() {
	var textLength = document.querySelector('.town-insert-content-text').value.length;
    document.getElementById('town-insert-textarea-count').textContent = textLength;
}

// 파일을 선택할 때 이벤트 처리
function handleFileInputChange(inputIndex) {
    const fileInput = document.getElementById('uploadCommunityFileInput' + inputIndex);
    const previewImage = document.getElementById('town-insert-preview-image' + inputIndex);

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
function removeImage(index) {
    const previewImage = document.getElementById('town-insert-preview-image' + index);
    
    if (previewImage) {
        previewImage.src = '#'; // 이미지 삭제
        previewImage.parentElement.classList.remove('show'); // 미리보기 이미지 칸을 숨기도록 설정
        const fileInput = document.getElementById('uploadCommunityFileInput' + index);
        if (fileInput) {
            fileInput.value = ''; // 파일 입력 값 초기화
        }
    }
}

// 파일 입력 창이 한 번에 하나만 열리도록 보장
document.addEventListener("DOMContentLoaded", function() {
    const fileInputs = document.querySelectorAll('.community-file-input');
    fileInputs.forEach(function(input) {
        input.addEventListener('click', function() {
            this.value = null;
        });
    });
});

function insertTown() {
	if($(".town-insert-title-input").val() !== '' && $(".town-insert-content-text").val() !== ''){ // 제목, 내용 등 필수항목 잘 작성한 경우
		// FormData 객체 생성
    	var townFormData = new FormData();
		
		// 이미지 파일을 선택한 경우에만 townFormData에 추가
	    const fileInputs = document.querySelectorAll('.uploadCommunityFileInput');
        fileInputs.forEach(function(fileInput, index) {
            if (fileInput.files.length > 0) {
                townFormData.append('insertTownImgFile' + index, fileInput.files[0]);
            }
        });
		
		townFormData.append('townTitle', $(".town-insert-title-input").val()); 
		townFormData.append('townContent', $(".town-insert-content-text").val()); 

		$.ajax({
			url: "insertTown.cm",
			type: "POST",
			data: townFormData,
			processData: false, // processData를 false로 설정하여 FormData를 변환하지 않도록
            contentType: false, // contentType을 false로 설정하여 기본 contentType을 사용하지 않도록
			success: function(result){
				if(result > 0){
					swal("동네소식 작성 성공!", "작성해주셔서 감사합니다", 'success');
				}else {
					swal("동네소식 작성 실패!", "관리자에게 문의해주세요", 'warning');
				}
				selectMemberMypageStar();
				changeTownArea();
				$(".town-btn").click();
			}, error: function(){
				swal("동네소식 작성 실패!", "관리자에게 문의해주세요", 'warning');
			}
		});
	}else { // 그 외
		swal("동네소식 작성 실패!", "제목과 내용 등 필수 입력사항을 입력해주세요.", 'warning');
	}
}