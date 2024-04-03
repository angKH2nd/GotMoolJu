<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
</head>
<body>
	<form action="login.me" method="post">
        <label for="userId" class="mr-sm-2">ID : </label>
        <input type="text" class="form-control mb-2 mr-sm-2" placeholder="ID" id="userId" name="userId" required> <br>
        <label for="userPwd" class="mr-sm-2">Password : </label>
        <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Password" id="userPwd" name="userPwd" required>
           
        <button type="submit" class="btn btn-primary">로그인</button>
    </form>
    
    <div id="header_1_right"> 
     	<c:choose>
     		<c:when test="${ empty loginUser }">         
           <a>로그인 아직 안 됨</a>
          </c:when>
             <c:otherwise>
                 <label>${ loginUser.userName }님 환영합니다</label> &nbsp;&nbsp;
             </c:otherwise>
         </c:choose>
     </div>
</body>
</html>