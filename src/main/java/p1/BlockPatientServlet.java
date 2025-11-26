package p1;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/BlockPatientServlet")
public class BlockPatientServlet extends HttpServlet 
{

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int patient_Id = Integer.parseInt(request.getParameter("patient_id"));

        String url = "jdbc:mysql://localhost:3306/farid_hospital";
        String user = "root";
        String pass = "system";

        try 
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, pass);

            // GET CURRENT STATUS
            String checkSql = "SELECT status FROM patient_registration WHERE patient_id=?";
            PreparedStatement pstmt = con.prepareStatement(checkSql);
            pstmt.setInt(1, patient_Id);
            ResultSet rs = pstmt.executeQuery();

            String newStatus = "BLOCKED";
            if (rs.next()) 
            {
                String current = rs.getString("status");
                if ("BLOCKED".equals(current)) 
                {
                    newStatus = "ACTIVE";   // Unblock
                }
            }

            // UPDATE STATUS
            String updateSql = "UPDATE patient_registration SET status=? WHERE patient_id=?";
            pstmt = con.prepareStatement(updateSql);
            pstmt.setString(1, newStatus);
            pstmt.setInt(2, patient_Id);
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