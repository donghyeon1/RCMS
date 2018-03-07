<%@page import="donghyeon.rcms.review.service.ReviewServiceImpl"%>
<%@page import="donghyeon.rcms.review.service.ReviewService"%>
<%@page import="donghyeon.rcms.common.service.PageServiceImpl"%>
<%@page import="donghyeon.rcms.common.service.PageService"%>
<%@page import="donghyeon.rcms.common.domain.Page"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	/* Page myPage=null;
	String currentPage = request.getParameter("currentPage");
	if(currentPage != null) myPage = new Page(Integer.parseInt(currentPage));
	else myPage = new Page();
	
	PageService pageService = new PageServiceImpl(5, myPage);
	pageContext.setAttribute("pageMaker", pageService);
	ReviewService reviewService = new ReviewServiceImpl();
	pageContext.setAttribute("reviews", reviewService.listAll()); */
%>
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
@import url("<c:url value="/css/common2.css"/>");
@import url("<c:url value="/css/comeon.css"/>");
</style>
<script>
var listAll = function(){
	$.ajax({
		method:"post",
		url:"rvlist",
		success:function(rvall){			
				$("#list").empty();
				$(rvall).each(function(idx, review){
					$("#list").append(
						"<tr>"+
							"<td>"+review.revNum+"</td>"+
							'<td><a href="rvView?revNum='+review.revNum+'">'+review.revTitle+"</a></td>"+
							"<td>"+review.revRegDate+"</td>"+
							"<td>"+review.userId+"</td>"+
						"</tr>");
				});			
		}		
	});
}

$(function(){
	/* listAll(); */
	
	$("#searchBtn").on("click",function(){
		var success=0;
		var search={
				searchOption: $("#searchOption").val(),
				keyword: $("#keyword").val()
		};
		console.log(search);
		$.ajax({
			method:"post",
			url:"rvSearch",
			data: search,
			success:function(rvall){			
					$("#list").empty();
					$(rvall).each(function(idx, review){
						success++;
						$("#list").append(
							"<tr>"+
								"<td>"+review.revNum+"</td>"+
								'<td><a href="rvView?revNum='+review.revNum+'">'+review.revTitle+"</a></td>"+
								"<td>"+review.revRegDate+"</td>"+
								"<td>"+review.userId+"</td>"+
							"</tr>");
					});			
				$("#times").text(success+"개의 게시물이 검색되었습니다.")
			}
		});
	});
	
});
</script>
</head>
<body>
<div class="container" style="margin-bottom: 0px;">
<%@ include file="../common/head.jsp" %>
</div>
<div class="container">
<div id="subMenu">
<ul>
   <li><a href="review">이용후기</a></li>
   <li><a href="qnaList">Q & A</a></li>
</ul>
</div>
	<center><div id="comeon"><span class="glyphicon glyphicon-list-alt"></span><h3>이용 후기</h3></div></center>
		
	<br><br>	
	<div id="searchForm">
       		<center>
            <select name="searchOption" id="searchOption">
                <option value="rev_Title">제목</option>
                <option value="rev_Content">내용</option>
                <option value="user_Id">글쓴이</option>
            </select>
            
            <input name="keyword" id="keyword">
          <!--   <input type="text" size="20" name="condition"/>&nbsp; -->
            <button id="searchBtn" class="btn btn-default">검색</button>
        	</center>       
    </div><br><br>
    
     <p id="times"></p>
    
		
		<table class="table table-bordered">
		 <thead>
		 	<tr>
				<th style="width: 60px;">번 호 </th>
				<th style="width: 400px;">제 목</th>			
				<th style="width: 60px;">작성일</th>
				<th style="width: 60px;">작성자</th>
			
			</tr> 
		 </thead>
		 <tbody id="list">
		 	<c:forEach var="review" items="${reviews }">
			 	<tr>
					<td>${review.revNum }</td>
					<td><a href="rvView?revNum=${review.revNum }">${review.revTitle }</a></td>
					<td>${review.revRegDate }</td>
					<td>${review.userId }</td>
				</tr>
		 	</c:forEach>
		</tbody>		
	</table>
	<div class="text-center">
		<ul class="pagination">
			<c:if test="${pageMaker.prev }">
				<li><a href="review?currentPage=${pageMaker.startPage-1 }">&laquo;</a></li>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
				<% %>
				<li <c:out value="${pageMaker.page.currentPage==idx ? 'class=active' : ''}"/>>
					<a href="review?currentPage=${idx }">${idx }</a>
				</li>
			</c:forEach>
			
			<c:if test="${pageMaker.next }">
				<li><a href="review?currentPage=${pageMaker.endPage+1 }">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
	<%if(user!=null){ %>
			<a id="btnWrite" class="btn btn-default" href="rvwriter">글쓰기</a>
	<%} %>
			<div style="margin-top: 10px;"></div>

</div>
</body>
<%@ include file="../common/foot.jsp" %>
</html>