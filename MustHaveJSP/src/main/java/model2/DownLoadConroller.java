package model2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fileupload.FileUtil;


@WebServlet("/14MVCBoard/Download.je")
public class DownLoadConroller extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		String ofile = req.getParameter("ofile"); //원본 파일명
		String sfile = req.getParameter("sfile"); //저장된 파일명
		String idx = req.getParameter("idx"); //게시물 일련번호
		
		//파일 다운로드
		FileUtil.download(req, resp,"/Uploads" ,sfile, ofile);
		
		//다운로드 수 증가
		
		MVCBoardDAO dao = new MVCBoardDAO();
		dao.downCountPlus(idx);
		dao.close();
	}
}
