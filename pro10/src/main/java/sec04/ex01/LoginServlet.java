package sec04.ex01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login2")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		LoginImpl loginUser = new LoginImpl(id, pwd);
		
		if(session.isNew()) {
			session.setAttribute("loginUser", loginUser);
		}
		
		out.print("<html><head><script>");
		out.print("setTimeout('history.go(0);',5000)");
		out.print("</script></head><body>");
		out.print("아이디 : " + loginUser.id + "<br>");
		out.print("총 접속자 수 : " 
				+ LoginImpl.total_user + "<br>");
		out.print("</body></html>");
		
	}

}