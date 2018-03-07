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
      $.ajax({
         method:"POST",
         url: "createInsrt",
         data: {
               qstTitle: $("#title").val(),                     
               qstContent: $("#content").val()
               },
         success: function(ismodify){
            if(ismodify){
               $("#title").val("")
               ,$("#content").val("");               
            }
//             qnaList();
         }
      });
      qstNum = 0;
      location.href="qnaList";
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
                  <li><a href="../review/reviewMain.jsp">이용후기</a></li>
                  <li><a href="../qna/qnalist.jsp">Q&A</a></li>
               </ul>
         </li>
      </ul>
   </div>
</nav>
</div> -->
<div class="container">
<center><div id="comeon"><span class="glyphicon glyphicon-list-alt"></span><h3>Q & A</h3></div></center>
   <center><h2>Q & A 글쓰기</h2></center>
   <center><div style="margin-bottom: 50px;">
      <table id="rvt">
          <tr>
              <td>제 목</td>
              <td><input type="text" name="title" id="title" placeholder="제목을 입력하세요."></td>
          </tr>
          
          <tr>
              <td>내 용</td>
              <td><textarea name="content" rows ="10" cols="100" id="content" placeholder="내용을 입력하세요."></textarea></td>
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
</div>
</body>
<%@ include file="../common/foot.jsp" %>
</html>   