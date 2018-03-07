<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	var QueryObject = function() {

	    var o = {};

	    var q = location.search.substring(1);
	    if (q) {

	        // 실제 그룹화 정규식.
	        var vg = /([^&=]+)=?([^&]*)/g;
	        
	        // 인코딩된 공백문자열을 다시 공백으로
	        var sp = /\+/g;

	        // 정규식을 사용하여 값을 추출
	        var decode = function(s) {
	            if (!s) {
	                return '';
	            }
	            return decodeURIComponent(s.replace(sp, " "));
	        };

	       // 한번씩 exec를 실행하여 값을 받아온다.
	        var tmp; 
	        while (tmp = vg.exec(q)) {
	            (function() {
	                var k = decode(tmp[1]);
	                var v = decode(tmp[2]);
	                var c;
	                if (k) {
	                    o[k] = v;
	                    // getXXX 형식의 자바빈 타입으로 사용하고 싶다면
	                    // 윗 라인을 지우고, 아래와 같이 하면 됩니다.
	                    //c = k.charAt(0).toUpperCase() + k.slice(1);
	                    //o["get" + c] = function() { return v; }
	                    //o["set" + c] = function(val) { v = val; }
	                }
	            })();
	        }
	    }
	    return o;
	};

	$("#update").bind("click",function(){
		$("#mySmallModal").modal('show');
		$.ajax({
			method:"POST",
			url: "rvUpdate",
			data: {
				   revTitle: $("#title").val(),							
				   revContent: $("#content").val(),
				   revNum:QueryObject(window.location.search).revNum
				   },
			success: function(result){
				if(result){
					$("#msg").text("수정 성공");
				}else{
					$("#msg").text("수정 실패");
				}
			}
		});
	});		
});	

</script>

</head>
<body>


<div class="container">
<%@ include file="../common/head.jsp" %>
<center><div id="comeon"><span class="glyphicon glyphicon-list-alt"></span><h3>이용 후기</h3></div></center>
<center><h2>게시판 글쓰기</h2></center>
	<center><div style="margin-bottom: 50px;">
		<table id="rvt">
    		<tr>
     			<td>제 목</td>
     			<td><input type="text" name="title" id="title" value="${review.revTitle }"></td>
    		</tr>
    		
    		<tr>
     			<td>내 용</td>    			
     			<td><textarea name="content" rows ="10" cols="100" id="content" >${review.revContent }</textarea></td>
    		</tr>
    		    		    		    		    		
    		<tr>
     			<td colspan="2">
     			<div align="center">
	     			<a id="update" class="btn btn-default">수정</a>
	     			<a href="review" class="btn btn-default" >목록</a>
         		</div>
     			</td>
    		</tr> 
  
		</table>
		<div class="modal fade" id="mySmallModal">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="msg"></h4><br>
					<a class="btn btn-lg btn-info" href="rvView?revNum=${review.revNum }">확인</a>
				</div>
			</div>
		</div>
	</div> 
	</div></center>
</div>
</body>

<%@ include file="../common/foot.jsp" %>
</html>
