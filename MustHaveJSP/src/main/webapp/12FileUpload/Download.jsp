<%@ page import="utils.JSFunction"%>
<%@ page import="java.io.FileNotFoundException"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.OutputStream"%>
<%@ page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String saveDirectory = application.getRealPath("/Uploads");//  /Uploads 까지의 실제 경로 "c:/...
String saveFilename = request.getParameter("sName");
String originalFilename = request.getParameter("oName");

try {
    // 파일을 찾아 입력 스트림 생성
    File file = new File(saveDirectory, saveFilename);  
    InputStream inStream = new FileInputStream(file);
    
    // 한글 파일명 깨짐 방지
    String client = request.getHeader("User-Agent");
    //인터넷 익스플로러 브라우져에는 WOW64라는 User-Agent 목록이 있는데 익스플로러는
    //KSC5601이라는 getBytes를 이용하여 바이트배열로 변환 후 문자열을 재생성한다.
    if (client.indexOf("WOW64") == -1) {
        originalFilename = new String(originalFilename.getBytes("UTF-8"), "ISO-8859-1");
    }
    else {
        originalFilename = new String(originalFilename.getBytes("KSC5601"), "ISO-8859-1");
    }
   
    // 파일 다운로드용 응답 헤더 설정
    //리셋 후 다시 작성
    response.reset();
    //application/octet-stream의 경우 8비트 바이너리 배열입니다.
   //http나 이메일상에서 application이 지정되지 않거나 형식을 모를 때 사용합니다.
    response.setContentType("application/octet-stream");
    
    //Content-Disposition에 attachment를 주는 경우, Body에 오는 값을 다운로드 받으라는 뜻
	//attachment는 첨부파일을 의미.
	//fileName은 다운로드할때의 파일이름을 의미.
	//UTF-8인코더는 한글변환을 위함
	//attachment;와 fileName 사이에는 띄워쓰기를 꼭 해주어야 하고 인코드하는 뒤 부분 "\" 부분도 꼭 써줘야 다운로드가 가능.
    response.setHeader("Content-Disposition", 
                       "attachment; filename=\"" + originalFilename + "\"");
    response.setHeader("Content-Length", "" + file.length() );
    
    // 출력 스트림 초기화
    //jsp가 열린상태에서 다운로드를 위해 또다른 jsp를 열면 출력 스트림 중복으로 생성됨 (이것이 없으면 예외가 발생한다)
    out.clear();  
    
    // response 내장 객체로부터 새로운 출력 스트림 생성
    //http 응답 바디에 데이터를 쓸 수 있는 스트림을 얻어온다.
    OutputStream outStream = response.getOutputStream();  

    // 출력 스트림에 파일 내용 출력
    //file.length 길이만큼의 바이트 배열 생성 후
    //instream.read(b)는 file을 읽고 바이트배열 b에 읽은 바이트를 저장한다. (실제 읽은 바이트 수 반환)
    byte b[] = new byte[(int)file.length()];
    int readBuffer = 0;    
    while ( (readBuffer = inStream.read(b)) > 0 ) {
        outStream.write(b, 0, readBuffer);//0부터 읽은 바이트 수만큼 outstream에 write한다.
    }   
    // 입/출력 스트림 닫음
    inStream.close(); 
    outStream.close();
}
catch (FileNotFoundException e) {
    JSFunction.alertBack("파일을 찾을 수 없습니다.", out);
}
catch (Exception e) {
    JSFunction.alertBack("예외가 발생하였습니다.", out);
}
%>