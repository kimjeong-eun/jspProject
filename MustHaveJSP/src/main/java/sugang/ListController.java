package sugang;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/sugang/SuGang.je")
public class ListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Map<String , Object> map = new HashMap<String, Object>();
		HttpSession session = req.getSession();
		
		String stuNum = (String) session.getAttribute("stu_num");
		String adminId = (String) session.getAttribute("admin_id");
		
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		if(searchWord != null) { // 검색어가 있으면
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		LectureDAO dao = new LectureDAO();
		
		List<LectureDTO> list = dao.getList(map);
		dao.close();
		
		if(adminId == null) { // 학생으로 로그인 했을 때만 나의 수강목록과 나의 학점을 보낸다.
			dao = new LectureDAO();
			List<LectureDTO> myList = dao.getMyList(stuNum);
			dao.close();
			
			dao = new LectureDAO();
			int score = dao.currentScore(stuNum); //현재 신청한 학점을 반환받음
			dao.close();
		
			req.setAttribute("curScore",score ); //현재 신청학점을 request로 보냄
			req.setAttribute("myList", myList);
		}
		
		req.setAttribute("lecList", list);
		
		// System.out.println("deleteMode:"+req.getParameter("deleteMode")); // 확인용
		
		req.getRequestDispatcher("/sugang/SuGang.jsp").forward(req, resp);
		
		
	}
}
