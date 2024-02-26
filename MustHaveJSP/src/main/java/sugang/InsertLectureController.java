package sugang;

import java.io.IOException;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.JSFunction;

@WebServlet("/sugang/InsertCourse.je")
public class InsertLectureController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String lec_id = req.getParameter("lec_id");
		HttpSession session = req.getSession();
		String stu_num = (String) session.getAttribute("stu_num"); //로그인정보
		
		LectureDAO dao = new LectureDAO();
		LectureDTO dto = dao.getLecture(lec_id); //넣으려는 강의 정보가 담긴 dto
		dao.close();
		
		dao = new LectureDAO();
		List<LectureDTO> myList = dao.getMyList(stu_num);
		dao.close();
		dao = new LectureDAO();
		String reason = dao.isPossibleInsert(dto, myList);
		dao.close();
		
		if(!reason.equals("")) {
			
			StringTokenizer resultStr = new StringTokenizer(reason,"/");
			JSFunction.alertBack(resp,resultStr.nextToken()+"과목은 "+resultStr.nextToken()+"과목으로 인해 추가가 불가능합니다.");
			
		}else {
			dao = new LectureDAO();
			boolean result = dao.insertLecture(dto, stu_num);
			dao.close();
			if(result) {
				JSFunction.alertLocation(resp, "추가되었습니다.", "./SuGang.je");
			}else {
				JSFunction.alertBack(resp,"학점 초과로 인해 추가가 불가능합니다.");
			}
		}
	}
}
