<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
</style>
</head>
<body>
<form method="post">
<div class="strip"><h1>Home</h1>&nbsp;</div>
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
	<tr><td>Password</td><td><input type="password" name="pass" class="round"></td></tr>
	<tr><td>Re-enter Password</td><td><input type="password" name="re-pass" class="round"></td></tr>
	<tr><td>Email</td><td><input type="text" name="email" class="round"></td></tr>
	<tr><td><input type="submit" value="Submit" style="color:GRAY" class="round"></td></tr>
</table>

<span class="foot">
	<% out.println("login IP : " + request.getRemoteAddr());%>
	<p>Today's Date:</p> <%=( new java.util.Date()).toLocaleString() %> 
</span>
</form>
</body>
</html>