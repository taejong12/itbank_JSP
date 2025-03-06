package sec05.ex03;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/cfile")
public class ContextFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		ServletContext context = getServletContext();
		
		// 파일 읽기
		InputStream is = 
			context.getResourceAsStream("/WEB-INF/bin/init.txt");
		BufferedReader buffer =
			new BufferedReader(new InputStreamReader(is));
		
		
		String menu = buffer.readLine();
		String[] menu_sub = menu.split(",");
		
		out.print("<html><body>");
		for(String s: menu_sub) {
			out.print(s + "<br>");
		}
		out.print("</body></html>");
		
	}

}