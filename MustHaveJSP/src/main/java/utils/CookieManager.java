package utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieManager {
	//쿠키를 생성하고 변경하고 삭제하는 공통의 코드
	
	
	public static void makeCookie(HttpServletResponse response, String cName ,
			String cValue, int cTime) {
		
		Cookie cookie = new Cookie(cName,cValue);
		cookie.setPath("/");
		cookie.setMaxAge(cTime);
		response.addCookie(cookie); //쿠키추가
	}
	
	public static String readCookie(HttpServletRequest request, String cName) {
		
		String cookieValue="";
		
		Cookie[] cookies = request.getCookies();
		if(cookies!=null) {
			for(Cookie c : cookies) {
				String cookieName = c.getName();
				if(cookieName.equals(cName)) {
					cookieValue=c.getValue();
				}
			}
		}
		return cookieValue;
	}
	
	public  static void deleteCookie(HttpServletResponse response, String cName) {
		
		makeCookie(response, cName, "", 0); //위에서 만든 make쿠키를 활용한다. age를 0으로 만든다.
	}
	
	
}
