<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오삼대학교 수강신청</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

<style type="text/css">

* {
  font-family: "Nanum Gothic", sans-serif;
  font-weight: 400;
  font-style: normal;
}

.lecList{
	
	width:96%;
	height:300px;
/* 	border: 1px solid red; */
	overflow-x: hidden;
	overflow-y: auto;
	
	
}
.MylecList{
	
	width:80%;
	height:150px;
	overflow-x: hidden;
	overflow-y: scroll;
	background-color: white;
}

 tr:hover td{

 	border: 3px solid black;
}

#backimg{

opacity: 0.3;
width: 100%;
height: 100%;

position: absolute;
left: 0;
top: 0;
z-index: -10;
} 

form td, form tr, table{
	background-color: white;
}

</style>

<script>
function deleteYesorNo(lec_id){
	//alert("lec_id:"+str); // 확인용
	var result = confirm("정말 삭제하시겠습니까 ?");
	//alert("result:"+result); // 확인용
	if(result){
		location.href='../sugang/AdminMenu.je?mode=deleteGo&lec_id=' + lec_id;
	}else{
	    alert("삭제를 취소했습니다.");
	    location.href='../sugang/SuGang.je?deleteMode=yes';
	}
}
</script>

</head>
<body>

<img src="../img/university.jpg" id="backimg"> 

<c:import url="./Header.jsp"/>

<form method="get"  >
		<table border="1" width="95%">
		<tr>
			<td align="center">
				<select name="searchField">
					<option value="title">강좌명</option>
					<option value="lec_id">강좌번호</option>
					<option value="profe_name">교수명</option> <!-- sql과 같은 이름으로 변경 했습니다!(쿼리문 작성할 때 필요) -->
				</select>
				<input type="text" name="searchWord"/>
				<input type="submit" value="검색하기">
		</tr>
		</table>	
	</form>
<!--컬럼명  -->
	<table border="1" width="95%">
		<tr>
			<th width="10%">강좌번호</th>
			<th width="*">강좌명</th>
			<th width="15%">시간</th>
			<th width="4%">학점</th> 
			<th width="10%">강의실</th>
			<th width="15%">교수명</th>
			<th width="8%">비고</th>
			<th width=4%>요일</th>
			<th width="8%">신청</th>
		</tr>
	</table>
<!--목록테이블  -->
	<div class="lecList">
	<table border="1" width="100%">
		<colgroup>
			<col width="10%"/>
			<col width="*"/>
			<col width="15%"/>
			<col width="4%"/>
			<col width="10%"/>
			<col width="15%"/>
			<col width="8%"/>
			<col width="4%"/>
			<col width="8%"/>
		</colgroup>	
		
	<!-- 강좌 list를 받아서 검색조건에 맞게 뿌리면 될 것 같습니다 -->	
	<!-- 리스트가 비어있다면 '검색조건에 일치하는 데이터가 없습니다' 출력!  -->
	<c:choose>
	 <c:when test="${empty lecList}">
	 	<tr height="250px">
	 		<td colspan="9" align="center">'검색조건에 일치하는 데이터가 없습니다'</td>
	 	</tr>
	 </c:when>
	 <c:otherwise>		
		<c:forEach var="row" items="${lecList}" >
			<tr>
				<td>${row.lec_id}</td>
				<td>${row.title}</td>
				<td align="center">${row.start_t}:00~${row.end_t}:00</td>
				<td align="center">${row.score}</td>
				<td>${row.classroom}</td>
				<td align="center">${row.profe_name}</td>
				<td>${row.ext}</td>
				<td align="center">${row.day}</td>
				<c:choose>
				<c:when test="${ deleteMode eq 'yes' }">
					<td><button type="button" onclick="deleteYesorNo('${ row.lec_id }');" style="width:90%;">삭 제</button></td>
				</c:when>
				<c:when test="${ editMode eq 'yes' }"> <!-- 에딧모드일 때 -->
					<td><button type="button" onclick="location.href='../sugang/AdminMenu.je?mode=editForm&lec_id=${row.lec_id}'" style="width:90%;">수 정</button></td> 
				</c:when>
				<c:when test="${empty stu_num }">
					<td><button type="button" onclick="location.href='./InsertCourse.je?lec_id=${row.lec_id}'" style="width:90%; pointer-events: none; cursor:not-allowed; ">신 청(학생전용)</button></td>
				</c:when>
				<c:otherwise>
					<td><button type="button" onclick="location.href='./InsertCourse.je?lec_id=${row.lec_id}'" style="width:90%; cursor: pointer;">신 청</button></td>
				</c:otherwise>
				</c:choose>
			</tr>
		</c:forEach>
	 </c:otherwise>
	</c:choose>	
	</table>
</div>

<c:choose>
<c:when test="${ empty admin_id }">
	<c:import url="./MyCourseList.jsp"></c:import>
</c:when>
<c:otherwise> <!-- 관리자 아이디라면  -->
	<c:import url="./Admin.jsp?deleteMode=${ deleteMode }"></c:import>
</c:otherwise>
</c:choose>

</body>
</html>