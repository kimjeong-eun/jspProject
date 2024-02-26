<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h4{
		color: red;
		font-weight: bold;
	}
</style>
</head>
<body>
	<h4>안녕하세요, 관리자 ${ admin_id }님 &nbsp; 관리자 메뉴 입니다. <c:if test="${ deleteMode eq 'yes' }">- 삭제모드</c:if><c:if test="${ editMode eq 'yes' }">- 수정모드</c:if></h4>
	<%-- <h4><c:if test="${ deleteMode eq 'yes' }">- 삭제모드</c:if></h4>
	<h4><c:if test="${ editMode eq 'yes' }">- 수정모드</c:if></h4> --%>
	<input type="button" onclick="location.href='../sugang/AdminMenu.je?mode=insert'" style="width:90%; height: 30px" value="강의추가" />
	<input type="button" onclick="location.href='../sugang/AdminMenu.je?mode=delete'" style="width:90%; height: 30px" value="강의삭제" />
	<input type="button" onclick="location.href='../sugang/AdminMenu.je?mode=edit'" style="width:90%; height: 30px" value="강의수정" />
</body>
</html>