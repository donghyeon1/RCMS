<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>AwesomeCar Main</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>
@import url("<c:url value="/css/common.css"/>");
</style>
<script>
$(function(){
   $("#back").on("click",function(){
      history.back();
   });
   
   $("#home").on("click",function(){
      location.href=".";
   });
});
</script>
<body>
<div class="container">
<%@ include file="../common/head.jsp" %>

   <div style="
      width:1138px; height:450px; 
      border: 1px solid white; margin-bottom: 0px; margin-top: 40px;
      border-radius: 10px; background-color: white;">
      <div id="loggingDiv" class="jumbotron" style="width:1138px; height:450px;
      padding-top: 10px; background-position: right;">
         <strong style="font-size: 45px;">서비스 이용에 불편을드려 죄송합니다.</strong><br><br>
         <h3 style="margin-top: 100px;">요청하신 페이지를 찾을 수 없습니다.</h3>
         <h3>고객센터로 문의 주시면 신속히 처리 하겠습니다.</h3>
         <h3>(고객센터 TEL.02-234-5678)<br><br><br></h3>
         <center>
         <div class="btn-group">
            <button type="button" id="back" class="btn btn-lg btn-info">이전 페이지</button>
            <button type="button" id="home" class="btn btn-lg btn-info">어썸카 홈으로</button>
         </div>
         </center>
      </div>
   </div>

</div>
</body>
<%@ include file="../common/foot.jsp" %>