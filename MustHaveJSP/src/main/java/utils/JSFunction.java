package utils;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;

public class JSFunction {
	//js파일에서 얼럿창을 띄우려면 <% 스크립틀릿 %> 이후에 작성을 해야된다.
	//자바 코드가 이어지는 부분에서는 코드가 복잡해진다. 
	
	
	public static void alertLocation(String msg,String url,JspWriter out) {
		
		try {
			String script = ""
						  +"<script>"
						  +"	alert('"+msg+"');"
						  +"	location.href='"+url+"';" //페이지이동
						  +"</script>";
			out.println(script);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}//alertLocation메서드종료
	
	public static void alertBack(String msg, JspWriter out) {
		
		try {
			String script =""
						+"<script>"
						+" 		alert('"+msg+"');"
						+"		history.back();" //뒤로이동
						+"</script>";
			out.println(script);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}	
	
	// 메시지 알림창을 띄운 후 명시한 URL로 이동합니다.
    public static void alertLocation(HttpServletResponse resp, String msg, String url) {
        try {
            resp.setContentType("text/html;charset=UTF-8");
            //response 객체 타입 지정
            PrintWriter writer = resp.getWriter();
            String script = ""
                          + "<script>"
                          + "    alert('" + msg + "');"
                          + "    location.href='" + url + "';"
                          + "</script>";
            writer.print(script);
        }
        catch (Exception e) {}
    }

    // 메시지 알림창을 띄운 후 이전 페이지로 돌아갑니다.
    public static void alertBack(HttpServletResponse resp, String msg) {
        try {
            resp.setContentType("text/html;charset=UTF-8");
            PrintWriter writer = resp.getWriter();
            String script = ""
                          + "<script>"
                          + "    alert('" + msg + "');"
                          + "    history.back();"
                          + "</script>";
            writer.print(script);
        }
        catch (Exception e) {}
    }
	
	
	
	
}
