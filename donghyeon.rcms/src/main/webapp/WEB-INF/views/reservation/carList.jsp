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
<script>
$(document).ready(function(){
	$("#page").bind("click",function(){
		location.href="05.html";
	});
});
</script>
<style>
@import "../res/css/common2.css";
@import "../res/css/comeon.css";
</style>
</head>
<body>
<div class="container">
	<a id="topLogin" href="../login/01.html">로그인</a>
 	<div id="logoText">
          <a id="logo" href="../main.html">
           AWESOME CAR♥
           </a>
    </div>
   
   
 <nav class="navbar navbar-inverse">
   <div class="container-fluid">
      <ul class="nav navbar-nav">
         <li class="dropdown">
            <a href="../introduction/01.html">회사 소개</a>
               <ul class="dropdown-menu" id="ul1">
                  <li><a href="../introduction/01.html">오시는길</a></li>
                  <li><a href="../introduction/02.html">인사말</a></li>
               </ul>
         </li>
         <li class="dropdown">
            <a href="../guide/01.html">대여 가이드</a>
               <ul class="dropdown-menu" id="ul2">
                  <li><a href="../guide/01.html">렌트안내</a></li>
                  <li><a href="../guide/02.html">보험및유의사항</a></li>
               </ul>
         </li>
         <li class="dropdown">
            <a href="../reservation/01.html">실시간 예약</a>
         </li>
         <li class="dropdown">
            <a href="../review/01.html">고객센터</a>
               <ul class="dropdown-menu" id="ul4">
                  <li><a href="../review/01.html">이용후기</a></li>
                  <li><a href="../qna/01.html">Q&A</a></li>
               </ul>
         </li>
      </ul>
   </div>
</nav>
<center><div id="comeon"><span class="glyphicon glyphicon-road"></span><h3>실시간 예약</h3></div></center>
<!--  여기부터 컨텐츠 내용  -->
    <div class="btn-group" id="carTypeMenu" style="margin: 30px 0 30px 100px;">
		<a href="01.html" class="btn btn-default" style="width: 150px;">소형차</a>
		<a href="02.html" class="btn btn-default" style="width: 150px;">중형차</a>
		<a href="03.html" class="btn btn-default" style="width: 150px;">대형차</a>
		<a href="04.html" class="btn btn-default" style="width: 150px;">수입차</a>
	</div>
	
	<div style="height: 260px; width: 900px;">
		<div style="float: left; margin: 10px;">
			<img src="../res/img/모닝.gif" class="img-thumbnail">
		</div>
		<div style="float: left; width: 400px; margin: 10px 20px;">
			<p style="font-size:60px;">모닝</p>
		</div>
		<div style="float: left; margin: 10px;">
			<table class="table table-striped">
  				<tr>
  					<th>1일(24시간) 요금</th>
  				</tr>
  				<tr>
  					<td>40,000원</td>
  				</tr>
			</table>
		</div>
		<div>
			<a href="#" class="btn btn-lg btn-info" data-toggle="modal" data-target="#myModal" style="margin: 20px 0 0 50px;"><span class="glyphicon glyphicon-search"></span>상세보기</a>
		</div>
	</div>
     
    <div style="height: 260px; width: 900px;">
		<div style="float: left; margin: 10px;">
			<img src="../res/img/레이.gif" class="img-thumbnail">
		</div>
		<div style="float: left; width: 400px; margin: 10px 20px;">
			<p style="font-size:60px;">레이</p>
		</div>
		<div style="float: left; margin: 10px;">
			<table class="table table-striped">
  				<tr>
  					<th>1일(24시간) 요금</th>
  				</tr>
  				<tr>
  					<td>40,000원</td>
  				</tr>
			</table>
		</div>
		<div>
			<a href="#" class="btn btn-lg btn-info" data-toggle="modal" data-target="#myModal" style="margin: 20px 0 0 50px;"><span class="glyphicon glyphicon-search"></span>상세보기</a>
		</div>
	</div>
	
	<div style="height: 260px; width: 900px;">
		<div style="float: left; margin: 10px;">
			<img src="../res/img/i30.gif" class="img-thumbnail">
		</div>
		<div style="float: left; width: 400px; margin: 10px 20px;">
			<p style="font-size:60px;">i30</p>
		</div>
		<div style="float: left; margin: 10px;">
			<table class="table table-striped">
  				<tr>
  					<th>1일(24시간) 요금</th>
  				</tr>
  				<tr>
  					<td>40,000원</td>
  				</tr>
			</table>
		</div>
		<div>
			<a href="#" class="btn btn-lg btn-info" data-toggle="modal" data-target="#myModal" style="margin: 20px 0 0 50px;"><span class="glyphicon glyphicon-search"></span>상세보기</a>
		</div>
	</div>
	
	<div style="height: 260px; width: 900px;">
		<div style="float: left; margin: 10px;">
			<img src="../res/img/아반떼.gif" class="img-thumbnail">
		</div>
		<div style="float: left; width: 400px; margin: 10px 20px;">
			<p style="font-size:60px;">아반떼</p>
		</div>
		<div style="float: left; margin: 10px;">
			<table class="table table-striped">
  				<tr>
  					<th>1일(24시간) 요금</th>
  				</tr>
  				<tr>
  					<td>40,000원</td>
  				</tr>
			</table>
		</div>
		<div>
			<a href="#" class="btn btn-lg btn-info" data-toggle="modal" data-target="#myModal" style="margin: 20px 0 0 50px;"><span class="glyphicon glyphicon-search"></span>상세보기</a>
		</div>
	</div>
	
	<div style="height: 260px; width: 900px;">
		<div style="float: left; margin: 10px;">
			<img src="../res/img/K3.gif" class="img-thumbnail">
		</div>
		<div style="float: left; width: 400px; margin: 10px 20px;">
			<p style="font-size:60px;">K3</p>
		</div>
		<div style="float: left; margin: 10px;">
			<table class="table table-striped">
  				<tr>
  					<th>1일(24시간) 요금</th>
  				</tr>
  				<tr>
  					<td>40,000원</td>
  				</tr>
			</table>
		</div>
		<div>
			<a href="#" class="btn btn-lg btn-info" data-toggle="modal" data-target="#myModal" style="margin: 20px 0 0 50px;"><span class="glyphicon glyphicon-search"></span>상세보기</a>
		</div>
	</div>
	
	<div style="height: 260px; width: 900px;">
		<div style="float: left; margin: 10px;">
			<img src="../res/img/프라이드.gif" class="img-thumbnail">
		</div>
		<div style="float: left; width: 400px; margin: 10px 20px;">
			<p style="font-size:60px;">프라이드</p>
		</div>
		<div style="float: left; margin: 10px;">
			<table class="table table-striped">
  				<tr>
  					<th>1일(24시간) 요금</th>
  				</tr>
  				<tr>
  					<td>40,000원</td>
  				</tr>
			</table>
		</div>
		<div>
			<a href="#" class="btn btn-lg btn-info" data-toggle="modal" data-target="#myModal" style="margin: 20px 0 0 50px;"><span class="glyphicon glyphicon-search"></span>상세보기</a>
		</div>
	</div>
     
     <!-- 예약모달 -->
     <div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">상세보기</h4>
				</div>
				<div class="modal-body">
					<div>
						<div style="float: left; margin: 10px;">
							<img src="../res/img/프라이드.gif" class="img-thumbnail">
						</div>
						<p>
							<b>차량명: </b> 프라이드<br>
							<b>차&nbsp;종: </b> 소형<br>
							<b>연&nbsp;비: </b> 13.3km/ℓ~19.0km/ℓ<br>
							<b>연&nbsp;료: </b> 가솔린<br>
							<b>제조사: </b> 기아<br>
							<b>색&nbsp;상: </b> 블루<br>
							<b>요&nbsp;금: </b> 40,000 원<br>
						</p>
						<form>
						<div class="form-group">
							<b>*인수 날짜</b>
							<input type="date"/>
							<b>*반납 날짜</b>
							<input type="date"/>
							<div>
								<a id="page" href="05.html" onclick="urlPage" class="btn btn-lg btn-info" data-toggle="modal" data-target="#myModal" style="margin: 20px 0 0 50px;"><span class="glyphicon glyphicon-time"></span>예약하기</a>
							</div>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</div><!-- 컨테이너 -->
</body>
<footer>
<div id="footer" class="container">	
   <div id="footerContent">
	   Copyright ⓒ awesomerentcar.com All rights reserved.<br>
	   서울특별시 구로구  구로동 182-13<br>
	   전화번호 : 010-4703-6105 | 사업자등록번호 : 111-22-33333 │ 개인정보관리책임: 김동현
   </div>
</div>
</footer>
</html>