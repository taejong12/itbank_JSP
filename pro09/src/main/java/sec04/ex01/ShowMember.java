package sec04.ex01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/show")
public class ShowMember extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// 로그인이 되어야 세션 객체를 생성
		// 세션 객체가 있다는 것은 로그인이 되었다는 것을 의미
		HttpSession session = request.getSession(false);
		
		if(session != null) {
			boolean isLogon = 
				(boolean)session.getAttribute("isLogon");
			
			if(isLogon) {
				String id = 
					(String)session.getAttribute("id");
				String pwd =
					(String)session.getAttribute("pwd");
				
				out.print("<html><body>");
				out.print("아이디 : " + id + "<br>");
				out.print("암호 : " + pwd + "<br>");
				out.print("</body></html>");
			} else {
				response.sendRedirect("login.html");
			}
		} else {
			out.print("<script>");
			out.print("alert('로그인 후 사용할 수 있습니다.');");
			out.print("location.href='login.html';");
			out.print("</script>");
		}
	}

}






