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
@import url("<c:url value="/css/adminMain.css"/>");
@import url("<c:url value="/css/comeon.css"/>");
</style>
<script>
var deleteUser = "";

var getUsers= function(){
	$("#userTable").empty();
	$.ajax({
		url: "getUsers",
		method: "post",
		success: function(users){
			$(users).each(function(idx,user){
				$("#userTable").append(
						'<tr>'+
							'<td>'+user.userName+'</td>'+
							'<td>'+user.userId+'</td>'+
							'<td>'+user.userEmail+'</td>'+
							'<td>'+user.userHp+'</td>'+
							'<td><button type="button" name="delBtn" class="btn btn-primary btn-sm" value='+user.userId+'>삭제</button></td>'+
						'</tr>');
			});
		}
	});
};

var deleteBtn = function() {
	$(document).on("click", "button[name=delBtn]", function(event) {
		deleteUser = $(event.target).val()
		$("#userDelete").modal('show');
	});
}

$(function(){
	deleteBtn();
	
	$(document).on("click", "#delete", function() {
		$.ajax({
			url : "userDelete",
			data : {
				userId : deleteUser
			},
			success : function(result) {
				if(result){
					$("#msg").text("삭제 완료");
					$("#confirmBtn").attr("data-dismiss","");
				    $("#confirmBtn").attr("href","adminUserMng");
				}else{
					$("#msg").text("삭제 실패");
					$("#confirmBtn").attr("data-dismiss","modal");
					$("#confirmBtn").attr("href","");
				}
			},
			complete : function() {
				getUsers();
			}
		});
	});
	
	//검색
	$("#search").on("click",function(){
		$.ajax({
			url : "userSearch",
			data : {
				userName: $("#userName").val(),
				userId: $("#userId").val()
			},
			success: function(users){
				$("#userTable").empty();
				
				$(users).each(function(idx,user){
					$("#userTable").append(
							'<tr>'+
								'<td>'+user.userName+'</td>'+
								'<td>'+user.userId+'</td>'+
								'<td>'+user.userEmail+'</td>'+
								'<td>'+user.userHp+'</td>'+
								'<td><button type="button" name="delBtn" class="btn btn-primary btn-sm" value='+user.userId+'>삭제</button></td>'+
							'</tr>');
				});
			}
		});
	});
});
</script>
</head>
<body>
<div class="container">
<%@ include file="../common/head.jsp" %>

<div class="title">
	<h3>관리자 페이지</h3>
</div>
<div id="comeon"><span class="glyphicon glyphicon-map-marker"></span><h3>회원관리</h3></div>

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
			<label style="color:black;">이름</label>&nbsp;&nbsp;<input type="text" id="userName">&nbsp;&nbsp;&nbsp;&nbsp;<label style="color:black;">아이디</label>&nbsp;<input type="text" id="userId">
			<button id="search">검색</button>
			</div>
				<table id="eventCarTable " class="table table-bordered" style="text-align: center;">
					<thead>
						<tr>
							<th>회원명</th>
							<th>아이디</th>
							<th>E-MAIL</th>
							<th>핸드폰</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody id="userTable">
						<c:forEach var="user" items="${users }">
						 	<tr>
								<td>${user.userName }</td>
								<td>${user.userId }</td>
								<td>${user.userEmail }</td>
								<td>${user.userHp }</td>
								<td><button type="button" name="delBtn" class="btn btn-primary btn-sm" value='${user.userId }'>삭제</button></td>
							</tr>
					 	</c:forEach>
					</tbody>
				</table>
				<div class="text-center">
					<ul class="pagination">
						<c:if test="${pageMaker.prev }">
							<li><a href="adminUserMng?currentPage=${pageMaker.startPage-1 }">&laquo;</a></li>
						</c:if>
						
						<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
							<li <c:out value="${pageMaker.page.currentPage==idx ? 'class=active' : ''}"/>>
								<a href="adminUserMng?currentPage=${idx }">${idx }</a>
							</li>
						</c:forEach>
						
						<c:if test="${pageMaker.next }">
							<li><a href="adminUserMng?currentPage=${pageMaker.endPage+1 }">&raquo;</a></li>
						</c:if>
					</ul>
				</div>
			</center>

		</div>
		
<div class="modal" id="userDelete" aria-hidden="true"
			style="display: none; z-index: 1050;">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header" style="height: 50px;">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h4 class="modal-title">회원 관리</h4>
					</div>
					
					<div class="modal-body" style="height: 100px;">
					<center>
						<div>
							
							<label style="margin-bottom: 20px;">삭제하시겠습니까?</label><br>
							
							<form>
								<div class="form-group">
									<div>
										<a id="delete" 
											class="btn btn-sm btn-primary" data-toggle="modal"
											data-target="#userDeleteResult"><span class="glyphicon glyphicon-trash"></span>삭제</a> 
											<a href="adminUserMng" onclick="06.html" class="btn btn-sm btn-primary"
											data-toggle="modal-close" data-target="#"><span
											class="glyphicon glyphicon-remove"></span>취소</a>
									</div>
								</div>
							</form>
						</div>
					</div>
					</center>
					<div class="modal-footer">
						<a href="#" data-dismiss="modal" class="btn">Close</a>
					</div>
				</div>
			</div>
		</div>

		<div class="modal" id="userDeleteResult"
			style="">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h4 class="modal-title">회원 관리</h4>
					</div>
					<center>
					<div class="modal-body">
						<h3 id="msg"></h3>
					</div>
					</center>
					<div class="modal-footer">
						<a id="confirmBtn" class="btn">Close</a>

					</div>
				</div>
			</div>

		</div>
</body>
<%@ include file="../common/foot.jsp" %>
</html>