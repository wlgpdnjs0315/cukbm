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
<title>delete</title>
<link href="style.css" rel="stylesheet" type="text/css">
<%
	request.setCharacterEncoding("EUC-KR");
	String nowPage = request.getParameter("nowPage");
	int num = Integer.parseInt(request.getParameter("num"));
	BoardBean bean = (BoardBean) session.getAttribute("bean");
	
	String realmanager = bean.getManager();
	if (loginid.equals(realmanager)){
		bMgr.deleteBoard(num);
		bMgr.deleteparticipate(num);
		out.println("<script>");
		out.println("history.go(-3);");
		out.println("</script>");
		
%><script>
	history.go(-1);
</script><% 
	}else {
		out.println("<script>");
		out.println("alert('해당 방의 방장이 아닙니다.');");
		out.println("history.back();");
		out.println("</script>");
	}
%>
</script>
</head>

</html>