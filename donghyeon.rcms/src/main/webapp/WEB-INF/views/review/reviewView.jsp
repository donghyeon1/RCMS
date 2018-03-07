<%@page import="donghyeon.rcms.common.domain.Review"%>
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
@import url("<c:url value="/css/comeon.css"/>");
@import url("<c:url value="/css/common2.css"/>");
</style>
<%
    // 줄바꿈 
    pageContext.setAttribute("br", "<br/>");
    pageContext.setAttribute("cn", "\n");
%> 
</head>
<body>


<div class="container">
<%@ include file="../common/head.jsp" %>
   <!-- 스크립트 -->
<script>
var comDel=0;
//쿼리스트링 빼오기
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

var commentAll = function(){
   var sessionId="";
   <% if(user!=null){ %>
      sessionId= "<%= user.getUserId()%>"
   <% } %>
   var success=1;
   $.ajax({
      method:"post",
      url:"coList",
      success:function(rvall){         
            $("#comment").empty();
            $(rvall).each(function(idx, comment){
               console.log(sessionId);
               if(QueryObject(window.location.search).revNum==comment.revNum){
                  success++;
                  if(sessionId == comment.userId){
                     $("#comm").after(
                        '<tr>'+
                           '<td style="text-align: center;">'+comment.userId+'</td>'+
                           '<td>'+comment.commContent+'</td>'+
                           '<td style="text-align: right;">'+comment.commRegDate+'</td>'+
                           '<td style="width:64px;"><button id="comDel" class="btn btn-default" name="comDel" value="'+comment.commNum+'">삭제</button></td>'+
                        '</tr>'      
                     );
                  }else{
                     $("#comm").after(
                           '<tr>'+
	                           '<td style="text-align: center;">'+comment.userId+'</td>'+
	                           '<td>'+comment.commContent+'</td>'+
	                           '<td style="text-align: right;">'+comment.commRegDate+'</td>'+
	                           '<td style="width:64px;"></td>'+
                           '</tr>'
                        );
                  }
                  $("#commentRow").attr("rowspan",success);
               }
            });         
      }   


   });
}



$(function(){
   //등록버튼 클릭시
   $("#coinsert").bind("click",function(){
      console.log($("#content1").val());
      $.ajax({
         method:"POST",
         url: "coInsert",
         data: {                  
               commContent: $("#content1").val(),
               revNum:QueryObject(window.location.search).revNum
               },
         success: function(result){
            if(result){
               $("#content1").val("");               
            }
            location.href="rvView?revNum="+QueryObject(window.location.search).revNum;
         }
      });
   });      
});

$(function(){
   //삭제버튼클릭시
   $(document).on('click','button[name="comDel"]',function(){
      comDel=$('button[name="comDel"]:hover').val();
      console.log(comDel);
      $.ajax({
         method:"POST",
         url: "replyDel",
         data: { commNum: comDel},
         success: function(){
            location.href="rvView?revNum="+QueryObject(window.location.search).revNum;
         }
            
      });

   });
   
})

   

$(function(){
   commentAll();
   $("#back").on("click",function(){
	   history.back();
   });
});
</script>
<!-- 스크립트 -->
<center><div id="comeon"><span class="glyphicon glyphicon-list-alt"></span><h3>이용 후기</h3></div></center>

<div id="wrap">
    <br><br>
    <center>
    <div id="board">
	<table class="list" style="width:800px;">
		<thead>
			<tr>
				<th>${review.revTitle }</th>
				<th style="float: right;">
					작성일
					<span class="num">${review.revRegDate }</span>
					<span class="txt_bar"> | </span>
					작성자
					<span class="num">${review.userId }</span>
				</th>
			</tr>
		</thead>
				<tbody class="view_body">
			<tr>
				<td colspan="2" class="view">
				<hr>
					<p>
						<span style="font-family:arial,helvetica,sans-serif;"><span style="font-size:12px;">${fn:replace(review.revContent, cn,br)}</span></span>
					</p>
				</td>
			</tr>
		</tbody>
	</table>
	</center>
	<div>
		<p style="font-size:15px; color:orange; margin: 20px 0 10px 30px;" >댓글</p>
			<input id="content1" type="text" style="width:700px; height:40px; margin-right: 10px;"><button class="btn btn-default" id="coinsert">등록</button>
	</div>
	<table class="table table-condensed">
		<tr>
			<th style="width:100px; text-align: center;">작성자</th>
			<th style="width:500px; text-align: center;">댓글내용</th>
			<th style="width:100px; text-align: center;">작성일</th>
		</tr>
		<tr id="comm">
			
		</tr>
	</table>
	<div>
        <%	 String writerId= ((Review)request.getAttribute("review")).getUserId();
           		 if(user==null){ %>
                    <a class="btn btn-default" id="back">목록</a>

              <% }else if(user.getUserId().equals(writerId)){ %>
                    <a class="btn btn-default" href="review">목록</a>            
                     <a href="rvUpdateOpen?revNum=${review.revNum }" id="updateBtn" class="btn btn-default" name="revNum">수정</button>                  
                     <a class="btn btn-default" data-toggle="modal" data-target="#mySmallModal">삭제</a>
              <% }else{ %> 
              		<a class="btn btn-default" id="back">목록</a>
              <% } %> 
    </div>
    
    <div style="margin-bottom: 100px;"></div>
</div>   
</div>  
   
   <div class="modal fade" id="mySmallModal">
      <div class="modal-dialog modal-sm">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h4 class="modal-title">정말 삭제하시겠습니까? </h4><br>
               <form>
                  <button type="submit" formaction="rvDel" id="delBtn" class="btn btn-lg btn-info" name="revNum" value="${review.revNum}">삭제</button>
               </form>
            </div>
         </div>
      </div>
   </div> 
</body>

<%@ include file="../common/foot.jsp" %>
</html>