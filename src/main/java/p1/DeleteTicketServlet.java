package p1;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/DeleteTicketServlet")
public class DeleteTicketServlet extends HttpServlet 
{

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

        int ticket_Id = Integer.parseInt(request.getParameter("ticket_id"));

        String url = "jdbc:mysql://localhost:3306/farid_hospital";
        String user = "root";
        String pass = "system";

        try 
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, pass);

            String sql = "DELETE FROM opd_ticket WHERE ticket_id=?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, ticket_Id);
            pstmt.executeUpdate();

            con.close();

        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }

        response.sendRedirect("admin_dashboard.jsp");
    }
}