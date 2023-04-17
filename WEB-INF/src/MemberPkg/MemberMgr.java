package MemberPkg;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class MemberMgr {

	private DBConnectionMgr pool;

	public MemberMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	// ID 중복확인
	public boolean checkId(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select id from tblmember where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			flag = pstmt.executeQuery().next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}


	

	// 회원가입
	public boolean insertMember(MemberBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert tblmember(id,pwd,name,snsid,team,gender,age"
					+ ")values(?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			String id = bean.getId();
			id = id.replaceAll("<", "&lt;");
	        id = id.replaceAll(">", "&gt;");
			pstmt.setString(1, id);
			
			String pwd = bean.getPwd();
			pwd = pwd.replaceAll("<", "&lt;");
			pwd = pwd.replaceAll(">", "&gt;");
			pstmt.setString(2, pwd);
			
			String name = bean.getName();
			name = name.replaceAll("<", "&lt;");
			name = name.replaceAll(">", "&gt;");
			pstmt.setString(3, name);
			
			String snsid = bean.getSnsId();
			snsid = snsid.replaceAll("<", "&lt;");
			snsid = snsid.replaceAll(">", "&gt;");
			pstmt.setString(4, snsid);
			
			String team = bean.getTeam();
			team = team.replaceAll("<", "&lt;");
			team = team.replaceAll(">", "&gt;");
			pstmt.setString(5, team);
			
			/*	
			pstmt.setString(2, bean.getPwd());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getSnsId());
			pstmt.setString(5, bean.getTeam());
			
			*/
			pstmt.setString(6, bean.getGender());
			pstmt.setInt(7, bean.getAge());

			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	
	
	
	
	

	// 로그인 로직
	public boolean loginMember(String id, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select id from tblmember where id = ? and pwd = ?";  /////////tblmember 에서 m 소문자로 바꿈!!
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}

	   // 회원 정보 가져오기
	   public MemberBean getMember(String id) {
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      MemberBean bean = null;
	      try {
	         con = pool.getConnection();
	         String sql = "select * from tblmember where id = ?";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, id);
	         rs = pstmt.executeQuery();
	         if (rs.next()) {
	            bean = new MemberBean();
	            bean.setId(rs.getString("id"));
	            bean.setPwd(rs.getString("pwd"));
	            bean.setSnsId(rs.getString("snsid"));
	            bean.setName(rs.getString("name"));
	            bean.setGender(rs.getString("gender"));
	            bean.setTeam(rs.getString("team"));
	            bean.setAge(rs.getInt("age"));
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         pool.freeConnection(con);
	      }
	      return bean;
	   }

	   // 회원 정보 수정
	   public boolean updateMember(MemberBean bean) {
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      boolean flag = false;
	      try {
	         con = pool.getConnection();
	         String sql = "update tblmember set snsid=?, team=? where id = ?";
	         pstmt = con.prepareStatement(sql);
	         
	         String snsid = bean.getSnsId();
			snsid = snsid.replaceAll("<", "&lt;");
			snsid = snsid.replaceAll(">", "&gt;");
			

	         pstmt.setString(1, snsid);
	         
	         String team = bean.getTeam();
	         team = team.replaceAll("<", "&lt;");
	         team = team.replaceAll(">", "&gt;");
	         
	         pstmt.setString(2, team);
	         pstmt.setString(3, bean.getId());
	         
	         int count = pstmt.executeUpdate();
	         if (count > 0)
	            flag = true;
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         pool.freeConnection(con, pstmt);
	      }
	      return flag;
	   }
}