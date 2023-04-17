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
      alert("회원가입이 완료되었습니다 :)");
      location.href="../index.jsp";
</script>
<% }else{%>
<script type="text/javascript">
      alert("회원가입에 실패 하였습니다. :(");
      history.back();
</script>
<%} %>