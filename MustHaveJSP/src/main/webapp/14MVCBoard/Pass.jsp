<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
<script type="text/javascript">

	function validateForm(form) {
	    if (form.pass.value == "") {
	        alert("비밀번호를 입력하세요.");
	        form.pass.focus();
	        return false;
	    }
	}
</script>
</head>
<body>
<!-- passcontroller로부터 값을 받고 다시 passcontroller로 post방식으로 값을보냄  -->
<!--폼데이터 요소에 hidden태그로 게시물 인덱스와 모드 값을 넘김 (계속 들고다니는 값)-->
<h2>파일 첨부형 게시판 - 비밀번호 검증(Pass)</h2>
<form name="writeFrm" method="post" action="./Pass.je" onsubmit="return validateForm(this);">
<input type="hidden" name="idx" value="${ param.idx }" /> <!--보이지 않는 태그 값을 넘길 때 사용  -->
<input type="hidden" name="mode" value="${ param.mode }" /><!--보이지 않는 태그 값을 넘길 때 사용  -->
<table border="1" width="90%">
    <tr>
        <td>비밀번호</td>
        <td>
            <input type="password" name="pass" style="width:100px;" />
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <button type="submit">검증하기</button>
            <button type="reset">RESET</button>
            <button type="button" onclick="location.href='./List.je';">
                목록 바로가기
            </button>
        </td>
    </tr>
</table>    
</form>

</body>
</html>