<%@ page contentType="text/html; charset=EUC-KR" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.sql.*" %> 

<%
   request.setCharacterEncoding("euc-kr");
   Integer roomid = Integer.parseInt(request.getParameter("roomid"));
   Integer nowPage = Integer.parseInt(request.getParameter("nowPage"));
%>
<HTML>
        <HEAD>
                <link rel="stylesheet" type="text/css" href="test.css">
                <script src="http://code.jquery.com/jquery-latest.min.js"></script>
                <SCRIPT>
                
                $(function() {
                    $('textarea').on('keydown', function(event) {
                        if (event.keyCode == 13)
                            if (!event.shiftKey){
                                event.preventDefault();
                                $('#testForm').submit();
                            }
                    });
        
                    $('#testForm').on('submit', function() {
                        button_click();
                    });
                    
                    function button_click() {   

                    }
                });
          
                
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
                
                function scroll(){
                var divdiv = document.getElementById("comment");

                divdiv.scrollTop = divdiv.scrollHeight; 
                }

                </SCRIPT>
                
<style>
.page {
	margin-top: -30px;
  justify-content: center;
}


/* add default color for animation start  */


/* toggle this class */

.color-bg-start {
  background-color: #56BAED;
}


/* toggle class bg-animate-color */

.bg-animate-color {
  animation: random-bg .5s linear infinite;
}


/* add animation to bg color  */

@keyframes random-bg {
  from {
    filter: hue-rotate(0);
  }
  to {
    filter: hue-rotate(360deg);
  }
}

.fun-btn {
  /* change bg color to get different hues    */
  width: 100px;
  height: 70px;
  background-color: #00BFFF;
  color: white;
  padding: 2em 1em;
  border: none;
  transition: all .3s ease;
  border-radius: 5px;
  letter-spacing: 2px;
  text-transform: uppercase;
  outline: none;
  align-self: center;
  cursor: pointer;
  font-weight: bold;
  float: right;
  margin-top: -40px;
 
}

.fun-btn:hover {
  animation: random-bg .5s linear infinite, grow 1300ms ease infinite;
}

.start-fun {
  background-color: #fff !important;
  /* change color of button text when fun is started   */
  color: #56BAED !important;
}

/* pulsating effect on button */
@keyframes grow {
  0% {
    transform: scale(1);
  }
  14% {
    transform: scale(1.3);
  }
  28% {
    transform: scale(1);
  }
  42% {
    transform: scale(1.3);
  }
  70% {
    transform: scale(1);
  }
}

</style>
        </HEAD>

<BODY onload="scroll()">

<center>
<TABLE>
<TR>


<td>
                <form id = "testForm" method = "POST" action="insert.jsp">
                <input type="hidden" name="num" value="<%=roomid%>"/>
                <input type="hidden" name="num2" value="<%=nowPage%>"/>
                <textarea autofocus="autofocus" name="content_text" cols="60" rows="2"></textarea>
				<div class="page">
				<button class="fun-btn">Write</button>
				</div>

				</form>

</td>
      </TR>
</TABLE>
</center>
<br>



<div style="width:100%; height:250px; overflow:auto" align="center" id="comment"> 
<TABLE>
   <TR>
        <TD width=100>아이디</TD>
        <TD width=250>내용</TD>
        <TD width=80>작성시간</TD>
    </TR>

   <TR>
      <%
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      try{
         Class.forName("com.mysql.jdbc.Driver");
         conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?serverTimezone=UTC", "root", "wkqkxlavmf");
         
         String sql = "select * from tblcomment where roomid = ? order by seq asc";
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1,Integer.toString(roomid));
         rs = pstmt.executeQuery();
         
         while(rs.next()){
            String id = rs.getString("id");
            String content = rs.getString("content");
            
            Timestamp register = rs.getTimestamp("time");
            content = content.replaceAll("<", "&lt;");
            content = content.replaceAll(">", "&gt;");

      %>
      
      <tr>
         <td><%=id%></td>
         <td><%=content%></td>
         <td><%=register.toString()%></td>
      </tr>
      <% 
         }
      }
      catch(Exception e){ 
         e.printStackTrace(); 
      }
      finally{
         if(pstmt != null)
            try{
               pstmt.close();
            }catch(SQLException sql){}
         
         if(conn != null)
            try{
               conn.close();
            }catch(SQLException sql){}
      }   
      %>
   
   </TR>
            
</TABLE>
</div>
<br/>

</BODY>
</HTML>