<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>로그인</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>
 @import url("<c:url value="/css/user.css"/>"); 
</style>
</head>
<body>  
<div class="login-page">
	<div id="logoText">
          <a id="logo" href=".">
           AWESOME CAR♥
          </a>
    </div>
  <div class="form" >
    <form class="login-form" method="post">
<%
    if(request.getAttribute("msg")!=null){
%>
    	<p style="color:red;"><span class="glyphicon glyphicon-exclamation-sign"></span>${requestScope.msg}</p>
<%
	}
%>
      <span class="glyphicon glyphicon-user"></span> <input type="text" name="userId" placeholder="아이디"/><br>
      <span class="glyphicon glyphicon-lock"></span> <input type="password" name="userPw" placeholder="비밀번호"/>
      <button type="submit">로그인</button>
      <p class="message">아직 아이디가 없으신가요? <a id="sign" href="signupForm">회원가입</a></p>
      <p class="message">가입한 정보가 기억이나지 않나요? <a id="sign" href="find">ID/PW 찾기</a></p>
    </form>
  </div>
</div>
</body>
</html>