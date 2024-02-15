package model2;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.BoardPage;

public class ListController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		MVCBoardDAO dao = new MVCBoardDAO();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		
		if(searchWord!=null) {
			
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);		
		}
		int totalCount = dao.selectCount(map); //게시물 개수
		
		ServletContext app = this.getServletContext();
		int pageSize = Integer.parseInt(app.getInitParameter("POST_PER_PAGE"));
		int blockPage = Integer.parseInt(app.getInitParameter("PAGES_PER_BLOCK"));
		
		//현재 페이지 확인
		int pageNum = 1;
		String pageTemp = req.getParameter("pageNum");
		//요청으로 받은 현재 페이지가 있다면
		if(pageTemp!=null && !pageTemp.equals("")) {
			pageNum=Integer.parseInt(pageTemp); //현재 페이지는 요청받은 페이지
		}
		
		//목록에 풀력할 게시물 범위 계산
		int start = (pageNum-1)*pageSize+1;// 첫 게시물 번호
		int end = pageNum * pageSize; //마지막 게시물 번호
		
		map.put("start", start);
		map.put("end", end);
		
		
		List<MVCBoardDTO> boardLists = dao.selectListPage(map);
		dao.close();
		
		//페이징처리 html 구문이 담긴 문자열 반환받음
		String pagingImg = BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "./List.je");
		 map.put("pagingImg", pagingImg);
	        map.put("totalCount", totalCount);
	        map.put("pageSize", pageSize);
	        map.put("pageNum", pageNum);

	        
	        // 전달할 데이터를 request 영역에 저장 후 List.jsp로 포워드
	        req.setAttribute("boardLists", boardLists);
	        req.setAttribute("map", map);
	        req.getRequestDispatcher("./List.jsp").forward(req, resp);
	}
	
	
	
}
