package sec01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login2")
public class LoginServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// request.setCharacterEncoding("utf-8")
		// 요청에 담긴 문자열들을 utf-8로 변환
		request.setCharacterEncoding("utf-8");
		
		// response.setContentType() : MIME Type 지정
		// "text/html" : 태그를 포함한 텍스트
		// "charset=utf-8" : 한글 언어셋
		response.setContentType("text/html;charset=utf-8");
		
		// HttpServletResponse의 getWriter() 를 이용해서
		// 출력 스트림을 PrintWriter 객체로 받아 처리 
		PrintWriter out = response.getWriter();
		
		
		String id = request.getParameter("user_id");
		String pwd = request.getParameter("user_pw");
		
		out.println("<html><body>");
		out.println("아이디 : " + id + "<br>");
		out.println("암호 : " + pwd + "<br>");
		out.println("</body></html>");
	}

}