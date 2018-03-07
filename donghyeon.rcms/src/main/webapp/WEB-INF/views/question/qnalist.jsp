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
 	var qnaList = ("#qnaList");
 	var tr;
 	var input;
 	var etc;
 	
 	
$(function(){
// 	$.ajax({
// 		url:"qnalists",
// 		success:function(qnalists){
// 			$(qnalists).each(function(idx,list){
// 				tr = $("<tr></tr>");
// 				td = $("<td>"+list.qstNum+"</td><td><a href='qnaView?qstNum="+list.qstNum+"'>"+list.qstTitle+"</a></td><td>"+list.qstRegDate+"</td><td>"+list.qstStatus+"</td><td>"+list.userId+"</td>");
					
// 				$("#qnaList").append(tr.append(td));
// 			});
//  			/* qnaList.empty(); */
// 		}
// 	});
	
	$("#qsearchBtn").on("click",function(){
		var success=0;
		var qsearch={
				qsearchOption: $("#qsearchOption").val(),
				qkeyword: $("#qkeyword").val()
		};
		console.log(qsearch);
		$.ajax({
			method:"post",
			url:"qSearch",
			data: qsearch,
			success:function(qnalists){			
					$("#qnaList").empty();
					$(qnalists).each(function(idx, question){
						success++;
						$("#qnaList").append(
							"<tr>"+
								"<td>"+question.qstNum+"</td>"+
								'<td><a href="qnaView?qstNum='+question.qstNum+'">'+question.qstTitle+"</a></td>"+
								"<td>"+question.qstRegDate+"</td>"+
								"<td>"+question.qstStatus+"</td>"+
								"<td>"+question.userId+"</td>"+
							"</tr>");
					});			
				$("#times1").text(success+"개의 게시물이 검색되었습니다.")
			}
		});
	});
});
</script>
<style>
@import url("<c:url value="/css/common2.css"/>");
@import url("<c:url value="/css/comeon.css"/>");
</style>
</head>
<body>
<div class="container" style="margin-bottom: 0px;">
<%@ include file="../common/head.jsp" %>

<div class="container">
<div id="subMenu">
<ul>
   <li><a href="review">이용후기</a></li>
   <li><a href="qnaList">Q & A</a></li>
</ul>
</div>
	<center><div id="comeon"><span class="glyphicon glyphicon-list-alt"></span><h3>Q & A</h3></div></center>
	<br><br>	
	<div id="searchForm">
       	<center>
            <select name="searchOption" id="qsearchOption">
                <option value="qst_Title">제목</option>
                <option value="qst_Content">내용</option>
                <option value="user_Id">글쓴이</option>
            </select>
            
            <input name="keyword" id="qkeyword">
          <!--   <input type="text" size="20" name="condition"/>&nbsp; -->
            <button id="qsearchBtn" class="btn btn-default">검색</button>
        </center>       
    </div><br><br>

		<div style="margin-top: 10px;"></div>
		<p id="times1"></p>
		<table class="table table-bordered">
		 <thead>
		 	<tr>
				<th style="width: 60px;">번 호</th>
				<th style="width: 400px;">제 목</th>
				<th style="width: 60px;">작성일</th>
				<th style="width: 60px;">답변상태</th>
				<th style="width: 60px;">작성자</th>
			</tr>
		 </thead>
		 <tbody id="qnaList">
		 	<c:forEach var="qst" items="${qnaList}">
			 	<tr>
					<td>${qst.qstNum }</td>
					<td><a href="qnaView?qstNum=${qst.qstNum }">${qst.qstTitle }</a></td>
					<td>${qst.qstRegDate }</td>
					<td>${qst.qstStatus }</td>
					<td>${qst.userId }</td>
				</tr>
		 	</c:forEach>
		 </tbody>
	</table>
		<div class="text-center">
		<ul class="pagination">
			<c:if test="${pageMaker.prev }">
				<li><a href="qnaList?currentPage=${pageMaker.startPage-1 }">&laquo;</a></li>
			</c:if> 	
			
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
<%-- 				<% %> --%>
				<li <c:out value="${pageMaker.page.currentPage==idx ? 'class=active' : ''}"/>>
					<a href="qnaList?currentPage=${idx }">${idx }</a>
				</li>
			</c:forEach>
			
			<c:if test="${pageMaker.next }">
				<li><a href="qnaList?currentPage=${pageMaker.endPage+1 }">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
	<% if(user != null){ %>
		<a class="btn btn-default" href="qnacreate">글쓰기</a>
	<% } %>
	<%-- <c:if test="${page>1}">
	<a href="/qnalist?page=${page-1 }">[이전]</a>
	</c:if> --%>
</div>
</div>
</body>
<%@ include file="../common/foot.jsp" %>
</html>