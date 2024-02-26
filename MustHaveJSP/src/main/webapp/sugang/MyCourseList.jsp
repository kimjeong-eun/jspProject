<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyCousreList</title>
<style type="text/css">

</style>
</head>
<body>

	<h4 style="font-weight: 700;">${stu_num }의 수강 목록  &nbsp; &nbsp; 신청학점: ${curScore }</h4>
	<button type="button"  id="showTable" onclick="location.href='./TimeTable.je'" style="cursor: pointer;">시간표 보기</button>
		<!--컬럼명  -->
	<table border="1" width="79%">
		<tr>
			<th width="10%">강좌번호</th>
			<th width="*">강좌명</th>
			<th width="15%">시간</th>
			<th width="4%">학점</th> 
			<th width="10%">강의실</th>
			<th width="15%">교수명</th>
			<th width="8%">비고</th>
			<th width=4%>요일</th>
			<th width="8%">제외</th>
		</tr>
	</table>
<div class="MylecList">
	<table  border="1" width="100%">
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
	<!--empty  -->
	<c:choose>
	 <c:when test="${empty myList}">
	 	
	 	<tr height="250px">
	 		<td colspan="9" align="center">'신청한 과목이 존재하지 않습니다!'</td>
	 	</tr>
	 </c:when>
	 <c:otherwise>		
		<c:forEach var="row" items="${myList}" >
			<tr>
				<td>${row.lec_id}</td>
				<td>${row.title}</td>
				<td align="center">${row.start_t}:00~${row.end_t}:00</td>
				<td align="center">${row.score}</td>
				<td>${row.classroom}</td>
				<td align="center">${row.profe_name}</td>
				<td>${row.ext}</td>
				<td align="center">${row.day}</td>
				<td><button type="button" onclick="location.href='./ExceptLecture.je?lec_id=${row.lec_id}'" style="width:90%; cursor:pointer;">제 외</button></td>
			</tr>
		</c:forEach>
	 </c:otherwise>
	</c:choose>	
	</table>
</div>

</body>
</html>