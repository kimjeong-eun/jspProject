<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일첨부형 게시판</title>
</head>
<body>
	
	<h1>${map.totalCount}</h1>
	
	<h2> 파일 첨부형 게시판 -목록보기</h2>
	
	<!--검색폼  -->
	<form method="get">
		<table border="1" width="90%">
		<tr>
			<td align="center">
				<select name="searchField">
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
				<input type="text" name="searchWord"/>
				<input type="submit" value="검색하기">
		</tr>
		</table>	
	</form>

	<!--목록 테이블 -->

	<table border="1" width="90%">
	<tr>
		<th width="10%">번호</th>
		<th width="*">제목</th>
		<th width="15%">작성자</th>
		<th width="10%">조회수</th>
		<th width="15%">작성일</th>
		<th width="8%">첨부</th>
	</tr>
<c:choose>
	<c:when test="${empty boardLists}">
		<tr>
			<td colspan="6" align="center">
				등록된 게시물이 없습니다.
			</td>
		</tr>
	</c:when>
	<c:otherwise>
		<c:forEach items="${boardLists}" var="row" varStatus="loop">
		<tr align="center">
			<td> ${map.totalCount - (((map.pageNum-1)*map.pageSize)+loop.index)} </td>
			<td align="left"> <a href="./View.je?idx=${row.idx}">${row.title}</a></td>
			<td>${row.name }</td>
			<td>${row.visitcount}</td>
			<td>${row.postdate}</td>
			<td><c:if test="${not empty row.ofile}"> <!--파일이 있다면  -->
				<a href="./Download.je?ofile=${row.ofile}&sfile=${row.sfile}&idx=${row.idx}">[다운로드]</a>	
				</c:if></td>
			</tr>
		</c:forEach>
	</c:otherwise>
</c:choose>
</table>

<!-- 하단메뉴   -->
<table border="1" width=90%>

<tr align="center">
	<td>${map.pagingImg}</td>
	<td width="100"><button type="button" onclick="location.href='./Write.je';">글쓰기</button></td>
</tr>
</table>
</body>
</html>