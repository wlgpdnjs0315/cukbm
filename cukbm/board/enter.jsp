<%@ page contentType="text/html; charset=EUC-KR" errorPage="../error.jsp"%>
<%@page import="BoardPkg.BoardBean"%>
<jsp:useBean id="bMgr" class="BoardPkg.BoardMgr" />
<%
	String loginid = (String) session.getAttribute("idKey");
	if (loginid == null) {
%>
<script>
	alert("로그인을 해주세요");
	location.href = "list.jsp"
</script>
<%
	} 
%>
<%
   request.setCharacterEncoding("EUC-KR");
   int num = Integer.parseInt(request.getParameter("num"));
      BoardBean bean = (BoardBean) session.getAttribute("bean");
      String chk = null;
      String snsid = bean.getSnsid();
      String team = bean.getTeam();
      snsid=bMgr.returnsnsid(loginid);
      team=bMgr.returnteam(loginid);
         chk = bMgr.enterBoard(loginid, num, snsid,team);
         System.out.println(chk);
         if(chk.equals("Y") || chk.equals("Now_full")) {
               out.println("<script>");
               out.println("alert('입장하셨습니다.');");
               out.println("history.go(-2);");
               out.println("</script>");
         } else if (chk.equals("Full")) {
               out.println("<script>");
               out.println("alert('지정 인원을 초과하여 참여가 불가능합니다.');");
               out.println("history.go(-1);");
               out.println("</script>");
         } else if (chk.equals("Manager")) {
	           out.println("<script>");
	           out.println("alert('방장은 자신의 방으로 입장 불가능합니다.');");
	           out.println("history.go(-1);");
	           out.println("</script>");
         } else if (chk.equals("N")) {
        	   out.println("<script>");
	           out.println("alert('확정인 방이므로 해당 기능 사용이 불가능합니다.');");
	           out.println("history.go(-1);");
	           out.println("</script>"); 
         } else if (chk.equals("Already_enter")) {
          	   out.println("<script>");
               out.println("alert('이미 참여한 방입니다.');");
               out.println("history.go(-1);");
               out.println("</script>");
         }
%>