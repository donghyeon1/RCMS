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
<script>
$(function(){
	//정보입력후 아이디찾기버튼클릭
	$("#findById").bind("click",function(){
		$.ajax({
			method:"POST",
			url: "findId",
			data : {
				userName: $("#userName").val(),
				userEmail: $("#userEmail").val()
			},
			success: function(msg){
				if(msg){
					$("#msg").text("가입하신 이메일로 비밀번호를 발송해드렸습니다. 확인후 로그인 하여주십시오.");
					$("#result").attr("data-dismiss","");
					$("#result").attr("href",".");
				}else{
					$("#msg").text("입력하신 정보로 가입한 회원을 찾을수 없습니다.");
					$("#result").attr("data-dismiss","modal");
					$("#result").attr("href","");
				}
			}
		});
	});
	
	//정보입력후 비밀번호찾기버튼클릭
	$("#findByPw").bind("click",function(){
		$.ajax({
			method:"POST",
			url: "findPw",
			data : {
				userId: $("#userId").val(),
				userEmail2: $("#userEmail2").val()
			},
			success: function(msg){
				console.log(msg);
				if(msg){
					$("#msg").text("가입하신 이메일로 비밀번호를 발송해드렸습니다. 확인후 로그인 하여주십시오.");
					$("#result").attr("data-dismiss","");
					$("#result").attr("href",".");
				}else{
					$("#msg").text("입력하신 정보로 가입한 회원을 찾을수 없습니다.");
					$("#result").attr("data-dismiss","modal");
					$("#result").attr("href","");
				}
			}
		});
	});
	
	//모달확인버튼클릭시 메세지초기화
	$("#result").bind("click",function(){
		$("#msg").text("요청 처리중입니다, 잠시만 기다려주세요.");
	});
});
</script>
<style>
 @import url("<c:url value="/css/userFind.css"/>"); 
</style>
</head>
<body>
<div class="container">
<%@ include file="../../common/head.jsp" %>

<div id="findUser">
	<div id="findId">
		<span style="width:400px; margin-top: 30px;font-size: 20px; text-align: center;">아이디를 잊으셨나요?</span>
		<div class="findBtn">
			<p>가입 시 입력한 이름과 E-Mail을 이용하여 ID를 찾습니다.</p>
			<a data-toggle="modal" href="#myModa" class="btn btn-default">아이디 찾기</a>
		</div>
	</div>
	
	<div id="findPw">
		<span style="width:400px; margin-top: 30px;font-size: 20px; text-align: center;">비밀번호를 잊으셨나요?</span>
		<div class="findBtn">
			<p>가입 시 입력한 아이디와 E-Mail을 이용하여 비밀번호를 찾습니다.</p>
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
  				<div class="form-group">
		              이름:<br>
		              <input type="type" class="form-control" id="userName" name="userName" placeholder="이름을 입력하세요."/>
		        </div>
		        <div class="form-group">
		              E-Mail 주소:<br>
		              <input type="email" name="userEmail" id="userEmail" placeholder="이메일 주소를 입력하세요" class="form-control"/>
		        </div>
		        <a data-toggle="modal" href="#myMo" class="btn btn-default" id="findById" style="margin-top: 20px;">아이디 찾기</a>
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
		              <input type="text" placeholder="아이디를 입력하세요" name="userId" id="userId" class="form-control"/>
		        </div>
		        <div class="form-group">
		              E-Mail 주소:<br>
		              <input type="email" name="userEmail2" id="userEmail2" placeholder="이메일 주소를 입력하세요" class="form-control"/>
		        </div>
		        <a data-toggle="modal" href="#myMo" class="btn btn-default" id="findByPw" style="margin-top: 20px;">비밀번호 찾기</a>
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
		        <p id="msg">요청 처리중입니다, 잠시만 기다려주세요.</p>
		        <a data-dismiss="modal" class="btn btn-info" id="result">확인</a>
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