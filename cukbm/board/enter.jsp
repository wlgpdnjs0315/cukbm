<%@ page contentType="text/html; charset=EUC-KR" errorPage="../error.jsp"%>
<%@page import="BoardPkg.BoardBean"%>
<jsp:useBean id="bMgr" class="BoardPkg.BoardMgr" />
<%
	String loginid = (String) session.getAttribute("idKey");
	if (loginid == null) {
%>
<script>
	alert("�α����� ���ּ���");
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
               out.println("alert('�����ϼ̽��ϴ�.');");
               out.println("history.go(-2);");
               out.println("</script>");
         } else if (chk.equals("Full")) {
               out.println("<script>");
               out.println("alert('���� �ο��� �ʰ��Ͽ� ������ �Ұ����մϴ�.');");
               out.println("history.go(-1);");
               out.println("</script>");
         } else if (chk.equals("Manager")) {
	           out.println("<script>");
	           out.println("alert('������ �ڽ��� ������ ���� �Ұ����մϴ�.');");
	           out.println("history.go(-1);");
	           out.println("</script>");
         } else if (chk.equals("N")) {
        	   out.println("<script>");
	           out.println("alert('Ȯ���� ���̹Ƿ� �ش� ��� ����� �Ұ����մϴ�.');");
	           out.println("history.go(-1);");
	           out.println("</script>"); 
         } else if (chk.equals("Already_enter")) {
          	   out.println("<script>");
               out.println("alert('�̹� ������ ���Դϴ�.');");
               out.println("history.go(-1);");
               out.println("</script>");
         }
%>