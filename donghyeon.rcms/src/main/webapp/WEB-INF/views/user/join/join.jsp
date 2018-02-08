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
	//아이디 유효성 검사
	var regexId = /^[a-z0-9_-]{4,16}$/;
	var regexPw = /^.*(?=.{8,16})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
	var regexHp = /^[0-9]{4}$/;
	//중복체크 확인
	var isId = false;
	
	//중복확인버튼클릭시
	$("#doublecheck2").bind("click",function(){
		$("#myModal").modal('show');
		$("#userId").val($("#userI").val());
		$.ajax({
			method:"POST",
			url: "doubleCheck",
			data : $("#userId").serialize(),
			success: function(msg){
				if(msg){
					if( !regexId.test($.trim($("#userId").val())) ){
						$("#msg").text("사용 불가능한 아이디입니다.");
					}else{
						$("#msg").text("사용 가능한 아이디 입니다.");
						$("#msg").append('<button type="button" id="use" class="btn btn-info" >사용하기</button>');
						$(":button#use").bind("click",function(){
							$("#userI").val($("#userId").val());
							$("#userI").attr("readonly",'');
							$("#myModal").modal('hide');
							isId=true;
						});
					}
				}else{
					$("#msg").text("이미 사용중인 아이디 입니다.");
				}
			}
		});
	});
	
	//모달창 중복확인버튼클릭
	$(":button#doubleCheck").bind("click",function(){
		$.ajax({
			method:"POST",
			url: "doubleCheck",
			data : $("#userId").serialize(),
			success: function(msg){
				if(msg){
					if( !regexId.test($.trim($("#userId").val())) ){
						$("#msg").text("사용 불가능한 아이디입니다.");
					}else{
						$("#msg").text("사용 가능한 아이디 입니다.");
						$("#msg").append('<button type="button" id="use" class="btn btn-info" >사용하기</button>');
						$(":button#use").bind("click",function(){
							$("#userI").val($("#userId").val());
							$("#userI").attr("readonly",'');
							$("#myModal").modal('hide');
							isId=true;
						});
					}
				}else{
					$("#msg").text("이미 사용중인 아이디 입니다.");
				}
			}
		});
	});
	
	//회원가입버튼클릭시 조건검사
	$("#join").bind("click",function(){
			$('font[name=errMsg]').text("");
		if(!isId){
			$('font[name=errMsg]').text("아이디 중복확인 버튼을 눌러주세요.");
		}else if( !regexPw.test($.trim($("#userPw").val())) ){
			$('font[name=errMsg]').text("비밀번호를 숫자, 문자 포함 8자 이상 16자 이하 설정해주세요.");
		}else if( $.trim($("#userPw").val()) != $.trim($("#userPwCheck").val()) ){
			$('font[name=errMsg]').text("비밀번호가 동일하지 않습니다.");
		}else if( $.trim($("#userName").val())=="" || $.trim($("#userHp2").val())=="" ||
				  $.trim($("#userHp3").val())=="" || $.trim($("#userEmail").val())==""){
			$('font[name=errMsg]').text("입력란을 모두입력해주세요.");
		}else if( !regexHp.test($.trim($("#userHp2").val())) || !regexHp.test($.trim($("#userHp3").val())) ){
			$('font[name=errMsg]').text("핸드폰 번호형식이 맞지않습니다.");
		}else{
			$("#joinHide").trigger("click");
		}
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
		    	<button type="button" id="doublecheck2" class="btn btn-default" >중복확인</button>
		    </div>
	    </div>
	    
	    <div class="form-group">
		    <label for="inputPassword" class="col-sm-2 control-label">비밀번호</label>
		    <div class="col-sm-6">
		    <input type="password" class="form-control" id="userPw" name="userPw" placeholder="비밀번호">
		    <p class="help-block">숫자, 문자 포함 8자 이상</p>
		    </div>
	    </div>
	    
       <div class="form-group">
		    <label for="inputPasswordCheck" class="col-sm-2 control-label">비밀번호 확인</label>
		    <div class="col-sm-6">
		    <input type="password" class="form-control" id="userPwCheck" name="userPwCheck" placeholder="비밀번호 확인">
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
    	<input type="text" class="form-control" id="userHp2" maxlength="4" name="userHp2">
    </div>
    <div class="col-sm-2">
    	<input type="text" class="form-control" id="userHp3" maxlength="4" name="userHp3">
    </div>
    </div>
    
    <div class="form-group">
	    <label for="inputNumberCheck" class="col-sm-2 control-label">이메일</label>
	    <div class="col-sm-6">
	    <input type="email" class="form-control" id="userEmail" name="userEmail" placeholder="이메일">
	    </div>
    </div>
    
    <div class="form-group">
     <font name="errMsg" size="3" color="red"></font>
      <center><button type="button" class="btn btn-primary" id="join" formaction="signupCheck">회원가입</button></center>
     <font size="3" color="red">${errMsg2 }</font>
    </div>
    <input type="submit" id="joinHide" formaction="signupCheck" style="display: none;"/>
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
					    <input type="text" class="form-control" id="userId" name="userId" placeholder="아이디"/>
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