package sugang;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.JSFunction;

@WebServlet("/sugang/ExceptLecture.je")
public class ExceptLectureController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String lec_id = req.getParameter("lec_id");
		HttpSession session = req.getSession();
		String stu_num = (String) session.getAttribute("stu_num");

		LectureDAO dao = new LectureDAO();
		LectureDTO dto = dao.getLecture(lec_id); // 제외할 lec_id
		dao.close();

		dao = new LectureDAO();
		boolean result = dao.exceptLecture(dto, stu_num);
		dao.close();
		
		if(result) {
			
			JSFunction.alertLocation(resp, "제외하였습니다.","./SuGang.je");
			
		}else {
			JSFunction.alertBack(resp,"제외를 실패하였습니다.");
		}
		
	}
	
	
}
