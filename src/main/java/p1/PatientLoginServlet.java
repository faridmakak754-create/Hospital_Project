package p1;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class PatientLoginServlet
 */
@WebServlet("/PatientLoginServlet")
public class PatientLoginServlet extends HttpServlet {
	
		String patient_number=null;
		String patient_password=null;
	
		String url = "jdbc:mysql://localhost:3306/farid_hospital";
	    String dbUsername = "root";
	    String dbPassword = "system";

	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet res = null;

	    public void init() {
	    	try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				System.out.println("Driver load success");
			}
			catch(Exception e)
			{
				System.out.println("Driver load failed");
			}
			
			//connection 
			try
			{
				con=DriverManager.getConnection(url,dbUsername,dbPassword);
				System.out.println("Connection success");
			}
			catch(Exception e)
			{
				System.out.println("Connection failed");
			}
		}

	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	    	patient_number=request.getParameter("patient_number");
			patient_password=request.getParameter("patient_password");
	        
	        
	       try {
	        pstmt = con.prepareStatement("SELECT * FROM PATIENT_REGISTRATION WHERE patient_number=? AND patient_password=?");
	        pstmt.setString(1, patient_number);
	        pstmt.setString(2, patient_password);
	        res = pstmt.executeQuery();

	        if (res.next()) {
	            HttpSession session = request.getSession();
	            session.setAttribute("patient_number", patient_number);
	            session.setAttribute("patient_password", patient_password);

	            RequestDispatcher rd = request.getRequestDispatcher("patient_dashboard.jsp");
	            rd.forward(request, response);
	        } else {
	            response.sendRedirect("index.jsp");
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        response.getWriter().println("Login failed: " + e.getMessage());
	    }
	
	}

}
