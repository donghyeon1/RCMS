<%@page import="donghyeon.rcms.common.domain.Question"%>
<%@page import="jdk.nashorn.internal.ir.RuntimeNode.Request"%>
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

$(function(){
	console.log({
		qstNum:QueryObject(window.location.search).qstNum,
		qstAnswer:$("#answer").val()
	});
	$("#answerBtn").on("click",function(){
		$.ajax({
			url:"answerInsert",
			method:"post",
			data:{
				qstNum:QueryObject(window.location.search).qstNum,
				qstAnswer:$("#answer").val()
			},
			success:function(result){
				if(result){
					$("#mySmallModal3").modal();
					$("#msg").text("답변 등록 완료");
				}else{
					$("#mySmallModal3").modal();
					$("#msg").text("답변 등록 실패");
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
<center><div id="comeon"><span class="glyphicon glyphicon-list-alt"></span><h3>Q & A</h3></div></center>

<div id="wrap">
    <br><br>
    <center>
    <div id="board">
     </center>
     <table class="list" style="width:800px;">
		<thead>
			<tr>
				<th style="width: 400px;">${qnaview.qstTitle}</th>
				<th style="float: right;">
					작성일
					<span class="num">${qnaview.qstRegDate}</span>
					<span class="txt_bar"> | </span>
					작성자
					<span class="num">${qnaview.userId}</span>
				</th>
			</tr>
		</thead>
				<tbody class="view_body">
			<tr>
				<td colspan="2" class="view">
				<hr>
					<p>
						<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:12px;">${qnaview.qstContent}</span></span>
					</p>
					<hr>
				</td>
			</tr>
			<tr>
            	<td style="font-size:15px; width: 100px;">
            		<strong>답 변</strong>
            	</td>
            	<td style="width: 2000px;">${qnaview.qstAnswer}</td>  
			</tr>  
			<% if(user.getClassCode()==2){ %>      
			<tr>
                   	<td id="title" style="width:50px;">
            		답변
            		</td>
            			<td><input id="answer" type="text" style="margin-left:4px; margin-top: 5px;" size="78px;">&nbsp;&nbsp;<button id="answerBtn" class="btn btn-default" style="float: right; margin-right: 10px;">등록</button>
            		</td>
 			</tr>
 			<% } %>
 			<tr>
	     		<td colspan="2">
	     			<div align="right">
	     				<a class="btn btn-default" href="qnaList">목록</a>
	     			<% String writerId= ((Question)request.getAttribute("qnaview")).getUserId();	     				
	     			if(user.getUserId().equals(writerId)){ %>
		     			<a class="btn btn-default" href="qnaupdateOpen?qstNum=${qnaview.qstNum}">수정</a>
		         		<button type="button" class="btn btn-default" onclick="location.href='delete?qstNum=${qnaview.qstNum}'" id="delBtn">삭제</button>
		         	<% } %>
	    	        </div>
	         	</td>
	         </tr>
		</tbody>
	</table>
    </div>
    <div style="margin-bottom: 80px;"></div>
</div>   

	 <div class="modal fade" id="mySmallModal">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">정말 삭제하시겠습니까? </h4><br>
					<button type="button" onclick="location.href='delete?qstNum=${qstNum}'">삭제</button>
				</div>
			</div>
		</div>
	</div> 
	
	<div class="modal fade" id="mySmallModal2">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">삭제 완료</h4><br>
					<a class="btn btn-lg btn-info" href="qnaList">확인</a>
				</div>
			</div>
		</div>
	</div>  

		<div class="modal fade" id="mySmallModal3">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="msg"></h4><br>
						<a class="btn btn-lg btn-info" href="qnaList">확인</a>
					</div>
				</div>
			</div>
		</div>
</body>
<%@ include file="../common/foot.jsp" %>
</html>