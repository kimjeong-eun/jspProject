package model2;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;
import utils.JSFunction;

public class WriteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/14MVCBoard/Write.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//파일 업로드 처리
		//업로드 디렉터리 물리적 경로 확인
		String saveDirectory = req.getServletContext().getRealPath("/Uploads");
		
		//초기화 매개변수로 설정한 첨부 파일 최대 용량 확인
		ServletContext app = this.getServletContext();
		int maxPostSize = Integer.parseInt(app.getInitParameter("maxPostSize"));
		
		//파일업로드
		//new MultipartRequest(req, saveDirectory, maxPostSize,"UTF-8");
		MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, maxPostSize);
		
		if(mr==null) {
			JSFunction.alertLocation(resp, "첨부 파일이 제한 용량을 초과했습니다.", "./Write.je");
			return;
		}
		MVCBoardDTO dto = new MVCBoardDTO();
		 dto.setName(mr.getParameter("name"));
	     dto.setTitle(mr.getParameter("title"));
	     dto.setContent(mr.getParameter("content"));
	     dto.setPass(mr.getParameter("pass"));
	     
	     // 원본 파일명과 저장된 파일 이름 설정
	        String fileName = mr.getFilesystemName("ofile");
	        if (fileName != null) {
	            // 첨부 파일이 있을 경우 파일명 변경
	            // 새로운 파일명 생성
	            String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
	            String ext = fileName.substring(fileName.lastIndexOf("."));
	            String newFileName = now + ext;	    
	            
	            // 파일명 변경
	            //File.separator => \ => 운영체제에 맞는 구분자를 리턴
	            //saveDirectory 위치에있는 filName의 파일을 가르키는 파일 참조 변수 oldFile (없을 수도 있음)
	            File oldFile = new File(saveDirectory + File.separator + fileName);
	            File newFile = new File(saveDirectory + File.separator + newFileName);
	            oldFile.renameTo(newFile);
	            
	            dto.setOfile(fileName);  // 원래 파일 이름
	            dto.setSfile(newFileName);  // 서버에 저장된 파일 이름
	        }
	        
	        // DAO를 통해 DB에 게시 내용 저장
	        MVCBoardDAO dao = new MVCBoardDAO();
	        int result = dao.insertWrite(dto);
	        dao.close();
	        
	        // 성공 or 실패?
	        if (result == 1) {  // 글쓰기 성공
	            resp.sendRedirect("./List.je");
	        }
	        else {  // 글쓰기 실패
	            resp.sendRedirect("./Write.je");
	        }
	}
	
}
