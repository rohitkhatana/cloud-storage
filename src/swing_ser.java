

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
//import javax.swing.tree.*;
import javax.swing.tree.DefaultMutableTreeNode;

/**
 * Servlet implementation class swing_ser
 */
@WebServlet("/swing_ser")
public class swing_ser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public swing_ser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	PrintWriter out = response.getWriter();
	try{
		 DefaultMutableTreeNode c = new DefaultMutableTreeNode("Collage", true);
	        DefaultMutableTreeNode d = new DefaultMutableTreeNode("Department");
	        DefaultMutableTreeNode f = new DefaultMutableTreeNode("Faculty");
	        DefaultMutableTreeNode a = new DefaultMutableTreeNode("Acoountant");
	     //   DefaultMutableTreeNode r = new DefaultMutableTreeNode("Resgistrar");
	        DefaultMutableTreeNode m = new DefaultMutableTreeNode("Managenent");
	        DefaultMutableTreeNode s = new DefaultMutableTreeNode("Security");
	        c.add(d);
	        d.add(f);
	        d.add(a);
	        d.add(m);
	        m.add(s );
	        c.add(a);
	        JTree mytree = new JTree(c);
	        JFrame frame = new JFrame("Demo of JTree Component!");
	        frame.add(mytree);
	        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	        frame.setUndecorated(true);
	        frame.getRootPane().setWindowDecorationStyle(JRootPane.PLAIN_DIALOG);
	        frame.setSize(450,450);
	        frame.setVisible(true);
	}catch(Exception e)
	{
		out.println(e);
	}
	}
	
	}


