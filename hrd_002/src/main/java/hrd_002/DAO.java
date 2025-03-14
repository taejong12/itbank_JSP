package hrd_002;

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
	
	public List<Member> memberList(){
		List<Member> memberList = new ArrayList<Member>();

		try {
			con = dataFactory.getConnection();
			String sql = "select mem.m_no, mem.m_name, par.p_name, "
					+ "    case mem.p_school when '1' then '고졸' "
					+ "    when '2' then '학사' when '3' then '석사' when '4' then '박사' end as p_school, "
					+ "    substr(mem.m_jumin,0,6)||'-'||substr(mem.m_jumin,7,7), mem.m_city, par.p_tel1||'-'||par.p_tel2||'-'||par.p_tel3 as tel "
					+ "from tbl_member_202005 mem, tbl_party_202005 par where mem.p_code = par.p_code";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Member m = new Member();
				
				m.setM_no(rs.getString(1));
				m.setM_name(rs.getString(2));
				m.setP_name(rs.getString(3));
				m.setP_school(rs.getString(4));
				m.setM_jumin(rs.getString(5));
				m.setM_city(rs.getString(6));
				m.setTel(rs.getString("tel"));
				
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
	
	public void insertVote(Vote v) {
		try {
			String sql = "insert into tbl_vote_202005 values(?,?,?,?,?,?)";
			con = dataFactory.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, v.getV_jumin());
			pstmt.setString(2, v.getV_name());
			pstmt.setString(3, v.getM_no());
			pstmt.setString(4, v.getV_time());
			pstmt.setString(5, v.getV_area());
			pstmt.setString(6, v.getV_confirm());
			
			pstmt.executeQuery();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public List<VoteOutput> select(String v_jumin) {
		List<VoteOutput> voteList = 
				new ArrayList<VoteOutput>();

		try {
			System.out.println(v_jumin);
			con = dataFactory.getConnection();
			String sql = "select v_name, '19'||substr(v_jumin,0,2)||'년'||substr(v_jumin,3,2)||'월'||substr(v_jumin,5,2)||'일' as birth, "
					+ " '만 ' ||(2025 - (1900 + substr(v_jumin,0,2))) as age, case when substr(v_jumin, 7, 1) in ('1','3') then '남' when substr(v_jumin, 7, 1) in('2','4') then '여' end "
					+ " as gender, m_no, substr(v_time,0,2)||':'||substr(v_time,3,2) as v_time, case v_confirm when 'Y' then '확인' when 'N' then '미확인' end as v_confirm "
					+ " from tbl_vote_202005 "
					+ " where v_jumin =" + v_jumin;
		
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				System.out.println("list");
				VoteOutput vo = new VoteOutput();
				
				vo.setV_name(rs.getString("v_name"));
				vo.setBirth(rs.getString("birth"));
				vo.setAge(rs.getString("age"));
				vo.setGender(rs.getString("gender"));
				vo.setV_time(rs.getString("v_time"));
				vo.setV_confirm(rs.getString("v_confirm"));
				vo.setM_no(rs.getString("m_no"));
				voteList.add(vo);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return voteList;
	}
	
	public List<VoteOutput> select() {
		List<VoteOutput> voteList = 
				new ArrayList<VoteOutput>();

		try {
			con = dataFactory.getConnection();
			String sql = "select v_name, '19'||substr(v_jumin,0,2)||'년'||substr(v_jumin,3,2)||'월'||substr(v_jumin,5,2)||'일' as birth, "
					+ " '만 ' ||(2025 - (1900 + substr(v_jumin,0,2))) as age, case when substr(v_jumin, 7, 1) in ('1','3') then '남' when substr(v_jumin, 7, 1) in('2','4') then '여' end "
					+ " as gender, m_no, substr(v_time,0,2)||':'||substr(v_time,3,2) as v_time, case v_confirm when 'Y' then '확인' when 'N' then '미확인' end as v_confirm "
					+ " from tbl_vote_202005 ";
		
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				VoteOutput vo = new VoteOutput();
				
				vo.setV_name(rs.getString("v_name"));
				vo.setBirth(rs.getString("birth"));
				vo.setAge(rs.getString("age"));
				vo.setGender(rs.getString("gender"));
				vo.setV_time(rs.getString("v_time"));
				vo.setV_confirm(rs.getString("v_confirm"));
				vo.setM_no(rs.getString("m_no"));
				voteList.add(vo);
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return voteList;
	}
	
	public List<VoteResult> voteResult(){
		List<VoteResult> resultList =
				new ArrayList<VoteResult>();
		try {
			con = dataFactory.getConnection();
			String sql = "select mem.m_no, mem.m_name, count(vote.m_no) from tbl_member_202005 mem, tbl_vote_202005 vote where mem.m_no = vote.m_no "
					+ "    group by mem.m_no, mem.m_name order by count(vote.m_no) desc";
			 pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				VoteResult v = new VoteResult();
				
				v.setM_no(rs.getString(1));
				v.setM_name(rs.getString(2));
				v.setVotecnt(rs.getInt(3));
				
				resultList.add(v);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultList;
	}
}