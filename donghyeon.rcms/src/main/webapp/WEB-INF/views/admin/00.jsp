<!DOCTYPE html>
<html lang="ko">
<head>
<title>AwesomeCar Main</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
	$("#page").bind("click",function(){
		location.href="../reservation/05.html";
	});
});
</script>
<style>
@import "../res/css/common.css";
</style>
</head>
<body>
<div class="container">


   <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
         <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
         <li data-target="#myCarousel" data-slide-to="1"></li>
         <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      
      <div class="carousel-inner">
         <div class="item active">
            <img src="../res/img/carpic.jpg">
         </div>
         
         <div class="item">
            <img src="../res/img/carpic01.jpg">
         </div>
         
         <div class="item">
            <img src="../res/img/gg.jpg">
         </div>
      </div>
   
   <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
   </a>
   <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
   </a>
   </div>
   

<form class="form-horizontal">
  <div style="text-align: center; margin-bottom: 30px; margin-top: 20px;">
  	<h4 style="color:white;">
  		<span class="glyphicon glyphicon-sunglasses"></span> 황규철 관리자님<br>
  		 반갑습니다
  	</h4>
  </div>
  <div class="col-sm-12">
      <a id="loginBtn" class="col-sm-12 btn btn-lg btnl" href="../admin/01.html">관리자 페이지</a>
      <a id="loginBtn" class="col-sm-8 btn btnl" style="margin-left: 40px;" href="../main.html">로그아웃</a>
    </div>
</form>
<div id="loginBanner">
	<a href="http://www.visitkorea.or.kr/" target="_blank"><img src="../res/img/loginBanner1.jpg" class="img-thumbnail"></a>
</div>
<div id="loginBanner">
	<a href="http://www.ex.co.kr/" target="_blank"><img id="loginBannerImg"src="../res/img/loginBanner2.jpg" class="img-thumbnail"></a>
</div>

</div><!-- 컨테이너끝  -->

<div class="container">
	<div id="reco"><h2>추천 차량</h2>
	</div>
	<div id="recoContainer">
		<div class="row">
		    <div class="thumbnail">
		      <img id="recoImg" src="../res/img/a.jpg">
		      <div class="caption">
		        <h3>차량명</h3>
		        <b>1일(24시간)</b><p id="price">40,000원</p>
		        <p><a id="detailBtn" href="#" class="btn btn-default" data-toggle="modal" data-target="#myModal"  role="button">상세보기</a></p>
		      </div>
		    </div>
		</div>
		<div class="row">
		    <div class="thumbnail">
		      <img id="recoImg" src="../res/img/a.jpg">
		      <div class="caption">
		        <h3>차량명</h3>
		        <b>1일(24시간)</b><p id="price">40,000원</p>
		        <p><a id="detailBtn" href="#" class="btn btn-default" data-toggle="modal" data-target="#myModal"  role="button">상세보기</a></p>
		      </div>
		    </div>
		</div>
		<div class="row">
		    <div class="thumbnail">
		      <img id="recoImg" src="../res/img/a.jpg">
		      <div class="caption">
		        <h3>차량명</h3>
		        <b>1일(24시간)</b><p id="price">40,000원</p>
		        <p><a id="detailBtn" href="#" class="btn btn-default" data-toggle="modal" data-target="#myModal"  role="button">상세보기</a></p>
		      </div>
		    </div>
		</div>
		<div class="row">
		    <div class="thumbnail">
		      <img id="recoImg" src="../res/img/a.jpg">
		      <div class="caption">
		        <h3>차량명</h3>
		        <b>1일(24시간)</b><p id="price">40,000원</p>
		        <p><a id="detailBtn" href="#" class="btn btn-default" data-toggle="modal" data-target="#myModal"  role="button">상세보기</a></p>
		      </div>
		    </div>
		</div>
		<div class="row">
		    <div class="thumbnail">
		      <img id="recoImg" src="../res/img/a.jpg">
		      <div class="caption">
		        <h3>차량명</h3>
		        <b>1일(24시간)</b><p id="price">40,000원</p>
		        <p><a id="detailBtn" href="#" class="btn btn-default" data-toggle="modal" data-target="#myModal"  role="button">상세보기</a></p>
		      </div>
		    </div>
		</div>
		<div class="row">
		    <div class="thumbnail">
		      <img id="recoImg" src="../res/img/a.jpg">
		      <div class="caption">
		        <h3>차량명</h3>
		        <b>1일(24시간)</b><p id="price">40,000원</p>
		        <p><a id="detailBtn" href="#" class="btn btn-default" data-toggle="modal" data-target="#myModal"  role="button">상세보기</a></p>
		      </div>
		    </div>
		</div>
		<div class="row">
		    <div class="thumbnail">
		      <img id="recoImg" src="../res/img/a.jpg">
		      <div class="caption">
		        <h3>차량명</h3>
		        <b>1일(24시간)</b><p id="price">40,000원</p>
		        <p><a id="detailBtn" href="#" class="btn btn-default" data-toggle="modal" data-target="#myModal"  role="button">상세보기</a></p>
		      </div>
		    </div>
		</div>
		<div class="row">
		    <div class="thumbnail">
		      <img id="recoImg" src="../res/img/a.jpg">
		      <div class="caption">
		        <h3>차량명</h3>
		        <b>1일(24시간)</b><p id="price">40,000원</p>
		        <p><a id="detailBtn" href="#" class="btn btn-default" data-toggle="modal" data-target="#myModal"  role="button">상세보기</a></p>
		      </div>
		    </div>
		  </div>
	</div>
	
	<!-- 예약 모달 -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">예약하기</h4>
				</div>
				<div class="modal-body">
					<div>
						<div style="float: left; margin: 10px;">
							<img src="../res/img/프라이드.gif" class="img-thumbnail">
						</div>
						<p>
							<b>차량명: </b> 프라이드<br>
							<b>차&nbsp;종: </b> 소형<br>
							<b>연&nbsp;비: </b> 13.3km/ℓ~19.0km/ℓ<br>
							<b>연&nbsp;료: </b> 가솔린<br>
							<b>제조사: </b> 기아<br>
							<b>색&nbsp;상: </b> 블루<br>
							<b>요&nbsp;금: </b> 40,000 원<br>
						</p>
						<form>
						<div class="form-group">
							<b>*인수 날짜</b>
							<input type="date"/>
							<b>*반납 날짜</b>
							<input type="date"/>
							<div>
								<a href="../reservation/05.html" id="page" class="btn btn-lg btn-info" data-toggle="modal" data-target="#myModal" style="margin: 20px 0 0 50px;"><span class="glyphicon glyphicon-time"></span>예약하기</a>
							</div>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<footer>
<div id="footer" class="container">	
   <div id="footerContent">
	   Copyright ⓒ awesomerentcar.com All rights reserved.<br>
	   서울특별시 구로구  구로동 182-13<br>
	   전화번호 : 010-4703-6105 | 사업자등록번호 : 111-22-33333 │ 개인정보관리책임: 김동현
   </div>
</div>
</footer>
</html>