<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연습페이지</title>
<script type="text/javascript">

function clickm(str) {
	
	window.alert("안녕하세요"+str);	
}

</script>
</head>
<body>

<c:set var="index" value="hihihi" scope="request"></c:set>
<button type="button" onclick="clickm('${index}');">눌러볼래요?</button>

<a href="./TimeTable.je">눌러보세요</a>

</body>
</html>