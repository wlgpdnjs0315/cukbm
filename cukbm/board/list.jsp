<%@ page contentType="text/html; charset=EUC-KR" errorPage="../error.jsp"%>
<%@page import="BoardPkg.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@ page import = "java.sql.*" %>
<jsp:useBean id="bMgr" class="BoardPkg.BoardMgr" />
<%	
	  request.setCharacterEncoding("EUC-KR");
		

      int totalRecord=0; //전체레코드수
	  int numPerPage=10; // 페이지당 레코드 수 
	  int pagePerBlock=15; //블럭당 페이지수 
	  
	  int totalPage=0; //전체 페이지 수
	  int totalBlock=0;  //전체 블럭수 

	  int nowPage=1; // 현재페이지
	  int nowBlock=1;  //현재블럭
	  
	  int start=0; //디비의 select 시작번호
	  int end=10; //시작번호로 부터 가져올 select 갯수
	  
	  int listSize=0; //현재 읽어온 게시물의 수
	  
	  String type = request.getParameter("type");
	  if(type != null){
	  }
	  else {
		  type = "Sports";
	  }
	  
	  bMgr.setType(request.getParameter("type"));
	  
	  

	String keyWord = "", keyField = "";
	Vector<BoardBean> vlist = null;
	if (request.getParameter("keyWord") != null) {
		keyWord = request.getParameter("keyWord");
		keyField = request.getParameter("keyField");
	}
	if (request.getParameter("reload") != null){
		if(request.getParameter("reload").equals("true")) {
			keyWord = "";
			keyField = "";
		}
	}
	
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	 start = (nowPage * numPerPage)-numPerPage;
	 end = numPerPage;
	 
	totalPage = (int)Math.ceil((double)totalRecord / numPerPage);  //전체페이지수
	nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock); //현재블럭 계산
	  
	totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);  //전체블럭계산
%>


<%
    request.setCharacterEncoding("euc-kr");
	String loginid = (String) session.getAttribute("idKey");
	String lchk="";
	if (loginid == null) {
%>
<script>
	alert("로그인을 해주세요");
	location.href = "../member/login.jsp"
</script>
<%
	}
	else {
		lchk = "<a href='../member/logout.jsp'>Logout</a>";
	}
%>

<html>
<head>
<title>Board List</title>
<link rel="stylesheet" type="text/css" href="../css/login.css">
<link rel="stylesheet" type="text/css" href="../style.css">
<link rel="stylesheet" type="text/css" href="../css/main.css">

<script type="text/javascript">
	function list() {
		document.listFrm.action = "list.jsp";
		document.listFrm.submit();
	}
	
	function pageing(page) {
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();
	}
	
	function block(value){
		 document.readFrm.nowPage.value=<%=pagePerBlock%>*(value-1)+1;
		 document.readFrm.submit();
	} 
	
	function read(num){
		document.readFrm.num.value=num;
		document.readFrm.action="read.jsp";
		document.readFrm.submit();
	}
	
	function check() {
	     if (document.searchFrm.keyWord.value == "") {
	   alert("검색어를 입력하세요.");
	   document.searchFrm.keyWord.focus();
	   return;
	     }
	  document.searchFrm.submit();
	 }
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
						<span id="char"><a href="../member/memberView.jsp">Profile</a></span>
						<span id="char"><a href="post.jsp">Match</a></span>
						<span id="char"><%=lchk %><span>

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
									style="margin-top: 15px; margin-left: 20px; font-size: 15px;">#Enjoy <% if(loginid!=null){ %> <%=loginid %> <% } %></span>

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

											<div
												style="font-size: 20px; margin-top: 10px; margin-bottom: 10px;">
												<br> <span>Join the games you want and enjoy
													sports!</span>
											</div>
										</div>

										<h4 style="margin-left: 35px;">[ <%=type%> ]</h4>


									</div>
						


	

			<%
				  vlist = bMgr.getBoardList(keyField, keyWord, start, end);
				  listSize = vlist.size();//브라우저 화면에 보여질 게시물갯수
				  if (vlist.isEmpty()) {
					out.println("<h4>등록된 게시물이 없습니다.</h4>");
				  } else {
			%>

					<%
					
					Connection conn = null;
			        PreparedStatement pstmt = null;
			        ResultSet rs = null;
					Class.forName("com.mysql.jdbc.Driver");
					
		            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?serverTimezone=UTC", "root","wkqkxlavmf"); 
					
					 for (int i = 0;i<numPerPage; i++) {
							if (i == listSize) break;
							BoardBean bean = vlist.get(i);
							int board_seq = bean.getSeq();  //1
							String regdate = bean.getType(); //2
							String subject = bean.getTitle(); //3
							int depth = bean.getMem_num();  //4
							String game_date = bean.getGame_date();  //5
							String isrecruit = bean.getIsrecruit();
							
							
							
							
				            String sql = "select count(*) as cnt from participate where board_seq=?";
				            pstmt = conn.prepareStatement(sql);
				            
				            pstmt.setInt(1,board_seq);
				            
				            rs = pstmt.executeQuery();
				           	int mem_count = 0;
				           	
				           	if(rs.next()) {
				                mem_count = rs.getInt(1);
				               }
							rs.close();
							
							
					%>
					
							
						
						
						<div
							class="cat-misc phbtEjxefGTKnURQmDKf- vUdKHHlLkgiLAA1TuA45P _2hzy86a-KLUKEnuuA6cwiv">
										<div
											style="color: rgba(255, 255, 255, 1); background-color: #202020; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; box-sizing: border-box; margin-top: 20px;">
											<div class="grid problem-card"  onclick="javascript:location.href='read.jsp?num=<%=board_seq%>&roomid=<%=board_seq%>&nowPage=1'"
												style="position: relative; height: 8rem; width: 100%; align-items: center; justify-content: center; background-color:     <% if(isrecruit.equals("Y")) { %> #00BFFF; <% }else {%>    #AAAAAA; <% }%>">
												
												
												<div style="font-size: 1.7em;">[#<%=board_seq%>] <%=subject%></div><br>
												
												<% if(isrecruit.equals("Y")) { %> <div style="font-size: 2em;" align="center"><%=mem_count%> / <%=depth%></div> <% }else {%>   <div style="font-size: 2em;" align="center">마감 완료</div> <% }%>
												
																				
												
												
											</div>
										</div>
									</div>
						
						
						
						
					<%
												} //for
					 conn.close();				%>
											

				 <%
				 	} //if
				  
				 %>
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
											style="position: static; visibility: visible; display: inline-block; width: 520px; height: 600px; padding: 0px; border: none; max-width: 100%; min-width: 180px; margin-top: 0px; margin-bottom: 0px; min-height: 200px;" title="Twitter Timeline"
											src="../alarm.jsp"></iframe>
									</div>
								</div>
							</div>
						</div>
						<div data-reactid=".0.1.1.0.0.1"></div>
					</div>
				</div>
			</div>
			
			
			

		
			
		</div>
	</div>
</body>
</html>