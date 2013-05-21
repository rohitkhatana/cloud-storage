<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
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
.error{
	position:absolute;
	left:39cm;
	font-size:13px;
	color:red;
}
</style>
</head>
<body>
<%
	List<String> errorList =(List<String>) request.getAttribute("error");
Boolean su=false;
Boolean user=false;
Boolean pass=false;
Boolean repass=false;
Boolean email=false;
	if(errorList != null)
	{
	Iterator<String> itr = errorList.iterator();
	
	
	while(itr.hasNext())
	{
		String check = itr.next();
		if(check.equals("Not a valid email"))
			email = true;
		if(check.equals("Not a valid pass"))
			pass = true;
		if(check.equals("Password not matched"))
			repass=true;
		if(check.equals("Not a valid name"))
			user=true;
		if(check.equals("Password not matched"))
			repass=true;
		if(check.equals("username already exits"))
			su=true;
		
	}
						
	}					%>
<form name="myform" method="post" action="RegisterHandler" onSubmit="return validPwd()">
<div class="strip"><a href="login.jsp" style="text-decoration:none; color: white;">login</a></div>

<!-- html comment -->
<!--  <input type="file" name="file" style="text-align: center;margin: 100px 0 0 0;"> --> 
<!--   <img src="WebContent/image/maint.png" class="banner-top"  height="100px" alt="image"></img> 
<script>document.write(window.innerWidth);</script> 
<img src="image\rohit.png" class="banner-top"  height="100px" alt="image"></img>--> 
<H1 style="position:absolute;left:15cm;color:GRAY">Cloud Yourself</H1>
<img src="${pageContext.request.contextPath}/image/rohit.png" class="banner-top"></img>
<div class="info-text">
				<h1>Time for a recharge!</h1>
				<p class="standout">We are going to provide you a different world of cloud storage</p>
</div>

<table style="margin:4cm 2cm 0.5cm 63%">
	<tr><td class="name-tags">Register Here</td></tr>
	<tr><td>Name</td><td><input type="text" name="name" class="round"></td></tr>
	<tr><td><span class="error"><%if(su) out.println("username already exits");
																				if(user)	out.println("not a valid usrename");%></span></td></tr>
	<tr><td>Password</td><td><input type="password" name="pass" class="round"></td></tr>
	<tr><td> <span class="error"><%if(pass) out.println("not a valid password");%></span></td></tr>
	<tr><td>Re-enter Password</td><td><input type="password" name="repass" class="round"></td></tr>
	<tr><td><span class="error"><%if(repass)	out.println("Password not matched");%></span></td></tr>
	<tr><td>Email</td><td><input type="text" name="email" class="round"></td></tr>
	<tr><td><span class="error"><%if(email) out.println("not a valid email");%></span></td></tr>
	<tr><td><input type="submit" value="Submit" style="color:GRAY" class="round"></td></tr>
</table>

<span class="foot">
	<% out.println("login IP : " + request.getRemoteAddr());%>
	<p>Today's Date: <%=( new java.util.Date()).toLocaleString() %> </p>
</span>
</form>

</body>
</html>
