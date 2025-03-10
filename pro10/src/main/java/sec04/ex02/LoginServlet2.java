package sec04.ex02;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login3")
public class LoginServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// user_list 저장할 공간으로 ServletContext 를 이용하여
	// 모든 브라우저에서 출력 되도록 구현
	ServletContext context;
	// user_list 는 로그인된 user_id 를 저장
	List<String> user_list = new ArrayList<String>();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		LoginImpl2 loginUser = new LoginImpl2(id, pwd);
		
		String log = request.getParameter("log");
		context = getServletContext();
		
		if(session.isNew()) {
			// session.setAttribute 시에 valueBound() 실행
			session.setAttribute("loginUser", loginUser);
			user_list.add(id);
			context.setAttribute("user_list", user_list);
		}
		
		out.print("<html><head><script>");
		// setTimeout() : 시간반복
		// history.go(0) : 현재 페이지
		// 5000 : 5000ms -> 5초
		out.print("setTimeout('history.go(0);',5000)");
		out.print("</script></head><body>");
		out.print("아이디 : " + loginUser.id + "<br>");
		out.print("총 접속자 수 : " 
				+ LoginImpl2.total_user + "<br>");
		out.print("접속 아이디 : <br>");
		List<String> list = 
				(ArrayList<String>)context.getAttribute("user_list");
		for(String s : list) {
			out.print(s + "<br>");
		}
		out.print("<a href='logout?id="+id+"'>로그아웃</a>");
		out.print("</body></html>");
		
	}

}