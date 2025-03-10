package sec02.ex01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// /first/test -> 정확히 이름이 일치해야 경로를 찾아온다.
@WebServlet("/first/test")
public class TestServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// getContextPath() : 컨텍스트 이름 반환
		String context = request.getContextPath();
		// getRequestURL() : 전체 URL 경로 반환
		String url = request.getRequestURL().toString();
		// getServletPath() : 서블릿 매핑 이름 반환
		String mapping = request.getServletPath();
		// getRequestURI() : 도메인 제외한 경로 이름 반환
		String uri = request.getRequestURI();
		
		out.print("<html><head>");
		out.print("<title>TestServlet</title></head>");
		out.print("<body bgcolor='green'>");
		out.print("<b>TestServlet1 입니다.</b><br>");
		out.print("<b>컨텍스트 이름 : " + context + "</b><br>");
		out.print("<b>전체 경로 : " + url + "</b><br>");
		out.print("<b>매핑 이름 : " + mapping + "</b><br>");
		out.print("<b>URI : " + uri + "</b><br>");
		out.print("</body></html>");
		
	}

}