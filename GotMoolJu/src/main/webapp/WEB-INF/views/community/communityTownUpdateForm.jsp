<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/community/communityTownUpdateForm.css">
</head>
<body>
	<div class="town-update-form">
		<input type="hidden" id="townUpdateNo">
		<div class="town-update-header pd15">
			<div class="town-update-title">
				<input class="town-update-title-input fb" placeholder="제목을 입력해주세요." required>
			</div>
			<div class="town-update-content">
				<textarea class="town-update-content-text fb" placeholder="내용을 입력해주세요." required onkeyup="calTownUpdateContentLength();" maxlength=300></textarea>
			</div>
			<div class="town-update-count"><span id="town-update-textarea-count">0</span>/300</div>
			<div class="town-update-picture">
				<div class="town-update-preview-container">
					<div class="town-update-preview-item">
						<img id="town-update-preview-image1" class="town-update-preview-image br5" width=65 height=65 src="#">
						<button class="town-update-remove-button fb brc mh" onclick="removeUpdateImage(1)">X</button>
					</div>
					<div class="town-update-preview-item">
						<img id="town-update-preview-image2" class="town-update-preview-image br5" width=65 height=65 src="#">
						<button class="town-update-remove-button fb brc mh" onclick="removeUpdateImage(2)">X</button>
					</div>
					<div class="town-update-preview-item">
						<img id="town-update-preview-image3" class="town-update-preview-image br5" width=65 height=65 src="#">
						<button class="town-update-remove-button fb brc mh" onclick="removeUpdateImage(3)">X</button>
					</div>
					<div class="town-update-preview-item">
						<img id="town-update-preview-image4" class="town-update-preview-image br5" width=65 height=65 src="#">
						<button class="town-update-remove-button fb brc mh" onclick="removeUpdateImage(4)">X</button>
					</div>
					<div class="town-update-preview-item">
						<img id="town-update-preview-image5" class="town-update-preview-image br5" width=65 height=65 src="#">
						<button class="town-update-remove-button fb brc mh" onclick="removeUpdateImage(5)">X</button>
					</div>
				</div>
			</div>
		</div>
		<div class="town-update-bottom pd15">
			<input type="file" id="uploadCommunityUpdateFileInput1" class="uploadCommunityUpdateFileInput" onchange="handleUpdateFileInputChange(1)">
			<input type="file" id="uploadCommunityUpdateFileInput2" class="uploadCommunityUpdateFileInput" onchange="handleUpdateFileInputChange(2)">
			<input type="file" id="uploadCommunityUpdateFileInput3" class="uploadCommunityUpdateFileInput" onchange="handleUpdateFileInputChange(3)">
			<input type="file" id="uploadCommunityUpdateFileInput4" class="uploadCommunityUpdateFileInput" onchange="handleUpdateFileInputChange(4)">
			<input type="file" id="uploadCommunityUpdateFileInput5" class="uploadCommunityUpdateFileInput" onchange="handleUpdateFileInputChange(5)">
			<div class="town-update-bottom-left fl mh">
				<i class="fa-solid fa-image fa-xl" id="uploadCommunityFileIcon" onclick="uploadCommunityUpdateFiles();"></i>
			</div>
			<div class="town-update-bottom-right fl mh" onclick="updateTown();">
				등록 <i class="fa-solid fa-paper-plane fa-xl"></i>
			</div>
		</div>
	</div>
	
	<button type="button" class="community-back-button mh" onclick="backToTownList();"><i class="fa-solid fa-rotate-left hoverZ"></i></button>
	
	<script src="resources/js/community/communityTownUpdateForm.js"></script>
</body>
</html>