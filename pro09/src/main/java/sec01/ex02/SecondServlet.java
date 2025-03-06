package sec01.ex02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/second2")
public class SecondServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		
		out.print("<html><body>");
		
		if(id.length() != 0 && pwd.length() != 0) {
			out.print("이미 로그인 상태 입니다.<br>");
			out.print("첫번째 서블릿 아이디 : " + id);
			out.print("첫번째 서블릿 암호 : " + pwd);
			out.print("첫번째 서블릿 이메일 : " + email);
		} else {
			out.print("로그인 하지 않았습니다.<br>");
			out.print("다시 로그인 하세요.<br>");
			out.print("<a href='/pro09/login.html'>로그인창</a>");
		}
		out.print("</body></html>");
	}

}