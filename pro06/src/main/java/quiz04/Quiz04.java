package quiz04;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * login2.html 을 이용하여 
 * id - admin, pwd - admin 일 경우 
 * 관리자로 로그인 하셨습니다. 메세지 출력
 * 그 외 아이디 일 경우
 * id 님 환영합니다. 메세지 출력 
 */
@WebServlet("/quiz04")
public class Quiz04 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("user_id");
		String pwd = request.getParameter("user_pw");
		
		if(id.equals("admin") && pwd.equals("admin")) {
			out.print("<html>");
			out.print("<body>");
			out.print("관리자님이 로그인하셨습니다.");
			out.print("</body>");
			out.print("</html>");
		} else {
			out.print("<html>");
			out.print("<body>");
			out.print(id + "님 환영합니다.");
			out.print("</body></html>");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}