<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Login</title>
		<style type="text/css">
			body{
				font-family:Helvetica, Arial, sans-serif; width:800px;padding: 20px;margin: 0 auto;font-size: 14px;
			}
			.usname{
				color:gray;
				text-decoration: none;
			}
			input[type=submit]{
				color:gray;
				margin: 0 0 0 3cm;
				position:absolute;
				top:8.5cm;
				left:11.5cm;
			}
			.error{
				color:red;font-size=20px;
				position:absolute;
				top:7.56cm;
				left:11.63cm;
				margin: 0 0 0 2cm
			}
			.main-title {
				display: block;
				color: #222;
				position:relative;
				top:3cm;
				left:2.5cm;
				font-size: 40px;
				font-weight: bold;
				margin-bottom: 4cm;
				text-decoration: none;
				margin-left:5cm;
			}
			.error
			{
				color:red;
				position:absolute;
				left:14cm;
			
			}
		</style>
	</head>
	<body>
	<%
		String error = (String)request.getAttribute("error");
		
	
	%>
		<form method="post" action="checkuser">
		<div style="width:1px;height:400px;background-color:black;float:left;"></div>
		<div style="width:1px;height:400px;background-color:black;float:right;"></div>
		<div class="main-title">ClOUD YOU</div>
		<table style="margin:4cm 2cm 0.5cm 3cm">
			<tr><td class="usname">Username</td><td><input type="text" value="" name="username"></td>
			<tr><td class="usname">Password</td><td><input type="password" value="" name="password"></td>
		</table>
		<div><input type="submit" name="submit"></div>
		<span class="error">
		<% if(error !=null)			
				out.println(error);
			%>
			</span>
		</form>
	</body>
</html>