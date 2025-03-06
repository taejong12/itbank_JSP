package sec04.ex01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/first9")
public class FirstServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		// 바인딩 : 데이터를 전송 객체에 저장하는 것
		// setAttribute("키", "값") : 데이터 바인딩
		// getAttribute("키") : 바인딩 된 데이터 가져오기
		// redirect, refresh, location :
		// - request에 바인딩해도 새로운 request 를 생성하기
		// 	 때문에 request 바인딩을 사용할 수 없다.
		request.setAttribute("address", "서울 종로구");
		response.sendRedirect("second9?name=lee");
	}
}



