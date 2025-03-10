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

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		ServletContext context = getServletContext();
		
		session.invalidate(); // 세션 종료
		
		List<String> user_list =
			(ArrayList<String>)context.getAttribute("user_list");
		user_list.remove(id);
		context.removeAttribute("user_list");
		context.setAttribute("user_list", user_list);
		out.print("로그 아웃 했습니다.<br>");
		
	}

}