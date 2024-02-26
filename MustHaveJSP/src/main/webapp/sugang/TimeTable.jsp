
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오삼대학교 수강신청</title>

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

table {
	background-color: white;
}

table{
	table-layout: fixed; /* 테이블 레이아웃 고정 */	
	border-collapse: collapse;
}

table td{
	height: 30px;
}

table{
 	float: left;
 }
table tr td{

	text-overflow: ellipsis; /* 글자가 넘어갈 경우 생략기호 표시 */
	overflow: hidden;
	white-space: nowrap; /* 공백문자가 있는경우  줄바꿈하지 않고 한줄로 나오게 처리함 */
}

table th{

	font-weight: 700;
	background-color: #dcdcdc;

}

table#timeT tr td{
	
	text-align: center;
	font-weight: 700;
}
.subjectData td:hover{

 border: 2px solid black;
 background-color: #DCDCDC;

}

.btn{

position:absolute;
left:320px;
top:590px;
float: left;
margin-right: 10px;

}

#timeTable{

	position: relative;
	transform: translate(20%,100px);
}

/* 화면 인쇄 속성 설정 */

@media print {

	table{
		width: 100px;
		height: 200px;
	}
		
	table tr td{
		font-size: 5%;
		color: blue;
	}	
}
</style>

<!-- 같은 내용 과목이 쓰여진 table td를 병합하는 메서드 -->
<script type="text/javascript">

$('.monday').each(function () {
	
	var rows = $('.monday:contains("' +$(this).text()+ '")' );
	if(rows.length > 1){
		rows.eq(0).attr('rowspan',rows.length);
		rows.eq(0).css('height',rows.length*30+'px');
		rows.not(':eq(0)').remove();
	}
});	

$('.tuesday').each(function () {
	
	var rows = $('.tuesday:contains("' +$(this).text()+ '")' );
	if(rows.length > 1){
		rows.eq(0).attr('rowspan',rows.length);
		rows.eq(0).css('height',rows.length*30+'px');
		rows.not(':eq(0)').remove();
	}
});	
$('.wednesday').each(function () {
	
	var rows = $('.wednesday:contains("' +$(this).text()+ '")' );
	if(rows.length > 1){
		rows.eq(0).attr('rowspan',rows.length);
		rows.eq(0).css('height',rows.length*30+'px');
		rows.not(':eq(0)').remove();
	}
});	

$('.thursday').each(function () {
	
	var rows = $('.thursday:contains("' +$(this).text()+ '")' );
	if(rows.length > 1){
		rows.eq(0).attr('rowspan',rows.length);
		rows.eq(0).css('height',rows.length*30+'px');
		rows.not(':eq(0)').remove();
	}
});	

$('.friday').each(function () {

	var rows = $('.friday:contains("' +$(this).text()+ '")' );
	if(rows.length > 1){
		rows.eq(0).attr('rowspan',rows.length);
		rows.eq(0).css('height',rows.length*30+'px');
		rows.not(':eq(0)').remove();
	}
});	
});

$(document).ready(function() {
	


/* 시간표를 인쇄하는 메서드  */
function f_print(){
	//프린트를 하기 전 전체 화면을 initBody에 저장
    var initBody = document.body.innerHTML;
	
    //프린트 전 전체 화면에 출력을 하고싶은 부분만 지정
    window.onbeforeprint = function(){
        document.body.innerHTML = document.getElementById("timeTable").innerHTML;
    }
    
    //프린트 후 처음에 저장한 initBody를 다시 할당
    window.onafterprint = function(){
        document.body.innerHTML = initBody;
    }
    window.print();
}

</script>
</head>
<body>	

 <img src="../img/university.jpg" id="backimg"> 
<c:import url="./Header.jsp"/>

<div class="btn">
<button type="button" id="backBtn" onclick="location.href='./SuGang.je'" style="cursor: pointer;">뒤로가기</button>
<button type="button" id="printBtn" onclick="f_print()" style="cursor: pointer;">시간표 인쇄</button>
</div>

<div id="timeTable" class="a4">

	<table border="1" width="10%" id="timeT" >
		<tr><th>시간</th></tr>
		<tr ><td>9:00~10:00</td></tr>
		<tr><td>10:00~11:00</td></tr>
		<tr><td>11:00~12:00</td></tr>
		<tr><td>12:00~13:00</td></tr>
		<tr><td>13:00~14:00</td></tr>
		<tr><td>14:00~15:00</td></tr>
		<tr><td>15:00~16:00</td></tr>
		<tr><td>16:00~17:00</td></tr>
		<tr><td>17:00~18:00</td></tr>
		<tr><td>18:00~19:00</td></tr>
		<tr><td>19:00~20:00</td></tr>
		<tr><td>20:00~21:00</td></tr>	
	</table>
	<!--월요일  -->
	<table border="1" width="10%" class="lecList">
	<tbody class="subjectData">
	<tr><th align="center">월</th></tr>		
	<c:set var="index_flag" value="9"></c:set>
		<c:forEach var="j" items="${myList}">
			<c:choose>
				<c:when test="${j.day eq '월' }">
					<c:set var="loop_flag" value="true" />
						<c:forEach var="i" begin="${index_flag}" end="20" varStatus="loop">
							<c:if test="${loop_flag}">
							<fmt:formatNumber var="starStr" value="${j.start_t }"></fmt:formatNumber>
								<c:choose>
									<c:when test="${loop.current eq j.start_t }">
										<fmt:parseNumber  var="end_t" value="${j.end_t}"/>
										<fmt:parseNumber  var="start_t" value="${j.start_t}"/>		
										<c:set var="time" value="${ end_t - start_t}"></c:set>	
											<c:forEach var="k" begin="1" end="${time }">
												<tr><td align="center" class="monday" style="cursor: pointer;" onclick="window.open('./LectureInfo.jsp?title=${j.title}&lec_id=${j.lec_id }&start_t=${j.start_t }&end_t=${j.end_t }&profe_name=${j.profe_name }&ext=${j.ext }&day=${j.day }&score=${j.score }&classroom=${j.classroom }','info','width=300px,height=300px')"> ${j.title}</td></tr>		
											</c:forEach>
										<c:set var="index_flag" value="${loop.current + time }"></c:set>
										<c:set var="loop_flag" value="false"></c:set>	
									</c:when>
									<c:otherwise>
										<tr><td>&nbsp;</td></tr>					
									</c:otherwise>			
								</c:choose>
							</c:if>					
						</c:forEach>
				</c:when>
			</c:choose>
		</c:forEach>	
		<c:forEach var="i" begin="${index_flag}" end="20">
			<tr><td>&nbsp;</td></tr>
		</c:forEach>
		</tbody>
	</table>	
	
	<!-- 화  -->
	<table border="1" width="10%" class="lecList">
	<tbody class="subjectData">
	<tr><th align="center">화</th></tr>		
	<c:set var="index_flag" value="9"></c:set>
		<c:forEach var="j" items="${myList}">
			<c:choose>
				<c:when test="${j.day eq '화' }">
					<c:set var="loop_flag" value="true" />
						<c:forEach var="i" begin="${index_flag}" end="20" varStatus="loop">
							<c:if test="${loop_flag}">
							<fmt:formatNumber var="starStr" value="${j.start_t }"></fmt:formatNumber>
								<c:choose>
									<c:when  test="${loop.current eq j.start_t }">
										<fmt:parseNumber  var="end_t" value="${j.end_t}"/>
										<fmt:parseNumber  var="start_t" value="${j.start_t}"/>		
										<c:set var="time" value="${ end_t - start_t}"></c:set>	
											<c:forEach var="k" begin="1" end="${time }">
												<tr><td align="center" class="tuesday" style="cursor: pointer;" onclick="window.open('./LectureInfo.jsp?title=${j.title}&lec_id=${j.lec_id }&start_t=${j.start_t }&end_t=${j.end_t }&profe_name=${j.profe_name }&ext=${j.ext }&day=${j.day }&score=${j.score }&classroom=${j.classroom }','info','width=300px,height=300px')"> ${j.title}</td></tr>				
										</c:forEach>
										<c:set var="index_flag" value="${loop.current + time }"></c:set>
										<c:set var="loop_flag" value="false"></c:set>	
									</c:when>
									<c:otherwise>
										<tr><td>&nbsp;</td></tr>					
									</c:otherwise>			
								</c:choose>
							</c:if>					
						</c:forEach>
				</c:when>
			</c:choose>
		</c:forEach>	
		<c:forEach var="i" begin="${index_flag}" end="20">
			<tr><td>&nbsp;</td></tr>
		</c:forEach>
		</tbody>
	</table>	
	
	<!-- 수  -->
	<table border="1" width="10%" class="lecList">
	<tbody class="subjectData">
	<tr><th align="center">수</th></tr>		
	<c:set var="index_flag" value="9"></c:set>
		<c:forEach var="j" items="${myList}">
			<c:choose>
				<c:when test="${j.day eq '수' }">
					<c:set var="loop_flag" value="true" />
						<c:forEach var="i" begin="${index_flag}" end="20" varStatus="loop">
							<c:if test="${loop_flag}">
							<fmt:formatNumber var="starStr" value="${j.start_t }"></fmt:formatNumber>
								<c:choose>
									<c:when  test="${loop.current eq j.start_t }">
										<fmt:parseNumber  var="end_t" value="${j.end_t}"/>
										<fmt:parseNumber  var="start_t" value="${j.start_t}"/>		
										<c:set var="time" value="${ end_t - start_t}"></c:set>	
											<c:forEach var="k" begin="1" end="${time }">
												<tr><td align="center" class="wednesday" style="cursor: pointer;" onclick="window.open('./LectureInfo.jsp?title=${j.title}&lec_id=${j.lec_id }&start_t=${j.start_t }&end_t=${j.end_t }&profe_name=${j.profe_name }&ext=${j.ext }&day=${j.day }&score=${j.score }&classroom=${j.classroom }','info','width=300px,height=300px')"> ${j.title}</td></tr>		
										</c:forEach>
										<c:set var="index_flag" value="${loop.current + time }"></c:set>
										<c:set var="loop_flag" value="false"></c:set>	
									</c:when>
									<c:otherwise>
										<tr><td>&nbsp;</td></tr>					
									</c:otherwise>			
								</c:choose>
							</c:if>					
						</c:forEach>
				</c:when>
			</c:choose>
		</c:forEach>	
		<c:forEach var="i" begin="${index_flag}" end="20">
			<tr><td>&nbsp;</td></tr>
		</c:forEach>
		</tbody>
	</table>	
	
	<!-- 목 -->
	<table border="1" width="10%" class="lecList">
	<tbody class="subjectData">
	<tr><th align="center">목</th></tr>		
	<c:set var="index_flag" value="9"></c:set>
		<c:forEach var="j" items="${myList}">
			<c:choose>
				<c:when test="${j.day eq '목' }">
					<c:set var="loop_flag" value="true" />
						<c:forEach var="i" begin="${index_flag}" end="20" varStatus="loop">
							<c:if test="${loop_flag}">
							<fmt:formatNumber var="starStr" value="${j.start_t }"></fmt:formatNumber>
								<c:choose>
									<c:when  test="${loop.current eq j.start_t }">
										<fmt:parseNumber  var="end_t" value="${j.end_t}"/>
										<fmt:parseNumber  var="start_t" value="${j.start_t}"/>		
										<c:set var="time" value="${ end_t - start_t}"></c:set>	
											<c:forEach var="k" begin="1" end="${time }">
												<tr><td align="center" class="thursday" style="cursor: pointer;" onclick="window.open('./LectureInfo.jsp?title=${j.title}&lec_id=${j.lec_id }&start_t=${j.start_t }&end_t=${j.end_t }&profe_name=${j.profe_name }&ext=${j.ext }&day=${j.day }&score=${j.score }&classroom=${j.classroom }','info','width=300px,height=300px')"> ${j.title}</td></tr>		
										</c:forEach>
										<c:set var="index_flag" value="${loop.current + time }"></c:set>
										<c:set var="loop_flag" value="false"></c:set>	
									</c:when>
									<c:otherwise>
										<tr><td>&nbsp;</td></tr>					
									</c:otherwise>			
								</c:choose>
							</c:if>					
						</c:forEach>
				</c:when>
			</c:choose>
		</c:forEach>	
		<c:forEach var="i" begin="${index_flag}" end="20">
			<tr><td>&nbsp;</td></tr>
		</c:forEach>
		</tbody>
	</table>	
	
	<!--금 -->
	<table border="1" width="10%" class="lecList">
	<tbody class="subjectData">
	<tr><th align="center">금</th></tr>		
	<c:set var="index_flag" value="9"></c:set>
		<c:forEach var="j" items="${myList}">
			<c:choose>
				<c:when test="${j.day eq '금' }">
					<c:set var="loop_flag" value="true" />
						<c:forEach var="i" begin="${index_flag}" end="20" varStatus="loop">
							<c:if test="${loop_flag}">
							<fmt:formatNumber var="starStr" value="${j.start_t }"></fmt:formatNumber>
								<c:choose>
									<c:when  test="${loop.current eq j.start_t }">
										<fmt:parseNumber  var="end_t" value="${j.end_t}"/>
										<fmt:parseNumber  var="start_t" value="${j.start_t}"/>		
										<c:set var="time" value="${ end_t - start_t}"></c:set>	
											<c:forEach var="k" begin="1" end="${time }">
												<tr><td align="center" class="friday" style="cursor: pointer;" onclick="window.open('./LectureInfo.jsp?title=${j.title}&lec_id=${j.lec_id }&start_t=${j.start_t }&end_t=${j.end_t }&profe_name=${j.profe_name }&ext=${j.ext }&day=${j.day }&score=${j.score }&classroom=${j.classroom }','info','width=300px,height=300px')"> ${j.title}</td></tr>		
										</c:forEach>
										<c:set var="index_flag" value="${loop.current + time }"></c:set>
										<c:set var="loop_flag" value="false"></c:set>	
									</c:when>
									<c:otherwise>
										<tr><td>&nbsp;</td></tr>					
									</c:otherwise>			
								</c:choose>
							</c:if>					
						</c:forEach>
				</c:when>
			</c:choose>
		</c:forEach>	
		<c:forEach var="i" begin="${index_flag}" end="20">
			<tr><td>&nbsp;</td></tr>
		</c:forEach>
		</tbody>
	</table>	
</div>
</body>
</html>