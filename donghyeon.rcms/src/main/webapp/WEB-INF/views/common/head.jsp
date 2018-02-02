<%@page import="donghyeon.rcms.common.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	User user=(User)session.getAttribute("user");
	if(user==null){
%>
	<a id="topLogin" href="login">로그인</a>
<%
	}else{
%>
	<a id="topLogin" href="logOut">로그아웃</a>
<%
	}
%>
 	<div id="logoText">
          <a id="logo" href=".">
           AWESOME CAR♥
           </a>
    </div>
   
   
 <nav class="navbar navbar-inverse">
   <div class="container-fluid">
      <ul class="nav navbar-nav">
         <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="comeon.html">회사 소개</a>
               <ul class="dropdown-menu" id="ul1">
                  <li><a href="comeon.html">오시는길</a></li>
                  <li><a href="#">인사말</a></li>
               </ul>
         </li>
         <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">대여 가이드</a>
               <ul class="dropdown-menu" id="ul2">
                  <li><a href="#">렌트안내</a></li>
                  <li><a href="#">보험및유의사항</a></li>
               </ul>
         </li>
         <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">실시간 예약</a>
         </li>
         <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">고객센터</a>
               <ul class="dropdown-menu" id="ul4">
                  <li><a href="#">이용후기</a></li>
                  <li><a href="#">Q&A</a></li>
               </ul>
         </li>
      </ul>
   </div>
</nav>