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
</head>
<body>
<div class="container">
<!-- 헤더 -->
<%@ include file="common/head.jsp" %>

   <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
         <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
         <li data-target="#myCarousel" data-slide-to="1"></li>
         <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      
      <div class="carousel-inner">
         <div class="item active">
            <img src="<c:url value="/img/carpic.jpg"/>">
         </div>
         
         <div class="item">
            <img src="<c:url value="/img/carpic01.jpg"/>">
         </div>
         
         <div class="item">
            <img src="<c:url value="/img/gg.jpg"/>">
         </div>
      </div>
   
   <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
   </a>
   <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
   </a>
   </div>
<% 
	if(user==null){ 
%>
<form class="form-horizontal" action="login" method="post">
  <div class="form-group">
    <label class="col-sm-4 control-label">아이디</label>
    <div class="col-sm-8">
      <input type="text" class="form-control" id="userId" name="userId" placeholder="아이디">
    </div>
  </div>
  <div class="form-group">
    <label class="col-sm-4 control-label">비밀번호</label>
    <div class="col-sm-8">
      <input type="password" class="form-control" id="userPw" name="userPw" placeholder="패스워드">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-12">
      <input type="submit" id="loginBtn" class="col-sm-12 btn btn-lg btnl" value="로그인"/>
      <a id="userBtn" class="btn col-sm-5 btnl" href="signupForm">회원가입</a>
      <a id="userBtn" class="btn col-sm-5 btnl" href="find">ID/PW 찾기</a>
    </div>
  </div><br><br>
</form>
<%
	}else if(user.getClassCode()==1){ 
%>
<form class="form-horizontal">
  <div style="text-align: center; margin-bottom: 30px; margin-top: 20px;">
  	<h4 style="color:white;">
  		<span class="glyphicon glyphicon-user"></span> <%=user.getUserName() %> 회원님<br>
  		 반갑습니다
  	</h4>
  </div>
  <div class="col-sm-12">
      <a id="loginBtn" class="col-sm-12 btn btn-lg btnl">마이 페이지</a>
      <a id="loginBtn" class="col-sm-8 btn btnl" style="margin-left: 40px;" href="logOut">로그아웃</a>
    </div>
</form>
<%
	}else{ 
%>
<form class="form-horizontal">
  <div style="text-align: center; margin-bottom: 30px; margin-top: 20px;">
  	<h4 style="color:white;">
  		<span class="glyphicon glyphicon-wrench"></span> <%=user.getUserName() %> 님<br>
  		 반갑습니다
  	</h4>
  </div>
  <div class="col-sm-12">
      <a id="loginBtn" class="col-sm-12 btn btn-lg btnl">관리자 페이지</a>
      <a id="loginBtn" class="col-sm-8 btn btnl" style="margin-left: 40px;" href="logOut">로그아웃</a>
    </div>
</form>
<%
	} 
%>
<div id="loginBanner">
	<a href="http://www.visitkorea.or.kr/" target="_blank"><img src="<c:url value="/img/loginBanner1.jpg"/>" class="img-thumbnail"></a>
</div>
<div id="loginBanner">
	<a href="http://www.ex.co.kr/" target="_blank"><img id="loginBannerImg"src="<c:url value="/img/loginBanner2.jpg"/>" class="img-thumbnail"></a>
</div>

</div><!-- 컨테이너끝  -->

<div class="container">
	<div id="reco"><h2>추천 차량</h2>
	</div>
	<div id="recoContainer">
		<div class="row">
		    <div class="thumbnail">
		      <img id="recoImg" src="<c:url value="/img/모닝.gif"/>">
		      <div class="caption">
		        <h3>모닝</h3>
		        <b>1일(24시간)</b><p id="price">40,000원</p>
		        <p><a id="detailBtn" href="#" class="btn btn-default" role="button">상세보기</a></p>
		      </div>
		    </div>
		</div>
		<div class="row">
		    <div class="thumbnail">
		      <img id="recoImg" src="<c:url value="/img/프라이드.gif"/>">
		      <div class="caption">
		        <h3>프라이드</h3>
		        <b>1일(24시간)</b><p id="price">40,000원</p>
		        <p><a id="detailBtn" href="#" class="btn btn-default" role="button">상세보기</a></p>
		      </div>
		    </div>
		</div>
		<div class="row">
		    <div class="thumbnail">
		      <img id="recoImg" src="<c:url value="/img/아반떼.gif"/>">
		      <div class="caption">
		        <h3>아반떼</h3>
		        <b>1일(24시간)</b><p id="price">40,000원</p>
		        <p><a id="detailBtn" href="#" class="btn btn-default" role="button">상세보기</a></p>
		      </div>
		    </div>
		</div>
		<div class="row">
		    <div class="thumbnail">
		      <img id="recoImg" src="<c:url value="/img/k5.gif"/>">
		      <div class="caption">
		        <h3>K5</h3>
		        <b>1일(24시간)</b><p id="price">50,000원</p>
		        <p><a id="detailBtn" href="#" class="btn btn-default" role="button">상세보기</a></p>
		      </div>
		    </div>
		</div>
		<div class="row">
		    <div class="thumbnail">
		      <img id="recoImg" src="<c:url value="/img/yf소나타.gif"/>">
		      <div class="caption">
		        <h3>YF소나타</h3>
		        <b>1일(24시간)</b><p id="price">50,000원</p>
		        <p><a id="detailBtn" href="#" class="btn btn-default" role="button">상세보기</a></p>
		      </div>
		    </div>
		</div>
		<div class="row">
		    <div class="thumbnail">
		      <img id="recoImg" src="<c:url value="/img/제네시스.gif"/>">
		      <div class="caption">
		        <h3>제네시스</h3>
		        <b>1일(24시간)</b><p id="price">100,000원</p>
		        <p><a id="detailBtn" href="#" class="btn btn-default" role="button">상세보기</a></p>
		      </div>
		    </div>
		</div>
		<div class="row">
		    <div class="thumbnail">
		      <img id="recoImg" src="<c:url value="/img/아슬란.gif"/>">
		      <div class="caption">
		        <h3>아슬란</h3>
		        <b>1일(24시간)</b><p id="price">150,000원</p>
		        <p><a id="detailBtn" href="#" class="btn btn-default" role="button">상세보기</a></p>
		      </div>
		    </div>
		</div>
		<div class="row">
		    <div class="thumbnail">
		      <img id="recoImg" src="<c:url value="/img/BMW528.gif"/>">
		      <div class="caption">
		        <h3>BMW 528</h3>
		        <b>1일(24시간)</b><p id="price">200,000원</p>
		        <p><a id="detailBtn" href="#" class="btn btn-default" role="button">상세보기</a></p>
		      </div>
		    </div>
		  </div>
	</div>
</div>
</body>
<!-- 풋터 -->
<%@ include file="common/foot.jsp" %>
</html>