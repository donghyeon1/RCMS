<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script>
$(function(){
	$(":button#doubleCheck").bind("click",function(){
		$.ajax({
			method:"POST",
			url: "doubleCheck",
			data : $("#userId").serialize(),
			success: function(msg){
				if(msg){
					$("#msg").text("사용 가능한 아이디 입니다.");
					$("#msg").append('<button type="button" id="use" class="btn btn-info" >사용하기</button>');
					$(":button#use").bind("click",function(){
						$("#userI").val($("#userId").val());
						$("#userI").attr("readonly",'');
						$("#myModal").modal('hide');
					});
				}else{
					$("#msg").text("이미 사용중인 아이디 입니다.");
				}
			}
		});
	});
});
</script>
<style>
 #logo{
   	font-size: 60px; color: #000;text-decoration: none;
   }
</style>
</head>
<center>
<div class="container">
 <div id="logoText">
          <a id="logo" href=".">
           AWESOME CAR♥
           </a>
    </div>

 <h1> 회원가입</h1><hr>
<div class="contentwrap">
  <article class="container">
    <form class="form-horizontal" method="post">
	    <div class="form-group">
		    <label for="userId" class="col-sm-2 control-label">아이디</label>
		    <div class="col-sm-6">
		    <input type="type" class="form-control" id="userI" name="userI" placeholder="아이디"/>
		    </div>
		    <div class="col-sm-1">
		    	<button type="button" data-toggle="modal" data-target="#myModal" class="btn btn-default" >중복확인</button>
		    </div>
	    </div>
	    
	    <div class="form-group">
		    <label for="inputPassword" class="col-sm-2 control-label">비밀번호</label>
		    <div class="col-sm-6">
		    <input type="password" class="form-control" name="userPw" placeholder="비밀번호">
		    <p class="help-block">숫자, 문자 포함 8자 이상</p>
		    </div>
	    </div>
	    
       <div class="form-group">
		    <label for="inputPasswordCheck" class="col-sm-2 control-label">비밀번호 확인</label>
		    <div class="col-sm-6">
		    <input type="password" class="form-control" id="inputPasswordCheck" name="userPwCheck" placeholder="비밀번호 확인">
		      <p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
		    </div>
	   </div>
    
	    <div class="form-group">
		    <label for="userName" class="col-sm-2 control-label">이름</label>
		    <div class="col-sm-6">
		    <input type="text" class="form-control" id="userName" name="userName"placeholder="이름">
		    </div>
	    </div>
    
    <div class="form-group">
    	<label for="inputNumber" class="col-sm-2 control-label">휴대폰번호</label>
    <div class="col-sm-2">
    <select class="form-control" name="userHp1">
    	<option>010</option>
    	<option>011</option>
    	<option>017</option>
    	<option>018</option>
    </select>
    </div>
    <div class="col-sm-2">
    	<input type="text" class="form-control" name="userHp2">
    </div>
    <div class="col-sm-2">
    	<input type="text" class="form-control" name="userHp3">
    </div>
    </div>
    
    <div class="form-group">
	    <label for="inputNumberCheck" class="col-sm-2 control-label">이메일</label>
	    <div class="col-sm-6">
	    <input type="email" class="form-control" id="inputNumberCheck" name="userEmail" placeholder="이메일">
	    </div>
    </div>
    
    <div class="form-group">
    <h4 style="color:red;">${requestScope.error }</h4>
      <center><button type="submit" class="btn btn-primary" formaction="signupCheck">회원가입</button></center>
    </div>
    
    </form>
  </article>
</div>
</center>
</div>

	<div class="modal fade" id="myModal">
		<div class="modal-dialog" style="width: 500px; height: 200px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<div class="form-group">
					    <label for="userId" class="col-sm-2 control-label">아이디</label>
					    <div class="col-sm-6">
					    <input type="type" class="form-control" id="userId" name="userId" placeholder="아이디"/>
					    </div>
					    <div class="col-sm-1">
					    	<button type="button" id="doubleCheck" class="btn btn-default" >중복확인</button>
					    </div>
					    <div class="col-sm-6">
					    	<p style="color:red; padding-left: 20px;" id="msg"></p>
					    </div>
				    </div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>