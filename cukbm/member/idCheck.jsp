<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mMgr" class="MemberPkg.MemberMgr"/>
<%
   request.setCharacterEncoding("EUC-KR");
   String id = request.getParameter("id");
   boolean result = mMgr.checkId(id);
%>
<html>
<head>
<title>ID �ߺ�üũ</title>
<link rel="stylesheet" type="text/css" href="../style.css">
<link rel="stylesheet" type="text/css" href="../css/main.css">
</head>
<body>
   <div align="center">
      <br /> <b><%=id%></b>
      <%
         if (result) {
            out.println("�� �̹� �����ϴ� ID�Դϴ�.<p>");
         } else {
            out.println("�� ��� ���� �մϴ�.<p>");
         }
      %>
      <a href="#" onClick="self.close()">�ݱ�</a>
   </div>
</body>
</html>