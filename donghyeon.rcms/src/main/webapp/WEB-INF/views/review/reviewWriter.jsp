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
@import url("<c:url value="/css/common2.css"/>");
@import url("<c:url value="/css/comeon.css"/>");
</style>
<script>
$(function(){
	//등록버튼 클릭시
	$("#insert").bind("click",function(){
		if($("#title").val()==""){
			$("#mySmallModal").modal();
			$("#msg").text("제목을 입력하세요");
		}else if($("#content").val()==""){
			$("#mySmallModal").modal();
			$("#msg").text("내용을 입력하세요");
		}else{
			$.ajax({
				method:"POST",
				url: "rvwriterInsrt",
				data: {
					   revTitle: $("#title").val(),							
					   revContent: $("#content").val()
					   },
				success: function(ismodify){
				}
			});
			location.href="review";
		}
	});		
});
		
	/* var title = $("#title").val();
    var content = $("#content").val();
    var writer = $("#writer").val();

    $("#insert").click(function(){
        	    	
    	if($("#title").val().trim() == ""){
            alert("제목을 입력하세요.");
            $("#title").focus();
            return false;
        }
         
        if($("#content").val().trim() == ""){
            alert("내용을 입력하세요.");
            $("#content").focus();
            return false;
        }
        
        document.rvt.submit();
        
    });                     */                         




</script>

</head>

<body>
<div class="container" style="margin-bottom: 0px;">
<%@ include file="../common/head.jsp" %>
</div>
<div class="container">
<center><div id="comeon"><span class="glyphicon glyphicon-list-alt"></span><h3>이용 후기</h3></div></center>
	<center><h2>게시판 글쓰기</h2></center>
	<center><div style="margin-bottom: 50px;">
		<table id="rvt">
    		<tr>
     			<td>제 목</td>
     			<td><input type="text" name="title" id="title" placeholder="제목을 입력해주세요"></td>
    		</tr>
    		
    		<tr>
     			<td>내 용</td>
     			<td><textarea name="content" rows ="10" cols="100" id="content"  placeholder="내용을 입력해주세요"></textarea></td>
    		</tr>
    		    		    		    		    		
    		<tr>
     			<td colspan="2">
     			<div align="center">
	     			<a id="insert" class="btn btn-default">등록</a>
	     			<a href="review" class="btn btn-default" >목록</a>
         		</div>
     			</td>
    		</tr> 
  
		</table>
	</div></center>
</div>

	<div class="modal fade" id="mySmallModal">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" id="msg"></h4><br>					
				</div>
			</div>
		</div>
	</div> 
</body>
<%@ include file="../common/foot.jsp" %>
</html>	