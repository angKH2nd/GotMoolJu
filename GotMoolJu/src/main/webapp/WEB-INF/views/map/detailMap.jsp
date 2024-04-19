<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .detailMap-outer{
        height: 100%;
        width: 100%;
        overflow-y: auto;
    }
    .no-scrollbar::-webkit-scrollbar {display:none;}
    .detailMap-apt{
        width: 100%;
        height: 150px;
        border-bottom: 1px solid rgb(237, 237, 237);
        box-sizing: border-box;
    }
    .detailMap-apt>*{
        height: 100%;
        float: left;
    }
    .detailMap-apt-img{
        width: 40%;
        text-align: center;
    }
    .detailMap-apt-content{
        width: 60%;
    }
    .detailMap-apt-img>img{
        width: 85%;
        height: 85%;
    }
    .detailMap-apt:hover{
        cursor: pointer;
        border: 1px solid orange;
    }
</style>
</head>
<body>

	<div class="detailMap-outer no-scrollbar">


    </div>



</body>
</html>