<%@ page contentType="text/html; charset=EUC-KR" errorPage="../error.jsp"%>
<%@page import="BoardPkg.BoardBean"%>
<jsp:useBean id="bMgr" class="BoardPkg.BoardMgr" />
<%
	String loginid = (String) session.getAttribute("idKey");
	if (loginid == null) {
%>
<script>
	alert("�α����� ���ּ���");
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
               out.println("alert('�����ϼ̽��ϴ�.');");
               out.println("history.go(-2);");
               out.println("</script>");
         } else if (chk.equals("N")) {
        	 out.println("<script>");
             out.println("alert('Ȯ���� ���̹Ƿ� �ش� ��� ����� �Ұ����մϴ�.');");
             out.println("history.go(-1);");
             out.println("</script>");
         } else if (chk == "Not_enter") {
            out.println("<script>");
               out.println("alert('�������� �ʾ� ������ �Ұ����մϴ�.');");
               out.println("history.go(-1);");
               out.println("</script>");
         } else if (chk == "Manager") {
             out.println("<script>");
             out.println("alert('������ ������ �Ұ����մϴ�.');");
             out.println("history.go(-1);");
             out.println("</script>");
       }
      

%>