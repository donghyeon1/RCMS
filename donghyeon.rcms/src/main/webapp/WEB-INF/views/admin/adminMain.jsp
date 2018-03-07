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
@import url("<c:url value="/css/adminMain.css"/>");
@import url("<c:url value="/css/comeon.css"/>");
</style>
<script>
var deleteFile = "";
var IMG_FORMAT = "\.(bmp|gif|jpg|jpeg|png)$";


$(function(){
   carouselListShow(); //carousel에 추가된 리스트
   carouselDelete();   //carousel에서 삭제 할 정보
   carouselDeleteBtn(); //carousel 삭제 정보 전달
   carouselAddBtn();   //carousel 추가 정보 전달
   getRecommendCars();   //차량 리스트 가져오기
   recommendCarAdd();   //추천 차량 추가
   recommendCarReduce();   //추천 차량 제거
   recommendCarSave(); //저장(저장 버튼 클릭해야 반영됨)
   
   
});

var carouselListShow = function(){
   var carouselList = $("#carouselList");
   var tr;
   carouselList.empty();
   
   $.ajax({
      url:"carouselList",
      success:function(carousels){
         $(carousels).each(function(idx, carousel){
            tr = $("<tr></tr>");
            td = $("<td>"+carousel.imgTitle+"</td><td>"+carousel.imgName+"</td>");
            td2 = $("<td><button type='button' data-toggle='modal' data-target='mainModal' name='delBtn' class='btn btn-primary btn-sm' value="+carousel.imgName+">삭제</button></td>");
            
            carouselList.append(tr.append(td).append(td2));
         });
      }
   });
}


   var carouselDelete = function() {
      $(document).on("click", "button[name=delBtn]", function(event) {
         deleteFile = $(event.target).val()
         $("#mainModal").modal();
      });
   }

   var carouselDeleteBtn = function() {
      $(document).on("click", "#deleteResult", function() {
         $.ajax({
            url : "carouselDelete",
            data : {
               fileName : deleteFile
            },
            success : function(result) {
               deleteResult()
            },
            complete : function() {
               carouselListShow();
            }
         });
      });
   };

   var carouselAddBtn = function() {
      $(":button#carouselAddBtn").bind("click",function() {
                  if (!$("#imgTitle").val()) {
                     $("#resultMsg").text("제목을 입력하세요.")
                     } else if (!$("#uploadFile").val()) {
                     $("#resultMsg").text("이미지파일을 선택하세요.")
                     } else if ($("#uploadFile").val() != "") {
                        var ext = $('#uploadFile').val().split('.').pop().toLowerCase();
                           if ($.inArray(ext, [ 'gif', 'png', 'jpg','jpeg' ]) == -1) {
                              $("#uploadInfo")[0].reset();
                              $("#resultMsg").text("이미지파일 형식이 아닙니다.")
                              return;
                           }
                        var formData = new FormData($("#uploadInfo")[0]);
                        $.ajax({
                           method : "post",
                           url : "upload/carouselAdd",
                           processData : false,
                           contentType : false,
                           data : formData,
                           success : function(msg) {
                              carouselListShow();
                              $("#uploadInfo")[0].reset();
                              switch (msg) {
                              case "success":$("#resultMsg").text(msg + "파일 이미지 업로드 성공.");break;
                              case "duplicate":$("#resultMsg").text("중복된 파일 명입니다."); break;
                              }
                           }
                        });
                     }
                  });
   };
   
var option = "";

var carList = new Array();
var nomalCarList = new Array();
var recommendCarList = new Array();
var nomalCarNumList = new Array();
var recommendCarNumList = new Array();

var getRecommendCars = function(){
   $("#nomalCarList").empty();
   $("#recommendCarList").empty();
   
   $.ajax({
      url:"recommendList",
      method:"post",
      success:function(carAllList){
         carList = carAllList;
         nomalCarList = carList.nomalCar;
         $(nomalCarList).each(function(idx, car){
            nomalCarNumList.push(car.carNum)
            
         });
         recommendCarList = carList.recommendCar;
         $(recommendCarList).each(function(idx, car){
            recommendCarNumList.push(car.carNum)
         });
         carListShow();
      }
   });
}

// var recommendCarAdd = function(){
// $("#addRight").on("click",function(){
//    $(nomalCarList).each(function(idx, car){
//    for(i=0; i<$("#nomalCarList").val().length; i++){
//       if(car.carNum == $("#nomalCarList").val()[i]){
//          nomalCarList.splice(nomalCarList.indexOf(car.carNum),1);
//          recommendCarList.push(car);
//       }
//    }
//    });
//    carListShow();
// });
// };

// var recommendCarReduce = function(){
// $("#addLeft").on("click",function(){
   
//    $(recommendCarList).each(function(idx, car){
//    for(i=0; i<$("#recommendCarList").val().length; i++){
//       if(car.carNum == $("#recommendCarList").val()[i]){
//          recommendCarList.splice(recommendCarList.indexOf(car.carNum),1);
//          nomalCarList.push(car);
//       }
//    }
//    });
//    carListShow();
// });
// };

function array_diff() {
    var args = array_diff.arguments;
    var T = args[0], arg, k, R = '', out = [];
    var d = array_diff.delim;
    for (k = 1; arg = args[k++];)
        R += arg.join(d) + d;
    for (k = 0; k < T.length; k++)
        if (R.indexOf(T[k] + d) < 0)
            out[out.length] = T[k];
    return out;
}
array_diff.delim = '*'; //임시 구분자 지정

var recommendCarAdd = function(){
$("#addRight").on("click",function(){
   nomalCarNumList = array_diff(nomalCarNumList, $("#nomalCarList").val());
   recommendCarNumList = recommendCarNumList.concat($("#nomalCarList").val());
   
   $(nomalCarList).each(function(idx, car){
   for(i=0; i<$("#nomalCarList").val().length; i++){
      if(car.carNum == $("#nomalCarList").val()[i]){
         delete nomalCarList[idx];
         recommendCarList.push(car);
      }
   }
   });
   nomalCarList = arr = nomalCarList.filter(function(e){return e}); 
   
   carListShow();
});
};

var recommendCarReduce = function(){
$("#addLeft").on("click",function(){
   recommendCarNumList = array_diff(recommendCarNumList, $("#nomalCarList").val());
   nomalCarNumList = nomalCarNumList.concat($("#recommendCarList").val());
   
   $(recommendCarList).each(function(idx, car){
      for(i=0; i<$("#recommendCarList").val().length; i++){
         if(car.carNum == $("#recommendCarList").val()[i]){
            delete recommendCarList[idx];
            nomalCarList.push(car);
         }
      }
      });
   recommendCarList = recommendCarList.filter(function(e){return e}); 
   carListShow();
});
};

var recommendCarSave = function(){
   $("#saveBtn").on("click",function(){
   var allList = []; //일반차량, 추천차량 번호들
   var nomalCarNums = []; //일반차량 차량번호들
   var recommendCarNums = []; //추천 차량번호들
   
//    if(nomalCarList.length>0){
//    $(nomalCarList).each(function(idx, car){
//       nomalCarNums.push(car.carNum);
//    })
//    }
   
//    if(recommendCarList.length>0){
//    $(recommendCarList).each(function(idx, car){
//       recommendCarNums.push(car.carNum);
//    })
//    }
   
//    var allList = {"nomalCarNums": nomalCarNums,"recommendCarNums": recommendCarNums};
   var allList = {"nomalCarNums": nomalCarNumList,"recommendCarNums": recommendCarNumList};
   
   jQuery.ajaxSettings.traditional = true;
   
   $.ajax({
      url:"recommendCarSave",
      method:"post",
      data:allList,
      success:function(carAllList){
         getRecommendCars();
      }
   });
   });
}

//getRecommendCars()으로 가져온 일반차량, 추천차량 selecte에 동적 추가
var carListShow = function(){
   $("#nomalCarList").empty();
   $("#recommendCarList").empty();
   $(nomalCarList).each(function(idx, car){
      $("#nomalCarList").append("<option value="+car.carNum+">[차량번호:"+car.carNum+"] [제조사: "+car.maker+"] [이름: "+car.carName+"] [색상: "+car.color+"] [차종: "+car.type+"]</option>")
   })
   $(recommendCarList).each(function(idx, car){
      $("#recommendCarList").append("<option value="+car.carNum+">[차량번호:"+car.carNum+"] [제조사: "+car.maker+"] [차량이름: "+car.carName+"] [색상: "+car.color+"] [차종: "+car.type+"]</option>")
   })
}
   

</script>
</head>
<body>
<div class="container">
<%@ include file="../common/head.jsp" %>
<div class="container">
<div class="title">
   <h3>관리자 페이지</h3>
</div>
<div id="comeon"><span class="glyphicon glyphicon-map-marker"></span><h3>메인화면 관리</h3></div>

<div id="subMenu">
<ul>
   <li><a href="adminMain">메인화면 관리</a></li>
   <li><a href="reservationMng">예약 관리</a></li>
   <li><a href="adminCarMng">차량 관리</a></li>
   <li><a href="adminUserMng">회원 관리</a></li>
</ul>
</div>

<div id="contentDiv" style="margin-bottom: 0px;">
   <div id="eventCar">
   <h3>이벤트 차량 관리</h3>
      <table id="eventCarTable" class="" style="text-align: center;">
         <thead>
            <tr>
               <th>제목</th>
               <th>파일 이름</th>
               <th>삭제</th>
            </tr>
         </thead>
         <tbody id="carouselList">
         </tbody>
      </table>
      <div id="upload">
      <form id="uploadInfo">
         <input id="uploadFile" name="uploadFile" type="file" style="margin-right:10px; float:left;">
         <input id="imgTitle" name="imgTitle" style="size:15px; float:left;" type="text">&nbsp;<button type="button" id="carouselAddBtn" class="btn btn-primary btn-sm">&nbsp;추가</button>
         <label id="resultMsg"></label>
      </form>
      </div>
   
   </div>
   <br>
   <br>
   <br>
   
   <div id="eventCar" style="float:left">
   <h3>추천 차량 관리</h3>
   
   <table>
   <tbody id="carList">
     <tr>
        <td><h5>일반 차량</h5></td>
        <td></td>
        <td><h5>추천 차량</h5></td>
     </tr>
     <tr>
      <td>
      <div style="width:400px;  border:1px black solid; overflow-x:auto;">
         <select name="recommeandCar" id="nomalCarList" style="width:500px; height:200px;" multiple>
         </select>
      </div>
      </td>
      <td style="width:15px; margin-left: 10px">
      <center>
         <button name="controlBtn" id="addRight" class="btn btn-default btn-sm controlBtn">
         <span class="glyphicon glyphicon-triangle-right"></span>
         </button>
         <br>
         <button name="controlBtn" id="addLeft" class="btn btn-default btn-sm controlBtn">
         <span class="glyphicon glyphicon-triangle-left"></span>
         </button>
         <br>
         <button type="button" id="saveBtn" class="btn btn-primary btn-sm controlBtn"><span class="glyphicon glyphicon-saved"></span>저장</button>
         
      </center>
      </td>
      <td>
      <div style="width:400px;  border:1px black solid; overflow-x:auto;">
         <select name="recommeandCar" id="recommendCarList" style="width:500px; height:200px;" multiple>
         </select>
      </div>
      </td>
     </tr>
   </tbody>
   </table>

   
   
   </div>

</div>
<div class="modal fade" id="mainModal">
      <div class="modal-dialog modal-sm">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h4 class="modal-title">메인화면 관리</h4>
            </div>
            <div class="modal-body">
            <center>
            <p>삭제 하시겠습니까?<p>
                <button type="button" class="btn btn-default" id="deleteBtn"  data-toggle="modal" data-target="#deleteResult">삭제</button>
            </center>
            </div>
         </div>
      </div>
   </div>
      
      <div class="modal" id="deleteResult" style="">
         <div class="modal-dialog modal-sm">
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal"
                     aria-hidden="true">×</button>
                  <h4 class="modal-title">메인화면 관리</h4>
               </div>
               <center>
               <div class="modal-body">
                  <p id="msg">삭제 완료<p>
               </div>
               </center>
               <div class="modal-footer">
                  <a href="adminMain"  class="btn">Close</a>
               </div>
            </div>
         </div>
      </div>

   </div>
</div>
</body>
<%@ include file="../common/foot.jsp" %>
</html>