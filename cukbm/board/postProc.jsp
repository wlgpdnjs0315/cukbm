<%@ page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="bMgr" class="BoardPkg.BoardMgr"/>
<%
	  bMgr.insertBoard(request);
	  response.sendRedirect("../index.jsp");
%>