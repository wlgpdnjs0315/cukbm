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

public class BoardMgr {

	private DBConnectionMgr pool;
	private static final String  SAVEFOLDER = "C:/Users/cysun/OneDrive/바탕 화면/fds";
	private static final String ENCTYPE = "EUC-KR";
	private static int MAXSIZE = 5*1024*1024;
	private static String type="";
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

	public BoardMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 게시판 리스트
	public Vector<BoardBean> getBoardList(String keyField, String keyWord, int start, int end) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<BoardBean> vlist = new Vector<BoardBean>();
		try {
			con = pool.getConnection();
			if (type == null){
				sql = "select * from board order by seq desc";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setSeq(rs.getInt("seq"));
				bean.setGame_date(rs.getString("game_date"));
				bean.setType(rs.getString("type"));
				bean.setMem_num(rs.getInt("mem_num"));
				bean.setTitle(rs.getString("title"));
				bean.setIsrecruit(rs.getString("isrecruit"));
				vlist.add(bean);
			}}
			else{
			sql = "select * from board where type=? order by seq desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, type);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setSeq(rs.getInt("seq"));
				bean.setGame_date(rs.getString("game_date"));
				bean.setType(rs.getString("type"));
				bean.setMem_num(rs.getInt("mem_num"));
				bean.setTitle(rs.getString("title"));
				bean.setIsrecruit(rs.getString("isrecruit"));
				vlist.add(bean);
			}}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	//게시글 입력 
	
	   public void insertBoard(HttpServletRequest req) {
		      Connection con = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;
		      ResultSet rs2 = null;
		      String sql = null;
		      MultipartRequest multi = null;
		      String aa="";
		      int bb=0;
		      String type = null;
		      String manager = null;
		      String place = null;
		      String title = null;
		      try {
		         con = pool.getConnection();
		         multi = new MultipartRequest(req, SAVEFOLDER,MAXSIZE, ENCTYPE,
		               new DefaultFileRenamePolicy());
		         String content = multi.getParameter("content");
		         content = content.replaceAll("<", "&lt;");
		         content = content.replaceAll(">", "&gt;");
		         
		         type = multi.getParameter("type");
		         type = type.replaceAll("<", "&lt;");
		         type = type.replaceAll(">", "&gt;");

		         manager = multi.getParameter("manager");
		         manager = manager.replaceAll("<", "&lt;");
		         manager = manager.replaceAll(">", "&gt;");
		         
		         place = multi.getParameter("place");
		         place = place.replaceAll("<", "&lt;");
		         place = place.replaceAll(">", "&gt;");

		         title = multi.getParameter("title");
		         title = title.replaceAll("<", "&lt;");
		         title = title.replaceAll(">", "&gt;");
		         
		         //////////////////////// game_type 추가
		         sql = "insert board (type,manager,place,mem_num,game_date,title,comment,isrecruit,time,game_type)";
		         sql += "values(?,?,?,?,?,?,?,?,now(),?)";
		         pstmt = con.prepareStatement(sql);
		         pstmt.setString(1, type);
		         pstmt.setString(2, manager);
		         pstmt.setString(3, place);
		         aa=multi.getParameter("mem_num");
		         bb=Integer.parseInt(aa);
		         pstmt.setInt(4, bb);
		         aa=multi.getParameter("game_date");
		         pstmt.setString(5, aa);
		         pstmt.setString(6, title);
		         pstmt.setString(7, content);
		         pstmt.setString(8, "Y");
		         pstmt.setString(9, multi.getParameter("game_type"));
		         pstmt.executeUpdate();
		         
		         sql = "select seq from board where type=? and manager=? and place=? and mem_num=? and game_date=? and title=? and comment=? and isrecruit='Y'";
		         pstmt = con.prepareStatement(sql);
		         pstmt.setString(1, type);
		         pstmt.setString(2, manager);
		         pstmt.setString(3, place);
		         pstmt.setInt(4, bb);
		         pstmt.setString(5, aa);
		         pstmt.setString(6, title);
		         pstmt.setString(7, content);
		         rs = pstmt.executeQuery();
		         
		         sql = "select snsid, team from tblmember where id=?";
		         pstmt = con.prepareStatement(sql);
		         pstmt.setString(1, manager);
		         rs2 = pstmt.executeQuery();
		         if(rs.next() && rs2.next()) {
		            sql = "insert into participate (user_seq, board_seq, flag, snsid, team) values (?, ?, 'Y', ?, ?)";
		            pstmt = con.prepareStatement(sql);
		               pstmt.setString(1, manager);
		               pstmt.setInt(2, rs.getInt("seq"));
		               pstmt.setString(3, rs2.getString("snsid"));
		               pstmt.setString(4, rs2.getString("team"));
		               pstmt.executeUpdate();
		         }
		            
		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		         pool.freeConnection(con, pstmt, rs);
		      }
		   }

	
	
	
	// 게시물 리턴
	public BoardBean getBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		BoardBean bean = new BoardBean();
		try {
			con = pool.getConnection();
			sql = "select * from board where seq=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {

				bean.setSeq(rs.getInt("seq"));
				bean.setManager(rs.getString("manager"));
				bean.setType(rs.getString("type"));
				bean.setTitle(rs.getString("title"));
				bean.setContent(rs.getString("comment"));
				bean.setMem_num(rs.getInt("mem_num"));
				bean.setGame_date(rs.getString("game_date")); 
				bean.setPlace(rs.getString("place"));
				bean.setTime(rs.getString("time"));
				bean.setGame_type(rs.getString("game_type"));
				bean.setIsrecruit(rs.getString("isrecruit"));
				

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}


	// 게시물 삭제
	public void deleteBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			sql = "delete from board where seq=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}

	
	
	
	
	   //게시물 삭제 시 participate에서 해당 data 삭제  /////////////////////////////////////////이거이거이거함수전체
	   public void deleteparticipate(int num) {
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      String sql = null;
	      ResultSet rs = null;
	      try {
	         con = pool.getConnection();
	         sql = "delete from participate where board_seq=?";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, num);
	         pstmt.executeUpdate();
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         pool.freeConnection(con, pstmt, rs);
	      }
	   }
	
	
	
	
	
	
	
	
	// 게시물 수정
	public void updateBoard(BoardBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update board set type=?, manager=?, place=?, mem_num=?, title=?, comment=?, game_type=? where seq=?";
			pstmt = con.prepareStatement(sql);
			
			
			pstmt.setString(1, bean.getType());
			
			pstmt.setString(2, bean.getManager());
			
			String place = bean.getPlace();
			place = place.replaceAll("<", "&lt;");
			place = place.replaceAll(">", "&gt;");
			pstmt.setString(3, place);
			
			
			pstmt.setInt(4, bean.getMem_num());
			
			String title = bean.getTitle();
			title = title.replaceAll("<", "&lt;");
			title = title.replaceAll(">", "&gt;");
			pstmt.setString(5, title);
			
			String content = bean.getPlace();
			content = content.replaceAll("<", "&lt;");
			content = content.replaceAll(">", "&gt;");
			pstmt.setString(6, content);
			
			pstmt.setString(7, bean.getGame_type());
			pstmt.setInt(8, bean.getNum());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//글 수정 삭제 시 필요한 방장 리턴
	public void checkmanager(String num) {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = null;
		BoardBean bean = new BoardBean();
		int num2= Integer.parseInt(num);
		try {
			con = pool.getConnection();
			sql = "select * from board where seq=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num2);
			rs = pstmt.executeQuery();
			if (rs.next()) {

				bean.setManager(rs.getString("manager"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	
	//입장하기
	   public String enterBoard(String id, int num,String snsid,String team) {
	         Connection con = null;
	         PreparedStatement pstmt = null;
	         String sql = null;
	         ResultSet rs = null;
	         String str = null;
	         boolean flag = false;
	         ResultSet tmp = null;
	         int total_mem = 0;
	         int current_mem = 0;
	         String manager = null;
	         try {
	            con = pool.getConnection();         
	            sql = "select manager, isrecruit, mem_num from board where seq=?";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setInt(1, num);
	            tmp = pstmt.executeQuery();
	            if(tmp.next()) {
	               total_mem = tmp.getInt("mem_num");
	               manager = tmp.getString("manager");
	               str = tmp.getString("isrecruit");
	            }
	            if(str.equals("Y")) {
	               sql = "select count(board_seq) from participate where board_seq=?";
	               pstmt = con.prepareStatement(sql);
	               pstmt.setInt(1,num);
	               tmp = pstmt.executeQuery();
	               if(tmp.next()) {
	                  current_mem = tmp.getInt(1);
	               }
	               sql = "select flag from participate where user_seq=? and board_seq=?";
	               pstmt = con.prepareStatement(sql);
	               pstmt.setString(1, id);
	               pstmt.setInt(2, num);
	               flag = pstmt.executeQuery().next();
	               if(flag) {
	                  return "Already_enter";
	               }
	               if (total_mem == current_mem) {
	                  return "Full";
	               }
	               else if (manager.equals(id)) {
	                  return "Manager";
	               }
	               else if (current_mem == total_mem - 1) {
	                  sql = "insert into participate (user_seq, board_seq, flag,snsid,team) values (?, ?, 'Y', ?, ?)";
	                  pstmt = con.prepareStatement(sql);
	                  pstmt.setString(1, id);
	                  pstmt.setInt(2, num);
	                  pstmt.setString(3, snsid);
	                  pstmt.setString(4, team);
	                  pstmt.executeUpdate();
	                  sql = "insert into history (user_id, board_seq, message) values (?, ?, ?)";
	                     pstmt = con.prepareStatement(sql);
	                     pstmt.setString(1,manager);
	                     pstmt.setInt(2,num);
	                     pstmt.setString(3, id + "님이 " + num + "번 방에 입장하였습니다.");
	                     pstmt.executeUpdate();
	                  sql = "insert into history (user_id, board_seq, message) values (?, ?, ?)";
	                  pstmt = con.prepareStatement(sql);
	                  pstmt.setString(1,manager);
	                  pstmt.setInt(2,num);
	                  pstmt.setString(3, num + "번 방 인원이 다 찼습니다. 확정 버튼을 눌러주세요.");
	                  pstmt.executeUpdate();
	                  return "Now_full";
	               } else {
	                     sql = "insert into participate (user_seq, board_seq, flag, snsid, team) values (?, ?, 'Y', ?, ?)";
	                     pstmt = con.prepareStatement(sql);
	                     pstmt.setString(1, id);
	                     pstmt.setInt(2, num);
	                     pstmt.setString(3, snsid);
	                     pstmt.setString(4, team);
	                     pstmt.executeUpdate();
	                     sql = "insert into history (user_id, board_seq, message) values (?, ?, ?)";
	                     pstmt = con.prepareStatement(sql);
	                     pstmt.setString(1,manager);
	                     pstmt.setInt(2,num);
	                     pstmt.setString(3, id + "님이 " + num + "번 방에 입장하였습니다.");
	                     pstmt.executeUpdate();
	                     return  "Y";
	                  }
	               }
	         } catch (Exception e) {
	            e.printStackTrace();
	         } finally {
	            pool.freeConnection(con, pstmt);
	         }
	         return "N";
	      }
	
	
	
	//퇴장하기
	   public String exitBoard(String id, int num) {
	        Connection con = null;
	         PreparedStatement pstmt = null;
	         String sql = null;
	         ResultSet tmp = null;
	         String str = null;
	         boolean rs = false;
	         String manager = null;
	         try {
	            con = pool.getConnection();
	            sql = "select manager, isrecruit from board where seq=?";
	            pstmt = con.prepareStatement(sql);
	             pstmt.setInt(1, num);
	            tmp = pstmt.executeQuery();
	            if(tmp.next()) {
	               str = tmp.getString("isrecruit");
	               manager = tmp.getString("manager");
	            }
	            /////////////////
	            if(id.equals(manager)) {
	               return "Manager";
	            }
	            if(str.equals("Y")) {
	               sql = "select seq from participate where user_seq=? and board_seq=?";
	                pstmt = con.prepareStatement(sql);
	                pstmt.setString(1,id);
	                pstmt.setInt(2,num);
	                rs = pstmt.executeQuery().next();
	                if(rs) {
	                   sql = "delete from participate where user_seq = ? and board_seq = ?";
	                   pstmt = con.prepareStatement(sql);
	                   pstmt.setString(1,id);
	                   pstmt.setInt(2,num);
	                   pstmt.executeUpdate();
	                   sql = "insert into history (user_id, board_seq, message) values (?, ?, ?)";
	                     pstmt = con.prepareStatement(sql);
	                     pstmt.setString(1,manager);
	                     pstmt.setInt(2,num);
	                     pstmt.setString(3, id + "님이 " + num + "번 방에서 퇴장하였습니다.");
	                     pstmt.executeUpdate();
	                   return "Exit";
	                }
	            } else if(str.equals("N")) {
	               return "N";
	            }
	         } catch (Exception e) {
	           e.printStackTrace();
	        } finally {
	           pool.freeConnection(con, pstmt);
	        }
	         
	         return "Not_enter";
	   }
	
	
	//participate테이블에 data insert시 같이 들어갈 snsid return
	public String returnsnsid(String loginid) {
		Connection con = null;
	    PreparedStatement pstmt = null;
		String snsid=null;
		String sql = null;
		BoardBean bean = new BoardBean();
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			sql = "select snsid from tblmember where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, loginid);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				bean.setSnsid(rs.getString("snsid"));
				snsid=rs.getString("snsid");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return snsid;
	}
	
	

	public String returnteam(String loginid) {
		Connection con = null;
	    PreparedStatement pstmt = null;
		String team=null;
		String sql = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			sql = "select team from tblmember where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, loginid);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				team=rs.getString("team");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return team;
	}
	
	
	
	
	
	//
	public String ifin(int num, String loginid) {
		Connection con = null;
	    PreparedStatement pstmt = null;

		String sql = null;
		BoardBean bean = new BoardBean();
		ResultSet rs = null;
		String ifin="";
		String ifinflag="";
		String nulll="";
		try {
		con = pool.getConnection();
		sql = "select seq from participate where board_seq=? and user_seq=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, num);
		pstmt.setString(2, loginid);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			ifin=rs.getString("seq");
			ifinflag="Y";
		}
		else {
			ifinflag="N";
		}
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return ifinflag;
	}
	
	
	//read.jsp에서 멤버인 경우 snsid 보여주기
	public Vector<BoardBean> show_snsid(int num) {
		Connection con = null;
	    PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		Vector<BoardBean> vlist = new Vector<BoardBean>();
		try {
			con = pool.getConnection();
			sql = "select user_seq,snsid,team from participate where board_seq=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardBean bean1 = new BoardBean();
				bean1.setUser_seq(rs.getString("user_seq"));
				bean1.setSnsid(rs.getString("snsid"));
				bean1.setTeam(rs.getString("team"));
				vlist.add(bean1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return vlist;
	}
	

	   public String toggleisrecruit(int num) {
		      Connection con = null;
		      PreparedStatement pstmt = null;
		      String sql = null;
		      ResultSet rs = null;
		      String tmp = null;
		      try {
		         con = pool.getConnection();
		         sql = "select isrecruit from board where seq=?";
		         pstmt = con.prepareStatement(sql);
		         pstmt.setInt(1, num);
		         rs = pstmt.executeQuery();
		         if(rs.next()) {
		            tmp = rs.getString("isrecruit");
		         }
		         if(tmp.equals("Y")) {
		            sql = "update board set isrecruit=? where seq=?";
		            pstmt = con.prepareStatement(sql);
		            pstmt.setString(1,"N");
		               pstmt.setInt(2,num);
		            pstmt.executeUpdate();
		            sql = "select user_seq from participate where board_seq=?";
		               pstmt = con.prepareStatement(sql);
		               pstmt.setInt(1,num);
		               rs = pstmt.executeQuery();
		               while(rs.next()) {
		                  sql = "insert into history (user_id, board_seq, message) values (?, ?, ?)";
		                     pstmt = con.prepareStatement(sql);
		                     pstmt.setString(1,rs.getString("user_seq"));
		                     pstmt.setInt(2,num);
		                     pstmt.setString(3, num + "번 방의 경기가 확정되었습니다.");
		                     pstmt.executeUpdate();
		               }
		               return "Y";
		         }
		      } catch (Exception e) {
		         e.printStackTrace();
		      } finally {
		         pool.freeConnection(con, pstmt);
		      }
		      return "N";
		   }
	
	
	//main
	public static void main(String[] args) {

		System.out.println("SUCCESS");
	}
}