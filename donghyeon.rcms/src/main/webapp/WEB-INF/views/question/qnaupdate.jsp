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
	   $("#update").bind("click",function(){
	      $("#mySmallModal").modal('show');
	      $.ajax({
	         method:"POST",
	         url: "qnaupdate",
	         data: {
	               qstTitle: $("#title").val(),                     
	               qstContent: $("#content").val(),
	               qstNum:QueryObject(window.location.search).qstNum
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
<div class="container" style="margin-bottom: 0px;">
<%@ include file="../common/head.jsp" %>
	<!-- <a id="topLogin" href="../login/01.html">로그인</a>
 	<div id="logoText">
          <a id="logo" href="../main.html">
           AWESOME CAR♥
           </a>
    </div>
   
   
 <nav class="navbar navbar-inverse">
   <div class="container-fluid">
      <ul class="nav navbar-nav">
         <li class="dropdown">
            <a href="../introduction/01.html">회사 소개</a>
               <ul class="dropdown-menu" id="ul1">
                  <li><a href="../introduction/01.html">오시는길</a></li>
                  <li><a href="../introduction/02.html">인사말</a></li>
               </ul>
         </li>
         <li class="dropdown">
            <a href="../guide/01.html">대여 가이드</a>
               <ul class="dropdown-menu" id="ul2">
                  <li><a href="../guide/01.html">렌트안내</a></li>
                  <li><a href="../guide/02.html">보험및유의사항</a></li>
               </ul>
         </li>
         <li class="dropdown">
            <a href="../reservation/01.html">실시간 예약</a>
         </li>
         <li class="dropdown">
            <a href="../review/01.html">고객센터</a>
               <ul class="dropdown-menu" id="ul4">
                  <li><a href="../review/01.html">이용후기</a></li>
                  <li><a href="../qna/01.html">Q&A</a></li>
               </ul>
         </li>
      </ul>
   </div>
</nav> -->

</div>
<center>
	<div class="container">
	
		<table>
			<caption>글 수정하기</caption>	
	    		<!-- <tr>
					<td>작성자</td>
					<td><input name="name" size="10" maxlength="8" placeholder="이름을 입력해주세요"></td>
				</tr> -->
	    		
	    		<tr>
	     			<td>제 목</td>
	     			<td><input type="text" name="title" id="title" value="${question.qstTitle}" placeholder="제목을입력하세요."></td>
	    		</tr>
	    		<tr>
	     			<td>내 용</td>
	     			<td><textarea name="content" rows ="10" cols="100" id="content" placeholder="내용을 입력하세요.">${question.qstContent}</textarea></td>
	    		</tr>
	    		
	    		
	    		<tr>
	     			<td colspan="2">
	     			<div align="center">
		     			<a id="update" class="btn btn-default">수정</a>
                 		<a href="qnaList" class="btn btn-default" >목록</a>
	         		</div>
	     			</td>
	    		</tr>
		</table>
		
		
		<div class="modal fade" id="mySmallModal">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="msg">수정 완료</h4><br>
						<a class="btn btn-lg btn-info" href="qnaView?qstNum=${question.qstNum}">확인</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</center>	
</body>
<%@ include file="../common/foot.jsp" %>
</html>	