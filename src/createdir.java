

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 * Servlet implementation class createdir
 */
@WebServlet("/createdir")
public class createdir extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public createdir() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();	
		String dname = request.getParameter("dname");
		
		Cookie[] cookies = null; 
		Cookie cookie=null;
		String username=null;
		cookies = request.getCookies();
		int curr_dir  = 0;
		for(int i=0;i<cookies.length;i++)
		{
			cookie = cookies[i];
			
			
			if(cookie.getName().equals("login"))
			{
				 username = cookie.getValue();
			}
			if(cookie.getName().equals("curr_dir"))
			{
				 curr_dir = Integer.parseInt(cookie.getValue());
			}
			
			
		}
		if(dname != null && username!=null)
		{
		String name="c:/data/"+dname;
				File file = new File(name);
				
				if (!file.exists()) {
					if (file.mkdir()) {
						
						
						//Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
						 Connection connection = null;
				            // declare object of Statement interface that uses for executing sql statements.
				            
				            PreparedStatement pstatement = null;
				            //load JDBC driver "com.mysql.jdbc.Driver"
				           try
				           {
						            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
						            
						            
						            connection = DriverManager.getConnection("jdbc:odbc:cloud", "root", "khatana");
						            
						            // sql query to insert
						            
						            //String qfile_table = "INSERT INTO file_table(filename,creation_time) VALUES(?,?)";
						            int root_dir_id=0;
						            String root_dir_q = "select * from folder_in_folder where parent_folder_id="+1+" and username='"+username+"'";
						            try{
						            pstatement = connection.prepareStatement(root_dir_q);
						            ResultSet rs1 = pstatement.executeQuery();
						            if(rs1.next())
						            {						            	
						            	root_dir_id = rs1.getInt(3);						            
						            }
						            }
						            catch (Exception e){
						            	out.println("root_id:" + e);
						            }
						            out.println("root_id:"+root_dir_id+"<br>");
						            //checking if it works then delete from above
						            root_dir_id = curr_dir;
						            if(root_dir_id!=0)
						            {
						            	java.util.Date dt = new java.util.Date();
										
										java.text.SimpleDateFormat sdf = 
										new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
										
										String currentTime = sdf.format(dt);
										try
										{
											String insert_q = "insert into folder_table(folder_name,creation_time) values(?,?) ";
											pstatement = connection.prepareStatement(insert_q);
							            	
							            	pstatement.setString(1,dname);
							            	pstatement.setString(2,currentTime);
							            	pstatement.executeUpdate();
										}
							            catch(Exception e)
							           	{
							            	out.println("folder_table_try:"+e);
							           	}
						            	//last insert row
						            	String last_row = "select * from folder_table order by folder_id desc limit 1";
						            	try
						            	{
							            	pstatement = connection.prepareStatement(last_row);
							            	ResultSet rs2 = pstatement.executeQuery();
							            	if(rs2.next())
							            	{
							            		int folder_id =0;
							            		folder_id= rs2.getInt(1);				
							            		
							            		String main_q = "insert into folder_in_folder(parent_folder_id,username,child_floder_id,child_floder_name) values(?,?,?,?) ";
							            		pstatement = connection.prepareStatement(main_q);
							            		
							            		pstatement.setInt(1,root_dir_id);
							            		pstatement.setString(2,username);
							            		pstatement.setInt(3,folder_id);
							            		pstatement.setString(4,dname);
							            		pstatement.executeUpdate();
							            	}
							            
						            	}
						            	 catch(Exception e)
								           	{
								            	out.println("folder_table_folder::"+e);
								           	}
						            	
						            }	
				           }
				           catch(Exception e)
				           	{
				            	out.println("outter try:"+e);
				           	}
				            				            
				            }    //end of try block
				            
				            //end of catch stmt
						
					 else 
					{
						out.println("Failed to create directory!");
					}
				}
				else
					out.println("Directory already exits");
			
				
		}
		else
		{
			out.println("invalid name");
		}
			
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
