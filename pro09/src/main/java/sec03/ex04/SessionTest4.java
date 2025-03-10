package sec03.ex04;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 문제
 * login.html 에서 아이디, 암호를 입력하고 login3 으로 접근
 * 세션을 새로 만들었다면 아이디 암호 가 있는지 확인
 * 있으면 로그인 완료
 * 없으면 로그인 페이지로 이동하도록 구현
 * 세션이 기존 세션이라면 
 * 로그인 완료 출력
 */
@WebServlet("/login3")
public class SessionTest4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		out.print("<html><body>");
		if(session.isNew()) {
			if(id.length() != 0 && pwd.length() != 0) {
				session.setAttribute("login", true);
				session.setAttribute("id", id);
				out.print(id + "님 로그인 완료");
				out.print("<a href='login3?login=false'>로그아웃</a>");
			} else {
				out.print("<a href='login.html'>로그인 창 이동</a>");
				session.invalidate();
			}
		} else {			
			boolean login = 
				(boolean) session.getAttribute("login");
			String _id =
				(String) session.getAttribute("id");
			String _login =
				request.getParameter("login");
			if (_login != null &&
					_login.equals("false")) {
				session.invalidate();
				out.print(_id +"님 로그아웃 완료");
			} else if(login && _id.length() != 0) {
				out.print(_id + "님 로그인 완료");
			} else {
				out.print("<a href='login.html'>로그인 창 이동</a>");
				session.invalidate();
			}
		}
		
		out.print("</body></html>");
	}

}