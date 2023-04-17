<%@ page contentType="text/html; charset=EUC-KR" errorPage="../error.jsp"%>
<%@ page import="BoardPkg.BoardBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="bMgr" class="BoardPkg.BoardMgr" />
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage");
	BoardBean bean = (BoardBean) session.getAttribute("bean");

	String realmanager = bean.getManager();
	String subject = bean.getSubject();
	String title = bean.getTitle();
	String type = bean.getType();
	String content = bean.getContent();
	int mem_num = bean.getMem_num();
	String name = bean.getName();
	String place = bean.getPlace();
	String game_date = bean.getGame_date();
	String game_type = bean.getGame_type();
	String time = bean.getTime();

	String loginid = (String) session.getAttribute("idKey");
	String lchk="";
	if (loginid == null) {
%>
<script>
	alert("로그인을 해주세요");
	location.href = "list.jsp"
</script>
<%
	}else if (!loginid.equals(realmanager)){
%>
<script>
	alert("해당 방의 방장이 아닙니다.");
	history.go(-1);
</script>
<%
	}
	else {
		lchk = "<a href='../member/logout.jsp'>Logout</a>";
	}
%>
<style>

		textarea {
			width: 100%;
			height: 200px;
			padding: 10px;
			box-sizing: border-box;
			border: solid 2px #eeeeee;
			border-radius: 5px;
			font-size: 16px;
			resize: both;
		}

</style>
<html>
<head>
<title>Post</title>
<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="vendor/jquery-ui/jquery-ui.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" type="text/css" href="../style.css">
<link rel="stylesheet" type="text/css" href="../css/main.css">
</head>
<body style="padding:0px 0px;">


<script type="text/javascript">
function inputCheck(){
   if(document.postFrm.title.value==""){
      alert("제목을 입력해 주세요");
      document.postFrm.title.focus();
      return;
   }
   if(document.postFrm.place.value==""){
      alert("장소를 입력해 주세요");
      document.postFrm.place.focus();
      return;
   }
   if(document.postFrm.mem_num.value==""){
      alert("모집 인원을 입력해 주세요");
      document.postFrm.mem_num.focus();
      return;
   }
   if(document.postFrm.mem_num.value<2){
	      alert("2 이상의 수를 입력해주세요");
	      document.postFrm.mem_num.focus();
	      return;
	   }
   if(document.postFrm.content.value==""){
      alert("내용을 입력해 주세요");
      document.postFrm.content.focus();
      return;
   }
   document.postFrm.submit();
}


function digit_check(evt){
	var code = evt.which?evt.which:event.keyCode;
	if(code < 48 || code > 57) {
		return false;
	}
}

</script>





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
						<span id="char"><%=lchk%><span>

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
											<hr width="500">
											<h4 align="center">Match Create</h4>
											<hr width="500">
											
											
											
												


<div class="main">

        <section class="signup">
            <div class="container">
                <div class="signup-content">
                
                    <form method="POST" id="signup-form" class="signup-form" name="postFrm" action="boardUpdate" style="height:855px;">
                  
                        <div class="form-row">
                            <div class="form-group">
                                <label for="manager">방 장</label>
                                <input type="text" class="form-input" name="manager" id="manager" readonly value="<%=loginid%>"/>
                            </div>
                            
                             <div class="form-radio">
                                <label for="gender">게임 타입</label>
                                <div class="form-flex">
                                    <input type="radio" name="game_type" value="S" id="single" <% if("S".equals(game_type)){%>checked="checked"<%}%> />
                                    <label for="single">개인전</label>
    
                                    <input type="radio" name="game_type" value="T" id="team" <% if("T".equals(game_type)){%>checked="checked"<%}%>/>
                                    <label for="team">팀전</label>
                                    
                                </div>
                              </div>
                            
                        </div>
                        
                        <div class="form-group">
                                <label for="title">제 목</label>
                                <input type="text" class="form-input" name="title" id="title" value="<%=title%>"/>
                        </div>
                        
                        
                        
                        <div class="form-radio">
                                <label for="gender">경기 종목</label>
                                <div class="form-flex">
                                    <input type="radio" name="type" value="basketball" id="basketball" <% if("basketball".equals(type)){%>checked="checked"<%}%>/>
                                    <label for="basketball">Basketball</label>
    
                                    <input type="radio" name="type" value="soccer" id="soccer" <% if("soccer".equals(type)){%>checked="checked"<%}%>/>
                                    <label for="soccer">Soccer</label>
                                    
                                    <input type="radio" name="type" value="baseball" id="baseball" <% if("baseball".equals(type)){%>checked="checked"<%}%>/>
                                    <label for="baseball">Baseball</label>
                                    
                                    <input type="radio" name="type" value="pingpong" id="pingpong" <% if("pingpong".equals(type)){%>checked="checked"<%}%>/>
                                    <label for="pingpong">PingPong</label>
                                    
                                    <input type="radio" name="type" value="tennis" id="tennis" <% if("tennis".equals(type)){%>checked="checked"<%}%>/>
                                    <label for="tennis">Tennis</label>
                                    
                                    <input type="radio" name="type" value="esports" id="esports" <% if("esports".equals(type)){%>checked="checked"<%}%>/>
                                    <label for="esports">E-sports</label>
                                    
                                    
                                </div>
                        </div>
                        
                        
                        
                        <div class="form-row">
                            <div class="form-group form-icon">
                                <label for="birth_date">경기 날짜</label>
                                <%=game_date%>
                            </div>
                            
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label for="place">장 소</label>
                                <input type="text" class="form-input" name="place" id="place" value="<%=place%>"/>
                            </div>
                            <div class="form-group">
                                <label for="mem_num">모집 인원</label>
                                <input type="text" onkeypress="return digit_check(event)" class="form-input" name="mem_num" id="mem_num" value="<%=mem_num%>"/>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="content">내 용</label>
                            <textarea class="form-input" name="content" id="content" cols="40"><%=content%></textarea>
                            
                        </div>
                        
                        <div class="form-group">
                            <input type="button" name="submit2" class="form-submit" style="margin-right: 80px;" value="Submit" onclick="inputCheck()"/>
                        </div>
                        
                        
                        <div class="form-group">
							<input type="reset" id="submit2" class="form-submit" style="margin-right: 80px;" value="Reset">
                        </div>
                        
                        <input type="hidden" name="nowPage" value="<%=nowPage%>">
                        <input type='hidden' name="num" value="<%=num%>">
                        <input type='hidden' name="loginid" value="<%=loginid%>">
                       
                    </form>
                </div>
            </div>
        </section>

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
										<iframe id="twitter-widget-0" scrolling="no" frameborder="0"
											allowtransparency="true" allowfullscreen="true"
											class="twitter-timeline twitter-timeline-rendered"
											style="position: static; visibility: visible; display: inline-block; width: 520px; height: 600px; padding: 0px; border: none; max-width: 100%; min-width: 180px; margin-top: 0px; margin-bottom: 0px; min-height: 200px;"
											src="../alarm.jsp"></iframe>
									</div>
								</div>
							</div>
							
							
							
						
						</div>
						
					</div>
				</div>
			</div>
			
			
			
			
			
			
		</div>

	</div>
    
</body>
</html>