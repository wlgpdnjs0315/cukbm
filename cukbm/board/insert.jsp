<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import = "java.sql.*" %>
<%@ page contentType="text/html; charset=EUC-KR" errorPage="../error.jsp"%>
<html>
   <body>
      <%
         String id = (String)session.getAttribute("idKey");
      	 request.setCharacterEncoding("euc-kr");
         String content = request.getParameter("content_text");
         String num = request.getParameter("num");
         int roomid = Integer.parseInt(num);
         String num2 = request.getParameter("num2");
         int nowPage = Integer.parseInt(num2);
         
         Connection conn = null;
         PreparedStatement pstmt = null;
         
         try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?serverTimezone=UTC", "root", "wkqkxlavmf");
            
            String sql = "insert into tblcomment (id,content,roomid,time) values(?,?,?,now())";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,id);
            pstmt.setString(2,content);
            pstmt.setInt(3,roomid);
            //pstmt.setTimestamp(4,new Timestamp(System.currentTimeMillis()));
            pstmt.executeUpdate();
         }
         catch(Exception e){ 
            e.printStackTrace(); 
         }
         finally{
            if(pstmt != null)
               try{
                  pstmt.close();
               }catch(SQLException sql){}
            
            if(conn != null)
               try{
                  conn.close();
               }catch(SQLException sql){}
         }
         
         response.sendRedirect("read.jsp?num="+roomid+"&nowPage="+nowPage);
         
      %>
   </body>
</html>