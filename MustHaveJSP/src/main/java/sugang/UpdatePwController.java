package sugang;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.JSFunction;

@WebServlet("/sugang/UpdatePw.sg")
public class UpdatePwController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//입력한 값 가져오기
		HttpSession session = req.getSession();
		String stu_num = session.getAttribute("stu_num").toString();
		
		String now_pw = req.getParameter("now_pw"); //현재 비밀번호
		String new_pw = req.getParameter("new_pw"); //새 비밀번호
		String conf_pw = req.getParameter("conf_pw"); //새 비밀번호 확인
		
		StudentDAO dao = new StudentDAO();
		StudentDTO dto = dao.selectById(stu_num); 	
		dao.close(); //stu_num 과 동일한 객체 가져오기 종료
		
		String pw = dto.getPw(); //현재 비밀번호 가져오기(dto)
		
		if(!pw.equals(now_pw)) { 
			JSFunction.alertBack(resp, "비밀번호가 일치하지 않습니다.");
		} else if(pw.equals(now_pw)){ //통과~!
			if(new_pw.equals(now_pw)) { 
				JSFunction.alertBack(resp, "기존 패스워드와 동일한 패스워드로 변경이 불가합니다.");
			} else { //통과~!
				if(!new_pw.equals(conf_pw)) {
					JSFunction.alertBack(resp, "비밀번호 재확인 바랍니다.");
				} else { //통과~!
					dto.setPw(new_pw);
					dao = new StudentDAO();
					boolean result = dao.updatePw(dto);
					dao.close(); //업데이트 종료
					if(result) {
						JSFunction.alertLocation(resp, "비밀번호 변경을 완료하였습니다.", "./myPage.sg");
					} else {
						JSFunction.alertBack(resp, "비밀번호 변경을 실패하였습니다.");
					}
				}
			}
		}
	}
}