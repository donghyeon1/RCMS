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
</head>
<body>
<div class="container" style="margin-bottom: 0px;">
	<%@ include file="../common/head.jsp" %>
<div class="container">
<div id="subMenu">
<ul>
   <li><a href="tocome">오시는 길</a></li>
   <li><a href="greet">인사말</a></li>
</ul>
</div>
<div id="comeon"><span class="glyphicon glyphicon-map-marker"></span><h3> 인사말</h3></div>
		<section class="content">	
			<div class="jumbotron">
			  <h2 style="color:black;">어썸렌트카(주)를 찾아주셔서 진심으로 감사드립니다.</h2><br>			
			  <p style="color:black;">
			  		안녕하세요!!<br>
			  		<br>
					저희 어썸렌트카는 고객감동을 최우선으로 최고의 만족과 최고의 서비스를 드리고자 최선을다하고 있습니다<br>
					각종 최신형 차량을 보유하여 고객이 원하는 서비스를 실시하고 있으며 <br>
					전 차량 보험가입, 전 차량오토 서비스를 실시하고 있으며 좋은차량만을 공급하여 고객의 만족을 보장합니다.<br>
					<br>
					고객의 필요성을 항상 분석하고 연구하여 저비용, 고효율의 서비스 상품의 개발과 함께 <br>
					고객 여러분들께 다양한 혜택을 보장해 드리겠습니다.<br>
					<br>
					저희 어썸렌트카는 신뢰를 바탕으로 성실과 친절을 생활화하여<br>
					최상의 서비스로 고객 여러분을 모시는 회사가 되겠습니다.<br>
					<br>
					고객 여러분의 소중한 시간을 편리하고 즐거운 여행이 되도록 어썸렌트카의 임직원 일동은<br>
					항상 최선을 다 할것을 약속드립니다.<br>
					<br>
					감사합니다.
			  </p>
			</div>
		</section>
</div>

</div>
</body>
<%@ include file="../common/foot.jsp" %>
</html>	