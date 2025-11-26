package p1;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.*;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet 
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

        String admin_phone = request.getParameter("admin_phone");
        String admin_password = request.getParameter("admin_password");

        try 
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, USER, PASS);

            String sql = "SELECT * FROM admin_registration WHERE admin_phone=? AND admin_password=?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, admin_phone);
            pst.setString(2, admin_password);

            ResultSet rs = pst.executeQuery();

            if (rs.next())
            {
                // Login success → save patient info in session
                HttpSession session = request.getSession();
                session.setAttribute("admin_id", rs.getInt("admin_id"));
                session.setAttribute("admin_name", rs.getString("admin_name"));
              

                response.sendRedirect("admin_dashboard.jsp");
               
            } 
            else
            {
            	request.setAttribute("error", "Invalid Number or password !");
               out.println("<h3 style='color:red;'>Invalid Number or Password!</h3>");
                RequestDispatcher rd = request.getRequestDispatcher("admin_login.jsp");
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