

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Course;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


@WebServlet("/Search")

public class Search extends HttpServlet {

	static final long serialVersionUID = 1L;

    public Search() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		==========================
//		PREPARE
//		==========================
	  //get the parameters from clients
		
    String semesterSearch = request.getParameter("semester-select");
    
    
    try {
    	
    	Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		
		//connect to mysql
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/NJIT?user=root&password=");
		
		//prepare to do sql
		Statement stmt = con.createStatement();
		
//		==========================
//		Service for Course Search
//		==========================
			List<Course> courseList = new ArrayList<Course>();
			String s = "select id,semester,courseName from Courses where semester='" + semesterSearch + "'";
			ResultSet courseFind = stmt.executeQuery(s);

			while(courseFind.next()) {
				Course Acourse = new Course();
				Acourse.setID(courseFind.getString("id"));
				Acourse.setSemester(courseFind.getString("semester"));
				Acourse.setName(courseFind.getString("courseName"));
				
				courseList.add(Acourse);
				System.out.println(courseList.get(0).getSemester());
				
			}
			
			
			request.setAttribute( "list_course",courseList);
			request.getRequestDispatcher("Main.jsp").forward(request,response);
    	
    }catch (Exception ex) {
		System.out.println(ex);
		System.exit(0);
    }
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

