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
<div class="container">
<%@ include file="../common/head.jsp" %>

<div id="subMenu">
<ul>
   <li><a href="tocome">오시는 길</a></li>
   <li><a href="greet">인사말</a></li>
</ul>
</div>
<div id="comeon"><span class="glyphicon glyphicon-map-marker"></span><h3> 오시는길</h3></div>
		<section class="content">
			<h2 style="margin-top: 30px;">대중교통 이용방법</h2>
			<article>				
				<p style="margin-right: 10px;">
					주소<br>
					서울특별시 구로구 디지털로 306 <br>(구로동, 대륭포스트타워 2차 212호,218호,219호)<br> 
					2호선 구로디지털단지역 3번 출구<br> 서울관악고용센터 바로 옆 

				</p>
			</article>
		</section>
		     <iframe style="margin-top: 10px;"src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1882.4735891294672!2d126.89637009731798!3d37.485964384380246!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c9e3b23ec4b27%3A0xaee10d7ad8be029f!2z64yA66Wt7Y-s7Iqk7Yq47YOA7JuMMuywqA!5e0!3m2!1sko!2skr!4v1516179653974" width="800" height="400" frameborder="0" style="border:0" allowfullscreen></iframe>
		      
</div>

</div>
</body>
<%@ include file="../common/foot.jsp" %>
</html>