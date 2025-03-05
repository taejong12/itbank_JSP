package quiz03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * quiz 폴더에 quiz03.html 을 생성
 * form 을 이용하여 이름, 주소, 나이를 입력 하고 
 * quiz03 으로 전송하여 입력 받은 데이터를 브라우저에
 *  출력해 보세요.
 * - get 방식, post 방식으로 모두 가능 하도록 구현
 */
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
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String age = request.getParameter("age");
		
		String msg = "<html><body>";
		msg += "<h3>이름 : " + name + "</h3>";
		msg += "<h3>주소 : " + address + "</h3>";
		msg += "<h3>나이 : " + age + "</h3>";
		msg += "</body></html>";
		
		out.println(msg);
	}
}








