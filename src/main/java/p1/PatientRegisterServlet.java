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
import java.sql.Statement;


@WebServlet("/PatientRegisterServlet")
public class PatientRegisterServlet extends HttpServlet {
	
	
	String patient_name=null;
	String patient_number=null;
	String patient_password=null;

	String url="jdbc:mysql://localhost:3306/farid_hospital";
	String username="root";
	String password="system";
	Statement stmt=null;
	ResultSet res=null;
	PreparedStatement pstmt=null;
	Connection con=null;
	
	public void init()
	{
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
			con=DriverManager.getConnection(url,username,password);
			System.out.println("Connection success");
		}
		catch(Exception e)
		{
			System.out.println("Connection failed");
		}
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		patient_name=request.getParameter("patient_name");
		patient_number=request.getParameter("patient_number");
		patient_password=request.getParameter("patient_password");
		
		try
        {
        	pstmt=con.prepareStatement("INSERT INTO  PATIENT_REGISTRATION (patient_name,patient_number,patient_password) VALUES(?,?,?)");
        	
        	pstmt.setString(1, patient_name);
        	pstmt.setString(2, patient_number);
        	pstmt.setString(3, patient_password);
        	
        	
        	int row=pstmt.executeUpdate();
        	System.out.println(row);
        	System.out.println("Data insert Successfully");
        	response.sendRedirect("patientlogin.jsp");
        	
        }
		catch(Exception e)
		{
			System.out.println("Data insert failed");
		}
        
   
	}

}
