<%@ page contentType="text/html; charset=EUC-KR" errorPage="../error.jsp"%>
<%@page import="BoardPkg.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@ page import = "java.sql.*" %>
<jsp:useBean id="bMgr" class="BoardPkg.BoardMgr" />


<html>
<head>
<title>Board</title>
<link rel="stylesheet" type="text/css" href="../style.css" >
<link rel="stylesheet" type="text/css" href="../css/main.css">

<%

	request.setCharacterEncoding("EUC-KR");
	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage");
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	//String isrecruit = request.getParameter("isrecruit");

	BoardBean bean = bMgr.getBoard(num);
	String manager = bean.getManager();
	String type = bean.getType();
	String title = bean.getTitle();
	
	String isrecruit = bean.getIsrecruit();

	String content = bean.getContent();
	int mem_num = bean.getMem_num();

	String game_date = bean.getGame_date();
	String place = bean.getPlace();
	String time = bean.getTime();
	String game_type = bean.getGame_type();
	

	session.setAttribute("bean", bean);
	
	
	String loginid = (String) session.getAttribute("idKey");
	String lchk = "";
	if (loginid == null) {
%>
<script>
	alert("로그인을 해주세요");
	location.href = "list.jsp"
	
	function list(){
	    document.listFrm.submit();
	 } 
	
	function down(filename){
		 document.downFrm.filename.value=filename;
		 document.downFrm.submit();
	}
	
	function list() {
		document.listFrm.submit();
	}


</script>
<%
	}
	else {
		lchk = "<a href='../member/logout.jsp'>Logout</a>";
	}
	
	
%>
<style>

textarea {
	width: 70%;
	height: 70px;
	padding: 10px;
	box-sizing: border-box;
	border: solid 2px #cccccc;
	border-radius: 5px;
	font-size: 17px;
	resize: both;
	margin-left: 50px;
}

a {
  color: #000000;
  display:inline-block;
  text-decoration: none;
  font-weight: 400;
}



</style>
</head>
<body>

	<div id="app">
		<div style="display: flex; flex-direction: column; min-height: 100vh;" data-reactid=".0.1">
			<div class="_1y_mg6OlZKhq9LGfUCMUme" data-reactid=".0.1.0">
				<div class="phbtEjxefGTKnURQmDKf-" data-reactid=".0.1.0.0">
					<div style="color: #000000; background-color: #ffffff; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; box-sizing: border-box; font-family: Roboto, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); border-radius: 0px; position: relative; z-index: 1100; width: 100%; display: flex; padding-left: 24px; padding-right: 24px;"
						data-reactid=".0.1.0.0.0">
						<span style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; margin: 0; padding-top: 0; letter-spacing: 0; font-size: 40px; font-weight: 400; color: #000000; height: 64px; line-height: 64px; box-flex: 1; flex: 1; font-family: 'Do Hyeon', serif;">
						<a href="../index.jsp">CUKBM</a></span>
						<span id="char"><a href="../index.jsp">Home</a></span>
						<span id="char"><a href="../member/memberView.jsp">Profile</a></span>
						<span id="char"><a href="post.jsp">Match</a></span>
						<span id="char"><%=lchk %></span>

					</div>
				</div>
				
				
				<div class="row-fill _1y_mg6OlZKhq9LGfUCMUme">
				<div class="grid phbtEjxefGTKnURQmDKf-"
					style="padding-left: 2em; padding-right: 2em;"
					data-reactid=".0.1.1.0">
					<div class="grid row-fill" data-reactid=".0.1.1.0.0">
						<div class="row-fill _1y_mg6OlZKhq9LGfUCMUme"
							data-reactid=".0.1.1.0.0.0">
							<div
								class="grid phbtEjxefGTKnURQmDKf- _2_YhBFklQfg_qTh6U0kmHg _10mdlAq96KeGEpKaRURBhG"
								data-reactid=".0.1.1.0.0.0.1">
								<span
									style="margin-top: 15px; margin-left: 20px; font-size: 15px;">#Enjoy <%=loginid %></span>

								<div
									style="display: flex; padding-top: 20px; padding-left: 5px; padding-right: 10px;"
									class="_1y_mg6OlZKhq9LGfUCMUme" data-reactid=".0.1.1.0.0.0.1.0">

								</div>
								<div class="     _1y_mg6OlZKhq9LGfUCMUme">
									<div style="margin-top: 10px;" class="phbtEjxefGTKnURQmDKf-">
										<div
											style="color: rgba(0, 0, 0, 1); background-color: #ffffff; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; box-sizing: border-box; font-family: 'Do Hyeon', serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-shadow: 0 1px 6px rgba(0, 0, 0, 0.12), 0 1px 4px rgba(0, 0, 0, 0.12); border-radius: 2px; padding: 10px;"
											data-reactid=".0.1.1.0.0.0.1.1.0.0">
										
											
											
											<br/><br/>
<table align="center" width="700" cellspacing="3">
 <tr>
  <td bgcolor="#00BFFF" height="25" align="center"><span id="char">[ #<%=num%> ] <%=title%> </span></td>
 </tr>
 <tr>
  <td colspan="2">
   <table cellpadding="3" cellspacing="0" width="100%"> 
    <tr> 
  <td align="center" bgcolor="#F0F0F0" width="20%"> 방 장 </td>
  <td bgcolor="#F0F0F0"><%=manager%></td>
  <td align="center" bgcolor="#F0F0F0" width="20%"> 경 기 날 짜 </td>
  <td bgcolor="#F0F0F0"><%=game_date%></td>
 </tr>
 <tr> 
    <td align="center" bgcolor="#F0F0F0"> 종 목 </td>
    <td bgcolor="#F0F0F0"><%=type%></td>
    <td align="center" bgcolor="#F0F0F0"> 게 임 타 입 </td>
    <td bgcolor="#F0F0F0"> <% if(game_type.equals("T")) { %> 팀전 <% }else {%>   개인전 <% }%> </td>
    
   </tr>
   <tr> 
     <td align="center" bgcolor="#F0F0F0">장 소 </td>
     <td bgcolor="#F0F0F0"><%=place %></td>
     <td align="center" bgcolor="#F0F0F0"> 모 집 여 부 </td>
     <td bgcolor="#F0F0F0">   <% if(isrecruit.equals("Y")) { %> 모집중 <% }else {%>   마감 <% }%></td>
   </tr>
     <tr> 
     <td align="center" bgcolor="#F0F0F0"> 참 여 인 원 </td>
     <td bgcolor="#F0F0F0" colspan="3"><%=mem_num %> 명 </td>
   </tr>
   <tr> 
    <td colspan="4"><br/><pre><%=content%></pre><br/></td>
   </tr>
   <tr>
    <td colspan="4" align="right">
     
    </td>
     
   </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td align="center" colspan="2"> 
 <hr/>
 [ 
 <a href="enter.jsp?num=<%=num%>">참 가</a> | 
 <a href="exit.jsp?num=<%=num%>">퇴 장</a> |
 <a href="update.jsp?nowPage=<%=nowPage%>&num=<%=num%>" >수 정</a> |
 <a href="delete.jsp?nowPage=<%=nowPage%>&num=<%=num%>">삭 제</a> |
 <a href="toggleisrecruit.jsp?num=<%=num%>">확정</a> ] <br>
  </td>
 </tr>
</table>

<form name="downFrm" action="download.jsp" method="post">
	<input type="hidden" name="filename">
</form>

<form name="listFrm" method="post" action="list.jsp">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
	<%if(!(keyWord==null || keyWord.equals(""))){ %>
	<input type="hidden" name="keyField" value="<%=keyField%>">
	<input type="hidden" name="keyWord" value="<%=keyWord%>">
	<%}%>
</form>


<h5 style="margin-left:100px">Comment</h5>



<jsp:include page="/cukbm/board/coreply.jsp" flush="false">
   <jsp:param name="roomid" value="<%=num%>"/>
   <jsp:param name="nowPage" value="<%=nowPage%>"/>
</jsp:include>


										</div>

										

									</div>

								


								</div>
							</div>
							
							<div
								class="grid phbtEjxefGTKnURQmDKf- _3kj7SajgEZppGZXkY1jtaB vbACpjjkrYGkAclG_dM33">
								<span
									style="margin-top: 20px; margin-left: 20px; font-size: 20px;">참가자 리스트 </span>
								<div
									style="color: #000000; background-color: #ffffff; border-radius: 2px; margin-top: 20px; padding: 10px; display: flex; flex: 1; flex-direction: column;">
									<div class="twitter-wrapper grid row-fill"
										style="min-height: 200px;">

											<%
												String ifinflag = "";
												ifinflag = bMgr.ifin(num, loginid);
												int listSize = 0;
												int numPerPage = 10000;
												if (ifinflag.equals("Y")) {
											%>
											<jsp:include page="/cukbm/board/show_sns_id_list.jsp"
												flush="false">
												<jsp:param name="roomid" value="<%=num%>" />
											</jsp:include>
											<% 	}
	else{
		
	}
%>

										</div>
								</div>
							</div>
						</div>
						<div data-reactid=".0.1.1.0.0.1"></div>
					</div>
				</div>
			</div>
				
				
			</div>

		<div>



</div>
</div>

</body>

</html>
