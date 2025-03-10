package quiz01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 문제
 * quiz01 에 접속 할 때 마다 1씩 증가 시키고 
 * 화면에 접속 횟수를 출력 해 보세요.
 * - 아무 브라우저랑 상관 없이 접속 되는 횟수 증가
 */
@WebServlet("/quiz01")
public class Quiz01 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		ServletContext ctx = getServletContext();
		
		Integer cnt = 
			(Integer) ctx.getAttribute("cnt");
		
		if(cnt == null) {
			cnt = 1;
		}
		
		out.print("접속 횟수 : " + cnt);
		
		ctx.setAttribute("cnt", cnt+1);
	}


}