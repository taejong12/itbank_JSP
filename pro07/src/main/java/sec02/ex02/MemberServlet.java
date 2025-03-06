package sec02.ex02;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member3")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		MemberDAO dao = new MemberDAO();
		
		// list 출력과 addMember 입력을 구분하는 코드
		String command = request.getParameter("command");
		
		if(command != null && command.equals("addMember")) {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			
			dao.addMember(id, pwd, name, email);
		} 
		/**
		 *  command 가 delMember 면 아이디 값으로 
		 *  데이터베이스에서 삭제 되도록 구현해보세요.
		 */
		List<MemberDTO> list = dao.listMembers();
		
		out.print("<html><body>");
		out.print("<table border='1'>"
		+ "<tr align='center' bgcolor='lightgreen'>");
		out.print("<td>아이디</td><td>암호</td>"
		+ "<td>이름</td><td>이메일</td><td>가입일</td>"
		+ "<td>삭제</td></tr>");
		
		for(MemberDTO m : list) {
			out.print("<tr>");
			out.print("<td>"+m.getId()+"</td>");
			out.print("<td>"+m.getPwd()+"</td>");
			out.print("<td>"+m.getName()+"</td>");
			out.print("<td>"+m.getEmail()+"</td>");
			out.print("<td>"+m.getJoinDate()+"</td>");
			out.print("<td><a href='/pro07/member3?"
			+ "command=delMember&id="+m.getId()+"'>삭제</a></td>");
			out.print("</tr>");
		}
		out.print("</table>");
		out.print("<a href='/pro07/MemberForm.html'>회원가입</a>");
		out.print("</body></html>");
	}
}