<%@ page contentType="text/html;charset=EUC-KR" errorPage="../error.jsp"%>
<%@page import="MemberPkg.MemberBean"%>
<jsp:useBean id="mMgr" class="MemberPkg.MemberMgr"/>
<%
   String id = (String) session.getAttribute("idKey");
   MemberBean mBean = mMgr.getMember(id);

	String lchk="";
	if (id == null) {
%>
<script>
	alert("로그인을 해주세요");
	location.href = "login.jsp"
</script>
<%
	
	}
	else {
	lchk = "<a href='logout.jsp'>Logout</a>";
	}

%>

<html>
<head>
<link rel="stylesheet" type="text/css" href="../style.css">
<link rel="stylesheet" type="text/css" href="../css/main.css">

<script type="text/javascript" src="script.js"></script>
</head>
<body>

<div id="app">
		<div style="display: flex; flex-direction: column; min-height: 100vh;">
			<div class="_1y_mg6OlZKhq9LGfUCMUme" data-reactid=".0.1.0">
				<div class="phbtEjxefGTKnURQmDKf-" data-reactid=".0.1.0.0">
					<div style="color: #000000; background-color: #ffffff; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; box-sizing: border-box; font-family: Roboto, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); border-radius: 0px; position: relative; z-index: 1100; width: 100%; display: flex; padding-left: 24px; padding-right: 24px;">
						<span style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; margin: 0; padding-top: 0; letter-spacing: 0; font-size: 40px; font-weight: 400; color: #000000; height: 64px; line-height: 64px; box-flex: 1; flex: 1; font-family: 'Do Hyeon', serif;">
						<a href="../index.jsp">CUKBM</a></span>
						<span id="char"><a href="../index.jsp">Home</a></span>
						<span id="char"><a href="memeberView.jsp">Profile</a></span>
						<span id="char"><a href="../board/post.jsp">Match</a></span>
						<span id="char"><%=lchk %></span>

					</div>
				</div>
			</div>

			<div class="row-fill _1y_mg6OlZKhq9LGfUCMUme">
				<div class="grid phbtEjxefGTKnURQmDKf-"
					style="padding-left: 2em; padding-right: 2em;">
					<div class="grid row-fill">
						<div class="row-fill _1y_mg6OlZKhq9LGfUCMUme">
							<div
								class="grid phbtEjxefGTKnURQmDKf- _2_YhBFklQfg_qTh6U0kmHg _10mdlAq96KeGEpKaRURBhG">
								<span
									style="margin-top: 15px; margin-left: 20px; font-size: 15px;">#Enjoy <%=id%></span>

								<div
									style="display: flex; padding-top: 20px; padding-left: 5px; padding-right: 10px;"
									class="_1y_mg6OlZKhq9LGfUCMUme">

								</div>
								<div class="     _1y_mg6OlZKhq9LGfUCMUme">
									<div style="margin-top: 10px;" class="phbtEjxefGTKnURQmDKf-">
										<div
											style="color: rgba(0, 0, 0, 1); background-color: #ffffff; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; box-sizing: border-box; font-family: 'Do Hyeon', serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-shadow: 0 1px 6px rgba(0, 0, 0, 0.12), 0 1px 4px rgba(0, 0, 0, 0.12); border-radius: 2px; padding: 10px;">
											
											
											
											<h4 align="center"> My Page</h4>
											<h5 style="font-weight: 300;" align="center">회원정보 조회</h5>
											
	
											<div align="center" style="font-size: 20px; margin-top: 10px; margin-bottom: 10px;">
												<br> 													
													<table width="600" cellpadding="3" align="center">
													<td colspan="2"><hr/></td>
	<tr>
		<td align=center>
		
		<form name="regFrm" method="post" action="memberUpdateProc.jsp">
		<table align="center">
		
			<tr>
				<td width="10%"><span id="char">이 름</span></td>
				<td width="90%"><%=mBean.getName()%></td>
			</tr>
			<tr>
				<td width="10%"><span id="char">아이디</span></td>
				<td width="90%"><%=id%></td>
			</tr>
			
			<tr>
				<td width="10%"><span id="char">비밀번호</span></td>
				<td width="90%">********</td>
			</tr>
			
			<tr>
				<td><span id="char">소 속</span></td>
				<td><input type="text" name="team" value="<%=mBean.getTeam()%>"></td>
			</tr>
			<tr>
				<td width="10%"><span id="char">SNS ID</span></td>
				<td width="90%"><input type="text" name="snsid" value="<%=mBean.getSnsId()%>"></td>
			</tr>
			
			<tr>
				<td colspan="2"><hr/></td>
			</tr>
			<tr>
				<td colspan="2">
						<input type="submit" value="수정완료"> &nbsp; &nbsp; 
                        <input type="reset" value="다시쓰기">
				</td>
			</tr>
		</table>
		</form>
		</td>
	</tr>
</table>
													
													
											</div>
											
											
											
											
											
										</div>

										

									</div>

									






								</div>
							</div>
							
							<div
								class="grid phbtEjxefGTKnURQmDKf- _3kj7SajgEZppGZXkY1jtaB vbACpjjkrYGkAclG_dM33">
								<span
									style="margin-top: 20px; margin-left: 20px; font-size: 20px;">My Room list</span>
								<div
									style="color: #000000; background-color: #ffffff; border-radius: 2px; margin-top: 20px; padding: 10px; display: flex; flex: 1; flex-direction: column;">
									<div class="twitter-wrapper grid row-fill"
										style="min-height: 200px;">
										<h5>내가 생성한 방</h5>
										<iframe id="twitter-widget-0" scrolling="no" frameborder="0"
											allowtransparency="true" allowfullscreen="true"
											class="twitter-timeline twitter-timeline-rendered"
											style="position: static; visibility: visible; display: inline-block; width: 520px; height: 600px; padding: 0px; border: none; max-width: 100%; min-width: 180px; margin-top: 0px; margin-bottom: 0px; min-height: 200px;"
											src="../board/myList.jsp?isJoin=create"></iframe>
											<h5>참여 중인 방</h5> 
											<iframe id="twitter-widget-0" scrolling="no" frameborder="0"
											allowtransparency="true" allowfullscreen="true"
											class="twitter-timeline twitter-timeline-rendered"
											style="position: static; visibility: visible; display: inline-block; width: 520px; height: 600px; padding: 0px; border: none; max-width: 100%; min-width: 180px; margin-top: 0px; margin-bottom: 0px; min-height: 200px;"
											src="../board/myList.jsp?isJoin=join"></iframe>
									</div>
								</div>
							</div>
						</div>
						<div></div>
					</div>
				</div>
			</div>
		</div>

	</div>



</body>
</html>


