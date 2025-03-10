package sec03.ex01;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/sess")
public class SessionTest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// 세션 호출 : request.getSession(true 생략)
		// 호출 시에 세션이 없으면 새로 생성하고 있으면 기존 세션 반환
		// request.getSession(false)
		// 호출 시에 세션이 없으면 null 반환 있으면 기존 세션 반환
		HttpSession session = request.getSession();
		
		out.print("세션 아이디 : " + session.getId() + "<br>");
		out.print("최초 세션 생성 시간 : " 
			+ new Date(session.getCreationTime()) + "<br>");
		out.print("최근 세션 접근 시간 : " 
			+ new Date(session.getLastAccessedTime()) + "<br>");
		out.print("세션 유효 시간 : " 
			+ session.getMaxInactiveInterval() + "<br>");
		
		// session.isNew() : 새 세션이면 true 아니면 false
		if(session.isNew()) {
			out.print("새 세션이 만들어졌습니다.<br>");
		}
		
		
	}


}