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
<style>
@import url("<c:url value="/css/myPage.css"/>");
@import url("<c:url value="/css/comeon.css"/>");
</style>
</head>
<body>
<div class="container" style="margin-bottom: 0px;">
	<%@ include file="../../common/head.jsp" %>
	
	<!-- 스크립트 -->	
<script>
function addComma(num) {
	  var regexp = /\B(?=(\d{3})+(?!\d))/g;
	   return num.toString().replace(regexp, ',');
}

var reservNum=0;
var userId="<%= user.getUserId()%>";

var reservList=function(){
	$("#reservTable").empty();
	$.ajax({
		url:"reservList",
		method:"post",
		data: {userId: userId},
		success:function(reservs){
			$(reservs).each(function(idx,reserv){
				$("#reservTable").append(
					'<tr>'+
				 		'<td>'+reserv.reservNum+'</td>'+
				 		'<td>'+reserv.carName+'</td>'+
				 		'<td>'+reserv.reservDate+' ~ '+reserv.returnDate+'</td>'+
				 		'<td><button name="reservDetail" value="'+reserv.reservNum+'" class="btn btn-primary">상세보기</button></td>'+
				 		'<td><button name="reservCancel" value="'+reserv.reservNum+'" class="btn btn-primary">취소</button></td>'+
				 	'</tr>'
				);
			});
		}
	});
};

$(function(){
	//페이지 로딩시 유저의예약내역 
	reservList();
	
	//삭제버튼 클릭
	$(document).on('click','button[name="reservCancel"]',function(){
		reservNum =$('button[name="reservCancel"]:hover').val();
		$("#myModal").modal("show");
	});
	
	//삭제확인버튼 클릭
	$("#deleteBtn").on("click",function(){
		$("#myModal2").modal("show");
		$.ajax({
			url:"reservDelete",
			method:"post",
			data: {reservNum: reservNum},
			success:function(result){
				if(result){
					$("#msg").text("취소되었습니다.");
				}else{
					$("#msg").text("취소실패.");
				}
			}
		});
	});
	
	//상세보기 클릭시
	$(document).on('click','button[name="reservDetail"]',function(){
		reservNum =$('button[name="reservDetail"]:hover').val();
		$("#myModa").modal("show");
		$("#detail").empty(); 
		$.ajax({
			url:"reservDetail",
			method:"post",
			data: {reservNum: reservNum},
			success:function(reservation){
				$("#detail").append(
						'<div>'+
						'<div style="float: left; margin: 10px;">'+
							 '<img id="recoImg" style="width:354px; height:243px;" src="<c:url value="/img/'+reservation.carImgName+'"/>">'+
						'</div>'+
						'<p>'+
							'<b>차량명: </b>'+reservation.carName+'<br>'+
							'<b>차&nbsp;종: </b> '+reservation.type+'<br>'+
							'<b>연&nbsp;비: </b> '+reservation.carMileage+'<br>'+
							'<b>연&nbsp;료: </b> '+reservation.fuel+'<br>'+
							'<b>제조사: </b> '+reservation.maker+'<br>'+
							'<b>색&nbsp;상: </b> '+reservation.color+'<br>'+
							'<b>요&nbsp;금: </b> '+addComma(reservation.carCharge)+' 원<br>'+
						'</p>'+
						'<form>'+
						'<div class="form-group">'+
							'<div>'+
								'<b>*인수 날짜</b>'+
								'&nbsp; '+reservation.reservDate+
							'</div>'+
							'<div>'+
								'<b>*반납 날짜</b>'+
								'&nbsp; '+reservation.returnDate+
							'</div>'+
						'</div>'+
						'</form>'+
					'</div>'
				);
			}
		});
	});
});
</script>	
	<!-- 스크립트 -->	
	
<div class="title">
	<h3>마이페이지</h3>
</div>
<center><div id="comeon"><span class="glyphicon glyphicon-list-alt"></span><h3>예약관리</h3></div></center>
<div id="subMenu">
<ul>
	<li><a href="myPage">개인정보관리</a></li>
	<li><a href="userReservPage">예약 관리</a></li>
	<li><a href="userSecedePage">회원 탈퇴</a></li>
</ul>
</div>

		<div style="margin-top: 10px;"></div>
		<table class="table table-bordered">
		 <thead>
		 	<tr>
				<th>예약 번호</th>
				<th>차 량</th>
				<th>기 간</th>
				<th>상세 보기</th>
				<th>예약 취소</th>
			</tr> 
		 </thead>
		 <tbody id="reservTable">
		 	
		</tbody>		
	</table>
	        <!-- first modal -->
    <div class="modal" id="myModal" aria-hidden="true" style="display: none; z-index: 1050;">
    	<div class="modal-dialog modal-sm">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
              <h4 class="modal-title">AWESOME CAR♥</h4>
            </div><div class="container"></div>
            <div class="modal-body">
				정말로 취소하시겠습니까?
				<br><br>
				<a id="deleteBtn" class="btn btn-primary">확인</a>
             </div>            
            <div class="modal-footer">
              <a href="#" data-dismiss="modal" class="btn">Close</a>
              
            </div>
            </div>
          </div>
        </div>
    </div>
    
            <div class="modal" id="myModal2" aria-hidden="true" style="display: none; z-index: 1060;">
    	<div class="modal-dialog modal-sm">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
              <h4 class="modal-title">AWESOME CAR♥</h4>
            </div><div class="container"></div>
            <div class="modal-body">
              	<p id="msg">취소되었습니다.</p> 
              <a href="userReservPage" class="btn btn-primary">확인</a>
            </div>
            <div class="modal-footer">
              <a href="#" data-dismiss="modal" class="btn">Close</a>
            </div>
          </div>
 </div>

</div>
		
</div>
	<div class="modal fade" id="myModa">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">상세보기</h4>
				</div>
				<div id="detail" class="modal-body" style="height: 300px;">
					<div>
						<div style="float: left; margin: 10px;">
							 <img id="recoImg" src="<c:url value="/img/BMW528.gif"/>">
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
							<div>
								<b>*인수 날짜</b>
								&nbsp; 2018-02-01
							</div>
							<div>
								<b>*반납 날짜</b>
								&nbsp; 2018-02-02
							</div>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<%@ include file="../../common/foot.jsp" %>
</html>