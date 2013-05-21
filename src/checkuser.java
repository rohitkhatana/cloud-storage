import java.sql.*;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class checkuser
 */
@WebServlet("/checkuser")
public class checkuser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkuser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter writer = response.getWriter();
		
		String username = request.getParameter("username");
		String pass = request.getParameter("password");
		writer.println("uenter:"+username);
		
         
		try{
			Connection connection = null;
			// declare object of Statement interface that uses for executing sql statements.

			PreparedStatement pstatement = null;
			//load JDBC driver "com.mysql.jdbc.Driver"
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			//int u =0;
			connection = DriverManager.getConnection("jdbc:odbc:cloud", "root", "khatana");
			
			// sql query to insert

			//String queryString = "INSERT INTO file(name) VALUES(?)";

			//pstatement = connection.prepareStatement(queryString);

				String query = "select * from user where username='"+username+"'" ;
				
					
					pstatement = connection.prepareStatement(query);
					ResultSet rs = pstatement.executeQuery();
					writer.println("pass:"+pass);
					if(rs.next())
					{
							//writer.println("username already exits:" +rs.getString(1));
						writer.println("pass:"+pass);
						String store_pass = rs.getString(2); //database password
						String sp[] = store_pass.split(",");
						writer.println("store:" + sp[0]);
						Sha256 ref = new Sha256();
						String curr_pass = ref.sha256(pass); //current password entered by user
						writer.println("curr:" + curr_pass);
						String cp[] = curr_pass.split(",");
						if(cp[0].equals(sp[0]))
						{
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
								Cookie dir = new Cookie("curr_dir", Integer.toString(root_id));      //converting int to string for coki and adding to cur_dir
								Cookie did = new Cookie("did", "0");
								Cookie back = new Cookie("back",Integer.toString(root_id));     //so that we can come back to the main directories
								Cookie index = new Cookie("index",Integer.toString(1));
							//expiry time by default only for current session
							//login.setMaxAge(60*60*24);
							//add cookie in response header
								response.addCookie(dir);
								response.addCookie(did);
								response.addCookie(back);
								response.addCookie(index);
								response.sendRedirect("userhome.jsp");
							}
						}
						else
						{
							writer.println("invalid password");
							request.setAttribute("error", "ivalid password");
							request.getRequestDispatcher("login.jsp").forward(request,response);
						}
					}
					else
					{
						writer.println("username not exits");
						request.setAttribute("error", "username not exits");
						request.getRequestDispatcher("login.jsp").forward(request,response);
					}	
				
				
		}
		catch(Exception e){
			writer.println(e);
		}
         // declare object of Statement interface that uses for executing sql statements.
         
       /*  PreparedStatement pstatement = null;
         //load JDBC driver "com.mysql.jdbc.Driver"
         Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
         int u =0;
         connection = DriverManager.getConnection("jdbc:odbc:cloud", "root", "khatana");
         
         // sql query to insert
         
         String queryString = "INSERT INTO file(name) VALUES(?)";
         
         pstatement = connection.prepareStatement(queryString);
         
         pstatement.setString(1,fileName);
            
         u = pstatement.executeUpdate(); */
		
	}

}
