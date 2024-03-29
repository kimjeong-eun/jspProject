<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View.jsp</title>
</head>
<body>
<h2>파일 첨부형 게시판 - 상세 보기(View)</h2>

<table border="1" width="90%">
    <colgroup> <!-- 테이블 컬럼의 스타일을 미리 지정할 수 있는 태그 (첫번째 컬럼은 width 15% 두번째는 35%....-->
        <col width="15%"/> <col width="35%"/>
        <col width="15%"/> <col width="*"/>
    </colgroup>

    <!-- 게시글 정보 -->
    <tr>
        <td>번호</td> <td>${ dto.idx }</td>
        <td>작성자</td> <td>${ dto.name }</td>
    </tr>
    <tr>
        <td>작성일</td> <td>${ dto.postdate }</td>
        <td>조회수</td> <td>${ dto.visitcount }</td>
    </tr>
    <tr>
        <td>제목</td>
        <td colspan="3">${ dto.title }</td>
    </tr>
    <tr>
        <td>내용</td>
        <td colspan="3" height="100">${ dto.content }</td>
    </tr>

    <!-- 첨부파일 -->
    <tr>
        <td>첨부파일</td>
        <td>
            <c:if test="${ not empty dto.ofile }">
            ${ dto.ofile }
            <a href="./Download.je?ofile=${ dto.ofile }&sfile=${ dto.sfile }&idx=${ dto.idx }">
                [다운로드]
            </a>
            </c:if>
        </td>
         <td>다운로드수</td>
        <td>${ dto.downcount }</td>
    </tr>

    <!-- 하단 메뉴(버튼) -->
    <tr>
        <td colspan="4" align="center">
            <button type="button" onclick="location.href='./Pass.je?mode=edit&idx=${ param.idx }';">
                수정하기
            </button>
            <button type="button" onclick="location.href='./Pass.je?mode=delete&idx=${ param.idx }';">
                삭제하기
            </button>
            <button type="button" onclick="location.href='./List.je';">
                목록 바로가기
            </button>
        </td>
    </tr>
</table>
</body>
</html>