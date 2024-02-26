package sugang;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.JSFunction;



@WebServlet("/sugang/login.sg")
public class LoginController extends HttpServlet {
	
	@Override
	   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	      HttpSession session = req.getSession(); //session
	      String logout = req.getParameter("logout");
	      
	      if(logout.equals("true"))
	         session.removeAttribute("stu_num");
	         session.removeAttribute("admin_id");
	         JSFunction.alertLocation(resp, "로그아웃이 완료되었습니다.", "./Login.jsp");
	   } // doGet()

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 매개변수 저장
		HttpSession session = req.getSession();
		String stu_num = req.getParameter("stu_num");
		String pw = req.getParameter("pw");
		
		StudentDAO dao = new StudentDAO();
		boolean loggedIn = dao.login(stu_num, pw);
		dao.close();
		
		if(loggedIn) {// 학생 테이블에 존재한다면
			
			SimpleDateFormat sdmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = new Date();
			String loginDate = sdmt.format(date);
			
			String clientIp = ""+req.getRemoteAddr();
			session.setAttribute("stu_num", stu_num); //로그인 정보 저장
			session.setAttribute("loginLog", loginDate); //로그인 시간 저장
			session.setAttribute("clientIp", clientIp ); //로그인 ip저장
			resp.sendRedirect("./SuGang.je"); // sugang.je
		} else {
			// 학생 테이블에 존재하지 않는다면
			dao = new StudentDAO();
			boolean admin = dao.adminLogin(stu_num, pw); //  관리자 테이블에 존재하는지 검증
			if(admin) { // 관리자 테이블에 존재한다면
				session.setAttribute("admin_id", stu_num); // admin_id 속성에 입력받은 id 저장
				resp.sendRedirect("./SuGang.je"); 
			} else { // 관리자 테이블에 존재하지 않는다면
				JSFunction.alertBack(resp, "로그인 정보가 일치하지 않습니다.");
			}
		}
	}
}
