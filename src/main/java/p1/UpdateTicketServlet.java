package p1;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/UpdateTicketServlet")
public class UpdateTicketServlet extends HttpServlet
{

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException 
    {

        int id = Integer.parseInt(req.getParameter("ticket_id"));
        String dept = req.getParameter("opd_department");
        String dob = req.getParameter("dob");

        String url = "jdbc:mysql://localhost:3306/farid_hospital";
        String userid = "root";
        String password = "system";

        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, userid, password);

            String sql = "UPDATE opd_ticket SET opd_department=?, dob=? WHERE ticket_id=?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, dept);
            pst.setString(2, dob);
            pst.setInt(3, id);

            pst.executeUpdate();
            con.close();

        }
        catch (Exception e) 
        {
            e.printStackTrace();
        }

        resp.sendRedirect("admin_dashboard.jsp");
    }
}