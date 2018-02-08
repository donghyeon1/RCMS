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
@import url("<c:url value="/css/comeon.css"/>");
@import url("<c:url value="/css/myPage.css"/>");
</style>
</head>
<body>
<div class="container" style="margin-bottom: 0px;">
  <%@ include file="../common/head.jsp" %>
<div class="container">
<div id="subMenu">
<ul>
   <li><a href="rentGuide">렌트 안내</a></li>
   <li><a href="insuranceGuide">보험 및 유의사항</a></li>
</ul>
</div>
<center>
<section id="note">
   <div id="comeon"><span class="glyphicon glyphicon-alert"></span><h3>보험 및 유의사항</h3></div>
</section>
</center>
      <div class="intro1" style="width: 580px; float: left;">
      <h2>렌트자격</h2>
         <strong>만21세 이상.운전경력 1년이상, 운전면허소지자에 한합니다.</strong>
         <p>일부차량은 만 26세이상을 요구할수 있습니다.</p>
         <p>운전면허증은 도로교통법상 유효한 면허를 소지하여야합니다.</p>
         <br>
         <strong>>차종별 필수면허증</strong>
         <p>승용차,9인승 승합차: 2종보통면허 이상 소지자</p>
         <p>15인 이상이하 승합차 : 1종 보통면허 이상 소지자</p>
         <p>외국인 : 국제면허증 소지자</p>
      </div>
      
      <div class="intro1" style="width: 500px; float: left;">
      <h2>보상제도</h2>
         <strong>AWSEOME CAR는 전 차량 자동차종합보험(대인,대물,자손)에 가입되어있습니다.</strong>
         <p>대인 : 무한대 , 대물: 건당 3천만원 , 자손: 개인 1500만원</p>
         <br>
         <strong>차량손해 면책제도</strong>
         <p>운전자의 과실에 의한 대여차량손해시 임차인의 책임이나 본차량손해 면책제도에 의거, 보상받으실수있습니다.</p>
         <p>이경우 면책금은 고객부담 입니다.</p>
         <br>
         <strong>사고시 휴차보상</strong>
         <p>차량 손해 발생시 수리기간동안 대여요금에 해당하는 휴차보상료가 청구되며 이는 임차인이 배상하여야 합니다.</p>         
      </div>
</div>

</div>
</body>
<%@ include file="../common/foot.jsp" %>
</html>   