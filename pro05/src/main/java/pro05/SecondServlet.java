package pro05;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SecondServlet extends HttpServlet{
	// url 경로가 여러 개더라도 클래스당 한번의 init()만 실행된다.
	// /sec 나 /cond 실행시 한번만 init() 실행
	// 그 후에는 doGet() 만 실행
	// 종료에도 destroy() 한번만 실행 된다.
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