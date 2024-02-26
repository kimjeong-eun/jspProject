package sugang;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;
import utils.JSFunction;

public class LectureDAO extends DBConnPool{

	
public List<LectureDTO> getList(Map<String , Object> map){
		
		List<LectureDTO> list = new Vector<LectureDTO>();

		String query = "select * from lecture "; // 조건이 없을 때
		if(map.get("searchWord") != null) {
			query += " where " + map.get("searchField") + " " + " like '%" + map.get("searchWord") + "%' " ; // 조건이 있을 때
		}
		query += " order by lec_id asc" ; 
		try {
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			 while(rs.next()) {
				 
				 LectureDTO dto = new LectureDTO();
				 
				 dto.setLec_id(rs.getString("lec_id"));
				 dto.setTitle(rs.getString("title"));
				 dto.setStart_t(rs.getInt("start_t"));
				 dto.setEnd_t(rs.getInt("end_t"));
				 dto.setScore(rs.getInt("score"));
				 dto.setClassroom(rs.getString("classroom"));
				 dto.setProfe_name(rs.getString("profe_name"));
				 dto.setExt(rs.getString("ext"));
				 dto.setDay(rs.getString("day"));
				 
				 list.add(dto);
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	public List<LectureDTO> getMyList(String stuNum ){
		//나의 수강목록 리스트를 반환하는 메서드
		List<LectureDTO> list = new Vector<LectureDTO>();
			
		 try {
			//String sql = "select * from leclist"+stuNum+" order by day desc , start_t asc";
			
			 String sql = "select * from student_leclist where stu_num = ? order by day desc , start_t asc";
			 
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1,stuNum);
			 rs = pstmt.executeQuery();
			
			 while(rs.next()) {
				 
				 LectureDTO dto = new LectureDTO();
				 
				 dto.setLec_id(rs.getString("lec_id"));
				 dto.setTitle(rs.getString("title"));
				 dto.setStart_t(rs.getInt("start_t"));
				 dto.setEnd_t(rs.getInt("end_t"));
				 dto.setScore(rs.getInt("score"));
				 dto.setClassroom(rs.getString("classroom"));
				 dto.setProfe_name(rs.getString("profe_name"));
				 dto.setExt(rs.getString("ext"));
				 dto.setDay(rs.getString("day"));
				 list.add(dto);
			 }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public LectureDTO getLecture(String lec_id) {
		//강좌번호로 강좌 정보를 반환하는 메서드
		LectureDTO dto = new LectureDTO();
		
		String sql = "select * from lecture where lec_id = ? ";
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,lec_id );
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				 dto.setLec_id(rs.getString("lec_id"));
				 dto.setTitle(rs.getString("title"));
				 dto.setStart_t(rs.getInt("start_t"));
				 dto.setEnd_t(rs.getInt("end_t"));
				 dto.setScore(rs.getInt("score"));
				 dto.setClassroom(rs.getString("classroom"));
				 dto.setProfe_name(rs.getString("profe_name"));
				 dto.setExt(rs.getString("ext"));
				 dto.setDay(rs.getString("day"));	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}
	
	public int currentScore(String stu_num ) {
		//현재 학점을 보여주는 메서드
		
		int score=0;
		try {
			//String sql = "select sum(score) from leclist"+stu_num;
			String sql = "select sum(score) from student_leclist where stu_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, stu_num );
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				score = rs.getInt(1);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return score;
	}
	
	public boolean insertLecture(LectureDTO dto, String stu_num ) {
		//수강신청 메서드.
		
		boolean possible = true;
		
		try {
			if(currentScore(stu_num)>(20-dto.getScore())) {
				
				possible = false;
				
			}else {
				
				//String sql = "insert into leclist"+stu_num+" values(?,?,?,?,?,?,?,?,?)";
				String sql = "insert into student_leclist values(?,?,?,?,?,?,?,?,?,?)";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getLec_id());
				pstmt.setString(2, dto.getTitle());
				pstmt.setInt(3, dto.getStart_t());
				pstmt.setInt(4, dto.getEnd_t());
				pstmt.setInt(5, dto.getScore());
				pstmt.setString(6, dto.getClassroom());
				pstmt.setString(7, dto.getProfe_name());
				pstmt.setString(8, dto.getExt());
				pstmt.setString(9, dto.getDay());
				pstmt.setString(10, stu_num);
				int result = pstmt.executeUpdate();
				
				if(result >1) {
					
					possible = true;
					con.commit();
				}
				
			}
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
			
		return possible;
	}
	
	public boolean exceptLecture(LectureDTO dto , String stu_num) {
		//추가한 수강목록을 제외하는 메서드 
		boolean result = false;
	
		int n=0;
		
			try {
				//String sql = "delete from leclist"+stu_num+" where lec_id ='"+dto.getLec_id()+"'";
				//String sql = "delete from leclist"+stu_num+" where lec_id = ? ";
				
				String sql = "delete from student_leclist where lec_id = ? and stu_num = ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getLec_id());
				pstmt.setString(2, stu_num);
				n = pstmt.executeUpdate();

				if(n>=1) {
					result=true;
					con.commit();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return result;
	}

	public String isPossibleInsert(LectureDTO dto , List<LectureDTO>myList) {
		//시간이 겹치는지 확인하는 메서드 
		String reason = ""; //추가를 못한다면 과목이름을 반환함
		for(int i=0;i<myList.size();i++) {
			
			if(dto.getDay().equals(myList.get(i).getDay())) {
				//넣으려는 과목의 요일이 내가 추가한 과목리스트의 요일과 같다면
				
				if((dto.getStart_t()<myList.get(i).getStart_t()&& dto.getEnd_t()>myList.get(i).getEnd_t())
					||(dto.getStart_t()>myList.get(i).getStart_t()&&dto.getStart_t()<myList.get(i).getEnd_t()) 	
					||(dto.getEnd_t()<myList.get(i).getEnd_t()&&dto.getEnd_t()>myList.get(i).getStart_t())
					||(dto.getStart_t()==myList.get(i).getStart_t()&& dto.getEnd_t()<myList.get(i).getEnd_t())	
					||(dto.getStart_t()==myList.get(i).getStart_t()&& dto.getEnd_t()>myList.get(i).getEnd_t())
					||(dto.getEnd_t()==myList.get(i).getEnd_t()&&dto.getStart_t()<myList.get(i).getStart_t())
					||(dto.getEnd_t()==myList.get(i).getEnd_t()&&dto.getStart_t()>myList.get(i).getStart_t())
					||(dto.getStart_t()==myList.get(i).getStart_t()&& dto.getEnd_t()==myList.get(i).getEnd_t())) {
					
					//넣으려는 수업 A / 추가되어있던 수업 B
					//A 시작시간이 B시작보다 작으면서 A끝나는시간이 B끝나는시간보다 크다면
					//A 시작시간이 B시작보다 크면서 A끝나는시간이 B끝나는 시간보다 작다면
					//A 끝나는시간이 B끝나는시간보다 작으면서 A끝나는 시간이 B시작시간보다 크다면
					//A 시작시간이 B시작시간과 같으면서 A끝나는시간이 B끝나는시간보다 작다면
					//A 시작시간이 B시작시간과 같으면서 A끝나는시간이 B끝나는 시간보다 크다면
					//A 끝나는시간이 B끝나는시간과 같으면서 A시작시간이 B시작시간보다 작다면
					//A 끝나는시간이 B끝나는시간과 같으면서 A시작시간이 B시작시간보다 크다면
					//A와 B가 같은시간이라면
					
					reason += dto.getTitle()+"/"+myList.get(i).getTitle();		
				}
			}
		}
		return reason;
	}
	
	public boolean adminCreateLecture(LectureDTO dto) { // 관리자모드로 새로운 강의를 추가하는 메서드
		boolean result = false;
		int i = 0; // insert가 성공했는지 실패했는지 판단
		try {
			String query = "insert into lecture(lec_id, title, start_t, end_t, day, score, classroom";
			// 폼에 필수가 아닌 필드들을 입력하는지, 하지않는지에 따른 insert문 ..... (선택항목 : 교수명, 비고)
			if(dto.getProfe_name() == null) { // 교수명을 입력하지 않고 비고만 입력했을 때
				query += ", ext) values(?, ?, ?, ?, ?, ?, ?, ?)"; 
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, dto.getLec_id());
				pstmt.setString(2, dto.getTitle());
				pstmt.setInt(3, dto.getStart_t());
				pstmt.setInt(4, dto.getEnd_t());
				pstmt.setString(5, dto.getDay());
				pstmt.setInt(6, dto.getScore());
				pstmt.setString(7, dto.getClassroom());
				pstmt.setString(8, dto.getExt());
			} else if(dto.getExt() == null) { // 비고를 입력하지 않고 교수명만 입력했을 때
				query += ", profe_name) values(?, ?, ?, ?, ?, ?, ?, ?)";
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, dto.getLec_id());
				pstmt.setString(2, dto.getTitle());
				pstmt.setInt(3, dto.getStart_t());
				pstmt.setInt(4, dto.getEnd_t());
				pstmt.setString(5, dto.getDay());
				pstmt.setInt(6, dto.getScore());
				pstmt.setString(7, dto.getClassroom());
				pstmt.setString(8, dto.getProfe_name());
			} else if(dto.getProfe_name() == null && dto.getExt() == null) { // 비고, 교수명 둘다 입력하지 않았을 때
				query += ") values(?, ?, ?, ?, ?, ?, ?)";
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, dto.getLec_id());
				pstmt.setString(2, dto.getTitle());
				pstmt.setInt(3, dto.getStart_t());
				pstmt.setInt(4, dto.getEnd_t());
				pstmt.setString(5, dto.getDay());
				pstmt.setInt(6, dto.getScore());
				pstmt.setString(7, dto.getClassroom());
			} else { // 모든 값을 입력했을 때
				query += ", profe_name, ext) values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, dto.getLec_id());
				pstmt.setString(2, dto.getTitle());
				pstmt.setInt(3, dto.getStart_t());
				pstmt.setInt(4, dto.getEnd_t());
				pstmt.setString(5, dto.getDay());
				pstmt.setInt(6, dto.getScore());
				pstmt.setString(7, dto.getClassroom());
				pstmt.setString(8, dto.getProfe_name());
				pstmt.setString(9, dto.getExt());
			}
			
			i = pstmt.executeUpdate();
			
			if(i >= 1) {
				result = true;
				con.commit(); // 성공하면 커밋
			}
		} catch (Exception e) {
			System.out.println("LectureDAO.adminCreateLecture(dto) 예외 발생");
			e.printStackTrace();
		}
		return result;
	}


	public boolean adminDeleteLecture(String lec_id) {
		// 강의삭제 메서드(관리자모드)
		boolean result = false;
		
		try {
			String query = "delete from lecture where lec_id = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, lec_id);
			int i = pstmt.executeUpdate();
			
			if(i >= 1) {
				result = true;
				con.commit(); // 성공하면 커밋
			}
		} catch (Exception e) {
			System.out.println("LectureDAO.adminDeleteLecture(lec_id) 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public boolean adminEditLecture(String lec_id, LectureDTO dto) { // 강의번호는 수정하지 못하게 한다.
		boolean result = false;
		String query = "update lecture set title = ?, start_t = ?, end_t = ?, day = ?, score = ?, classroom = ?, profe_name = ?, ext = ? where lec_id = ?";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, dto.getTitle());
			pstmt.setInt(2, dto.getStart_t());
			pstmt.setInt(3, dto.getEnd_t());
			pstmt.setString(4, dto.getDay());
			pstmt.setInt(5, dto.getScore());
			pstmt.setString(6, dto.getClassroom());
			pstmt.setString(7, dto.getProfe_name());
			pstmt.setString(8, dto.getExt());
			pstmt.setString(9, lec_id);
			
			int i = pstmt.executeUpdate();
			
			if(i >= 1) {
				result = true;
				con.commit();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} // 전달 객체 생성
		return result;
	}
}
