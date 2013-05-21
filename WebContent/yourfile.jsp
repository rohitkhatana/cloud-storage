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
	color: white;
	position:absolute;
	top:4cm;
	left:8.4cm;
	height: 5cm;
	width: 70%;
	background: #354B59;
	background: white;//rgba(35, 5, 8, 0.8);
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
	font-size:28px;font-weight:bold;color:white;text-shadow: 34px 4px 6px #FF0000;
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
.link{
		 color: blue;
		text-decoration: none;
		margin:40px 0 0 40px;
	}
.tdl
{
	margin:40px 0 0 40px;
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
function getCookie(c_name)
	{
		var c_value = document.cookie;
		var c_start = c_value.indexOf(" " + c_name + "=");
		if (c_start == -1)
		{
			c_start = c_value.indexOf(c_name + "=");
		}
		if (c_start == -1)
		{
			c_value = null;
		}
		else
		{
			c_start = c_value.indexOf("=", c_start) + 1;
			var c_end = c_value.indexOf(";", c_start);
			if (c_end == -1)
			{ 
			c_end = c_value.length;
			}
			c_value = unescape(c_value.substring(c_start,c_end));
		}
		return c_value;
	}

function showDiv() {
    div = document.getElementById('two');
    div.style.display = "block";   
};

function showDivds(fid,i){
	//document.write(fid);
    div = document.getElementById('ds');
    ml = document.getElementById('mlink'+i).href;
    //document.write(m1);
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
function openfolder(dir_id){
	var dd=dir_id;
	document.cookie="curr_dir="+dir_id;
	document.cookie="flag="+"1";

	var check_back = getCookie("back");    //back is for back function in main page
	
	var index = getCookie("index");
	if(index!=null && index!="")
	{
		index=index+1;
		document.cookie="index="+index;
	
	}
	else
		{
		document.cookie="index=1";
		}
	if(check_back!=null && check_back!="")    //if found then append
	{
		
		check_back=check_back+"|"+dd;
		document.cookie="back="+check_back;
	}
	else   //if not then set cookie
	{
		document.cookie="back="+dir_id;
		
	}
	location.reload(true);
	
}
function dashb(){
	//document.cookie="curr_dir="+"0";                      //onclick dashboard changing the backarray and curr_dir cookie
	
}
function goback(){
	
	var back = getCookie("back");
	var index =getCookie("index");
	if(back!=null && back!="")
	{
		var sp = back.split("|");
		var len = sp.length;
		//document.write("len:"+len+"<br>"+"back:"+sp);
		if(len!=1)
		{
			var temp="";
			var last_dir=sp[len-2]; 			//len-2 because i want to go to last directory
			//document.write(last_dir);
			document.cookie="curr_dir="+last_dir;
			//now changing the value of back array cookie
			for(var i=0;i<len-1;i++)
			{
				if(i==0)
					temp+=sp[i];
				else
					temp+="|"+sp[i];	
			}
			document.cookie="back="+temp;
		}
	}
	
}
</script>

</head>
<body>
<!--  <a href="#" onclick="performClick(document.getElementById('theFile'));">Open file dialog</a>-->
<div class="strip">
	<table style="margin:0cm 2cm 0.5cm 3cm" cellpadding="15">
		<tr><td><a href="index.jsp" class="login-link">upload file</a></td> 
			<td><a href="yourfile.jsp" class="login-link" onclick="javascript:dashb();">Dashboard</a></td>
			<td><a href="sharewithme.jsp" class="login-link">share with me</a></td>
			<td><a href="" class="login-link" id="ds">download</a></td>
			<td><a href="sharehandler.jsp " class="login-link" id="ds1">share</a></td>
		</tr>
	</table>
	<hr>		<!-- horizontal row -->      
	<div style="width:1px;height:700px;background-color:gray;float:left; position:absolute;left:8cm;top:2.05cm;"></div>
	<div>   	
		<form action="createdir">
   		 <div id="two">
   		 	
       			<table><tr><td>Name of directory </td><td><input type="text" name="dname"></td><td><input type="submit" value="ok"></td></tr></table>
   		</div>
   		</form>
   		<form>
   			<input type="submit" value="back" onclick="javascript:goback();">
   		</form>
   		<button onclick="javascript:showDiv();">create directory<img src="image/directory.png" height="40px" width="40px"></img></button>
	</div>
	
	<table style="position:absolute;top:0px;right:2cm;">
		<tr>
			<td><a href="logout.jsp" class="login-link">
			<%			
			Cookie cookie = null;
			Cookie[] cookies = null;
			String username = null;
			int did=0;
			int flag=0;
			int[] back_arr = new int[30];
			
			// get an array of Cookies associated
			cookies = request.getCookies();
	 		if( cookies != null ){	    
	      	for (int i = 0; i < cookies.length; i++){
	         cookie = cookies[i];	  
	         if(cookie.getName().equals("login"))
	         {
	        	 username = cookie.getValue();
	        	// out.println("rh");
	        	 out.println( username);
	         }
	         if(cookie.getName().equals("curr_dir"))
	         {
	        	 //Cookie
	        	 did = Integer.parseInt(cookie.getValue());
	        	 //Cookie dir = new Cookie("did", "0");	    
	        	 //response.addCookie(dir);
	         }
	        
	    		if(cookie.getName().equals("flag"))   			//setting flag in userhome.jsp file so that i can intialise the back array with -1
	         	{
	        		 flag=Integer.parseInt(cookie.getValue());
	        	 }
	    		 
	     		if(flag==0)
	         	{
	     			//out.println("rohit");
	        		 for(int g=0;g<30;g++)
	 				{
	 					back_arr[g]=-1;
	 				}
	        	 
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
				<p class="standout">We are going to provide<br> you a different world of <br>cloud storage</p>
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


//String query = "select * from file_in_folder where username='"+username+"' and parent_folder_id="+12+"" ;     //first file checking
String query=null;
if(did!=0)
	query = "select * from file_in_folder where username='"+username+"' and parent_folder_id="+did+"" ;     //did is changin throug cookie curr_dir
//else
	// query = "select * from file_in_folder where username='"+username+"' and parent_folder_id="+1+"" ;
				try{
					pstatement = connection.prepareStatement(query);
					ResultSet rs = pstatement.executeQuery();
					%>
					<span class="fi"> Your Files (Click on file to download)</span>
					<div class="box"> <!-- class="box" -->
					<% 
					
					int p =0;
					int id_arr[] = new int[20];                      //id_arr = file id
					
					String file_name[] = new String[20];
					
					while(rs.next())
					{
					
						int fid = rs.getInt(3);
						id_arr[p] = fid;
						String fname = rs.getString(1);	
						file_name[p] = fname;
						p++;	
					}
					//finding root folder
					
					String root_dir_q  =null;
					 root_dir_q = "select * from folder_in_folder where username='"+username+"' and parent_folder_id="+1+"";
					 if(did!=0)
						 root_dir_q = "select * from folder_in_folder where username='"+username+"' and parent_folder_id="+did+"";
					String root = null;
					int root_id=0;
					int count=0;
					try
					{
						pstatement = connection.prepareStatement(root_dir_q);
						ResultSet rs2 = pstatement.executeQuery();
						if(rs2.next())
						{
							root_id = rs2.getInt(3);
							root = rs2.getString(4);
							if(root_id!=0)
							{
								//finding all directories in root folder
								String[] dir_name = new String[20];
								int dir_id[] = new int[30];
								
								String dir_q = "select * from folder_in_folder where username='"+username+"' and parent_folder_id="+root_id+"";	
								if(did!=0)
								{
									
									dir_q = "select * from folder_in_folder where username='"+username+"' and parent_folder_id="+did+"";
								}
								pstatement = connection.prepareStatement(dir_q);
								ResultSet rs3 = pstatement.executeQuery();
								int d_no=0;
								while(rs3.next())
								{
									
										dir_id[d_no] = rs3.getInt(3);
										dir_name[d_no] = rs3.getString(4);
										d_no++;
								}
								
								for(int i =0; i<d_no;i++)
								{
											count++;
											String fname =dir_name[i];
											String url =  file_name[i];
											String cl = "link";
											String id ="mlink";
											String js = "javascript:showDivds("+dir_id[i]+");return false;";
											String link = "<a id='"+id+"' class='"+cl+"' href='"+ url +"' onclick='"+js+"'>";
											String timclass= "timclass";							
											%>
											
											<button  class="link" onclick="javascript:openfolder(<%=dir_id[i]%>)"><img src="image/directory.png" height="80px" width="60px"><%=dir_name[i] %></button>
											
											<%  
											if(count==4)
											{
												count=0;
												
											%>
											<br><!-- <h1 style="color:black">rohit<%=count %></h1>-->
											
											<%
											}
								
								}
								//end of for loop
								
							}
						}
						
					}
					//end of try block(directory)
					catch(Exception e)
					{
						out.println(e);
						
					}
					//count=1;
					for(int i =0; i<p;i++)
					{
				
								int img_flag=1;
								count++;
								String fname = file_name[i];
								String ff[] = fname.split("\\)");           //special charater used by me to identify acutal file name
								if(ff.length == 1)
									fname=ff[0];
								else
									fname = ff[1];
								
								String[] sf = fname.split("\\.");
								String ext = sf[1];
								//out.println(id_arr[i]);
								String url = "data/" + file_name[i];
								String cl = "link";
								String id ="mlink"+i;
								String js = "javascript:showDivds("+id_arr[i]+","+i+");return false;";
								String link = "<a id='"+id+"' class='"+cl+"' href='"+ url +"' onclick='"+js+"'>";
								String timclass= "timclass";
							//	String dat = "<span class='"+timclass+"'>Created at:'"+dd+"'</span>";
								
										
												
											
											
								%>
								<% 						
								if(ext.equals("mp3"))
								{
									img_flag=0;
									
									%>
										<%=link %><button><img src="image/mp3.png" height="80px" width="60px"><%=fname %></button>
									<!--  	<%=link %><img src="image/mp3.png" height="40px" width="40px"><%out.println(link + fname+"</a>");  %></img> -->
									<% 
								}
								if(ext.equals("py"))
								{
									
									img_flag=0;
									%>
										<%=link %><button><img src="image/python.png" height="80px" width="60px"><%=fname %></button>
										<!-- <%=link %><img src="image/python.png" height="40px" width="40px"><%out.println(link + fname+"</a>");  %></img>-->
									<% 
								}
								if(ext.equals("pdf"))
								{
								
									img_flag=0;
									%>
										<%=link %><button><img src="image/pdf.png" height="80px" width="60px"><%=fname %></button>
										<!-- <%=link %><img src="image/pdf.png" height="40px" width="40px"><%out.println(link + fname+"</a>");  %></img>-->
									<% 
								}
								if(ext.equals("txt"))
								{
									
									img_flag=0;
									%>
										<%=link %><button><img src="image/File.png" height="80px" width="60px"><%=fname %></button>
										<!-- <%=link %><img src="image/File.png" height="40px" width="40px"><%out.println(link + fname+"</a>");  %></img>-->
									<% 
								}
								if(ext.equals("png"))
								{
									
									img_flag=0;
									%>
									<%=link %><button><img src="image/png.png" height="80px" width="60px"><%=fname %></button>
										<!-- <%=link %><img src="image/png.jpg" height="40px" width="40px"><%out.println(link + fname+"</a>");  %></img>-->
									<% 
								}
								if(ext.equals("jpeg") || ext.equals("jpg")||ext.equals("JPEG") || ext.equals("JPG"))
								{
									
									img_flag=0;
									%>
										<%=link %><button><img src="image/jpg.jpg" height="80px" width="60px"><%=fname %></button>
										<!-- <%=link %><img src="image/jpg.jpg" height="40px" width="40px"><%out.println(link + fname+"</a>");  %>-->
									<% 
								}
								else if(img_flag==1)
								{
									
									%>
									<%=link %><button><img src="image/f_icon.png" height="80px" width="60px"><%=fname %></button>
									<!-- <%=link %><img src="image/f_icon.png" height="40px" width="40px"><%out.println(link + fname+"</a>");  %>-->
									<%
								}
										
							%>
							<%
							if(count==4)
								{
									
									count=0;
									%><br><h1 style="color:black"></h1><%
								}
							%>
							<%
									
						//}
					//	catch(Exception e)
						//{
							//out.println("inner try:" + e);
						//}
						
						
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