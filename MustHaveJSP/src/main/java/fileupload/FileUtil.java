package fileupload;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

public class FileUtil {
	//파일 업로드 (multipart/form-data 요청) 처리
	public static MultipartRequest uploadFile(HttpServletRequest req, String saveDirectory, int maxPostSize) {
	
		try {
			return new MultipartRequest(req, saveDirectory, maxPostSize,"UTF-8");
		} catch (IOException e) {	
			e.printStackTrace();
			return null;
		}
	}
	// 명시한 파일을 찾아 다운로드합니다.
    public static void download(HttpServletRequest req, HttpServletResponse resp,
            String directory, String sfileName, String ofileName) {
    	
    	//application영역의 파일이 저장된 공간의 경로를 얻어옴
        String sDirectory = req.getServletContext().getRealPath(directory);
        try {
            // 파일을 찾아 입력 스트림 생성
        	//저장경로 아래의 저장파일이름을 붙여 실제 저장된 파일을 참조하는 변수 선언
            File file = new File(sDirectory, sfileName);
            //파일을 읽어오기 위해 inputstream 변수 선언후 해당 파일을 읽도록 준비
            InputStream iStream = new FileInputStream(file);

            // 한글 파일명 깨짐 방지
            //바이트로 읽어온 후 유니코드 처리 
            String client = req.getHeader("User-Agent");
            if (client.indexOf("WOW64") == -1) {
                ofileName = new String(ofileName.getBytes("UTF-8"), "ISO-8859-1");
            }
            else {
                ofileName = new String(ofileName.getBytes("KSC5601"), "ISO-8859-1");
            }

            // 파일 다운로드용 응답 헤더 설정
            //파일 다운로드를 위해 response 객체를 초기화 시켜줘야함
            resp.reset();
            
            //"다목적 인터넷 메일 확장"이라는 뜻으로, 웹을 통해 여러 형태의 파일을 전달하는데 사용됨
            //파일의 종류가 확실히 정해지지 않은 상태에서 파일을 얻어오기위해 씀
            resp.setContentType("application/octet-stream");
            //Content-Disposition 헤더 항목에 attachment를 붙임으로써 후에 오는 파일 이름의 파일을 다운받아라 라는 뜻임
            //바디에 내용이 쓰여있어야함
            resp.setHeader("Content-Disposition",
                           "attachment; filename=\"" + ofileName + "\"");
         
            //파일의 크기를 얻어와서 문자열로 헤더에 저장
            resp.setHeader("Content-Length", "" + file.length() );

            //out.clear();  // 출력 스트림 초기화 //jsp상에서는 초기화시켜줘야함

            // response 내장 객체로부터 새로운 출력 스트림 생성
            //response 객체 바디의 내용을 쓰기위해 
            OutputStream oStream = resp.getOutputStream();

            // 출력 스트림에 파일 내용 출력
            //파일 크기만큼의 바이트 배열을 선언함
          
            byte[] b = new byte[(int)file.length()];
            
            //파일을 읽는 스트림이 읽은후에 바로 바이트배열 b에 저장함. (읽은 바이트 수를 반환함)
            int readBuffer = 0;
            while ( (readBuffer = iStream.read(b)) > 0 ) {
            	//response바디에 b바이트 배열의 0번째부터 읽은 버퍼 수만큼 write함
                oStream.write(b, 0, readBuffer);
            }
                
            //ofileName 라는 이름으로 바디에는 iStream으로 read한 내용이 담기게 되고 
            //Content-Disposition헤더에 attachment; 함으로써 다운받기가 가능함
            
            // 입/출력 스트림 닫음
            iStream.close();
            oStream.close();
        }
        catch (FileNotFoundException e) {
            System.out.println("파일을 찾을 수 없습니다.");
            e.printStackTrace();
        }
        catch (Exception e) {
            System.out.println("예외가 발생하였습니다.");
            e.printStackTrace();
        }
    }

	public static void delteFile(HttpServletRequest req, String directory , String filename) {
		// 파일을 삭제하는 메서드
		
		String sDirectory = req.getServletContext().getRealPath(directory);
		//삭제하고자 하는 파일의 위치를 참조하는 파일 변수 
		File file = new File(sDirectory+ File.separator + filename);
		
		if(file.exists()) { //파일이 존재한다면 (존재 안할 수도 있음 , 경로에 없다면)
			file.delete(); //파일삭제
		
		}
	}
}
