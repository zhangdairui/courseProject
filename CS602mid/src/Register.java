//CS602-midterm-Dairui Zhang

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.ArrayList;


@WebServlet("/Main")

public class Register extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
  static final long serialVersionUID = 1L;
   
  public Register () {
    super();
  }   	
	
  protected void doGet(HttpServletRequest request, 
    HttpServletResponse response)throws ServletException, IOException {
//		==========================
//		PREPARE
//		==========================
	  //get the paramaters from clients
    String id = request.getParameter("id");
    String semester = request.getParameter("semester");
   
    String registerMessage;
    
    try {
		Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		
		//connect to mysql
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/NJIT?user=root&password=");
		
		//prepare to do sql
		Statement stmt = con.createStatement();
		
//		==========================
//		Service for Registration
//		==========================
		if(!id.equals("") && !semester.equals("")) {
				String s = "select * from Courses where id='" + id + "'and semester='" + semester + "'";
				ResultSet registerFind = stmt.executeQuery(s);
				
				if(!registerFind.next()) {
					System.out.println("no match!");
					registerMessage = "Sorry! This course is not offered!";
					request.setAttribute( "result-massage",registerMessage);
					request.setAttribute( "menu-check","2");
					request.getRequestDispatcher( "./Main.jsp").forward(request,response);
					
				}else {
						registerMessage = "You are registered in " +  id + " for " + semester;
						request.setAttribute( "result-massage",registerMessage);
						request.setAttribute( "menu-check","2");
						request.getRequestDispatcher( "./Main.jsp").forward(request,response);
				}
				
			}else {
				registerMessage = "You must enter both the course Id and the semester!";
				request.setAttribute( "result-massage",registerMessage);
				request.setAttribute( "menu-check","2");
				request.getRequestDispatcher("./Main.jsp").forward(request,response);
			}
			
    } catch (Exception ex) {
		System.out.println(ex);
		System.exit(0);
    }
    
    
  }  	
	
  protected void doPost(HttpServletRequest request, 
    HttpServletResponse response)throws ServletException, IOException {
    // TODO Auto-generated method stub
  }   	  	    
}
