package pro05;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// HttpServlet 을 상속 받아 생성
public class FirstServlet extends HttpServlet{
	
	@Override
	public void init() throws ServletException {
		// 최초 실행시 메모리에 등록되도록 한번만 실행 
		System.out.println("init() 실행");
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 메모리에 등록 후에는 doGet 또는 doPost 메서드만 실행
		System.out.println("doGet() 실행");
	}

	@Override
	public void destroy() {
		// 서버 메모리에서 제거 될 때 한번만 실행
		System.out.println("destroy() 실행");
	}


	
}