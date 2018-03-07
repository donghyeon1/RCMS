<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>AwesomeCar Main</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>
@import url("<c:url value="/css/common.css"/>");
</style>
<script>
var carNum=0;
//숫자 3자리마다 콤마찍는함수
function addComma(num) {
     var regexp = /\B(?=(\d{3})+(?!\d))/g;
      return num.toString().replace(regexp, ',');
}

$(function(){
	var num = 0;
	var carouselBtn = $("#carouselBtn");
	var carouselDiv = "";
	var carouselList = $("#carouselList");
	$.ajax({
			method:"POST",
			url:"carouselList",
			success: function(carousels){
				for(num; num<$(carousels).length; num++){
					$("#carouselBtn").append("<li data-target='#myCarousel' data-slide-to='"+num+"'></li>");
				}
				
				$(carousels).each(function(idx, carousel){
					carouselList.append("<div class='item'>"
									+"<img src='<c:url value='/img/"+carousel.imgName+"'/>'>"
		            				+"</div>");
				});
				
				$(".item").first().addClass('active');
				carouselList.append(carouselDiv);
				
			     	}
	});
	
		$.ajax({
			url:"recommendList",
			method:"POST",
			success:function(cars){
				$(cars.recommendCar).each(function(idx, car){
					$("#recoContainer").append(
							"<div class='row'>"
							+"<div class='thumbnail'>"
							+"<img style='width:240px;; height:156px;' id='recoImg' src='<c:url value='/img/"+car.carImgName+"'/>'>"
							+"<div class='caption'>"
							+"<h3>"+car.carName+"</h3>"
							+"<b>1일(24시간)</b><p id='price'>"+addComma(car.carCharge)+"원</p>"
							+'<p><button name="carNum" value="'+car.carNum+'" id="detailBtn" class="btn btn-default"><span class="glyphicon glyphicon-search"></span>상세보기</button></p>'
							+"</div>"
							+"</div>"
							+"</div>")
				})
			}
		});
});

$(document).on('click','button[name="carNum"]',function(){
    $("#myModal").modal('show');
    carNum=$('button[name="carNum"]:hover').val();
    $("#modalBody").empty();
    $.ajax({
       url: "carDetail",
       method: "post",
       data: {carNum: carNum},
       success: function(reservInfo){
    	   var disableDate = "";
    	   var car = "";
    	   car = reservInfo.carInfo;
    	   disableDate = reservInfo.disableDate;
    	   
          $("#modalBody").append(
                '<div>'+
                '<div style="float: left; margin: 10px;">'+
                   '<img style="width:354px; height:234px;" src="<c:url value="/img/'+car.carImgName+'"/>" class="img-thumbnail">'+
                '</div>'+
                '<p>'+
                   '<b>차량명: </b> '+car.carName+'<br>'+
                   '<b>연&nbsp;비: </b>'+ car.carMileage+'<br>'+
                   '<b>연&nbsp;료: </b>'+ car.fuel+'<br>'+
                   '<b>제조사: </b>'+ car.maker+'<br>'+
                   '<b>색&nbsp;상: </b>'+ car.color+'<br>'+
                   '<b>요&nbsp;금: </b>'+ addComma(car.carCharge)+'원<br>'+
                '</p>'+
                '<form id="reservForm" method="post">'+
                '<div class="form-group">'+
                   '<input id="carNum" name="carNum" value="'+carNum+'" hidden/>'+
                   '<b>* 인수 날짜</b>'+
                   '<input id="reservDate" name="reservDate" type="text" placeholder="인수일을 선택하세요."/>'+
                   '<b>* 반납 날짜</b>'+
                   '<input id="returnDate" name="returnDate" type="text" placeholder="반납일을 선택하세요."/>'+
                   '<div  style="margin-top:37px; height:50px;">'+
                   '<span id="resultMsg" style="margin:17px 0px 0px 50px; float:left; color:red; "></span>'+
                      '<button class="btn btn-lg btn-info" type="button" id="reservBtn" style="float:right; margin-right:35px;"><span class="glyphicon glyphicon-time"></span>예약하기</button>'+
                   '</div>'+
                '</div>'+
                '</form>'+
             '</div>');
        
          $('#reservDate').datepicker({
              beforeShowDay: function(day) {
                  if(disableDate.indexOf($.datepicker.formatDate('yy-mm-dd', day)) != -1) return [false, "disableDate", "beforeShowDay로 블록"];
                  else return [true, "", ""];
              },
          altField : '#reservDate',
          dateFormat : 'yy-mm-dd',
          minDate: 0
          });
          
          $('#returnDate').datepicker({
              beforeShowDay: function(day) {
                  if(disableDate.indexOf($.datepicker.formatDate('yy-mm-dd', day)) != -1) return [false, "disableDate", "beforeShowDay로 블록"];
                  else return [true, "", ""];
              },
          altField : '#returnDate',
          dateFormat : 'yy-mm-dd',
          minDate: 0
          });
       }
    });
 });
 
$(document).on("click","#reservBtn", function(){
	if($("#reservDate").val()==""){
		$("#resultMsg").text("인수일을 선택하세요.");
		return false;
	}
	if($("#returnDate").val()==""){
		$("#resultMsg").text("반납일을 선택하세요.");
		return false;
	}
         var startDate = $("#reservDate").val();
         var endDate = $("#returnDate").val();
         //-을 구분자로 연,월,일로 잘라내어 배열로 반환
         var startArray = startDate.split('-');
         var endArray = endDate.split('-');   
         //배열에 담겨있는 연,월,일을 사용해서 Date 객체 생성
         var start_date = new Date(startArray[0], startArray[1], startArray[2]);
         var end_date = new Date(endArray[0], endArray[1], endArray[2]);
              //날짜를 숫자형태의 날짜 정보로 변환하여 비교한다.
         if(start_date.getTime() > end_date.getTime()) {
             $("#resultMsg").text("종료날짜보다 시작날짜가 작아야합니다.");
             return false;
         }

	var reservation = $("#reservForm").serialize();
    $.ajax({
       url: "carReservation",
       method: "post",
       data: reservation,
       success: function(msg){
    	   console.log(msg);
			switch(msg){
			case "noLogin": window.location.href = "login"; break;
			case "success": $("#check").modal('show');
						    $("#confirmBtn").attr("href",""); break;
			case "overLap": $("#resultMsg").text("예약 날짜가 중복 됩니다.");
			};
       }
    });
 });
</script>
</head>
<body>
<div class="container">
<!-- 헤더 -->
<%@ include file="common/head.jsp" %>

   <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators" id="carouselBtn">
      </ol>
      
      <div class="carousel-inner" id="carouselList">
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
      <a href="myPage" id="loginBtn" class="col-sm-12 btn btn-lg btnl">마이 페이지</a>
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
      <a id="loginBtn" class="col-sm-12 btn btn-lg btnl" href="adminMain">관리자 페이지</a>
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
	</div>
</div>
</body>
<!-- 풋터 -->
<%@ include file="common/foot.jsp" %>

<div class="modal fade" id="myModal">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h4 class="modal-title">상세보기</h4>
            </div>
            <div class="modal-body" id="modalBody">

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
					<center>
					<h4 class="modal-title">예약 성공</h4><br>
					</center>
					<a class="btn btn-default close" id="confirmBtn" type="submit">확인</a>
				</div>
			</div>
		</div>
	</div>	
</html>