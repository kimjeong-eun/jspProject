<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String popupMode = "on"; //레이어 팝업창 띄울지 여부

Cookie[] cookies = request.getCookies(); //요청 헤더의 모든 쿠키 열기
if(cookies != null) {
	for(Cookie c : cookies) { 
		String cookieName = c.getName();
		String cookieValue = c.getValue();
		if(cookieName.equals("PopupClose")) {
			popupMode = cookieValue;
		} //request 영역에 쿠키 배열을 가져와 popupClose 이름을 갖는 쿠키를 popupMode에 넣는다.
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
font-family: SF Pro KR, SF Pro Display, SF Pro Icons, AOS Icons, Apple Gothic, HY Gulim, MalgunGothic, HY Dotum, Lexi Gulim, Helvetica Neue, Helvetica, Arial, sans-serif;
.layerPopup img{
margin-bottom : 20px;}
.layerPopup:before {display:block; content:""; position:fixed; left:0; top:0; width:100%; height:100%; background:rgba(0,0,0,.5); z-index:9000}
.layerPopup .layerBox {    z-index:10000;   
position:fixed; left:30%; top:48%; width:450px; height:600px; transform:translate(-50%, -50%); padding:30px; background:#fff; border-radius:6px; }
.layerPopup .layerBox .title {margin-bottom:10px; padding-bottom:10px; font-weight:600; border-bottom:1px solid #d9d9d9;}
.layerPopup .layerBox .btnTodayHide {
font-size:14px; font-weight:600; color:black; 
float: left;text-decoration:none;width: 150px; 
height : 30px;line-height:30px;border:black solid 1px; text-align : center;text-decoration:none;
}
.layerPopup div{
	display : inline;
}
.layerPopup form{
	margin-top : 5px;
	font-size:16px; font-weight:600;
	weight: 100%;
	height : 30px;
	line-height:30px
}
.layerPopup #close {
font-size:16px; font-weight:600; width: 40px; height : 30px;color:black; float: right; line-height:30px; text-align : center;text-decoration:underline;
}
.layerPopup a{
	text-decoration : none;
	color : black;width: 50px;height : 40px;
}
</style>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>
$(function() {
	$('#closeBtn').click(function() {
		$('#layer_popup').hide();
		var chkVal = $("input:checkbox[id=inactiveToday]:checked").val(); /* 체크가 되면 1, 안되면 NULL */
		$.ajax({ 
			url : '../popup/PopupCookie.jsp', //현재 디렉토리에 있는 jsp파일
			type : 'get',
			data : {inactiveToday : chkVal}, //key와 value 데이터 넘김
			dataType : "text",
			success : function(resData) {
				//if(resData != '') location.reload();
			}
		});
	});
});
</script>

<title>레이어 팝업 구현</title>
</head>
<body>
<!-- layer popup content -->
<% if(popupMode.equals("on")) { %>
<div class="layerPopup" id="layer_popup" style="visibility :visible;"> <!-- style="visibility:visible;">: 이 부분은 레이어 팝업을 감싸는 최상위 <div> 요소임 -->
	<div class="layerBox">
		<h4 class="title">오삼대학교 공지사항</h4> <!-- 제목 -->
		<div class="cont" width=90% height=90%> <!-- 내용 -->
			<img src="../img/popup.png" width=100% height=80% usemap="#popup" alt="event page">
			<!-- src : 이미지 파일의 경로 지정 usemap : 이미지 맵을 사용할 때 해당 이미지 맵의 이름을 지정 -->
		</div>
			<form name="pop_form">
				<div id="check">
				<input type="checkbox" name="chkbox" value="1" id="inactiveToday">
				<label for="checkbox">&nbsp&nbsp오늘 하루동안 보지 않기</label> <!-- 체크박스의 라벨을 정의 -->
				<input type="button" value="닫기" id="closeBtn">
				</div> 
			</form>
	</div>
<% } %>
</div>
</body>
</html>