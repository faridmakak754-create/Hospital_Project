package p1;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.*;

@WebServlet("/patientLogin")
public class PatientLoginServlet extends HttpServlet 
{

    private static final String url = "jdbc:mysql://localhost:3306/farid_hospital";
    private static final String USER = "root";
    private static final String PASS = "system";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String number = request.getParameter("patient_number");
        String password = request.getParameter("patient_password");

        try 
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, USER, PASS);

            String sql = "SELECT * FROM patient_registration WHERE patient_number=? AND patient_password=?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, number);
            pst.setString(2, password);

            ResultSet rs = pst.executeQuery();

            if (rs.next())
            {
                // Login success → save patient info in session
                HttpSession session = request.getSession();
                session.setAttribute("patient_id", rs.getInt("patient_id"));
                session.setAttribute("patient_name", rs.getString("patient_name"));

                response.sendRedirect("patient_dashboard.jsp");
            } 
            else
            {
                out.println("<h3 style='color:red;'>Invalid Number or Password!</h3>");
                RequestDispatcher rd = request.getRequestDispatcher("patient_login.jsp");
                rd.include(request, response);
            }

            con.close();
        } 
        catch (Exception e)
        {
            e.printStackTrace();
            out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
        }
    }
}