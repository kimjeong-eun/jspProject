package model2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fileupload.FileUtil;
import utils.JSFunction;

@WebServlet("/14MVCBoard/Pass.je")
public class PassController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		req.setAttribute("mode", req.getParameter("mode")); //?
		req.getRequestDispatcher("/14MVCBoard/Pass.jsp").forward(req, resp);	
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String idx = req.getParameter("idx");//hidden 태그로 넘어온 값
		String mode = req.getParameter("mode"); //hidden 태그로 넘어온 값
		String pass = req.getParameter("pass"); 
		
		//비밀번호 확인
		MVCBoardDAO dao = new MVCBoardDAO();
		boolean confirmed = dao.confirmPassWord(pass,idx);
		dao.close();
		
		if(confirmed) {
			//비밀번호 일치
			if(mode.equals("edit")) {
				
				HttpSession session = req.getSession();
				session.setAttribute("pass", pass);
				resp.sendRedirect("./Edit.je?idx="+idx);
				
			}else if(mode.equals("delete")) {
				
				dao= new MVCBoardDAO();
				MVCBoardDTO dto = dao.selectView(idx);
				int result = dao.deletePost(idx); //게시물 삭제 메서드
				dao.close();
				if(result==1) {
					//게시물 삭제 성공 시 첨부파일도 삭제
					String saveFileName = dto.getSfile();
					FileUtil.delteFile(req, "/Uploads", saveFileName);
				}
				//삭제 후 메세지 출력 후 리스트 페이지로 이동
				JSFunction.alertLocation(resp, "삭제되었습니다.", "./List.je");
			}
		
		}else {
			//비밀번호 불일치
			JSFunction.alertBack(resp, "비밀번호 검증에 실패했습니다.");
		}
	}	
}
