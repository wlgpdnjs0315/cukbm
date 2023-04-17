<%@ page contentType="text/html; charset=EUC-KR" errorPage="../error.jsp"%>
<%@page import="BoardPkg.BoardBean"%>
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
<%
   request.setCharacterEncoding("EUC-KR");
   int num = Integer.parseInt(request.getParameter("num"));
      String inPass = request.getParameter("pass");
      BoardBean bean = (BoardBean) session.getAttribute("bean");
      String chk = null;

         chk = bMgr.exitBoard(loginid, num);

         if(chk == "Exit") {
               out.println("<script>");
               out.println("alert('퇴장하셨습니다.');");
               out.println("history.go(-2);");
               out.println("</script>");
         } else if (chk.equals("N")) {
        	 out.println("<script>");
             out.println("alert('확정인 방이므로 해당 기능 사용이 불가능합니다.');");
             out.println("history.go(-1);");
             out.println("</script>");
         } else if (chk == "Not_enter") {
            out.println("<script>");
               out.println("alert('입장하지 않아 퇴장이 불가능합니다.');");
               out.println("history.go(-1);");
               out.println("</script>");
         } else if (chk == "Manager") {
             out.println("<script>");
             out.println("alert('방장은 퇴장이 불가능합니다.');");
             out.println("history.go(-1);");
             out.println("</script>");
       }
      

%>