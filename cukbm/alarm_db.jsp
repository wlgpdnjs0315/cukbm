<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR" errorPage="error.jsp"%>
<%@page import="java.sql.*" %>
<%
    String code = request.getParameter("code");
    Connection conn = null;
    Statement stmt = null;
    String loginid = (String) session.getAttribute("idKey");

    try{

        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(
                "jdbc:mysql://127.0.0.1:3306/mydb?useUnicode=true&characterEncoding=EUC_KR&useSSL=false", "root", "wkqkxlavmf");
        stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("select user_id, message from history order by seq desc;");

%>
<table cellspancing="0">
<%
           while(rs.next()){
              String tmp = rs.getString("user_id");
              if(tmp != null && loginid.equals(tmp)) {
%>               <tr> 
                <td><%=rs.getString("message")%></td>
               </tr>
<%            
              }
           }
    } catch (Exception e) {
        e.printStackTrace();
    }
    finally{
      stmt.close();
      conn.close();
    }
%>