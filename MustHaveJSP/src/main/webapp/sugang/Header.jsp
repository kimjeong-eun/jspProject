<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
 <style>
 
 * {
  font-family: "Nanum Gothic", sans-serif;
  font-weight: 400;
  font-style: normal;
}   
    
.container{
    width: 100%;
    background: linear-gradient(rgba(0,0,0,1),rgba(0,0,0,0.8));
}

.container .header{
    width: 80%;
    height: 80px;
    margin: 0 auto; /* 항상 중앙에 오도록 하기 위해서! */
    display: flex; /* 아이템들의 원활한 정렬을 위해서 */
    justify-content: space-between; /* 요소가 항상 좌우 끝으로 붙어서 보이도록 함 */
    align-items: center; /* 중앙 정렬 */
}

.container .header h1 a{
    text-decoration: none;
    color: white;
    font-family: abster; 
}
.container .nav ul li{
    display: inline-block; /* 가로로 정렬 */
    margin: 0 10px;
}

.container .nav ul li a{
    text-decoration: none;
    color: white;
}

.container .nav ul li a:hover{
    color: #1fdfdf;
}
</style>

</head>
<body>
    <div class="container">
        <div class="header">
            <h1><a href="./SuGang.je">Osam National University</a></h1>
            <div class="nav">
                <ul>
                	<c:choose>
                		<c:when test="${not empty stu_num }">
                			 <li style="color:white;">${stu_num }님 환영합니다.</li>
                			 <li><a href="./myPage.sg">마이페이지</a></li>
                			 <li><a href="./login.sg?logout=true">로그아웃</a></li>
                		</c:when>
                		<c:otherwise>
                			  <li style="color:white;">관리자님 환영합니다.</li>
                			  <li><a href="./login.sg?logout=true">로그아웃</a></li>
                		</c:otherwise>
                	</c:choose>
                   
                
                </ul>
            </div>    
        </div>
    </div>     
</body>
</html>