package quiz02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 문제
 * url 패턴을 이용해서 /quiz02로 시작 하는 모든 경로
 * url 패턴을 이용해서 /quiz/ 로 시작 하는 모든 경로
 * 로 호출이 되면 해당하는 URL 을 출력하고 URI 를 출력하세요
 */
@WebServlet({"/quiz02/*", "/quiz/*"})
public class Quiz02 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String url = request.getRequestURL().toString();
		String uri = request.getRequestURI();
		
		out.print("전체 경로 : " + url + "<br>");
		out.print("URI : " + uri);
	}

}