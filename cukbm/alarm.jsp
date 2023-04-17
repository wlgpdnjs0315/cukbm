<html>
<head>

<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
@import url(https://fonts.googleapis.com/css?family=Do+Hyeon:400);
body {
         
            letter-spacing: 0;
            font-size: 25px;
            font-weight: 400;
            height: 64px;
            line-height: 64px;
            color: #000000;
            font-family: 'Do Hyeon', serif;
            margin: 10px;
        }

</style>

<script language=javascript>
var xmlhttp = null;

function getHttprequest() {

  if(window.XMLHttpRequest) {
   xmlhttp = new XMLHttpRequest();
  } else {
   xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
  }

  xmlhttp.open("GET","alarm_db.jsp");

  xmlhttp.onreadystatechange = function(){
    if(xmlhttp.readyState == '4'){ 
      if(xmlhttp.status == 200) {
        var data=xmlhttp.responseText;
        document.getElementById("Context").innerHTML = data;
      }
    }
  }

    xmlhttp.send();
    setTimeout("getHttprequest()", 2000); 
    return false; 
}

</script>
</head>
<body onload="getHttprequest()">

<table>
<tr><td id='Context'>
</td></tr>
</table>


<script>
getHttprequest();
</script>

</body>
</html>
