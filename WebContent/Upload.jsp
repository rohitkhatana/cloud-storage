<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<%@ page import="java.sql.*"%>
<%
 

Cookie cookie = null;
Cookie[] cookies = null;
String username = null;
int curr_dir=0;
cookies = request.getCookies();
	if( cookies != null )
	{
		for(int g=0;g<cookies.length;g++)
		{
			cookie = cookies[g];
			if(cookie.getName().equals("login"))
			{
				 username = cookie.getValue();
			}
			if(cookie.getName().equals("curr_dir"))
			{
				curr_dir = Integer.parseInt(cookie.getValue());
			}
		}
	}
	
	//datetime formatting for storing
		java.util.Date dt = new java.util.Date();
		
		java.text.SimpleDateFormat sdf = 
		     new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		String currentTime = sdf.format(dt);
		//database
		 String connString = "jdbc:odbc:cloud";
         Connection connection = null;
         // declare object of Statement interface that uses for executing sql statements.
         
         PreparedStatement pstatement = null;
         //load JDBC driver "com.mysql.jdbc.Driver"
         Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
         int u =0;
         connection = DriverManager.getConnection("jdbc:odbc:cloud", "root", "khatana");
         
         String qq = "select * from file_table order by file_id desc limit 1";						//getting last row from database so that can change the name of uploading file
         
         pstatement = connection.prepareStatement(qq);
         
         ResultSet rss = pstatement.executeQuery();
         int file_id=0;
         if(rss.next())
         {
        	 file_id=rss.getInt(2);
         }
        	 
        
            
        
         
   File file ;
   int maxFileSize = 1073741824;  //4mb
   //1073741824bytes = 1gb
   int maxMemSize = 1073741824;
   ServletContext context = pageContext.getServletContext();
   String filePath = context.getInitParameter("file-upload");

   // Verify the content type
   String contentType = request.getContentType();
   if ((contentType.indexOf("multipart/form-data") >= 0)) {

      DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);
      // Location to save data that is larger than maxMemSize.
      factory.setRepository(new File("c:\\temp"));

      // Create a new file upload handler
      ServletFileUpload upload = new ServletFileUpload(factory);
      // maximum file size to be uploaded.
      upload.setSizeMax( maxFileSize );
      try{ 
         // Parse the request to get file items.
         List fileItems = upload.parseRequest(request);
			
         // Process the uploaded file items
         Iterator i = fileItems.iterator();

         out.println("<html>");
         out.println("<head>");
         out.println("<title>JSP File upload</title>");  
         out.println("</head>");
         out.println("<body>");
         String access = "111";
         while ( i.hasNext () ) 
         {
        	
            FileItem fi = (FileItem)i.next();
            if(fi.isFormField())
            {
            	String name = fi.getFieldName();
            	
            	if(name.equals("access"))
            	{
            		access = fi.getString();
            		if(access.equals("private"))
            			access="000";
            		else
            			access="111";
            		out.println("value" + access);
            	}
            }
            else //if ( !fi.isFormField () )	
            {
	            // Get the uploaded file parameters
	            String fieldName = fi.getFieldName();
	            String fileName = fi.getName();
	            file_id+=1;
	            fileName = file_id+")"+fileName;						//changing file name with file_id
	            out.println("filenmae:"+fileName);
	            boolean isInMemory = fi.isInMemory();
	            long sizeInBytes = fi.getSize();
	            // Write the file
	            if( fileName.lastIndexOf("\\") >= 0 )
	            {
	            	file = new File( filePath + 
	            	fileName.substring( fileName.lastIndexOf("\\"))) ;
	            }
	            else
	            {
	            	file = new File( filePath + 
	            	fileName.substring(fileName.lastIndexOf("\\")+1)) ;
	            }
	            fi.write( file ) ;
	            out.println("Uploaded Filename: " + filePath + 
	            fileName + "<br>");
	            
	            //DATABASE UPLOAD
	           
	            // sql query to insert
	          
	            String qfile_table = "INSERT INTO file_table(filename,creation_time) VALUES(?,?)";
	          
	            pstatement = connection.prepareStatement(qfile_table);
	            
	          
	                    
	            pstatement.setString(1,fileName);
	            pstatement.setString(2,currentTime);
	               
	            u = pstatement.executeUpdate();
	            
	            //if(u != 0)
	            {
	       		//	response.sendRedirect("yourfile.jsp");
	            }
		            String query = "select file_id from file_table where filename='"+fileName+"'" ;
					try
					{
						pstatement = connection.prepareStatement(query);
						ResultSet rs = pstatement.executeQuery();
						out.println("in try :");
						while(rs.next())
						{
							int folder_id;
							String s = rs.getString(1);
							out.println("in rs.next()1:<br>");
							//out.println("fileid:" + s);
							
							String fq = "select * from folder_in_folder where username='"+username+"' and parent_folder_id="+1+"";
							pstatement = connection.prepareStatement(fq);
							out.println("in rs.next()1:<br>");
							ResultSet rs1 = pstatement.executeQuery();
							out.println("in rs.next()1:<br>");
							try{
							if(rs1.next())
							{
								
								 folder_id = rs1.getInt(3); 
								 if(curr_dir!=0) 						//checking if inside a directory or not
									 folder_id = curr_dir;
								 out.println("in rs.next()2:<br>");
								int id = Integer.parseInt(s);	
								//int acc = Integer.parseInt(access);
					            String qfile_access = "insert into file_in_folder(child_file_name,parent_folder_id,child_file_id,username) values(?,?,?,?)";
					          
					            pstatement = connection.prepareStatement(qfile_access);
					            pstatement.setString(1,fileName);
					            pstatement.setInt(2,folder_id);
					            pstatement.setInt(3,id);
					            pstatement.setString(4,username);
					            u = pstatement.executeUpdate();
							}
							}
							catch(Exception e)
							{
								out.println("inner try:"+e);
							}
				            response.sendRedirect("yourfile.jsp");
							
						}
					}
					catch(Exception ex)
					{
				        out.println(ex);
					}
					finally{
						connection.close();
						pstatement.close();
					}
	           }
              
         }
         
         out.println("</body>");
         out.println("</html>");
      }catch(Exception ex) {
         System.out.println(ex);
      }
   }else{
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Servlet upload</title>");  
      out.println("</head>");
      out.println("<body>");
      out.println("<p>No file uploaded</p>"); 
      out.println("</body>");
      out.println("</html>");
   }
%>