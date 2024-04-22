<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/community/communityTownInsertForm.css">
</head>
<body>
	<div class="town-insert-form">
		<div class="town-insert-header pd15">
			<div class="town-insert-title">
				<input class="town-insert-title-input fb" placeholder="제목을 입력해주세요." required>
			</div>
			<div class="town-insert-content">
				<textarea class="town-insert-content-text fb" placeholder="내용을 입력해주세요." required></textarea>
			</div>
			<div class="town-insert-count"><span id="town-insert-textarea-count">0</span>/300</div>
			<div class="town-insert-picture">
				<div class="town-preview-container">
					<div class="town-preview-item">
						<img id="town-insert-preview-image1" class="town-insert-preview-image br5" width=65 height=65 src="#">
						<button class="town-remove-button fb brc mh" onclick="removeImage(1)">X</button>
					</div>
					<div class="town-preview-item">
						<img id="town-insert-preview-image2" class="town-insert-preview-image br5" width=65 height=65 src="#">
						<button class="town-remove-button fb brc mh" onclick="removeImage(2)">X</button>
					</div>
					<div class="town-preview-item">
						<img id="town-insert-preview-image3" class="town-insert-preview-image br5" width=65 height=65 src="#">
						<button class="town-remove-button fb brc mh" onclick="removeImage(3)">X</button>
					</div>
					<div class="town-preview-item">
						<img id="town-insert-preview-image4" class="town-insert-preview-image br5" width=65 height=65 src="#">
						<button class="town-remove-button fb brc mh" onclick="removeImage(4)">X</button>
					</div>
					<div class="town-preview-item">
						<img id="town-insert-preview-image5" class="town-insert-preview-image br5" width=65 height=65 src="#">
						<button class="town-remove-button fb brc mh" onclick="removeImage(5)">X</button>
					</div>
				</div>
			</div>
		</div>
		<div class="town-insert-bottom pd15">
			<input type="file" id="uploadCommunityFileInput1" class="uploadCommunityFileInput" onchange="handleFileInputChange(1)">
			<input type="file" id="uploadCommunityFileInput2" class="uploadCommunityFileInput" onchange="handleFileInputChange(2)">
			<input type="file" id="uploadCommunityFileInput3" class="uploadCommunityFileInput" onchange="handleFileInputChange(3)">
			<input type="file" id="uploadCommunityFileInput4" class="uploadCommunityFileInput" onchange="handleFileInputChange(4)">
			<input type="file" id="uploadCommunityFileInput5" class="uploadCommunityFileInput" onchange="handleFileInputChange(5)">
			<div class="town-insert-bottom-left fl mh">
				<i class="fa-solid fa-image fa-xl" id="uploadCommunityFileIcon" onclick="uploadCommunityFiles();"></i>
			</div>
			<div class="town-insert-bottom-right fl mh" onclick="insertTown();">
				등록 <i class="fa-solid fa-paper-plane fa-xl"></i>
			</div>
		</div>
	</div>
	
	<button type="button" class="community-back-button mh" onclick="changeTownArea();"><i class="fa-solid fa-rotate-left hoverZ"></i></button>
	
	<script src="resources/js/community/communityTownInsertForm.js"></script>
</body>
</html>