<%@ page contentType="text/html; charset=EUC-KR" errorPage="../error.jsp"%>
<%@page import="BoardPkg.BoardBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="bMgr" class="BoardPkg.BoardMgr" />
<%
   String loginid = (String) session.getAttribute("idKey");
   if (loginid == null) {
%>
<script>
   alert("로그인을 해주세요");
   location.href = "../index.jsp"
</script>
<%
   }
%>
<html>
<head>
<title>JSP Board</title>
<link href="style.css" rel="stylesheet" type="text/css">
<%
   request.setCharacterEncoding("EUC-KR");
   String nowPage = request.getParameter("nowPage");
   int num = Integer.parseInt(request.getParameter("num"));
   BoardBean bean = (BoardBean) session.getAttribute("bean");
   String tmp = null;
   String realmanager = bean.getManager();  
   if (loginid.equals(realmanager)){
      tmp = bMgr.toggleisrecruit(num);
      if(tmp.equals("Y")) {
         out.println("<script>");
         out.println("alert('게임이 확정되었습니다.');");
         out.println("</script>");
      
%><script>
      location.href = "../index.jsp";
</script>
<% /////////////////////////
      } else if(tmp.equals("N")) {
         out.println("<script>");
         out.println("alert('이미 확정된 방입니다.');");
         out.println("history.go(-1);");
         out.println("</script>");
      }
   }else {
      out.println("<script>");
      out.println("alert('해당 방의 방장이 아닙니다.');");
      out.println("history.go(-1);");
      out.println("</script>");
   }
%>
</script>
</head>
</html>