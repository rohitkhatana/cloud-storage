<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>logout</title>
</head>
<body>
<%
	Cookie cookie = null;
	Cookie[] cookies = null;
	//get cookies in the array
	cookies = request.getCookies();
	if(cookies !=null)
		for(int i=0 ;i<cookies.length;i++)
		{
			cookie = cookies[i];
			if(cookie.getName().equals("login"))
			{
				cookie.setMaxAge(0);
				response.addCookie(cookie);
				
			}
			if(cookie.getName().equals("back"))
			{
				
				cookie.setMaxAge(0);
				response.addCookie(cookie);
				//response.sendRedirect("register.jsp");
			}
			if(cookie.getName().equals("shfile"))
			{
				
				cookie.setMaxAge(0);
				response.addCookie(cookie);
				//response.sendRedirect("register.jsp");
			}
			if(cookie.getName().equals("flag"))
			{
				
				cookie.setMaxAge(0);
				response.addCookie(cookie);
				//response.sendRedirect("register.jsp");
			}
			if(cookie.getName().equals("index"))
			{
				
				cookie.setMaxAge(0);
				response.addCookie(cookie);
				//response.sendRedirect("register.jsp");
			}
			if(cookie.getName().equals("curr_dir"))
			{
				
				cookie.setMaxAge(0);
				response.addCookie(cookie);
				//response.sendRedirect("register.jsp");
			}
			if(cookie.getName().equals("fid"))
			{
				
				cookie.setMaxAge(0);
				response.addCookie(cookie);
				//response.sendRedirect("register.jsp");
			}
		}
	response.sendRedirect("register.jsp");
%>
</body>
</html>