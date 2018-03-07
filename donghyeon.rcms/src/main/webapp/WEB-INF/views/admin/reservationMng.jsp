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
@import url("<c:url value="/css/adminMain.css"/>");
@import url("<c:url value="/css/comeon.css"/>");
</style>
<script>

function addComma(num) {
    var regexp = /\B(?=(\d{3})+(?!\d))/g;
     return num.toString().replace(regexp, ',');
}

$(function(){
	
	$("#sReservDateSearch").datepicker({
        altField : '#sReservDateSearch',
        dateFormat : 'yy-mm-dd',
	});
	$("#sReturnDateSearch").datepicker({
        altField : '#sReturnDateSearch',
        dateFormat : 'yy-mm-dd',	
	});	
	
// 	$("#reservTableBody").empty();
// 	$.ajax({
// 			method:"POST",
// 			url:"getReservationList",
// 			success: function(reservList){
// 				$(reservList).each(function(idx, reserv){
// 					tr = $("<tr></tr>");
// 					td = $("<td>"+reserv.reservNum+"</td><td>"+reserv.userId+"</td><td>"+reserv.carNum+"</td><td>"+reserv.carName+"</td><td>"+reserv.reservDate+"~"+reserv.returnDate+"</td>");
// 					td2 = $("<td>"+
// 							"<button type='button' id='manageBtn' data-toggle='modal' data-target='manageModal' name='manageBtn' class='btn btn-primary btn-sm' value="+reserv.reservNum+">수정</button>&nbsp;&nbsp;&nbsp;"+
// 							"<button type='button' id='deleteBtn' data-toggle='modal' data-target='deleteModal' name='deleteBtn' class='btn btn-primary btn-sm' value="+reserv.reservNum+">삭제</button>"+
// 					"</td>");
					
// 					$("#reservTableBody").append(tr.append(td).append(td2));
// 				});
// 			}

// 	})

	$(document).on("click", "#manageBtn", function(event){
// 		reservNum = $(event.target).val()
		$("#manageModal").modal('show');
		$("#manageModalBody").empty();
	    $.ajax({
	       url: "getReservationInfo",
	       method: "post",
	       data: {
	    	   reservNum : $(event.target).val(),
	       },
	       success: function(reservInfoMap){
	    	   var disableDate = "";
	    	   var reserv = "";
	    	   var carInfo = "";
	    	   reservInfo = reservInfoMap.reservInfo;
	    	   disableDate = reservInfoMap.disableDate;
	    	   carInfo = reservInfoMap.carInfo;
	    	   
	    	   $("#manageModalBody").append(
	                '<div>'+
	                '<div style="float: left; margin: 10px;">'+
	                   '<img src="<c:url value="/img/'+carInfo.carImgName+'"/>" class="img-thumbnail">'+
	                '</div>'+
	                '<p>'+
	                   '<b>차량명: </b> '+carInfo.carName+'<br>'+
	                   '<b>연&nbsp;비: </b>'+ carInfo.carMileage+'<br>'+
	                   '<b>연&nbsp;료: </b>'+ carInfo.fuel+'<br>'+
	                   '<b>제조사: </b>'+ carInfo.maker+'<br>'+
	                   '<b>색&nbsp;상: </b>'+ carInfo.color+'<br>'+
	                   '<b>요&nbsp;금: </b>'+ addComma(carInfo.carCharge)+'원<br>'+
	                '</p>'+
	                '<form id="reservModifyForm" method="post">'+
	                '<div class="form-group">'+
	                   '<input id="reservNum" name="reservNum" value="'+reservInfo.reservNum+'" hidden/>'+
	                   '<b>* 인수 날짜</b>'+
	                   '<input id="reservDate" name="reservDate" type="text" value="'+reservInfo.reservDate+'" placeholder="인수일을 선택하세요."/>'+
	                   '<b>* 반납 날짜</b>'+
	                   '<input id="returnDate" name="returnDate" type="text" value="'+reservInfo.returnDate+'" placeholder="반납일을 선택하세요."/>'+
	                   '<div  style="margin-top:37px; height:50px;">'+
	                   '<span id="resultMsg" style="margin:17px 0px 0px 50px; float:left; color:red; "></span>'+
	                      '<button class="btn btn-lg btn-info" type="button" id="reservBtn" style="float:right; margin-right:35px;"><span class="glyphicon glyphicon-time"></span>수정하기</button>'+
	                   '</div>'+
	                '</div>'+
	                '</form>'+
	             '</div>');
	    	  $("#reservDate").datepicker({
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
	
	//예약 확인 모달
	var deleteReservNum = "";
	$(document).on("click", "button[name=deleteBtn]", function(event) {
		deleteReservNum = $(event.target).val()
		$("#deleteModal").modal();
	});
	
	//예약 삭제
	$(document).on("click", "#reservationDeleteBtn", function() {
		$.ajax({
			url : "carReservationDelete",
			method:"post",
			data : {
				deleteReservNum: deleteReservNum,
			},
			success : function(msg) {
						switch(msg){
						case "noLogin": window.location.href = "login"; break;
						case "success": $("#deleteResult").modal('show');
									    $("#resultBtn").attr("href","reservationMng"); break;
						};
			}
		});
	});
// });

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

	var reservation = $("#reservModifyForm").serialize();
    $.ajax({
       url: "carReservationModify",
       method: "post",
       data: reservation,
       success: function(msg){
			switch(msg){
			case "noLogin": window.location.href = "login"; break;
			case "success": $("#check").modal('show');
						    $("#confirmBtn").attr("href","reservationMng"); break;
			case "overLap": $("#resultMsg").text("예약 날짜가 중복 됩니다.");
			};
       }
    });  
 });
 
//검색 버튼 클릭
$("#searchBtn").on("click",function(){
	console.log("검색버튼")
	var carNum=0;
    var reservNum=0;
    
	
	var res = {
		reservNum:($("#sReservNum").val()=='')?'0':$("#sReservNum").val(),
		userId:($("#sUserId").val()=='')?'null':$("#sUserId").val(),
		carNum:($("#sCarNum").val()=='')?'0':$("#sCarNum").val(),
		carName:($("#sCarName").val()=='')?'null':$("#sCarName").val(),
		reservDate:$("#sReservDateSearch").val(),
		returnDate:$("#sReturnDateSearch").val()
	}
    
    if(res.reservDate==""||res.returnDate==""){
    	if(res.reservDate==""&&res.returnDate==""){
    	    res.reservDate= "null";
        	res.returnDate= "null"; 
        }else{
            $("#searchMsg").text("날짜를 선택하여 주세요.");
        	return false;
        }
    }
    
    var startDate = $("#sReservDateSearch").val();
    var endDate = $("#sReturnDateSearch").val();
    //-을 구분자로 연,월,일로 잘라내어 배열로 반환
    var startArray = startDate.split('-');
    var endArray = endDate.split('-');   
    //배열에 담겨있는 연,월,일을 사용해서 Date 객체 생성
    var start_date = new Date(startArray[0], startArray[1], startArray[2]);
    var end_date = new Date(endArray[0], endArray[1], endArray[2]);
         //날짜를 숫자형태의 날짜 정보로 변환하여 비교한다.
    if(start_date.getTime() > end_date.getTime()) {
        $("#searchMsg").text("반납일 보다 인수일이 작아야합니다.");
        return false;
    }
    
    var json_data = JSON.stringify(res);
	$.ajax({
			url:"getReservationSearchList",
			method:"post",
			dataType:"json",
			data:{
				res:json_data
			},
			success: function(reservList){
				$("#resultMsg").text("");
				$("#reservTableBody").empty();
				$(reservList).each(function(idx, reserv){
					tr = $("<tr></tr>");
					td = $("<td>"+reserv.reservNum+"</td><td>"+reserv.userId+"</td><td>"+reserv.carNum+"</td><td>"+reserv.carName+"</td><td>"+reserv.reservDate+"~"+reserv.returnDate+"</td>");
					td2 = $("<td>"+
							"<button type='button' id='manageBtn' data-toggle='modal' data-target='manageModal' name='manageBtn' class='btn btn-primary btn-sm' value="+reserv.reservNum+">수정</button>&nbsp;&nbsp;&nbsp;"+
							"<button type='button' id='deleteBtn' data-toggle='modal' data-target='deleteModal' name='deleteBtn' class='btn btn-primary btn-sm' value="+reserv.reservNum+">삭제</button>"+
					"</td>");
					
					$("#reservTableBody").append(tr.append(td).append(td2));
				});
			}
	})
});

 
});

</script>
</head>
<body>
<div class="container">
<%@ include file="../common/head.jsp" %>
<div class="container">
<div class="title">
	<h3>관리자 페이지</h3>
</div>
<div id="comeon"><span class="glyphicon glyphicon-map-marker"></span><h3>예약 관리</h3></div>

<div id="subMenu">
<ul>
	<li><a href="adminMain">메인화면 관리</a></li>
	<li><a href="reservationMng">예약 관리</a></li>
	<li><a href="adminCarMng">차량 관리</a></li>
	<li><a href="adminUserMng">회원 관리</a></li>
</ul>
</div>
<center>
<div id="contentDiv" style="margin-bottom: 0px; margin-left:1px;">


	<div id="content">
	<form id="searchForm" method="post">
		<label style="color: black;">예약번호</label>&nbsp;&nbsp;
		<input type="text" name="reservNum" id="sReservNum" placeholder="예약번호를 입력하세요">&nbsp;&nbsp;
		
		<label style="color: black;">아이디</label>&nbsp;&nbsp;
		<input type="text" name="userId" id="sUserId" placeholder="아이디를 입력하세요.">
		
		<label style="color: black;">차량 번호</label>&nbsp;&nbsp;
		<input type="text" name="carNum" id="sCarNum" placeholder="차량번호를 입력하세요.">
		
		<br>
		
		<label style="color: black;">차량 이름</label>&nbsp;&nbsp;
		<input type="text" name="carName" id="sCarName" placeholder="차량이름을 입력하세요.">
		
		
		<label style="color: black;">예약 기간</label>&nbsp;
		<input id="sReservDateSearch" name="reservDate" type="text" placeholder="인수일을 선택하세요."/> &nbsp;~&nbsp;
		<input id="sReturnDateSearch" name="returnDate" type="text" placeholder="반납일을 선택하세요."/>
		
		<a class="btn btn-primary btn-sm" type="button" id="searchBtn">검색</a><p id="searchMsg" style="color:red"></p>
	</form>
	</div>
	<table id="reservTable" class="table table-bordered"style="text-align: center;">
		<thead>
			<tr>
				<th>예약번호</th>
				<th>아이디</th>
				<th>차량 번호</th>
				<th>차량 이름</th>
				<th>예약 기간</th>
				<th>관리</th>
			</tr>
		</thead>
		<tbody id="reservTableBody">
	 	<c:forEach var="reservation" items="${reservations}">
			 	<tr>
					<td>${reservation.reservNum }</td>
					<td>${reservation.userId }</td>
					<td>${reservation.carNum }</td>
					<td>${reservation.carName }</td>
					<td>${reservation.reservDate } ~ ${reservation.returnDate }</td>
					<td>
					<button type='button' id='manageBtn' data-toggle='modal' data-target='manageModal' name='manageBtn' class='btn btn-primary btn-sm' value="${reservation.reservNum}">수정</button>&nbsp;&nbsp;&nbsp;
 					<button type='button' id='deleteBtn' data-toggle='modal' data-target='deleteModal' name='deleteBtn' class='btn btn-primary btn-sm' value="${reservation.reservNum}">삭제</button>
 					</td>
				</tr>
		 	</c:forEach>
		</tbody>		
	</table>
	<div class="text-center">
		<ul class="pagination">
			<c:if test="${pageMaker.prev }">
				<li><a href="reservationMng?currentPage=${pageMaker.startPage-1 }">&laquo;</a></li>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
				<% %>
				<li <c:out value="${pageMaker.page.currentPage==idx ? 'class=active' : ''}"/>>
					<a href="reservationMng?currentPage=${idx }">${idx }</a>
				</li>
			</c:forEach>
			
			<c:if test="${pageMaker.next }">
				<li><a href="reservationMng?currentPage=${pageMaker.endPage+1 }">&raquo;</a></li>
			</c:if>
		</ul>
	</div>



</div>
</center>


</div>
</div>

</body>
<%@ include file="../common/foot.jsp" %>

<div class="modal fade" id="manageModal">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h4 class="modal-title">예약 관리</h4>
            </div>
            <div class="modal-body" id="manageModalBody">

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
					<h4 class="modal-title">수정 성공</h4><br>
					</center>
					<a class="btn btn-default close" id="confirmBtn" type="submit">확인</a>
				</div>
			</div>
		</div>
	</div>
	
<div class="modal fade" id="deleteModal">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">메인화면 관리</h4>
				</div>
				<div class="modal-body">
				<center>
				<p>삭제 하시겠습니까?<p>
				    <button type="button" class="btn btn-default" id="reservationDeleteBtn"  data-toggle="modal" data-target="#deleteResult">삭제</button>
				</center>
				</div>
			</div>
		</div>
	</div>
		
		<div class="modal" id="deleteResult" style="">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h4 class="modal-title">메인화면 관리</h4>
					</div>
					<center>
					<div class="modal-body">
						<p id="msg">삭제 완료<p>
					</div>
					</center>
					<div class="modal-footer">
						<a href="" id="resultBtn" class="btn">Close</a>
					</div>
				</div>
			</div>
		</div>
</html>