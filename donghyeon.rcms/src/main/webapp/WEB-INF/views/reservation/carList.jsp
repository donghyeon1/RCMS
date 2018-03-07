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
@import url("<c:url value="/css/common2.css"/>");
@import url("<c:url value="/css/comeon.css"/>");
</style>
</head>
<body>
<div class="container">
	<%@ include file="../common/head.jsp" %>
<script>
$(function(){
	
	//상세보기 카넘버
	var carNum=0;
	
	//숫자 3자리마다 콤마찍는함수
	function addComma(num) {
		  var regexp = /\B(?=(\d{3})+(?!\d))/g;
		   return num.toString().replace(regexp, ',');
	}
	
	//소형차 클릭시
	$("#small").on("click",function(){
		$.ajax({
			url: "carTypes",
			data: {typeNum: 1},
			success: function(cars){
				$("#carContent").empty();
				$(cars).each(function(idx, car){
					$("#carContent").append(
							'<div style="height: 260px; width: 900px;">'+
							'<div style="float: left; margin: 10px;">'+
								'<img style="width:360px; height:240px;" src="<c:url value="/img/'+car.carImgName+'"/>" class="img-thumbnail">'+
							'</div>'+
							'<div style="float: left; width: 400px; margin: 10px 20px;">'+
								'<p style="font-size:60px;">'+car.carName+'</p>'+
							'</div>'+
							'<div style="float: left; margin: 10px;">'+
								'<table class="table table-striped">'+
					  				'<tr>'+
					  					'<th>1일(24시간) 요금</th>'+
					  				'</tr>'+
					  				'<tr>'+
					  					'<td>'+addComma(car.carCharge)+'원</td>'+
					  				'</tr>'+
								'</table>'+
							'</div>'+
							'<div>'+
								'<button name="carNum" value="'+car.carNum+'" class="btn btn-lg btn-info" style="margin: 20px 0 0 50px;"><span class="glyphicon glyphicon-search"></span>상세보기</button>'+
							'</div>'+
						'</div>');
				});
			}
		});
	});
	
	//중형차 클릭시
	$("#middle").on("click",function(){
		$.ajax({
			url: "carTypes",
			data: {typeNum: 2},
			success: function(cars){
				$("#carContent").empty();
				$(cars).each(function(idx, car){
					$("#carContent").append(
							'<div style="height: 260px; width: 900px;">'+
							'<div style="float: left; margin: 10px;">'+
								'<img style="width:360px; height:240px;" src="<c:url value="/img/'+car.carImgName+'"/>" class="img-thumbnail">'+
							'</div>'+
							'<div style="float: left; width: 400px; margin: 10px 20px;">'+
								'<p style="font-size:60px;">'+car.carName+'</p>'+
							'</div>'+
							'<div style="float: left; margin: 10px;">'+
								'<table class="table table-striped">'+
					  				'<tr>'+
					  					'<th>1일(24시간) 요금</th>'+
					  				'</tr>'+
					  				'<tr>'+
					  					'<td>'+addComma(car.carCharge)+'원</td>'+
					  				'</tr>'+
								'</table>'+
							'</div>'+
							'<div>'+
								'<button name="carNum" value="'+car.carNum+'" class="btn btn-lg btn-info" style="margin: 20px 0 0 50px;"><span class="glyphicon glyphicon-search"></span>상세보기</button>'+
							'</div>'+
						'</div>');
				});
			}
		});
	});
	
	//대형차 클릭시
	$("#big").on("click",function(){
		$.ajax({
			url: "carTypes",
			data: {typeNum: 3},
			success: function(cars){
				$("#carContent").empty();
				$(cars).each(function(idx, car){
					$("#carContent").append(
							'<div style="height: 260px; width: 900px;">'+
							'<div style="float: left; margin: 10px;">'+
								'<img style="width:360px; height:240px;" src="<c:url value="/img/'+car.carImgName+'"/>" class="img-thumbnail">'+
							'</div>'+
							'<div style="float: left; width: 400px; margin: 10px 20px;">'+
								'<p style="font-size:60px;">'+car.carName+'</p>'+
							'</div>'+
							'<div style="float: left; margin: 10px;">'+
								'<table class="table table-striped">'+
					  				'<tr>'+
					  					'<th>1일(24시간) 요금</th>'+
					  				'</tr>'+
					  				'<tr>'+
					  					'<td>'+addComma(car.carCharge)+'원</td>'+
					  				'</tr>'+
								'</table>'+
							'</div>'+
							'<div>'+
								'<button name="carNum" value="'+car.carNum+'" class="btn btn-lg btn-info" style="margin: 20px 0 0 50px;"><span class="glyphicon glyphicon-search"></span>상세보기</button>'+
							'</div>'+
						'</div>');
				});
			}
		});
	});
	
	//수입차 클릭시
	$("#foreign").on("click",function(){
		$.ajax({
			url: "carTypes",
			data: {typeNum: 4},
			success: function(cars){
				$("#carContent").empty();
				$(cars).each(function(idx, car){
					$("#carContent").append(
							'<div style="height: 260px; width: 900px;">'+
							'<div style="float: left; margin: 10px;">'+
								'<img style="width:360px; height:240px;" src="<c:url value="/img/'+car.carImgName+'"/>" class="img-thumbnail">'+
							'</div>'+
							'<div style="float: left; width: 400px; margin: 10px 20px;">'+
								'<p style="font-size:60px;">'+car.carName+'</p>'+
							'</div>'+
							'<div style="float: left; margin: 10px;">'+
								'<table class="table table-striped">'+
					  				'<tr>'+
					  					'<th>1일(24시간) 요금</th>'+
					  				'</tr>'+
					  				'<tr>'+
					  					'<td>'+addComma(car.carCharge)+'원</td>'+
					  				'</tr>'+
								'</table>'+
							'</div>'+
							'<div>'+
								'<button name="carNum" value="'+car.carNum+'" class="btn btn-lg btn-info" style="margin: 20px 0 0 50px;"><span class="glyphicon glyphicon-search"></span>상세보기</button>'+
							'</div>'+
						'</div>');
				});
			}
		});
	});
	
//상세보기
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
                   '<img style="width:360px; height:234px;" src="<c:url value="/img/'+car.carImgName+'"/>" class="img-thumbnail">'+
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
	<% if(user==null){ %>
	$("#resultMsg").text("로그인이 필요합니다.");
	return false;
	<% } %>
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
	//페이지 로딩시
	$("#small").trigger("click");
});
</script>	
	
<center>
<div id="comeon"><span class="glyphicon glyphicon-road"></span><h3>실시간 예약</h3></div>

<!--  차종 메뉴  -->
    <div class="btn-group" id="carTypeMenu" style="margin: 40px 0 40px 0;">
		<a id="small" class="btn btn-default" style="width: 150px;">소형차</a>
		<a id="middle" class="btn btn-default" style="width: 150px;">중형차</a>
		<a id="big" class="btn btn-default" style="width: 150px;">대형차</a>
		<a id="foreign" class="btn btn-default" style="width: 150px;">수입차</a>
	</div>
</center>

<div id="carContent">
	
     
</div>

     <!-- 예약모달 -->
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