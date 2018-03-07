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
<script>
//파일선택시 이미지미리보기
var imgView = function(input){
	   if(input.files && input.files[0]){
	      var reader = new FileReader();
	      reader.addEventListener("load",function(){
	         $("#carImgView").attr("src", reader.result);
	      }, false);
	      reader.readAsDataURL(input.files[0]);
	   }
	}
	
var regexHp = /^[0-9]{1,10}$/;

// var getCars= function(){
// 	$("#carTable").empty();
// 	$.ajax({
// 		url: "getCars",
// 		method: "post",
// 		success: function(cars){
// 			$(cars).each(function(idx,car){
// 				$("#carTable").append(
// 						'<tr>'+
// 							'<td>'+car.carName+'</td>'+
// 							'<td>'+car.carNum+'</td>'+
// 							'<td>'+car.type+'</td>'+
// 							'<td>'+car.color+'</td>'+
// 							'<td><button name="carNum" value="'+car.carNum+'" class="btn btn-primary btn-sm">수정/삭제</a></td>'+
// 						'</tr>');
// 			});
// 		}
// 	});
// };

$(function(){
	var carNum=0;
	//핸들러 등록
	
	// 수정/삭제 버튼클릭시
	$(document).on('click','button[name="carNum"]',function(){
		$("#modifyModal").modal('show');
		carNum=$('button[name="carNum"]:hover').val();
		$.ajax({
			url: "carDetails",
			method: "post",
			data: {carNum: carNum},
			success: function(car){
				$("deImg").attr("value",car.carImgName);
				$("#detailDiv").empty();
				$("#detailDiv").append(
						'<div style="float: left; margin:0 50px 0 100px;">'+
						'<img style="width:350px; height:250px;"src="<c:url value="/img/'+car.carImgName+'"/>" class="img-thumbnail">'+
					'</div>'+
						'<form id="updateForm2">'+ 
						'<label class="carInfo">차량명</label><input type="text" value="'+car.carName+'"id="carName2" name="carName" style="margin-left: 4px"><br>'+						
						'<label class="carInfo">연&nbsp;&nbsp;&nbsp;비</label><input type="text" value="'+car.carMileage+'" id="carMileage2" name="carMileage" style="margin-left: 7px"><br>'+						
						'<label class="carInfo">차&nbsp;&nbsp;&nbsp;종</label>'+
						'<select  style="margin-left: 7px; width: 174px; height: 26px;" id="type2" name="type">'+
					    	'<option value="1">소형차</option>'+
					    	'<option value="2">중형차</option>'+
					    	'<option value="3">대형차</option>'+
					    	'<option value="4">외제차</option>'+
					    '</select><br>'+
						'<label class="carInfo">연&nbsp;&nbsp;&nbsp;료</label>'+
						'<select  style="margin-left: 7px; width: 174px; height: 26px;" name="fuel" id="fuel2">'+
					    	'<option value="1">가솔린</option>'+
					    	'<option value="2">디젤</option>'+
					    	'<option value="3">LPG</option>'+
					    '</select><br>'+
						'<label class="carInfo">색&nbsp;&nbsp;&nbsp;상</label>'+
						'<select  style="margin-left: 7px; width: 174px; height: 26px;" name="color" id="color2">'+
					    	'<option value="1">화이트</option>'+
					    	'<option value="2">블랙</option>'+
					    	'<option value="3">그레이</option>'+
					    	'<option value="4">블루</option>'+
					    	'<option value="5">레드</option>'+
					    	'<option value="6">옐로우</option>'+
					    '</select><br>'+
					    '<label class="carInfo">제조사</label>'+
						'<select  style="margin-left: 4.5px; width: 174px; height: 26px;" name="maker" id="maker2">'+
					    	'<option value="1">현대</option>'+
					    	'<option value="2">기아</option>'+
					    	'<option value="3">삼성</option>'+
					    	'<option value="4">쉐보레</option>'+
					    	'<option value="5">벤츠</option>'+
					    	'<option value="6">BMW</option>'+
					    '</select><br>'+
						'<label class="carInfo">요&nbsp;&nbsp;&nbsp;금</label><input type="text" value="'+car.carCharge+'" id="carCharge2" name="carCharge" style="margin-left: 7px"><br>'+							
					'</form>'+
					'<div>'+
						'<button name="updateBtn" class="btn btn-sm btn-primary"style="margin: 20px 0 0 40px;"><span class="glyphicon glyphicon-wrench"></span>수정하기</button>'+
						'<button name="deleteBtn" class="btn btn-sm btn-primary" style="margin: 20px 0 0 20px;"><span class="glyphicon glyphicon-trash"></span>삭제하기</button>'+
						'<p id="errMsg2" style="margin-top: 10px; text-align: right; margin-right: 200px; color:red; "></p>'+
					'</div>'
				); 
			}
		});
	});
	
	//수정버튼클릭시
	$(document).on('click','button[name="updateBtn"]',function(){
		if( !$("#carName2").val() ){
			$("#errMsg2").text("차량명을 입력하세요.");
		}else if( !$("#carMileage2").val() ){
			$("#errMsg2").text("연비를 입력하세요.");
		}else if( !$("#carCharge2").val() ){
			$("#errMsg2").text("요금을 입력하세요.");
		}else if( !regexHp.test($.trim($("#carCharge2").val())) ){
			$("#errMsg2").text("요금란에 숫자만 입력하세요.");
		}else{
			var car={
					carNum:carNum,
					carName:$("#carName2").val(),
					carMileage:$("#carMileage2").val(),
					type:$("#type2").val(),
					fuel:$("#fuel2").val(),
					color:$("#color2").val(),
					maker:$("#maker2").val(),
					carCharge:$("#carCharge2").val()
			}
			$("#modifyResult").modal('show');
			$.ajax({
				method:"post",
				url: "updateCar",
				data: car,
				success:function(msg){
					if(msg){
						$("#updateMsg").text("수정 완료");
					}else{
						$("#updateMsg").text("수정 실패");
					}
				}
			});
		}
	});

	//삭제버튼클릭시
	$(document).on('click','button[name="deleteBtn"]',function(){
		console.log(carNum);
		$.ajax({
			method:"post",
			url: "deleteCar",
			data: {carNum:carNum},
			success:function(msg){
				$("#deleteCar").modal('show');
				if(msg){					
					$("#deleteMsg").text("삭제 완료");
				}else{					
					$("#deleteMsg").text("삭제 실패");
				}
			}
		});
	});

	//등록버튼
	$(":button#addBtn").on("click",function(){
		if( !$("#carName").val() ){
			$("#errMsg").text("차량명을 입력하세요.");
		}else if( !$("#carMileage").val() ){
			$("#errMsg").text("연비를 입력하세요.");
		}else if( !$("#carCharge").val() ){
			$("#errMsg").text("요금을 입력하세요.");
		}else if( !regexHp.test($.trim($("#carCharge").val())) ){
			$("#errMsg").text("요금란에 숫자만 입력하세요.");
		}else if( !$("#uploadFile").val() ){
			$("#errMsg").text("이미지파일을 선택하세요.");
		}else{
			var ext = $('#uploadFile').val().split('.').pop().toLowerCase();
			if ($.inArray(ext, [ 'gif', 'png', 'jpg','jpeg' ]) == -1) {
				$("#errMsg").text("이미지파일 형식이 아닙니다.")
				return;
			}
			var formData=new FormData($("#uploadForm")[0]);
			$("#createResult").modal('show');
			$.ajax({
						method : "post",
						url : "upload/addCar",
						processData : false,
						contentType : false,
						data : formData,
						success : function(result) {
							$("#createResult").modal('show');
							if(result){
								$("#resultMsg").text("등록 완료.");
							}else{
								$("#resultMsg").text("등록 실패.");
							}
						}
			});
		}
	});
	
	//검색버튼
	$("#search").on("click",function(){
		$("#carTable").empty();
		var carNum=0;
		if(!$("#sCarNum").val()==""){
			carNum=$("#sCarNum").val();
		}
		$.ajax({
			url: "searchCars",
			method: "post",
			data:{
				carName: $("#sCarName").val(),
				carNum: carNum,
				type: $("#sType").val(),
				color: $("#sColor").val()
			},
			success: function(cars){
				$(cars).each(function(idx,car){
					$("#carTable").append(
							'<tr>'+
								'<td>'+car.carName+'</td>'+
								'<td>'+car.carNum+'</td>'+
								'<td>'+car.type+'</td>'+
								'<td>'+car.color+'</td>'+
								'<td><button name="carNum" value="'+car.carNum+'" class="btn btn-primary btn-sm">수정/삭제</a></td>'+
							'</tr>');
				});
			}
		});
	});
});
</script>
<style>
@import url("<c:url value="/css/adminMain.css"/>");
@import url("<c:url value="/css/comeon.css"/>");
</style>
<body>
	<div class="container">
<%@ include file="../common/head.jsp" %>

			<div class="title">
				<h3>관리자 페이지</h3>
			</div>
			<div id="comeon">
				<span class="glyphicon glyphicon-map-marker"></span>
				<h3>차량관리</h3>
			</div>

			<div id="subMenu">
				<ul>
	<li><a href="adminMain">메인화면 관리</a></li>
	<li><a href="reservationMng">예약 관리</a></li>
	<li><a href="adminCarMng">차량 관리</a></li>
	<li><a href="adminUserMng">회원 관리</a></li>
				</ul>
			</div>
			<center>
				<div id="content">
					<label style="color: black;">차량명</label>&nbsp;&nbsp;
					<input type="text" id="sCarName">&nbsp;&nbsp;
					
					<label style="color: black;">차량번호</label>&nbsp;&nbsp;
					<input type="text" id="sCarNum" placeholder="숫자만 입력하세요.">
					
					<label style="color: black;">차종</label>&nbsp;&nbsp;
					<select  style="margin-left: 7px; width: 174px; height: 26px;" id="sType">
						<option value="">(선택안함)</option>
					    <option value="1">소형차</option>
					   	<option value="2">중형차</option>
					    <option value="3">대형차</option>
					    <option value="4">외제차</option>
					</select>
					
					<label style="color: black;">색상</label>&nbsp;
					<select  style="margin-left: 7px; width: 174px; height: 26px;" id="sColor">
						<option value="">(선택안함)</option>
					    <option value="1">화이트</option>
					    <option value="2">블랙</option>
					    <option value="3">그레이</option>
					    <option value="4">블루</option>
					    <option value="5">레드</option>
					    <option value="6">옐로우</option>
					</select>
					
					<a class="btn btn-primary btn-sm" id="search">검색</a>
					&nbsp;&nbsp;
					<a data-toggle="modal" href="#carCreateModal" class="btn btn-primary btn-sm">신규등록</a>
				</div>
				<table id="eventCarTable" class="table table-bordered"
					style="text-align: center;">
					<thead>
						<tr>
							<th>차량명</th>
							<th>차량번호</th>
							<th>차종</th>
							<th>색상</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody id="carTable">
	 	<c:forEach var="car" items="${cars}">
			 	<tr>
					<td>${car.carName }</td>
					<td>${car.carNum }</td>
					<td>${car.type }</td>
					<td>${car.color }</td>
					<td>
					<button name="carNum" value="${car.carNum }" class="btn btn-primary btn-sm">수정/삭제</button>
 					</td>
				</tr>
		 	</c:forEach>
		</tbody>		
	</table>
	<div class="text-center">
		<ul class="pagination">
			<c:if test="${pageMaker.prev }">
				<li><a href="adminCarMng?currentPage=${pageMaker.startPage-1 }">&laquo;</a></li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
				<% %>
				<li <c:out value="${pageMaker.page.currentPage==idx ? 'class=active' : ''}"/>>
					<a href="adminCarMng?currentPage=${idx }">${idx }</a>
				</li>
			</c:forEach>
			
			<c:if test="${pageMaker.next }">
				<li><a href="adminCarMng?currentPage=${pageMaker.endPage+1 }">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
			</center>
		</div>
		
		<div class="modal" id="modifyModal" aria-hidden="true"
			style="display: none; z-index: 1050;">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header" style="height: 50px;">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h4 class="modal-title">차량 관리</h4>
					</div>
					
					<div class="modal-body" style="height: 270px;">
						<div id="detailDiv">
						
						</div>						
					</div>
					<div class="modal-footer">
						<a href="#" data-dismiss="modal" class="btn">Close</a>

					</div>
				</div>
			</div>
		</div>

		<div class="modal" id="modifyResult"
			style="">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">차량 수정</h4>
					</div>
					<center>
					<div class="modal-body">
						<h3 id="updateMsg">처리중 입니다.</h3>
					</div>
					</center>
					<div class="modal-footer">
						<a href="adminCarMng"  class="btn">Close</a>

					</div>
				</div>
			</div>

		</div>
		
		<div class="modal" id="deleteCar" 
			style="">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">차량 삭제</h4>
					</div>
					<center>
					<div class="modal-body">
						<h3 id="deleteMsg"></h3>
					</div>
					</center>
					<div class="modal-footer">
						<a href="adminCarMng" class="btn">Close</a>

					</div>
				</div>
			</div>

		</div>
		
		
		<div class="modal" id="carCreateModal" aria-hidden="true"
			style="display: none; z-index: 1050;">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header" style="height: 50px;">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h4 class="modal-title">차량 관리</h4>
					</div>
					
					<div class="modal-body" style="height: 270px;">
						<div>
							<div style="float: left; margin:0 50px 0 100px;">
								<img id="carImgView" class="img-thumbnail" style="width:354px; height: 234px;" >
							</div>
 							<form id="uploadForm"> 
								<label class="carInfo">차량명</label><input type="text" id="carName" name="carName" style="margin-left: 4px"><br>
								
								<label class="carInfo">연&nbsp;&nbsp;&nbsp;비</label><input type="text" id="carMileage" name="carMileage" style="margin-left: 7px"><br>
								
								<label class="carInfo">차&nbsp;&nbsp;&nbsp;종</label>
								<select  style="margin-left: 3px; width: 174px; height: 26px;" id="type" name="type">
							    	<option value="1">소형차</option>
							    	<option value="2">중형차</option>
							    	<option value="3">대형차</option>
							    	<option value="4">외제차</option>
							    </select><br>
								
								<label class="carInfo">연&nbsp;&nbsp;&nbsp;료</label>
								<select  style="margin-left: 3px; width: 174px; height: 26px;" name="fuel" id="fuel">
							    	<option value="1">가솔린</option>
							    	<option value="2">디젤</option>
							    	<option value="3">LPG</option>
							    </select><br>
							    
								<label class="carInfo">색&nbsp;&nbsp;&nbsp;상</label>
								<select  style="margin-left: 3px; width: 174px; height: 26px;" name="color" id="color">
							    	<option value="1">화이트</option>
							    	<option value="2">블랙</option>
							    	<option value="3">그레이</option>
							    	<option value="4">블루</option>
							    	<option value="5">레드</option>
							    	<option value="6">옐로우</option>
							    </select><br>
							    
							    <label class="carInfo">제조사</label>
								<select  style="margin-left: 1px; width: 174px; height: 26px;" name="maker" id="maker">
							    	<option value="1">현대</option>
							    	<option value="2">기아</option>
							    	<option value="3">삼성</option>
							    	<option value="4">쉐보레</option>
							    	<option value="5">벤츠</option>
							    	<option value="6">BMW</option>
							    </select><br>
							    
								<label class="carInfo">요&nbsp;&nbsp;&nbsp;금</label><input type="text" id="carCharge" name="carCharge" style="margin-left: 7px"><br>
							
								<button type="button" id="addBtn" class="btn btn-primary" style="float: right;"><span class="glyphicon glyphicon-plus"></span>등록</button>
								<input type="file" name="uploadFile" id="uploadFile" class="btn btn-sm btn-default" onchange="imgView(this)">
							</form>
							<p id="errMsg" style="text-align: right; margin-right: 200px; color:red; "></p>
							
						</div>
					</div>
					<div class="modal-footer">
						
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="modal" id="createResult">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						
						<h4 class="modal-title">차량 관리</h4>
					</div>
					<center>
					<div class="modal-body">
						<h3 id="resultMsg"></h3>
					</div>
					</center>
					<div class="modal-footer">
						<a href="adminCarMng" class="btn">Close</a>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>

<%@ include file="../common/foot.jsp" %>
</html>