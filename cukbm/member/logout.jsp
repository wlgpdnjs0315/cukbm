<%@ page contentType="text/html; charset=EUC-KR" errorPage="../error.jsp"%>
<%
      session.invalidate();
%>
<script>
   alert('�α׾ƿ� �Ǿ����ϴ�.');
   top.document.location.reload(); 
   location.href="<%=request.getContextPath()%>/cukbm/index.jsp";
</script>