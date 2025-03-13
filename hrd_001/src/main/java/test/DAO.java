package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DAO {
	Connection con;
	DataSource dataFactory;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public DAO() {
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
	
	public int maxCustNo() {
		int custNo = 0;
		try {
			con = dataFactory.getConnection();
			String sql = "select max(custNo) from member_tbl_02";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				custNo = rs.getInt(1) + 1;	
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return custNo;
	}
	
	public int insertMember(MemberDTO m) {
		int result = 0;
		
		try {
			con = dataFactory.getConnection();
			String sql = "insert into member_tbl_02 "
					+ "values(?,?,?,?,sysdate,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, m.getCustno());
			pstmt.setString(2, m.getCustname());
			pstmt.setString(3, m.getPhone());
			pstmt.setString(4, m.getAddress());
			pstmt.setString(5, m.getGrade());
			pstmt.setString(6, m.getCity());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<MemberDTO> listMembers(){
		List<MemberDTO> memberList =
				new ArrayList<MemberDTO>();
		try {
			con = dataFactory.getConnection();
			String sql = "select * from member_tbl_02 "
					+ " order by custno asc";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO m = new MemberDTO();
				m.setCustno(rs.getInt(1));
				m.setCustname(rs.getString(2));
				m.setPhone(rs.getString(3));
				m.setAddress(rs.getString(4));
				m.setJoindate(rs.getDate(5));
				m.setGrade(rs.getString(6));
				m.setCity(rs.getString(7));
				memberList.add(m);
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return memberList;
	}
	
	public List<SaleDTO> saleList(){
		List<SaleDTO> saleList =
				new ArrayList<SaleDTO>();
		
		try {
			con = dataFactory.getConnection();
			String sql = "select mon.custno, mem.custname, "
					+ "    case mem.grade when 'A' then 'VIP' "
					+ "    when 'B' then '일반' else '직원' end as grade, "
					+ "    sum(mon.price) "
					+ "    from money_tbl_02 mon, member_tbl_02 mem "
					+ "    where mon.custno = mem.custno "
					+ "    group by mon.custno, mem.custname, mem.grade "
					+ "    order by sum(mon.price) desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				SaleDTO s = new SaleDTO();
				s.setCustno(rs.getInt(1));
				s.setCustname(rs.getString(2));
				s.setGrade(rs.getString(3));
				s.setPrice(rs.getInt(4));
				
				saleList.add(s);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return saleList;
	}
	
	public MemberDTO select(int custno) {
		MemberDTO m = new MemberDTO();
		try {
			con = dataFactory.getConnection();
			String sql = "select * from member_tbl_02 "
					+ " where custno=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, custno);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				m.setCustno(rs.getInt(1));
				m.setCustname(rs.getString(2));
				m.setPhone(rs.getString(3));
				m.setAddress(rs.getString(4));
				m.setJoindate(rs.getDate(5));
				m.setGrade(rs.getString(6));
				m.setCity(rs.getString(7));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return m;
	}
	
	public void updateMember(MemberDTO m) {
		try {
			String sql = "update member_tbl_02 set "
					+ "custname=?, phone=?, address=?, "
					+ "grade=?, city=? where custno=?";
			con = dataFactory.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, m.getCustname());
			pstmt.setString(2, m.getPhone());
			pstmt.setString(3, m.getAddress());
			pstmt.setString(4, m.getGrade());
			pstmt.setString(5, m.getCity());
			pstmt.setInt(6, m.getCustno());
			
			int result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}





