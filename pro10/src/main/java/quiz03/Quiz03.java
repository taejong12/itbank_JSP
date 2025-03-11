package quiz03;

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

@WebServlet("/quiz03")
public class Quiz03 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		String log = request.getParameter("log");
		ServletContext context = getServletContext();
		
		List<String> list = 
				(ArrayList<String>)context.getAttribute("user_list");
		
		if(session.isNew()) {
			if(list != null && list.contains(id)) {
				 out.print("<h1>이미 로그인 되어 있습니다.</h1>");
			} else {
				if (list == null) {
					list = new ArrayList<String>();
				}
				list.add(id);
				context.setAttribute("user_list", list);
			}
			
		}
		
		out.print("<html><head><script>");
		out.print("setTimeout('history.go(0);',5000)");
		out.print("</script></head><body>");
		out.print("아이디 : " + id + "<br>");
		out.print("접속 아이디 : <br>");
		for(String s : list) {
			out.print(s + "<br>");
		}
		out.print("<a href='logout?id="+id+"'>로그아웃</a>");
		out.print("</body></html>");
	}
}





