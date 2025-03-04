package quiz01;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * webapp 에 quiz 폴더 생성 후 
 * Quiz01.html에 이름, 나이를 입력 후 
 * /quiz01 로 전송 후 콘솔에 출력 
 */

@WebServlet("/quiz01")
public class Quiz01 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 모든 입출력 데이터의 타입은 문자열
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		System.out.println("이름 : " + name);
		System.out.println("나이 : " + age);
	}

}




