<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지(오삼대학교)</title>
<link href="../css/updatePw.css" rel="stylesheet" type="text/css">
<link
   href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
   rel="stylesheet">
<style type="text/css">

   #backimg{

opacity: 0.3;
width: 100%;
height: 100%;

position: absolute;
left: 0;
top: 30px;
z-index: -10;
} 
</style>

</head>
<body>

<img src="../img/university.jpg" id="backimg"> 

<c:import url="./Header.jsp"/>

   <div id="wrap">
         <div id="container" style="height:1000px;">
            <!-- CONTENTS -->
            <div id="content">
            <!-- section_pwconfirm -->
            <div class="section_pwconfirm">
               <div class="spc_header">
                  <h1 style="text-align-last: center;">${myDto.name} 님의 마이페이지</h1><br>
                  <br>
                  <h3 style="text-align-last: left; font-weight:bold;">[ 내 정보 ]</h3><br>
                  <p class="contxt contxt_list">
                     <em style="color:#666; font-weight:bold;">최근 로그인</em> &nbsp|&nbsp ${loginLog}
                  </p>
                  <p class="contxt contxt_list">
                       <em style="color:#666; font-weight:bold;">IP</em> &nbsp|&nbsp ${clientIp}
                  </p>
                  <p class="contxt contxt_list">
                     <em style="color:#666; font-weight:bold;">학번</em> &nbsp|&nbsp ${myDto.stu_num }
                  </p>
               </div>
               <div class="spc_content">
               <h3 style="text-align-last: left; font-weight:bold;">[ 정보변경 ]</h3><br>
                  <form id="fm">
                     <fieldset>
                        <p class="btn_area_btm">
                           <button type="button" id="changeSubmit" onclick="location.href='./UpdatePw.jsp'">비밀번호 변경</button>
                           <br>
                           <button type="button" onclick="location.href='./SuGang.je'">뒤로가기</button>
                        </p>
                     </fieldset>
                  </form>
               </div>
            </div>                              
         </div>   
      </div>
   </div>
</body>
</html>