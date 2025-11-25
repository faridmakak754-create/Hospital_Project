package p1;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.*;

@WebServlet("/AdminRegisterServlet")
public class AdminRegisterServlet extends HttpServlet {

    private static final String URL = "jdbc:mysql://localhost:3306/farid_hospital";
    private static final String USER = "root";
    private static final String PASS = "system";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        String admin_name = request.getParameter("admin_name");
        String admin_email = request.getParameter("admin_email");
        String admin_phone = request.getParameter("admin_phone");
        String admin_password = request.getParameter("admin_password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USER, PASS);

    
        
            String insertSql = "INSERT INTO admin_registration (admin_name,admin_email, admin_phone, admin_password) VALUES (?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(insertSql);

            pst.setString(1, admin_name);
            pst.setString(2, admin_email);
            pst.setString(3, admin_phone);
            pst.setString(4, admin_password);

            pst.executeUpdate();

            con.close();

            // Success → redirect to login page
            response.sendRedirect("admin_login.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            
            RequestDispatcher rd = request.getRequestDispatcher("admin_register.jsp");
            rd.forward(request, response);
        }
    }
}
