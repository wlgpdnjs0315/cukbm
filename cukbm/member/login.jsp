<%@ page contentType="text/html; charset=EUC-KR" errorPage="../error.jsp"%>
<%
	  request.setCharacterEncoding("EUC-KR");
	  String id = (String)session.getAttribute("idKey");
%>
<html>
<head>
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="../css/login.css">
<link rel="stylesheet" type="text/css" href="../css/main.css">
<link rel="stylesheet" type="text/css" href="../style.css">



<script type="text/javascript">
	function loginCheck() {
		if (document.loginFrm.id.value == "") {
			alert("아이디를 입력해 주세요.");
			document.loginFrm.id.focus();
			return;
		}
		if (document.loginFrm.pwd.value == "") {
			alert("비밀번호를 입력해 주세요.");
			document.loginFrm.pwd.focus();
			return;
		}
		document.loginFrm.action = "loginProc.jsp";
		document.loginFrm.submit();
	}
	
	function memberForm(){
		document.loginFrm.target = "content";
		document.loginFrm.action = "member.jsp";
		document.loginFrm.submit();
	}
	
	

     
     $('.fun-btn').on('click', function(event) {
     	  $(this).toggleClass('start-fun');
     	  var $page = $('.page');
     	  $page.toggleClass('color-bg-start')
     	    .toggleClass('bg-animate-color');

     	  //change text when when button is clicked

     	  $(this).hasClass('start-fun') ?
     	    $(this).text('stop the fun') :
     	    $(this).text('start the fun');

     	});
     
     
     
    
     
     
	
	
</script>
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
						<span id="char"><a href="memberView.jsp">Profile</a></span>
						<span id="char"><a href="../board/post.jsp">Match</a></span>
						<span id="char"><a href="login.jsp">Login</a></span>

					</div>
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
									style="margin-top: 15px; margin-left: 20px; font-size: 15px;">#Enjoy</span>

								<div
									style="display: flex; padding-top: 20px; padding-left: 5px; padding-right: 10px;"
									class="_1y_mg6OlZKhq9LGfUCMUme" data-reactid=".0.1.1.0.0.0.1.0">

								</div>
								<div class="     _1y_mg6OlZKhq9LGfUCMUme">
									<div style="margin-top: 10px;" class="phbtEjxefGTKnURQmDKf-">
										<div
											style="color: rgba(0, 0, 0, 1); background-color: #ffffff; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; box-sizing: border-box; font-family: 'Do Hyeon', serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-shadow: 0 1px 6px rgba(0, 0, 0, 0.12), 0 1px 4px rgba(0, 0, 0, 0.12); border-radius: 2px; padding: 10px;"
											data-reactid=".0.1.1.0.0.0.1.1.0.0">
											<h4 data-reactid=".0.1.1.0.0.0.1.1.0.0.0">Catholic
												University of Korea Big Match</h4>
											<h5 style="font-weight: 300;"
												data-reactid=".0.1.1.0.0.0.1.1.0.0.1">원하는 게임을 선택하여 스포츠를
												즐기세요!</h5>
												


											<div class="wrapper fadeInDown">
												<div id="formContent">
													<!-- Tabs Titles -->
													<h2 class="active">CUKBM</h2>
													<h2 class="inactive underlineHover"><a href="member.jsp">Sign Up</a></h2>

													<!-- Icon -->
													<div class="fadeIn first">
													
													</div>

													<!-- Login Form -->
													<form name="loginFrm" method="post" action="loginProc.jsp" id="login">
														<input type="text" id="id" class="fadeIn second" name="id" placeholder="login">
														<input type="password" id="password" class="fadeIn third" name="pwd" placeholder="password">
															<input type="button" value="Log In" onclick="loginCheck()">
													</form>

													<!-- Remind Passowrd -->
													<div id="formFooter">
														<a class="underlineHover" onclick="javascript:alert('관리자에게 문의해주세요 :)')">Forgot Password?</a>
													</div>

												</div>
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
										
										<% if (id == null) { %> &nbsp;<h5>Login first.</h5> <% } else { %>
										<iframe id="twitter-widget-0" scrolling="no" frameborder="0"
											allowtransparency="true" allowfullscreen="true"
											class="twitter-timeline twitter-timeline-rendered"
											style="position: static; visibility: visible; display: inline-block; width: 520px; height: 600px; padding: 0px; border: none; max-width: 100%; min-width: 180px; margin-top: 0px; margin-bottom: 0px; min-height: 200px;"
											data-widget-id="profile:PlaidCTF" title="Twitter Timeline"
											src="../alarm.jsp"></iframe>
											
											<% } %>
									</div>
								</div>
							</div>
							
							
							
							
							
						
						</div>
						
					</div>
				</div>
			</div>
		</div>

	</div>




 <div align="center">
		<%
			if (id != null) {
		%>
		<b><%=id%></b>님 환영 합니다.
		<p>제한된 기능을 사용 할 수가 있습니다.
		<p>
			<a href="logout.jsp">로그아웃</a>
			<%} else {%>
		
		<%}%>
	</div>
</body>
</html>