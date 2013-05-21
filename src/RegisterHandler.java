
import java.sql.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.*;
//Regex

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class RegisterHandler
 */
@WebServlet("/RegisterHandler")
public class RegisterHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterHandler() {
        super();
    }
    private final String USNAME = "^[a-zA-Z0-9_-]{3,20}";
    private final String PASSWORD = "^.{6,20}$";
    private final String EMAIL = "^[\\S]+@[\\S]+\\.[\\S]+$";
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    String Sha256(String inp)
    {
    
    	MessageDigest md;
		try {
			md = MessageDigest.getInstance("SHA-256");
			md.update(inp.getBytes());
	    	byte byteData[] = md.digest();
	    	StringBuffer hexString= new StringBuffer();
	    	for(int i =0;i<byteData.length;i++)
	    	{
	    		String s = Integer.toHexString(0xff & byteData[i]);
	    		hexString.append(s);
	    	}
	    	random ran = new random();
	    	String salt = ran.genranString();
	    	hexString.append(',');
	    	hexString.append(salt);
	    	return hexString.toString();
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return null;
    	
    }
    boolean Validate(String in,char c)
    {
    	
    	if(c=='U')
    	{
    		Pattern pat = Pattern.compile(USNAME);
    		Matcher mat = pat.matcher(in);
    		if(mat.find())
        	{
        		return true;
        	}
        	else
        	{
        		return false;
        	}
    	}
    	else if(c == 'P')
    	{
    		Pattern pat = Pattern.compile(PASSWORD);
    		Matcher mat = pat.matcher(in);
    		if(mat.find())
        	{
        		return true;
        	}
        	else
        	{
        		return false;
        	}
    	}
    	else if(c == 'E')
    	{
    		Pattern pat = Pattern.compile(EMAIL);
    		Matcher mat = pat.matcher(in);
    		if(mat.find())
        	{
        		return true;
        	}
        	else
        	{
        		return false;
        	}
    		
    	}
    return false;
    	
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//String s = request.getParameter("name");
		response.setContentType("text/html;character=UTF-8");
    	/*PrintWriter out = response.getWriter();
    	out.println("<h1>U r in RegisterHandler</h1>" + s);*/
		PrintWriter writer = response.getWriter();
		writer.println("");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter writer = response.getWriter();
		
		List<String> errorList = new ArrayList<String>();
		response.setContentType("text/html;character=UTF-8");
    	/*PrintWriter out = response.getWriter();
    	out.println("<h1>U r in RegisterHandler</h1>" + s);*/
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");
		String repass = request.getParameter("repass");
		writer.println("repass:" + repass);
		String email = request.getParameter("email");
		//validating the name
		boolean flag = this.Validate(name,'U');
		boolean error = false;
		if (flag)
		{
			try{
				Connection connection = null;
				// declare object of Statement interface that uses for executing sql statements.

				PreparedStatement pstatement = null;
				//load JDBC driver "com.mysql.jdbc.Driver"
				Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			//	int u =0;
				connection = DriverManager.getConnection("jdbc:odbc:cloud", "root", "khatana");

				// sql query to insert

				//String queryString = "INSERT INTO file(name) VALUES(?)";

				//pstatement = connection.prepareStatement(queryString);

					String query = "select * from user where username='"+name+"'";
					try{
						pstatement = connection.prepareStatement(query);
						ResultSet rs = pstatement.executeQuery();
						
						while(rs.next())
						{
								writer.println("username already exits:" +rs.getString(1));
								errorList.add("username already exits");
								error=true;
						}
					}
					catch(Exception ex) {
				        System.out.println(ex);
					}
			}
			catch(Exception e){
				System.out.println(e);
			}
		}
		else
		{
			error=true;
			errorList.add("Not a valid name");
			writer.println("<h3>Not a valid name</h3>" + name);
			
		}
		
		//validating the password
		flag = this.Validate(pass, 'P');
		if (flag)
		{
			if(!pass.equals(repass))
			{
				writer.println("repass:" + repass+ "<br> pass:"+pass);
				errorList.add("Password not matched");
				error=true;
			}
		}
		else
		{
			
			error=true;
			errorList.add("Not a valid pass");
			writer.println("<h3>Not a valid pass</h3>" + pass);	
		}
		//validating email
		flag = this.Validate(email,'E');
		if (flag)
				writer.println("<h3>" + email + "</h3>");
		else
		{
			error=true;
			errorList.add("Not a valid email");
			
			writer.println("<h3>Not a valid email</h3>" + email);	
		}
		//redirect
		/*String url = "/register.jsp";
		ServletContext context = getServletContext();
		RequestDispatcher dispatcher = context.getRequestDispatcher(url);
		dispatcher.forward(request, response);*/
		if(error)
		{
			//response.sendRedirect("register.jsp");
		/*	Iterator<String> itr = errorList.iterator();
			while(itr.hasNext())
			{
				String val = (String)itr.next();
				writer.println("error:" +val+"<br>");
			}*/
			request.setAttribute("error", errorList);
			request.getRequestDispatcher("register.jsp").forward(request,response);
		}
		else
		{
	         Connection connection = null;
	         // declare object of Statement interface that uses for executing sql statements.	    
	         PreparedStatement pstatement = null;
	         try{	        
	        	 //load JDBC driver "com.mysql.jdbc.Driver"
	        	 Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		         connection = DriverManager.getConnection("jdbc:odbc:cloud", "root", "khatana");
		         int u=0;
		         // sql query to insert		         
		         String queryString = "INSERT INTO user(username,password,email) values(?,?,?)";
		    
		         //hashing the password before storing
		         String hash_pass = Sha256(pass);
		         pstatement = connection.prepareStatement(queryString);		         
		         pstatement.setString(1,name);
		         pstatement.setString(2, hash_pass);
		         pstatement.setString(3, email);
		         u = pstatement.executeUpdate();
		         if(u != 0)
		        	 writer.println("<h3>Successfully</h3>" + u);	
	         }
	         catch (Exception c)
	         {
	        	 writer.println("Unable to connect to database.");
	         }
			Cookie login = new Cookie("login", name);
			//expiry time by default only for current session
			//login.setMaxAge(60*60*24);
			//add cookie in response header
			response.addCookie(login);
			String dname="c:/data/"+name;
			File file = new File(dname);
			
			if (!file.exists()) {
				if (file.mkdir()) {
					writer.println("Directory is created!");
				} else {
					writer.println("Failed to create directory!");
				}
			}
			try{
				
				//datetime formatting for storing
				java.util.Date dt = new java.util.Date();
				
				java.text.SimpleDateFormat sdf = 
				new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				
				String currentTime = sdf.format(dt);
				Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		         connection = DriverManager.getConnection("jdbc:odbc:cloud", "root", "khatana");
		        // int u=0;
		         // sql query to insert		         
		         String queryString = "INSERT INTO folder_table(folder_name,creation_time) values(?,?)";
		    
		         
		         
		         pstatement = connection.prepareStatement(queryString);		         
		         pstatement.setString(1,name);
		         pstatement.setString(2, currentTime);
		       
		        pstatement.executeUpdate();
		         
		         //fetching folder_id from folder_table
		         //for inserting into folder_in_folder

	
		           
		            
		           // connection = DriverManager.getConnection("jdbc:odbc:cloud", "root", "khatana");
		            
		            // sql query to insert
		            
		            
		            
		            //if(u != 0)
		            {
		       		//	response.sendRedirect("yourfile.jsp");
		            }
			            String query = "select folder_id from folder_table where folder_name='"+name+"'" ;
						try
						{
							writer.println("select fid in try:");
							pstatement = connection.prepareStatement(query);
							ResultSet rs = pstatement.executeQuery();
							
							if(rs.next())
							{
								writer.println("select fid in next:");
								String s = rs.getString(1);
								//out.println("fileid:" + s);
								int id = Integer.parseInt(s);	
								writer.println("id:" + id+"<br>");
								writer.println("name:" + name+"<br>");
								String qq = "insert into folder_in_folder(parent_folder_id,username,child_floder_id,child_floder_name) values(?,?,?,?)";
								pstatement = connection.prepareStatement(qq);
								pstatement.setInt(1,1);
								pstatement.setString(2,name);
								
								pstatement.setInt(3,id);
					            pstatement.setString(4,name);
					            
								pstatement.executeUpdate();
								
								//getting cur_dir
								/*  
								 query="select * from folder_in_folder where username='"+username+"' and parent_folder_id="+1+"";    //getting rootdir at login time
							pstatement = connection.prepareStatement(query);
							ResultSet rs1 = pstatement.executeQuery();
							if(rs1.next())
							{
								int root_id = rs1.getInt(3);     //rootid
								Cookie login = new Cookie("login", username);
						    //expiry time by default only for current session
							//login.setMaxAge(60*60*24);
							//add cookie in response header
								response.addCookie(login);
								Cookie dir = new Cookie("curr_dir", Integer.toString(root_id));    
								 */
								
								String cd = "select * from folder_in_folder where username='"+name+"' and parent_folder_id='"+1+"'";
								pstatement = connection.prepareStatement(cd);
								ResultSet rs1 = pstatement.executeQuery();
								if(rs1.next())
								{
									int root_id = rs1.getInt(3);     //rootid
									Cookie dir = new Cookie("curr_dir", Integer.toString(root_id));
									response.addCookie(dir);
								}
								
								
					            response.sendRedirect("yourfile.jsp");
							}
						}
						catch(Exception ex)
						{
					        writer.println(ex);
						}
						finally{
							connection.close();
							pstatement.close();
						}
		           
		         writer.println("u dir:" + name);
			}
	         catch(Exception e)
	         {
	        	 writer.println(e);
	         }
			Cookie dir = new Cookie("curr_dir", name);
			//expiry time by default only for current session
			//login.setMaxAge(60*60*24);
			//add cookie in response header
			response.addCookie(dir);
			//response.sendRedirect("userhome.jsp");
		}
			
	}

}
