<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
		 color:white;
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
</style>

<script type="text/javascript">
function showDiv() {
    div = document.getElementById('two');
    div.style.display = "block";   
}

function showDivds(fid,i){
    div = document.getElementById('ds');
    ml = document.getElementById('mlink'+i).href;
    div.href = ml;
    div.style.display = "block";
    div1 = document.getElementById('ds1');
    div1.style.display = "block";
    sp1 = ml.split("/")[4];
    sp2 = ml.split("/")[5];
    addd=sp1+"/"+sp2;
    document.cookie="shfile=" +addd ;
    document.cookie="fid="+fid;
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
			<td><a href="sharewithme.jsp" class="login-link">share with me</a></td>
			<td><a href="" class="login-link" id="ds">download</a></td>
			<td><a href="sharehandler.jsp " class="login-link" id="ds1">share</a></td>
		</tr>
	</table>
	
	<div>   	
		<form action="createdir">
   		 <div id="two">
       			<table><tr><td>Name of directory </td><td><input type="text" name="dname"></td><td><input type="submit" value="ok"></td></tr></table>
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
			// get an array of Cookies associated
			cookies = request.getCookies();
	 		if( cookies != null ){	    
	      	for (int i = 0; i < cookies.length; i++){
	         cookie = cookies[i];	  
	         if(cookie.getName().equals("login"))
	         {
	        	 username = cookie.getValue();
	        	 out.println( username);
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
	<p>Today's Date: </p><%=( new java.util.Date()).toString() %> 
</span>
</form>
<%
String connString = "jdbc:odbc:cloud";
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
String query = "select * from file_access where username='"+username+"'";
//String query = "select * from file_in_folder where username='"+username+"'" ;
				try{
					pstatement = connection.prepareStatement(query);
					ResultSet rs = pstatement.executeQuery();
					%>
					<span class="fi"> share with you (Click on file to download)</span>
					<div class="box">
					<table>
					<% 
					
					int p =0;
					int id_arr[] = new int[20];
					String owner[] = new String[20];
					while(rs.next())
					{
						int fid = rs.getInt(1);
						id_arr[p] = fid;
						owner[p]=rs.getString(4);
						//String fname = rs.getString(1);	
						//file_name[p] = fname;
						p++;	
					}
					for(int i =0; i<p;i++)
					{
						String qq = "select * from file_in_folder where child_file_id="+id_arr[i]+"";				
						try{
							pstatement = connection.prepareStatement(qq);
						ResultSet rs2 = pstatement.executeQuery();
							
							while(rs2.next())
							{
								//out.println
								
								String fname =  rs2.getString(1);
								//String fname = file_name[i];
								String ff[] = fname.split("\\)");           //special charater used by me to identify acutal file name
								if(ff.length == 1)
									fname=ff[0];
								else
									fname = ff[1];
								String[] sf = fname.split("\\.");
								String ext = sf[1];
								//Timestamp dd  = rs2.getTimestamp(3);
								//String fname = file_name[i];
								String url = "data/" + fname;
								String cl = "login-link";
								String id ="mlink"+i;
								String js = "javascript:showDivds("+id_arr[i]+","+i+");return false;";
								String link = "<a id='"+id+"' class='"+cl+"' href='"+ url +"' onclick='"+js+"'>";
								String timclass= "timclass";
							//	String dat = "<span class='"+timclass+"'>Created at:'"+dd+"'</span>";
								%>
								
									<% 
								
								if(ext.equals("mp3"))
								{
									%>
									
										<tr><td><%=link %><img src="image/mp3.png" height="40px" width="40px"></td>
									<% 
								}
								if(ext.equals("py"))
								{
									%>
									
										<tr><td><%=link %><img src="image/python.png" height="40px" width="40px"></td>
									<% 
								}
								if(ext.equals("pdf"))
								{
									%>
									
										<tr><td><%=link %><img src="image/pdf.png" height="40px" width="40px"></td>
									<% 
								}
						
							%>
							<% 
							if(ext.equals("txt"))
								{
								%>	
									
										<tr><td><%=link %><img src="image/pdf.png" height="40px" width="40px"></td>
									<% 
								}
							out.println("<td>"+link + fname+"</a><td>"); 
							%>
							<td><span style="color:white; position:relative;left:3cm;"><%=owner[i] %></span></td></tr>
							<%
									
						}
							%>
							</table>
							<%
						}
						catch(Exception e)
						{
							out.println("inner try:" + e);
						}
						
					}
					%>
					</div>	
							<%
					
				}
				catch(Exception ex) {
			        out.println(ex);
				}


%>
</body>
</html>