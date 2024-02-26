<%@page import="fileupload.MyFileDAO"%>
<%@page import="fileupload.MyFileDTO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String saveDirectory = application.getRealPath("/Uploads"); //저장할 디렉터리
	int maxPostSize = 1024 * 1024; //파일 최대 크기 (1mb = 1024 * 1kb)
	String encoding = "UTF-8";
	
	try{
		MultipartRequest mr = new MultipartRequest(request,saveDirectory,maxPostSize,encoding);
	 	
		//새로운 파일명 생성
		String fileName = mr.getFilesystemName("attatchedFile"); // main.jsp에 form의 file태그 name임/ 첨부파일명
		String ext = fileName.substring(fileName.lastIndexOf(".")); //확장자
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
		String newFileName = now + ext; //새로운 파일 이름("20240208_시분초초.확장자")
	 
		//파일명 변경 (c:\\update\\김기원.hwp)
		
		File oldFile = new File(saveDirectory + File.separator+fileName); //File.separator => \ 
		File newFile = new File(saveDirectory + File.separator+newFileName);
		oldFile.renameTo(newFile); //파일명 변경완료
		
		//폼값 받기
		String name = mr.getParameter("name");
		String title = mr.getParameter("title");
		String[] cateArray = mr.getParameterValues("cate");
		StringBuffer cateBuf = new StringBuffer();
		String joincate ="";
		
		if(cateArray==null){
			cateBuf.append("선택없음");		
		}else{
			//for(String s : cateArray){
			//	cateBuf.append(s+", "); //  String.join(",",cateArray);
		//	}
			
			joincate = String.join(",", cateArray); //문자열배열 요소를 ','로 붙인다. 
		}
		MyFileDTO dto = new  MyFileDTO();
		dto.setName(name);
		dto.setTitle(title);
		//dto.setCate(cateBuf.toString());
		dto.setCate(joincate);
		dto.setOfile(fileName);
		dto.setSfile(newFileName); // 폼으로 입력받은 내용을 변환하여 객체 생성
		
		//6. DAO를 통해 데이터베이스에 반영
		MyFileDAO dao = new MyFileDAO();
		dao.insertFile(dto);
		dao.close();
		
		response.sendRedirect("FileList.jsp");
	}catch(Exception e){
		e.printStackTrace();
		request.setAttribute("errorMessage","파일 업로드 오류");
		request.getRequestDispatcher("FileUploadMain.jsp").forward(request, response);
	}
 %>   
    