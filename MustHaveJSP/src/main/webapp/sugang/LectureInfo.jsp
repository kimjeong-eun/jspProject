<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의정보</title>
</head>
<body>
<!--강의 정보를 출력하는 페이지  -->

	<%
		String title = request.getParameter("title");
		String lec_id = request.getParameter("lec_id");
		String profe_name = request.getParameter("profe_name");
		String start_t = request.getParameter("start_t");
		String end_t = request.getParameter("end_t");
		String score = request.getParameter("score");
		String ext = request.getParameter("ext");
		String classroom = request.getParameter("classroom");
			
		request.setAttribute("ext", ext);
	%>
	<h2>강의 정보</h2>
	<hr/>
	<ul>
		<li>강좌번호 : <%=lec_id %></li>
		<li>강의명 : <%=title %></li>
		<li>학점 : <%=score %></li>
		<li>교수명 : <%=profe_name %></li>
		<li>강의 시간 : <%=start_t %>:00 &nbsp;~&nbsp; <%=end_t %>:00 </li>
		<li>강의실 : <%=classroom %></li>
		<li>비고 : ${ext }</li>
	</ul>
		<button type="button" onclick="window.close()" style="cursor: pointer;">닫기</button>
</body>
</html>