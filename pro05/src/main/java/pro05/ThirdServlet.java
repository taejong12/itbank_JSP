package pro05;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// @WebServlet("url_pattern") : url_pattern 으로 호출 가능
@WebServlet("/third")
public class ThirdServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doGet() 실행");
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("destroy() 실행");
	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("init() 실행");
	}
	
}