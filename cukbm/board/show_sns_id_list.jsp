<%@ page contentType="text/html; charset=EUC-KR" errorPage="../error.jsp"%>
<%@page import="BoardPkg.BoardBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="myBMgr" class="BoardPkg.MyBoardMgr"/>
<%
   Integer roomid = Integer.parseInt(request.getParameter("roomid"));
%>
<%   
     request.setCharacterEncoding("EUC-KR");
     String id = (String) session.getAttribute("idKey");
     String isJoin = request.getParameter("isJoin");
      int totalRecord=0; 
     int numPerPage=10; 
     int pagePerBlock=15; 
     
     int totalPage=0;
     int totalBlock=0;  

     int nowPage=1;
     int nowBlock=1;  
     
     int start=0; 
     int end=10; 
     
     int listSize=0; 

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
   totalPage = (int)Math.ceil((double)totalRecord / numPerPage);  
   nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock); 
     
   totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock); 
%>
<html>
<head>
<title>JSP Board</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
   function list() {
      document.listFrm.action = "myList.jsp"+<% request.getParameter("isJoin");%>;
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
</script>
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

</style>

</head>
<body>
<div align="center">
<hr width="300">
   <table align="center" width="300" cellpadding="3">
      <tr>
         <td align="center" colspan="2">
         <%
              vlist = myBMgr.showsnsList(roomid, isJoin, keyField, keyWord, start, end);
              listSize = vlist.size();
              if (vlist.isEmpty()) {
               out.println("참여 중인 인원이 없습니다.");
              } else {
         %>
              <table width="100%" cellpadding="2" cellspacing="0">
              
               <%
                    for (int i = 0;i<numPerPage; i++) {
                     if (i == listSize) break;
                     BoardBean bean = vlist.get(i);
                     String user_seq = bean.getUser_seq();
                     String snsid = bean.getSnsid();
                     String team = bean.getTeam();
               %>
               <tr>
               <td colspan=2 bgcolor="#f0f0f0"></td>
               </tr>
               <tr>
                  <td>아이디</td><td align="center"><%=user_seq%></td>
               </tr>
               <tr>
                  <td>SNS아이디</td><td align="center"><%=snsid%></td>
               </tr>
               <tr>
                  <td>소속</td><td align="center"><%=team%></td>
                </tr>
                  

               <%}//for%>
            </table> 
            
            <%
            
          }//if
       %>
         </td>
      </tr>
      <tr>
         <td colspan="2"></td>
      </tr>
      </table>
      
      <hr width="300">
   
   </form>
   <form name="listFrm" method="post">
      <input type="hidden" name="reload" value="true"> 
      <input type="hidden" name="nowPage" value="1">
   </form>
   <form name="readFrm" method="get">
      <input type="hidden" name="num"> 
      <input type="hidden" name="nowPage" value="<%=nowPage%>"> 
      <input type="hidden" name="keyField" value="<%=keyField%>"> 
      <input type="hidden" name="keyWord" value="<%=keyWord%>">
   </form>
</div>
</body>
</html>