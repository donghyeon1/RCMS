<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>ID/PW 찾기</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
<style>
 @import url("<c:url value="/css/userFind.css"/>"); 
</style>
</head>
<body>
<div class="container">
	<a id="topLogin" href=".">로그아웃</a>
 	<div id="logoText">
          <a id="logo" href=".">
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

<div id="findUser">
	<div id="findId">
		<span style="width:400px; margin-top: 30px;font-size: 20px; text-align: center;">아이디를 잊으셨나요?</span>
		<div class="findBtn">
			<p>가입 시 입력한 이름과 핸드폰번호를 이용하여 ID를 찾습니다.</p>
			<a data-toggle="modal" href="#myModa" class="btn btn-default">아이디 찾기</a>
		</div>
	</div>
	
	<div id="findPw">
		<span style="width:400px; margin-top: 30px;font-size: 20px; text-align: center;">비밀번호를 잊으셨나요?</span>
		<div class="findBtn">
			<p>가입 시 입력한 이름과 핸드폰번호를 이용하여 ID를 찾습니다.</p>
			<a data-toggle="modal" href="#myMod" class="btn btn-default">비밀번호 찾기</a>
		</div>
	</div>
</div>
</div><!-- 컨테이너끝  -->
<!-- 아이디모달 -->
	<div class="modal fade" id="myModa">
      <div class="modal-dialog">
         <div class="modal-content" style="width: 300px; height: 300px;">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h4 class="modal-title">아이디 찾기</h4>
            </div>
	        <div class="modal-body" style="height: 300px;">
		        <form>
  				<div class="form-group">
		              이름:<br>
		              <input type="text" placeholder="이름을 입력하세요" class="form-control"/>
		        </div>
		        <div class="form-group">
		              핸드폰 번호:<br>
		              <input type="number" placeholder="-를 빼고 입력하세요" class="form-control"/>
		        </div>
		        <a data-toggle="modal" href="#myMo" class="btn btn-default" style="margin-top: 20px;">아이디 찾기</a>
		        </form>
	        </div>
        </div>
     </div>
   </div>
 
 <!-- 비밀번호 모달 -->
	<div class="modal fade" id="myMod">
      <div class="modal-dialog">
         <div class="modal-content" style="width: 300px; height: 300px;">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h4 class="modal-title">비밀번호 찾기</h4>
            </div>
	        <div class="modal-body" style="height: 300px;">
		        <form>
  				<div class="form-group">
		              아이디:<br>
		              <input type="text" placeholder="아이디를 입력하세요" class="form-control"/>
		        </div>
		        <div class="form-group">
		              핸드폰 번호:<br>
		              <input type="number" placeholder="-를 빼고 입력하세요" class="form-control"/>
		        </div>
		        <a data-toggle="modal" href="#myMo" class="btn btn-default" style="margin-top: 20px;">비밀번호 찾기</a>
		        </form>
	        </div>
        </div>
     </div>
   </div>
   
   <!-- 확인 모달 -->
	<div class="modal fade" id="myMo">
      <div class="modal-dialog">
         <div class="modal-content" style="width: 300px; height: 300px;">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h4 class="modal-title"><span class="glyphicon glyphicon-envelope"></span> 확인</h4>
            </div>
	        <div class="modal-body" style="height: 300px;">
		        <p> 입력하신 정보로 아이디/비밀번호를 문자발송하였습니다.</p>
		        <p> 확인후 로그인 하여주십시오.</p>
		        <a href="01.html" class="btn btn-info">확인</a>
	        </div>
        </div>
     </div>
   </div>
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