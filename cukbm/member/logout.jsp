<%@ page contentType="text/html; charset=EUC-KR" errorPage="../error.jsp"%>
<%
      session.invalidate();
%>
<script>
   alert('로그아웃 되었습니다.');
   top.document.location.reload(); 
   location.href="<%=request.getContextPath()%>/cukbm/index.jsp";
</script>