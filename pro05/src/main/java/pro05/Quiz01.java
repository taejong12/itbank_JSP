package pro05;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Quiz01 extends HttpServlet{

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
	/**
	 * localhost:8080/pro05/quiz01 경로에
	 * init, doGet, destroy 메서드를 오버라이드 하고
	 * web.xml 에 servlet 등록하고 mapping 만들어서 
	 * 각 메서드가 실행 되었다는 메세지를 콘솔창에 출력해 보세요.
	 */
	
	
}