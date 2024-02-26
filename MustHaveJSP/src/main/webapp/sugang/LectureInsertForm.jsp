<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function validateForm(form){
	if(form.lec_id.value == ""){
		alert("강좌번호를 입력하세요.")
		form.lec_id.focus();
		return false;
	}
	if(form.title.value == ""){
		alert("강좌명을 입력하세요.")
		form.title.focus();
		return false;
	}
	if(form.start_t.value == ""){
		alert("강의시작시간을 입력하세요.")
		return false;
	}
	if(form.end_t.value == ""){
		alert("강의끝시간을 입력하세요.")
		return false;
	}
	if(form.day.value == ""){
		alert("요일을 선택하세요.")
		return false;
	}
	if(form.score.value == ""){
		alert("학점을 입력하세요.")
		form.score.focus();
		return false;
	}
	if(form.classroom.value == ""){
		alert("강의실을 입력하세요.")
		form.classroom.focus();
		return false;
	}
	
}
</script>
</head>
<body>
	<h2>강의 추가 페이지 - 관리자모드</h2>
	<form name="LecCreFrm" method="post" action="../sugang/AdminMenu.je" onsubmit="return validateForm(this);">
	<table width="50%" border="1">
		<tr>
			<td>강좌번호(ex: A1111)</td>
			<td><input type="text" name="lec_id" style="width:95%;" /></td>
		</tr>
		<tr>
			<td>강좌명</td>
			<td><input type="text" name="title" style="width:95%;" /></td>
		</tr>
		<tr>
			<td>강의시간(시작 ~ 끝)</td>
			<td>
			<select name="start_t" style="width:44%;">
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
			</select>
			~ 
			<select name="end_t" style="width:44%;">
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
			</select>
			</td>
		</tr>
		<tr>
			<td>요일</td>
			<td>
				<select name="day" style="width:97%;">
					<option value="월">월</option>
					<option value="화">화</option>
					<option value="수">수</option>
					<option value="목">목</option>
					<option value="금">금</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>학점</td>
			<td><input type="text" name="score" style="width:95%;" /></td>
		</tr>
		<tr>
			<td>강의실</td>
			<td><input type="text" name="classroom" style="width:95%;" /></td>
		</tr>
		<tr>
			<td>교수이름(선택)</td>
			<td><input type="text" name="profe_name" style="width:95%;" /></td>
		</tr>
		<tr>
			<td>비고(선택)</td>
			<td><input type="text" name="ext" style="width:95%;" /></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit">작성완료</button>
				<button type="reset">다시작성하기</button>
				<button type="button" onclick="location.href='../sugang/SuGang.je';">뒤로가기</button>
			</td>
		</tr>
	
	</table>
	</form>
</body>
</html>