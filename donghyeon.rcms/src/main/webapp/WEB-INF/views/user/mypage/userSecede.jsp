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
<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
<style>
@import url("<c:url value="/css/myPage.css"/>");
@import url("<c:url value="/css/comeon.css"/>");
</style>
<script>
var regexPw = /^.*(?=.{8,16})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;


$(function(){
	$("#secedeBtn").bind("click",function(){
	if(!regexPw.test($.trim($("#password").val())) ){
		$("#msg").text("비밀번호 양식이 아닙니다.");
	}else{
			      $.ajax({
			    	 method:"POST",
			         url: "userSecede",
			         data : {
			        	 userPw:$("#password").val(),
			         },
			         success: function(result){
			        	$("#confirmBtn").attr("data-dismiss","");
			        	$("#confirmBtn").attr("href","main");
						switch(result){
						case "secedeSuccess": $("#msg").text("탈퇴 완료 이용해주셔서 감사합니다.");
											  $("#confirmBtn").attr("data-dismiss","");
											  $("#confirmBtn").attr("href","/");
						case "secedeFail": $("#msg").text("탈퇴 실패: 비밀번호가 틀립니다.");
						};
			         }
			      });
	}
	   });
	
})
</script>
</head>
<body>
<div class="container">
<%@ include file="../../common/head.jsp" %>
<div class="title">
	<h3>마이페이지</h3>
</div>
<center><div id="comeon"><span class="glyphicon glyphicon-list-alt"></span><h3>회원탈퇴</h3></div></center>
<div id="subMenu">
<ul>
	<li><a href="myPage">개인정보관리</a></li>
	<li><a href="04.html">예약 관리</a></li>
	<li><a href="03.html">회원 탈퇴</a></li>
</ul>
</div>

<div id="contentDiv">
		<table id="infoTable">
			<tbody>
			
			<tr>
			<th>이름</th>
			<td><%=user.getUserName()%></td>
			</tr>
	
			<tr>
			<th>아이디</th>
			<td><%=user.getUserId()%></td>
			</tr>
			
			<tr>
			<th>E-MAIL</th>
			<td><%=user.getUserEmail()%></td>
			</tr>
			
			<tr>
			<th>핸드폰</th>
			<td><%=user.getUserHp()%></td>
			</tr>			
			</tbody>			
		</table>
		
		<div id="secedeDiv">
        <a data-toggle="modal" href="#secedeModal" class="btn btn-primary">회원탈퇴</a>
        <div class="row 2nd">
        <center>
 
        </div>
      </div>
      </senter>
        <!-- first modal -->
<div class="modal fade" id="secedeModal">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">회원 탈퇴</h4>
				</div>
				<div class="modal-body">
					<form class="signin">
					        <fieldset class="textbox">
					        <label class="password">
					        <span>비밀번호</span>
					        <input id="password" name="password" value="" type="password" placeholder="비밀번호를 입력하세요">
					        </label>
					        <button type="button" class="btn btn-default" id="secedeBtn"  data-toggle="modal" data-target="#check">탈퇴</button>
					        </fieldset>
					  </form>
				</div>
			</div>
		</div>
	</div>
  </div>
    
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