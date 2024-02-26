package sugang;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.JSFunction;

@WebServlet("/sugang/AdminMenu.je")
public class AdminMenuController extends HttpServlet {
	
	private final String lecIdPattern = "^[A-Z][0-9]{1,4}$";
	private final String titlePattern = "^[0-9a-zA-Zㄱ-ㅎ가-힣]{1,20}$"; //특수문자 불가능
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String mode = req.getParameter("mode");
		LectureDAO dao = new LectureDAO(); // 강의삭제를 위한 dao 생성

		if (mode.equals("insert")) // 강의추가 클릭
			req.getRequestDispatcher("../sugang/LectureInsertForm.jsp").forward(req, resp);
		
		else if (mode.equals("delete")) { // 강의삭제 클릭
			req.setAttribute("deleteMode", "yes");
			req.getRequestDispatcher("./SuGang.je").forward(req, resp);
			
		} else if (mode.equals("deleteGo")) { // 삭제할거냐 물봄 & 실행
			String lec_id = (String) req.getParameter("lec_id");
			boolean result = dao.adminDeleteLecture(lec_id);

			if (result) {
				JSFunction.alertLocation(resp, "강의 삭제에 성공했습니다.", "./SuGang.je");
			} else {
				JSFunction.alertBack(resp, "강의 삭제에 실패했습니다.");
			}

		} else if (mode.equals("edit")) { // 버튼띄우기
			req.setAttribute("editMode", "yes");
			req.getRequestDispatcher("./SuGang.je").forward(req, resp); // 이동해서 띄운 버튼 보고 클릭
			
		} else if (mode.equals("editForm")) { // 강좌번호와 이전입력값을 가지고 폼으로 가는
			String lec_id = (String) req.getParameter("lec_id");
			LectureDTO dto = dao.getLecture(lec_id);
			req.setAttribute("oldDto", dto); // dto.get머시기할 때 null한 번 잇는 거 한번 돈다 기록용
			// 수정폼에서 입력 컨트롤러로 보내고 List
			// dao로 lec_id 전달
			req.getRequestDispatcher("../sugang/LectureEditForm.jsp").forward(req, resp); // 작성 받고
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		LectureDAO dao = new LectureDAO();
		String mode = req.getParameter("mode");
		
		// 입력받은 폼 값 가져와서 dto 객체에 저장
		LectureDTO dto = new LectureDTO();
		dto.setLec_id(req.getParameter("lec_id"));
		dto.setTitle(req.getParameter("title"));
		dto.setStart_t(Integer.parseInt(req.getParameter("start_t")));
		dto.setEnd_t(Integer.parseInt(req.getParameter("end_t")));
		//System.out.println(dto.getStart_t() + " ~ " + dto.getEnd_t()); // 테스트
		dto.setDay(req.getParameter("day"));
		dto.setScore(Integer.parseInt(req.getParameter("score")));
		dto.setClassroom(req.getParameter("classroom"));
		dto.setProfe_name(req.getParameter("profe_name"));
		dto.setExt(req.getParameter("ext"));
		
		if (mode != null) { // 폼에서 새로입력받은값 가지고 판단하고 dao로 이동
			
			String lec_id = (String) req.getParameter("lec_id");
			
			if(!Pattern.matches(lecIdPattern, dto.getLec_id())) {
				//강좌번호 패턴에 일치한지
				JSFunction.alertBack(resp, "강좌번호 입력형식이 일치하지 않습니다!(ex:A1234)");
				
			}else if(dto.getStart_t()>dto.getEnd_t() || dto.getStart_t()==dto.getEnd_t()) {
				//시작시간이 끝나는 시간보다 크다면 || 같아도안됨
				JSFunction.alertBack(resp, "시작 시간이 끝나는 시간보다 클 수 없습니다!");
			}else if(!Pattern.matches(titlePattern, dto.getTitle())) {
				//강좌명 예외처리
				JSFunction.alertBack(resp, "강좌명은 1자이상 20자 이하로 입력해주세요!(특수문자불가)");
			}else if(dto.getScore()>4 || dto.getScore()<1) {
				//학점이 1보다작고 4보다 크다면
				JSFunction.alertBack(resp, "학점은 1학점 이상 4학점 이하로 입력 가능합니다!!!");
			}else if(!Pattern.matches(titlePattern, dto.getClassroom())) {
				//강의실명 예외처리
				JSFunction.alertBack(resp, "강의실명은 1자이상 20자 이하로 입력해주세요!(특수문자불가)");
			}else {
				//다 만족하면 수정가능
				boolean result = dao.adminEditLecture(lec_id, dto);
				dao.close();
				
				if (result) {
					JSFunction.alertLocation(resp, "강의수정에 성공했습니다.", "./SuGang.je");
				} else {
					JSFunction.alertBack(resp, "강의수정에 실패했습니다.");
				}
				
			}
			//System.out.println("------새로운거------");
			//System.out.println(dto.getDay());
			//System.out.println(dto.getLec_id());
		} else {
			
			if(!Pattern.matches(lecIdPattern, dto.getLec_id())) {
				//강좌번호 패턴에 일치한지
				JSFunction.alertBack(resp, "강좌번호 입력형식이 일치하지 않습니다!(ex:A1234)");
				
			}else if(dto.getStart_t()>dto.getEnd_t() || dto.getStart_t()==dto.getEnd_t()) {
				//시작시간이 끝나는 시간보다 크다면
				JSFunction.alertBack(resp, "시작 시간이 끝나는 시간보다 클 수 없습니다!");
			}else if(!Pattern.matches(titlePattern, dto.getTitle())) {
				//강좌명 예외처리
				JSFunction.alertBack(resp, "강좌명은 1자이상 20자 이하로 입력해주세요!(특수문자불가)");
			}else if(dto.getScore()>4 || dto.getScore()<1) {
				//학점이 1보다작고 4보다 크다면
				JSFunction.alertBack(resp, "학점은 1학점 이상 4학점 이하로 입력 가능합니다!!!");
			}else if(!Pattern.matches(titlePattern, dto.getClassroom())) {
				//강의실명 예외처리
				JSFunction.alertBack(resp, "강의실명은 1자이상 20자 이하로 입력해주세요!(특수문자불가)");
			}else {
				//다 만족하면 추가 가능
				dao= new LectureDAO();
				boolean result = dao.adminCreateLecture(dto); // 강의추가메서드가 성공했는지 ?
				
				if (result) {
					JSFunction.alertLocation(resp, "강의추가에 성공했습니다.", "./SuGang.je");
				} else {
					JSFunction.alertBack(resp, "강의추가에 실패했습니다.");
				}
			}

		}
		
	}
}
