package sec04.ex01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/second9")
public class SecondServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String address = 
			(String) request.getAttribute("address");
		out.print("<html><body>");
		out.print("sendRedirect를 이용한 redirect 실습<br>");
		out.print("이름 : " + name + "<br>");
		out.print("주소 : " + address + "<br>"); 
		out.print("</body></html>");
	}

}