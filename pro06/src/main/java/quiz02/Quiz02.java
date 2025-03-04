package quiz02;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 성별을 체크하는 라디오 박스와
 * 연령대 선택하는 콤보 박스를 만들고 
 * 전달 하여 출력 해 보세요.
 */
@WebServlet("/quiz02")
public class Quiz02 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String gender = request.getParameter("gender");
		String age = request.getParameter("age");
		
		System.out.println("성별 : " + gender);
		System.out.println("연령대 : " + age);
	}


}