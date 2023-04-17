<%@ page contentType="text/html; charset=EUC-KR" errorPage="../error.jsp"%>
<%@page import="BoardPkg.BoardBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="myBMgr" class="BoardPkg.MyBoardMgr"/>
<%   
     request.setCharacterEncoding("EUC-KR");
     String id = (String) session.getAttribute("idKey");
     String isJoin = request.getParameter("isJoin");
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
    
   totalRecord = myBMgr.getTotalCount(id, isJoin, keyField, keyWord);
   totalPage = (int)Math.ceil((double)totalRecord / numPerPage);  //전체페이지수
   nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock); //현재블럭 계산
     
   totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);  //전체블럭계산
%>
<html>
<head>
<title>mylist</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
@import url(https://fonts.googleapis.com/css?family=Do+Hyeon:400);
body {
         
            letter-spacing: 0;
            font-size: 20px;
            font-weight: 400;
            height: 64px;
            line-height: 64px;
            color: #000000;
            font-family: 'Do Hyeon', serif;
        }
        
        
        
a {
  color: #000000;
  display:inline-block;
  text-decoration: none;
  font-weight: 400;
}


a:visited {
  color: #000000;
  display:inline-block;
  text-decoration: none;
  font-weight: 400;
}

a:hover {
  color: #52ADEB;
  display:inline-block;
  text-decoration: none;
  font-weight: 500;
}

</style>

<script type="text/javascript">
   function list() {
      document.listFrm.action = "myList.jsp"+<% request.getParameter("isJoin");%>;
      document.listFrm.submit();
   }
   
</script>
</head>
<body>
<div align="center">

   <hr width="300"/>
   <table align="center" width="300">
        
   </table>
   <table align="center" width="300" cellpadding="3">
      <tr>
         <td align="center" colspan="2">
         <%
              vlist = myBMgr.getBoardList(id, isJoin, keyField, keyWord, start, end);
              listSize = vlist.size();//브라우저 화면에 보여질 게시물갯수
              if (vlist.isEmpty()) {
               out.println("No data.");
              } else {
         %>
              <table width="100%" cellpadding="2" cellspacing="0">
               <tr align="center" bgcolor="#F0F0F0" height="120%">
                  <td width="30%">종 목</td>
                  <td>제 목</td>
                  <td>번 호</td>
               </tr>
               <%
                    for (int i = 0;i<numPerPage; i++) {
                     if (i == listSize) break;
                     BoardBean bean = vlist.get(i);
                     int num = bean.getSeq();
                     String title = bean.getTitle();
                     String game_date = bean.getGame_date();
                     String type = bean.getType();
                     int mem_num = bean.getMem_num();
               %>
               <tr>
                  <td align="center"><%=type%></td>
                  <td align="center"><a href="../board/read.jsp?num=<%=num%>&roomid=<%=num%>&nowPage=1" target="_parent"><%=title%></a></td>
                  <td align="center">#<%=num%></td>
                  </tr>
               <%}//for%>
            </table> <%
          }//if
       %>
         </td>
      </tr>
      <tr>
         <td colspan="2"><br /><br /></td>
      </tr>
      </table>
   <hr width="300"/>
   </form>
   <form name="listFrm" method="post">
      <input type="hidden" name="reload" value="true"> 
      <input type="hidden" name="nowPage" value="1">
   </form>
   <form name="readFrm" method="get">
      <input type="hidden" name="nowPage" value="<%=nowPage%>"> 
      <input type="hidden" name="keyField" value="<%=keyField%>"> 
      <input type="hidden" name="keyWord" value="<%=keyWord%>">
   </form>
</div>
</body>
</html>