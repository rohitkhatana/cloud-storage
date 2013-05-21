
    <%@ page import="java.sql.*" %>
    <%@ page import="java.security.MessageDigest.*" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DashBoard</title>
<script language="javascript">
var _hidediv = null;
function showdiv(id){
	function showDiv() {
	    div = document.getElementById('tow');
	    div.style.display = "block";
	}
}


</script>
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
.box{
	color: gray;
	position:absolute;
	top:4cm;
	right:4cm;
	height: 5cm;
	width: 30%;
	background: #354B59;
	background: rgba(35, 5, 8, 0.8);
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
		
		
		.fi{
		position:absolute;
		top:3.4cm;
		right:6cm;
		}
		#two{
		display:none;
		}
		#ds{
		display:none;
		}
		#ds1{
		display:none;
		}
		.timclass{
		margin:13px 17px 15px 26px;
		
		font-size:17px;
		color:yellow;
		}
		#sp{
		display:none;
		}
</style>

<script type="text/javascript">
function showDiv() {
    div = document.getElementById('two');
    div.style.display = "block";   
}

function showSpan() {
    div = document.getElementById('sp');
    div.style.display = "block";   
}
function showDivds(){
    div = document.getElementById('ds');
    ml = document.getElementById('mlink').href;
    div.href = ml;
    div.style.display = "block";
    div1 = document.getElementById('ds1');
    div1.style.display = "block";
    return false;
}
</script>

</head>
<body>
<!--  <a href="#" onclick="performClick(document.getElementById('theFile'));">Open file dialog</a>-->
<div class="strip">
	<table style="margin:0cm 2cm 0.5cm 3cm" cellpadding="15">
		<tr><td><a href="index.jsp" class="login-link">upload file</a></td> 
			<td><a href="yourfile.jsp" class="login-link">Dashboard</a></td>
			<td><a href="" class="login-link" id="ds">download</a></td>
			<td><a href="sharehandler.jsp " class="login-link" id="ds1">share</a></td>
		</tr>
	</table>
	
	<div>   	
		<form action="createdir">
   		 <div id="two">
       			<table><tr><td>Name of directory</td><td><input type="text" name="dname"></td><td><input type="submit" value="ok"></td></tr></table>
   		</div>
   		</form>
   		<button onclick="javascript:showDiv();">create directory</button>
	</div>
	
	<table style="position:absolute;top:0px;right:2cm;">
		<tr>
			<td><a href="logout.jsp" class="login-link">
			
			<%			
			Cookie cookie = null;
			Cookie[] cookies = null;
			String username = null;
			String shfile=null;
			String fid=null;
			// get an array of Cookies associated
			cookies = request.getCookies();
	 		if( cookies != null ){	    
	      	for (int i = 0; i < cookies.length; i++){
	         cookie = cookies[i];
	         //out.println(cookie.getName() );
	         if(cookie.getName().equals("login"))
	         {
	        	 username = cookie.getValue();
	        	 out.println( username);
	         }
	         if(cookie.getName().equals("shfile"))
	         {
	        	 shfile = cookie.getValue();
	         }
	         if(cookie.getName().equals("fid"))
	        	 fid=cookie.getValue();
	       
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

		
	<%
	try{
		Connection connection = null;
		// declare object of Statement interface that uses for executing sql statements.

		PreparedStatement pstatement = null;
		//load JDBC driver "com.mysql.jdbc.Driver"
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		int u =0;
		connection = DriverManager.getConnection("jdbc:odbc:cloud", "root", "khatana");

		// sql query to insert

		//String queryString = "INSERT INTO file(name) VALUES(?)";

		//pstatement = connection.prepareStatement(queryString);
		
		String ff = "select * from file_table where file_id="+fid+"";
		pstatement = connection.prepareStatement(ff);
		ResultSet fn = pstatement.executeQuery();
		if(fn.next())
		{
			shfile=fn.getString(1);
			String lo[] = shfile.split("\\)");
			if(lo.length != 1)
				shfile=lo[1];
		}
		%>
		<div style="position:absolute;top:6cm;left:13cm;">
	<h1>Selected file:
		<% if(shfile != null)
			out.println( shfile); %>
	</h1>
	<form method="post">
	<span onclick="javascript:showSpan();" >Share with(click):
		<select id="sp" name="usersel">
		<%
		
			String query = "select * from user";
		
				pstatement = connection.prepareStatement(query);
				ResultSet rs = pstatement.executeQuery();
				
				while(rs.next())
				{
					String s = rs.getString(1);
					if(!s.equals(username))
					{
					
					%>
						<%out.println("<option>" + s + "</option>"); %>
	
					<%
					}
				}
			
	}
	catch(Exception e){
		out.println(e);
	}
	%>
			</select>
	<input type="submit">
	</span>
	</form>
</div>






<span class="foot">
	<% out.println("login IP : " + request.getRemoteAddr());%>
	<p>Today's Date: </p><%=( new java.util.Date()).toString() %> 
</span>



<%

//get cookies in the array
cookies = request.getCookies();
if(cookies !=null)
	for(int i=0 ;i<cookies.length;i++)
	{
		cookie = cookies[i];
		if(cookie.getName().equals("shfile"))
		{
			cookie.setMaxAge(0);
			response.addCookie(cookie);
			
		}
	}

%>

<% String selected = request.getParameter("usersel");
	if(selected !=null )
	{
	//out.println("selected"+selected);
	try{
		Connection connection = null;
		// declare object of Statement interface that uses for executing sql statements.

		PreparedStatement pstatement = null;
		//load JDBC driver "com.mysql.jdbc.Driver"
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		int u =0;
		connection = DriverManager.getConnection("jdbc:odbc:cloud", "root", "khatana");

		// sql query to insert

		//String queryString = "INSERT INTO file(name) VALUES(?)";

		//pstatement = connection.prepareStatement(queryString);

			String query = "select * from user where username='"+selected+"'" ;
			try{
				pstatement = connection.prepareStatement(query);
				ResultSet rs = pstatement.executeQuery();
				
				while(rs.next())
				{
					int id = Integer.parseInt(fid);	
					//int acc = Integer.parseInt(access);
		            String qfile_access = "insert into file_access(file_id,username,access_right,owner_name) values(?,?,?,?)";
		            
		            pstatement = connection.prepareStatement(qfile_access);
		            pstatement.setInt(1,id);
		            pstatement.setString(2,selected);
		            pstatement.setInt(3,100);
		            pstatement.setString(4,username);
		               
		            u = pstatement.executeUpdate();
					
						
				}
			}
			catch(Exception ex) {
		        System.out.println(ex);
			}
	}
	catch(Exception e){
		System.out.println(e);
	}


	}//end of if

%>
</body>
</html>