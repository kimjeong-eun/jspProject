package sugang;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/sugang/myPage.sg")
public class myPageController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		StudentDAO dao = new StudentDAO();
		StudentDTO dto = new StudentDTO();
		HttpSession session = req.getSession();
		
		String stu_num = session.getAttribute("stu_num").toString();
		dto = dao.selectById(stu_num);
		dao.close();
		
		LectureDAO ldao = new LectureDAO(); 
	
		List<LectureDTO> myList = ldao.getMyList(stu_num);

		req.setAttribute("myDto", dto);
		req.setAttribute("myList", myList);
		req.getRequestDispatcher("/sugang/MyPage.jsp").forward(req, resp);
		
	}
}
