<%@ page contentType="text/html; charset=EUC-KR" errorPage="../error.jsp"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mMgr" class="MemberPkg.MemberMgr"/>
<jsp:useBean id="mBean" class="MemberPkg.MemberBean" scope="request"/>
<jsp:setProperty  name="mBean" property="*"/>
<%
     mBean.setSnsId(request.getParameter("snsid"));
     boolean result = mMgr.insertMember(mBean);
     if(result){
%>
<script type="text/javascript">
      alert("ȸ�������� �Ϸ�Ǿ����ϴ� :)");
      location.href="../index.jsp";
</script>
<% }else{%>
<script type="text/javascript">
      alert("ȸ�����Կ� ���� �Ͽ����ϴ�. :(");
      history.back();
</script>
<%} %>