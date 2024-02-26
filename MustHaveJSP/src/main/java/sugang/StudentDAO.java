package sugang;

import java.sql.SQLException;

import common.DBConnPool;

public class StudentDAO extends DBConnPool {
	
	public StudentDAO() {
		super();
	} // DBConnPool 연결

	public boolean login(String stu_num, String pw) {
		boolean loggedIn = true;
		try {
			String query = "select count(*) from student where stu_num = ? and pw = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, stu_num);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			rs.next();
			
			if(rs.getInt(1) == 0) {
				loggedIn = false;
			}
		} catch (Exception e) {
			loggedIn = false;
			e.printStackTrace();
		}
		return loggedIn;
	}		
	
	public boolean adminLogin(String stu_num, String pw) { // 관리자 로그인
		//System.out.println("관리자 로그인 실행");
		boolean admin = true;
		try {
			String query = "select count(*) from admin where admin_num = ? and pw = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, stu_num);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			rs.next();
			if(rs.getInt(1) == 0) {
				admin = false;
			}
		} catch (Exception e) {
			admin = false;
			e.printStackTrace();
		}
		return admin;
	}

	public StudentDTO selectById(String stu_num) {
		StudentDTO dto = new StudentDTO();
		String query = "select * from student where stu_num=?";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, stu_num);
			rs = pstmt.executeQuery();
			if(rs.next()) { //결과를 dto에 저장
				dto.setStu_num(rs.getString(1));
				dto.setName(rs.getNString(2));
				dto.setPw(rs.getString(3));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	public boolean updatePw(StudentDTO dto) {
		boolean result = false;
		try {
			String query = "update student set pw=? where stu_num=?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.getStu_num());
			
			int n = pstmt.executeUpdate();
			
			if(n>0) {
				con.commit();
				result = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
