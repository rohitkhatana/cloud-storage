<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>cloud you</title>
<style type="text/css">
body{
	font-family:arial,helvetica,sans-serif;
	font-size:20px;
	padding: 0;		
	margin: 0;
	background-color:#FFF;
}
h1{
	color:black;
	font-size:20px;
}
.strip{
	position:relative;
	top:0px;
	height: 40px;
	width: 100%;
	background: #354B59;
	background: rgba(35, 55, 68, 0.8);
}
.banner-top{
			position:absolute;
			top:3cm;
			left:2cm;
			margin: 100px 0 0 0;
			text-align: center;
}
.name-tags{
	font-size:28px;font-weight:bold;color:#E21;text-shadow: 34px 4px 6px #FF0000;
}
.round{
				border:2px solid #AAA;
				padding:10px 42px; 
				background:#FFF;
				width:180px;
				border-radius:15px;
				-moz-border-radius:25px; /* Old Firefox */
}
.foot{
	font-size:15px;
	position:absolute;
	right:2cm;
	bottom:1cm;
}
.info-text{
			position:absolute;
			top:11cm;
			padding: 90px 10px 10px 30px;
			width: 458px;
			float:bottom;
			
		}
.standout{
		font-family:karla;
		font-size:20px;
		font-color:gray;
		}
		
.login-link{
		 color: white;
		text-decoration: none;
		}
</style>
<script>
	function setcok(){
		document.cookie="flag="+"0";       //this cookie is for checking the back button on loading dashbord
	}

</script>
</head>
<body>
			

<form name="myform" method="post" action="RegisterHandler" onSubmit="return validPwd()">

<div class="strip">
	<table style="margin:0cm 2cm 0.5cm 3cm" cellpadding="15">
		<tr><td><a href="index.jsp" class="login-link">upload file</a></td> 
			<td><a href="yourfile.jsp" class="login-link" onClick="javascript:setcok();">Dashboard</a></td>
		</tr>
	</table>
	<table style="position:absolute;top:0px;right:2cm;">
		<tr>
			<td><a href="logout.jsp" class="login-link">
			<%			
			Cookie cookie = null;
			Cookie[] cookies = null;
			String username = null;
			// get an array of Cookies associated
			cookies = request.getCookies();
	 		if( cookies != null ){	    
	      	for (int i = 0; i < cookies.length; i++){
	         cookie = cookies[i];	  
	         if(cookie.getName().equals("login"))
	         {
	        	 username = cookie.getValue();
	        	 out.print( username);
	         }
	         
	      }
	  }else{
	      out.println("login");
	  }
	%>

</a></td>
<td><a href="logout.jsp" class="login-link">(logout)</a></td>
	</table>
</div>
<!-- html comment -->

<H1 style="position:absolute;left:15cm;color:GRAY">Cloud Yourself</H1>
<img src="${pageContext.request.contextPath}/image/robot.png" class="banner-top"></img>
<div class="info-text">
				<h1>Time for a recharge!</h1>
				<p class="standout">We are going to provide you a different world of cloud storage</p>
</div>


<span class="foot">
	<% out.println("login IP : " + request.getRemoteAddr());%>
	<p>Today's Date: </p><%=( new java.util.Date()).toLocaleString() %> 
</span>
</form>
</body>
</html>
<%
	String s = request.getParameter("name");
%>