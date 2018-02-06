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
@import url("<c:url value="/css/rentGuide.css"/>");
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
   <div id="comeon"><span class="glyphicon glyphicon-saved
"></span><h3>렌트 안내</h3></div>
</section>
</center>
<center>
<table id="infoTable">
   <thead>
      <tr>
         <th>예약하기</th>
         <th>예약 / 결제</th>
         <th>챠량 인수</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td>
            <span>전화 예약, 온라인 예약, 지점방문 예약</span>
            <p>(전화/온라인 예약시 차종별 가능여부를반드시 확인하시기 바랍니다.)</p>
         </td>
         <td>
            <p>전차량임대차계약서 작성(면허증지참)
처음 이용하시는 경우 신원확인을 위해
            <p>카드결제(방문고객), 현금결제가능</p>
         </td>
         <td>
            <span>차량확인후 인수</span>
            <p>차량 외관, 작동상태 확인하고 차량임대차 계약서 서명후 인수</p>         
         </td>
      </tr>
   </tbody>
</table>
</center>

</div>

</div>
</body>
<%@ include file="../common/foot.jsp" %>
</html>   