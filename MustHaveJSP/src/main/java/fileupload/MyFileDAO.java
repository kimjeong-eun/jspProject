package fileupload;

import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import common.DBConnPool;

public class MyFileDAO extends DBConnPool {

	//jdbc 연결해서 sql문을 처리한다.
	//새로운 게시물을 입력
	
	public int insertFile(MyFileDTO dto) {
		
		int applyResult = 0;
		
		try {
			String sql = "insert into myfile(idx,name,title,cate,ofile,sfile) values (seq_board_num.nextval,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getCate());
			pstmt.setString(4, dto.getOfile());
			pstmt.setString(5, dto.getSfile());
			
			applyResult = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insert 중 예외발생");
			e.printStackTrace();
		}
		return applyResult;	
	}
	
    public List<MyFileDTO> myFileList() {
        List<MyFileDTO> fileList = new Vector<MyFileDTO>();

        // 쿼리문 작성
        String query = "SELECT * FROM myfile ORDER BY idx DESC";
        try {
            pstmt = con.prepareStatement(query);  // 쿼리 준비
            rs = pstmt.executeQuery();  // 쿼리 실행

            while (rs.next()) {  // 목록 안의 파일 수만큼 반복
                // DTO에 저장
                MyFileDTO dto = new MyFileDTO();
                dto.setIdx(rs.getString(1));
                dto.setName(rs.getString(2));
                dto.setTitle(rs.getString(3));
                dto.setCate(rs.getString(4));
                dto.setOfile(rs.getString(5));
                dto.setSfile(rs.getString(6));
                dto.setPostdate(rs.getString(7));
                
                fileList.add(dto);  // 목록에 추가
            }
        }
        catch (Exception e) {
            System.out.println("SELECT 시 예외 발생");
            e.printStackTrace();
        }        
        return fileList;  // 목록 반환
    }

}


