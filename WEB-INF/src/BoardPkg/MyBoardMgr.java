package BoardPkg;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MyBoardMgr {

   private DBConnectionMgr pool;
   private static final String ENCTYPE = "EUC-KR";
   private static final String type = "";
   public MyBoardMgr() {
      try {
         pool = DBConnectionMgr.getInstance();
      } catch (Exception e) {
         e.printStackTrace();
      }
   }

   // 마이페이지에서 보여지는 생성한방, 참여한방 리스트!!
   public Vector<BoardBean> getBoardList(String id, String isJoin, String keyField, String keyWord,
         int start, int end) {
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String sql = null;
      System.out.println("list test");
      Vector<BoardBean> vlist = new Vector<BoardBean>();
      try {
         con = pool.getConnection();
         if (isJoin != null) {
	         if(isJoin.equals("create")) {
	            sql = "select * from board where manager = '"+id +"' order by seq desc ";
	            
	         }
	         else if(isJoin.equals("join")) {
	            sql = "select * from board where seq=any(select board_seq from participate where user_seq='"+id+"') order by seq desc ";
	            
	         }
         }
         pstmt = con.prepareStatement(sql);
         rs = pstmt.executeQuery();
         while (rs.next()) {
            BoardBean bean = new BoardBean();
            bean.setSeq(rs.getInt("seq"));
            bean.setTitle(rs.getString("title"));
            bean.setGame_date(rs.getDate("game_date").toString());
            bean.setType(rs.getString("type"));
            bean.setMem_num(rs.getInt("mem_num"));
            vlist.add(bean);
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         pool.freeConnection(con, pstmt, rs);
      }
      return vlist;
   }
   
   //총 게시물수
   public int getTotalCount(String id, String isJoin, String keyField, String keyWord) {
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String sql = null;
      int totalCount = 0;
      try {
         con = pool.getConnection();
         if (keyWord.equals("null") || keyWord.equals("")) {
            sql = "select count(num) from board where manager ="+id;
            pstmt = con.prepareStatement(sql);
         } else {
            sql = "select count(num) from  tblBoard where " + keyField + " like ? ";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "%" + keyWord + "%");
         }
         rs = pstmt.executeQuery();
         if (rs.next()) {
            totalCount = rs.getInt(1);
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         pool.freeConnection(con, pstmt, rs);
      }
      return totalCount;
   }
   
   
   public Vector<BoardBean> showsnsList(int roomid, String isJoin, String keyField, String keyWord,
	         int start, int end) {
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql = null;
	      System.out.println("list test");
	      Vector<BoardBean> vlist = new Vector<BoardBean>();
	      try {
	         con = pool.getConnection();
	         sql = "select user_seq,snsid,team from participate where board_seq= '"+roomid +"' order by seq asc";
	         pstmt = con.prepareStatement(sql);
	         rs = pstmt.executeQuery();
	         while (rs.next()) {
	            BoardBean bean = new BoardBean();
	            bean.setUser_seq(rs.getString("user_seq"));
	            bean.setSnsid(rs.getString("snsid"));
	            bean.setTeam(rs.getString("team"));
	            vlist.add(bean);
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         pool.freeConnection(con, pstmt, rs);
	      }
	      return vlist;
	   }
   
 
   //main
   public static void main(String[] args) {
      System.out.println("SUCCESS");
   }
}