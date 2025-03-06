package sec02.ex01;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/get")
public class GetCookieValue extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// 쿠키 정보를 배열로 가져온다.
		Cookie[] allValues = request.getCookies();
		
		for(Cookie c : allValues) {
			out.print("<h2>Cookie 값 가져오기 : " 
				+ URLDecoder.decode(c.getValue(),"utf-8"));
		}
	}

}