<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>AwesomeCar Main</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
<style>
@import url("<c:url value="/css/myPage.css"/>");
@import url("<c:url value="/css/comeon.css"/>");
</style>
<script>
var regexPw = /^.*(?=.{8,16})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
var regexEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
var regexHp = /^[0-9]{4}$/;

$(function(){
	   $("#modifyPwBtn").bind("click",function(){
		   if( !regexPw.test($.trim($("#password").val())) ){
		         $("#msg").text("비밀번호를 숫자, 문자 포함 8자 이상 16자 이하 설정해주세요.");
		      }else if( $.trim($("#password").val()) != $.trim($("#passwordChk").val()) ){
		         $("#msg").text("비밀번호가 동일하지 않습니다.");
		      }else{ 
			      $.ajax({
			    	 method:"POST",
			         url: "myPageModifyPw",
			         data : {
			        	 userPw:$("#password").val(),
			         },
			         success: function(msg){
			        	$("#confirmBtn").attr("data-dismiss","");
			        	$("#confirmBtn").attr("href","myPage");
						switch(msg){
						case "success": $("#msg").text("변경 완료"); break;
						case "err": $("#msg").text("변경 실패")
						};
			         }
			      });
		      }
	   });
	   
	  
	   $("#modifyEmailBtn").bind("click",function(){
		   if( !regexEmail.test($.trim($("#email").val())) ){
		         $("#msg").text("올바른 이메일 주소를 입력하세요.");
		      }else{ 
			      $.ajax({
			    	 method:"POST",
			         url: "myPageModifyEmail",
			         data : {
			        	 userEmail:$("#email").val(),
			         },
			         success: function(msg){
			        	$("#confirmBtn").attr("data-dismiss","");
			        	$("#confirmBtn").attr("href","myPage");
						switch(msg){
						case "success": $("#msg").text("변경 완료"); break;
						case "err": $("#msg").text("변경 실패")
						};
			         }
			      });
		      }
	   });
	   
	   
	   $("#modifyHpBtn").bind("click",function(){
		   if(!regexHp.test($.trim($("#userHp2").val())) || !regexHp.test($.trim($("#userHp3").val()))){
		         $("#msg").text("올바른 핸드폰번호를 입력하세요.");
		   }else{ 
			      $.ajax({
			    	 method:"POST",
			         url: "myPageModifyHp",
			         data : {
			        	 userHp:$("#userHp1").val()+"-"+$("#userHp2").val()+"-"+$("#userHp3").val()
			         },
			         success: function(msg){
			        	$("#confirmBtn").attr("data-dismiss","");
			        	$("#confirmBtn").attr("href","myPage");
						switch(msg){
						case "success": $("#msg").text("변경 완료"); break;
						case "err": $("#msg").text("변경 실패")
						};
			         }
			      });
		      }
	   });
	});
	
</script>
</head>
<body>
<div class="container">
	<%@ include file="../../common/head.jsp" %>
<div class="title">
	<h3>마이페이지</h3>
</div>
<center><div id="comeon"><span class="glyphicon glyphicon-list-alt"></span><h3>개인정보관리</h3></div></center>
<div id="subMenu">
<ul>
	<li><a href="myPage">개인정보관리</a></li>
	<li><a href="userReservPage">예약 관리</a></li>
	<li><a href="userSecedePage">회원 탈퇴</a></li>
</ul>
</div>

<div id="contentDiv">
		<table id="infoTable">
			<tbody>
			
			<tr>
			<th>이름</th>
			<td><%=user.getUserName() %></td>
			</tr>
	
			<tr>
			<th>아이디</th>
			<td><%=user.getUserId() %></td>
			</tr>
			
			<tr>
			<th>비밀번호 변경</th>
			<td><button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#pwModal">변경</button></td>
			</tr>
			
			<tr>
			<th>E-MAIL</th>
			<td><%=user.getUserEmail() %> <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#emailModal">변경</button></td>
			</tr>
			
			<tr>
			<th>핸드폰</th>
			<td><%=user.getUserHp() %> <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#hpModal">변경</button></td>
			</tr>
			</tbody>
		</table>
</div>

<!-- 비번 모달 -->
	<div class="modal fade" id="pwModal">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">비밀번호 변경</h4>
				</div>
				<div class="modal-body">
					<form class="signin">
					        <fieldset class="textbox">
					        <label class="userName">
					        <span>비밀번호</span>
					        <input id="password" name="password" value="" type="password" placeholder="비밀번호를 입력하세요">
					        </label>
					        <label class="phoneNum">
					        <span>비밀번호 확인</span>
					        <input id="passwordChk" name="passwordChk" type="password" placeholder="한번 더 입력하세요">
					        </label>
					        <button type="button" class="btn btn-default" id="modifyPwBtn"  data-toggle="modal" data-target="#check">변경</button>
					        </fieldset>
					  </form>
				</div>
			</div>
		</div>
	</div>
	
<!-- 이메일 모달 -->
	<div class="modal fade" id="emailModal">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">이메일 변경</h4>
				</div>
				<div class="modal-body">
					<form class="signin">
				        <fieldset class="textbox">
				        <label class="email">
				        <span>E-MAIL</span>
				        <input id="email" name="email" type="email" placeholder="E-MAIL을 입력하세요.">
				        </label>
				        <button type="button" class="btn btn-default" id="modifyEmailBtn" data-toggle="modal" data-target="#check">변경</button>
				        
				        </fieldset>
				 	</form>
				</div>
			</div>
		</div>
	</div>
	
<!-- 핸드폰 모달 -->
	<div class="modal fade" id="hpModal">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">핸드폰번호 변경</h4>
				</div>
				<div class="modal-body">
					<form class="signin">
				        <fieldset class="textbox">
				        <label class="userPh">
				        <span>핸드폰 번호</span>
				        <select class="form-control" name="userHp1" id="userHp1">
					       <option>010</option>
					       <option>011</option>
					       <option>017</option>
					       <option>018</option>
					    </select>
					    <input type="text" class="form-control" id="userHp2" maxlength="4" name="userHp2" style="background-color: white; width: 70px; border:1px solid #ccc; margin-left: 5px; color:black;">
					    <input type="text" class="form-control" id="userHp3" maxlength="4" name="userHp3" style="background-color: white; width: 70px; border:1px solid #ccc; margin-left: 5px; color:black;">
				        </label>
				        <button type="button" class="btn btn-default" id="modifyHpBtn" data-toggle="modal" data-target="#check">변경</button>
				        </fieldset>
				 	</form>
				</div>
			</div>
		</div>
	</div>
		
<!-- 확인 모달 -->
	<div class="modal fade" id="check">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" id="msg"></h4><br>
					<a class="btn btn-default" id="confirmBtn" data-dismiss="modal">확인</a>
				</div>
			</div>
		</div>
	</div>		
</div><!-- 컨테이너끝  -->
</body>
<%@ include file="../../common/foot.jsp" %>
</html>