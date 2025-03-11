package sec01.ex01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	Connection con;
	DataSource dataFactory;
	PreparedStatement pstmt;
	
	public MemberDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = 
				(Context) ctx.lookup("java:/comp/env");
			dataFactory = 
				(DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<MemberDTO> listMembers(String id) {
		List<MemberDTO> list = 
				new ArrayList<MemberDTO>();

		try {
			String sql = "select * from member";
			con = dataFactory.getConnection();
			
			if(id != null && id.length() != 0) {
				// select * from member where id=?
				sql += " where id=?";
				pstmt = 
						con.prepareStatement(sql);
				pstmt.setString(1, id);
			} else {
				// select * from member
				pstmt = con.prepareStatement(sql);
			}

			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO m = new MemberDTO();
				m.setId(rs.getString(1));
				m.setPwd(rs.getString(2));
				m.setName(rs.getString(3));
				m.setEmail(rs.getString(4));
				m.setJoinDate(rs.getDate(5));
				list.add(m);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public void addMember(String id, String pwd, String name, String email) {
		// TODO Auto-generated method stub
		try {
			con = dataFactory.getConnection();
			String sql = 
				"insert into member values(?,?,?,?,sysdate)"; 
			pstmt =	con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			
			int result = pstmt.executeUpdate();
			
			if (result >= 1) {
				System.out.println("저장 완료");
			}
			pstmt.close();
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public void addMember(MemberDTO m) {
		// TODO Auto-generated method stub
		try {
			con = dataFactory.getConnection();
			String sql = 
				"insert into member values(?,?,?,?,sysdate)"; 
			pstmt =	con.prepareStatement(sql);
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getPwd());
			pstmt.setString(3, m.getName());
			pstmt.setString(4, m.getEmail());
			
			int result = pstmt.executeUpdate();
			
			if (result >= 1) {
				System.out.println("저장 완료");
			}
			pstmt.close();
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public void delMember(String id) {
		String sql = "delete from member where id=?";
		
		try {
			con = dataFactory.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			int result = pstmt.executeUpdate();
			
			if(result >= 1) {
				System.out.println("삭제완료");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public boolean isExisted(String id, String pwd) {
		// TODO Auto-generated method stub
		boolean result = false;
		
		try {
			String sql = "select decode(count(*),1,'true','false') "
					+ " as result from member where id=? and pwd=?";
			con = dataFactory.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = Boolean.parseBoolean(rs.getString(1));
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

}