package sugang;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/sugang/TimeTable.je")
public class TimeTableController extends HttpServlet {

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String stu_num = (String) session.getAttribute("stu_num");

		LectureDAO dao = new LectureDAO();
		List<LectureDTO> myList = dao.getMyList(stu_num);
		dao.close();

		req.setAttribute("myList", myList);

		req.getRequestDispatcher("/sugang/TimeTable.jsp").forward(req, resp);
	}

}
