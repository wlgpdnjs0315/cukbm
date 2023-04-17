<%@ page contentType="text/html;charset=EUC-KR" pageEncoding="utf-8" errorPage="../error.jsp"%>
<html>
<head>
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="../style.css">
<link rel="stylesheet" type="text/css" href="../css/main.css">
<link rel="stylesheet" type="text/css" href="../css/login.css">
<script type="text/javascript" src="scripttt.js"></script>
<script type="text/javascript">
   function idCheck(id) {
      frm = document.regFrm;
      if (id == "") {
         alert("아이디를 입력해 주세요.");
         frm.id.focus();
         return;
      }
      url = "idCheck.jsp?id=" + id;
      window.open(url, "IDCheck", "width=300,height=150");
   }
   function digit_check(evt) {
	   var code = evt.which?evt.which:event.keyCode;
	   if(code < 48 || code > 57) {
		   return false;
	   }
   }
</script>
</head>
<body onLoad="regFrm.id.focus()">



<div id="app">
		<div style="display: flex; flex-direction: column; min-height: 100vh;">
			<div class="_1y_mg6OlZKhq9LGfUCMUme" data-reactid=".0.1.0">
				<div class="phbtEjxefGTKnURQmDKf-" data-reactid=".0.1.0.0">
					<div style="color: #000000; background-color: #ffffff; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; box-sizing: border-box; font-family: Roboto, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); border-radius: 0px; position: relative; z-index: 1100; width: 100%; display: flex; padding-left: 24px; padding-right: 24px;">
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
					style="padding-left: 2em; padding-right: 2em;">
					<div class="grid row-fill">
						<div class="row-fill _1y_mg6OlZKhq9LGfUCMUme">
							<div
								class="grid phbtEjxefGTKnURQmDKf- _2_YhBFklQfg_qTh6U0kmHg _10mdlAq96KeGEpKaRURBhG">
								<span
									style="margin-top: 15px; margin-left: 20px; font-size: 15px;">#Enjoy</span>

								<div
									style="display: flex; padding-top: 20px; padding-left: 5px; padding-right: 10px;"
									class="_1y_mg6OlZKhq9LGfUCMUme">

								</div>
								<div class="     _1y_mg6OlZKhq9LGfUCMUme">
									<div style="margin-top: 10px;" class="phbtEjxefGTKnURQmDKf-">
										<div
											style="color: rgba(0, 0, 0, 1); background-color: #ffffff; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; box-sizing: border-box; font-family: 'Do Hyeon', serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-shadow: 0 1px 6px rgba(0, 0, 0, 0.12), 0 1px 4px rgba(0, 0, 0, 0.12); border-radius: 2px; padding: 10px;">
											
											
											
											<h4 align="center"> Sign Up</h4>
											<h5 style="font-weight: 300;" align="center">회원가입</h5>
											
	
											<div align="center" style="font-size: 20px; margin-top: 10px; margin-bottom: 10px;">
												<br> 													
													<table width="700" cellpadding="3" align="center">
													<td colspan="2"><hr/></td>
	<tr>
		<td align=center>
		
		<form name="regFrm" method="post" action="memberProc.jsp">
		<table align="center">
		
			<tr>
				<td width="10%"><span id="char">아이디</span></td>
				<span><td width="90%"><input type="text" name="id" value=""></td><td><input type="button" value="ID중복확인" onClick="idCheck(this.form.id.value)" style="width:100px;margin:10px;"></td>
			</tr>
			<tr>
				<td width="10%"><span id="char">비밀번호</span></td>
				<td width="90%"><input type="password" name="pwd" size="20" value=""></td>
			</tr>
					
			<tr>
				<td width="10%"><span id="char">SNS ID</span></td>
				<td width="90%"><input type="text" name="snsid" size="20" value=""></td>
			</tr>
			
			<tr>
				<td><span id="char">이 름</span></td>
				<td><input type="text" name="name" size="20" value=""></td>
			</tr>
			
			<tr>
				<td><span id="char">성 별</span></td>
				<td>남<input type="radio" name="gender" value="M" checked="checked"> 
                    여<input type="radio" name="gender" value="F">
               </td>
			</tr>
			
			<tr>
				<td width="10%"><span id="char">소 속</span></td>
				<td width="90%"><input type="text" name="team" size="20" value=""></td>
			</tr>
			
			<tr>
				<td width="10%"><span id="char">나 이</span></td>
				<td width="90%"><input type="text" onkeypress="return digit_check(event)" name="age" size="20" value=""></td>
			</tr>
			
			
			<tr>
				<td colspan="2"><hr/></td>
			</tr>
			<tr>
				<td>
						 
                       
				</td>
				<td>
						 
                        
                        <input type="reset" value="Reset"> &nbsp; &nbsp;<input type="submit" value="Submit">
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
									style="margin-top: 20px; margin-left: 20px; font-size: 20px;">Hello</span>
								<div
									style="color: #000000; background-color: #ffffff; border-radius: 2px; margin-top: 20px; padding: 10px; display: flex; flex: 1; flex-direction: column;">
									<div class="twitter-wrapper grid row-fill"
										style="min-height: 200px;">
										<img src="../images/whitecat.jpg" width="200px" style="padding: 300px 0px;margin-left: 40px;">
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