<%@ page contentType="text/html; charset=EUC-KR" errorPage="error.jsp"%>

<%
    request.setCharacterEncoding("euc-kr");
	String loginid = (String) session.getAttribute("idKey");
	String lchk;
	if (loginid == null) {
		lchk = "<a href='member/login.jsp'>Login</a>";
	}
	else {
		lchk = "<a href='member/logout.jsp'>Logout</a>";
	}
%>


<html>
<head>
<title>CUKBM</title>
<link rel="stylesheet" type="text/css" href="css/login.css">
<link rel="stylesheet" type="text/css" href="style.css">
<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">
</style>

</head>
<body>

	<div id="app">
		<div style="display: flex; flex-direction: column; min-height: 100vh;" data-reactid=".0.1">
			<div class="_1y_mg6OlZKhq9LGfUCMUme">
				<div class="phbtEjxefGTKnURQmDKf-">
					<div style="color: #000000; background-color: #ffffff; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; box-sizing: border-box; font-family: Roboto, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); border-radius: 0px; position: relative; z-index: 1100; width: 100%; display: flex; padding-left: 24px; padding-right: 24px;">
						<span style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; margin: 0; padding-top: 0; letter-spacing: 0; font-size: 40px; font-weight: 400; color: #000000; height: 64px; line-height: 64px; box-flex: 1; flex: 1; font-family: 'Do Hyeon', serif;">
						<a href="index.jsp" class="menu">CUKBM</a></span>
						<span id="char"><a href="index.jsp">Home</a></span>
						<span id="char"><a href="member/memberView.jsp">Profile</a></span>
						<span id="char"><a href="board/post.jsp">Match</a></span>
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
									style="margin-top: 15px; margin-left: 20px; font-size: 15px;">#Enjoy <% if(loginid!=null){ %> <%=loginid %> <% } %></span>

								<div
									style="display: flex; padding-top: 20px; padding-left: 5px; padding-right: 10px;"
									class="_1y_mg6OlZKhq9LGfUCMUme">

								</div>
								<div class="     _1y_mg6OlZKhq9LGfUCMUme">
									<div style="margin-top: 10px;" class="phbtEjxefGTKnURQmDKf-">
										<div
											style="color: rgba(0, 0, 0, 1); background-color: #ffffff; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; box-sizing: border-box; font-family: 'Do Hyeon', serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-shadow: 0 1px 6px rgba(0, 0, 0, 0.12), 0 1px 4px rgba(0, 0, 0, 0.12); border-radius: 2px; padding: 10px;">
											<span><h4>Catholic University of Korea Big Match</h4></span>
											<span id="char"><h5>원하는 게임을 선택하여 스포츠를
												즐기세요!</h5></span>
												<span id="char"><h5>Join the games you want and enjoy sports!</h5></span>


										</div>

										<h4 style="margin-left: 35px;">[ Sports ]</h4>

									</div>

									<div
										class="cat-misc phbtEjxefGTKnURQmDKf- vUdKHHlLkgiLAA1TuA45P _2hzy86a-KLUKEnuuA6cwiv">
										<div
											style="color: rgba(255, 255, 255, 1); background-color: #202020; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; box-sizing: border-box; margin-top: 20px;">
											<div class="grid problem-card"  onclick="javascript:location.href='board/list.jsp?type=basketball'"
												style="position: relative; height: 8rem; width: 100%; align-items: center; justify-content: center; background-color: #00BFFF;">
												<div style="font-size: 3em;">Basketball</div>
											</div>
										</div>
									</div>

									<div
										class="cat-misc phbtEjxefGTKnURQmDKf- vUdKHHlLkgiLAA1TuA45P _2hzy86a-KLUKEnuuA6cwiv">
										<div
											style="color: rgba(255, 255, 255, 1); background-color: #202020; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; box-sizing: border-box; margin-top: 20px;">
											<div class="grid problem-card" onclick="javascript:location.href='board/list.jsp?type=soccer'"
												style="position: relative; height: 8rem; width: 100%; align-items: center; justify-content: center; background-color: #00BFFF;">
												<div style="font-size: 3em;">Soccer</div>
											</div>
										</div>
									</div>

									<div
										class="cat-misc phbtEjxefGTKnURQmDKf- vUdKHHlLkgiLAA1TuA45P _2hzy86a-KLUKEnuuA6cwiv">
										<div
											style="color: rgba(255, 255, 255, 1); background-color: #202020; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; box-sizing: border-box; margin-top: 20px;">
											<div class="grid problem-card" onclick="javascript:location.href='board/list.jsp?type=baseball'"
												style="position: relative; height: 8rem; width: 100%; align-items: center; justify-content: center; background-color: #00BFFF;">
												<div style="font-size: 3em;">Baseball</div>
											</div>
										</div>
									</div>

									<div
										class="cat-misc phbtEjxefGTKnURQmDKf- vUdKHHlLkgiLAA1TuA45P _2hzy86a-KLUKEnuuA6cwiv">
										<div
											style="color: rgba(255, 255, 255, 1); background-color: #202020; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; box-sizing: border-box; margin-top: 20px;">
											<div class="grid problem-card" onclick="javascript:location.href='board/list.jsp?type=pingpong'"
												style="position: relative; height: 8rem; width: 100%; align-items: center; justify-content: center; background-color: #00BFFF;">
												<div style="font-size: 3em;">Ping-Pong</div>
											</div>
										</div>
									</div>

									<div
										class="cat-misc phbtEjxefGTKnURQmDKf- vUdKHHlLkgiLAA1TuA45P _2hzy86a-KLUKEnuuA6cwiv">
										<div
											style="color: rgba(255, 255, 255, 1); background-color: #202020; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; box-sizing: border-box; margin-top: 20px;">
											<div class="grid problem-card" onclick="javascript:location.href='board/list.jsp?type=tennis'"
												style="position: relative; height: 8rem; width: 100%; align-items: center; justify-content: center; background-color: #00BFFF;">
												<div style="font-size: 3em;">Tennis</div>
											</div>
										</div>
									</div>

									<div
										class="cat-misc phbtEjxefGTKnURQmDKf- vUdKHHlLkgiLAA1TuA45P _2hzy86a-KLUKEnuuA6cwiv">
										<div
											style="color: rgba(255, 255, 255, 1); background-color: #202020; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; box-sizing: border-box; font-family: Do Hyeon, sans-serif; margin-top: 20px;">
											<div class="grid problem-card" onclick="javascript:location.href='board/list.jsp?type=esports'"
												style="position: relative; height: 8rem; width: 100%; align-items: center; justify-content: center; background-color: #00BFFF;">
												<div style="font-size: 3em;">E-Sports</div>
											</div>
										</div>
									</div>






								</div>
							</div>
							
							<div
								class="grid phbtEjxefGTKnURQmDKf- _3kj7SajgEZppGZXkY1jtaB vbACpjjkrYGkAclG_dM33">
								<span
									style="margin-top: 20px; margin-left: 20px; font-size: 20px;">MESSAGE</span>
								<div
									style="color: #000000; background-color: #ffffff; border-radius: 2px; margin-top: 20px; padding: 10px; display: flex; flex: 1; flex-direction: column;">
									<div class="twitter-wrapper grid row-fill"
										style="min-height: 200px;">
										<% if (loginid == null) { %> &nbsp;<h5>Login first.</h5> <% } else { %> 
										<iframe id="twitter-widget-0" scrolling="no" frameborder="0"
											allowtransparency="true" allowfullscreen="true"
											class="twitter-timeline twitter-timeline-rendered"
											style="position: static; visibility: visible; display: inline-block; width: 520px; height: 600px; padding: 0px; border: none; max-width: 100%; min-width: 180px; margin-top: 0px; margin-bottom: 0px; min-height: 200px;"
											data-widget-id="profile:PlaidCTF" title="Twitter Timeline"
											src="alarm.jsp"></iframe>
											
											<% } %>
											
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