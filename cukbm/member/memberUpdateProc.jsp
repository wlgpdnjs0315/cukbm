<%@ page contentType="text/html; charset=EUC-KR" errorPage="../error.jsp"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mMgr" class="MemberPkg.MemberMgr"/>
<jsp:useBean id="mBean" class="MemberPkg.MemberBean" scope="request"/>
<jsp:setProperty name="mBean" property="*" />
<%
	  mBean.setSnsId(request.getParameter("snsid"));
	  mBean.setTeam(request.getParameter("team"));
	  mBean.setId((String)session.getAttribute("idKey"));
	  
	  System.out.println(request.getParameter("team"));
	  boolean result = mMgr.updateMember(mBean);
	  
	  if(result){
%>
<script type="text/javascript">
		alert("회원정보 수정 하였습니다.");
		location.href="memberView.jsp";
</script>
<% }else{%>
<script type="text/javascript">
		alert("회원정보 수정에 실패 하였습니다.");
		history.back();
</script>
<%} %>