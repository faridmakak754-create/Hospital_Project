package p1;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/UpdatePatientServlet")
public class UpdatePatientServlet extends HttpServlet 
{

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {

        int id = Integer.parseInt(req.getParameter("patient_id"));
        String name = req.getParameter("patient_name");
        String number = req.getParameter("patient_number");

        String url = "jdbc:mysql://localhost:3306/farid_hospital";
        String userid = "root";
        String password = "system";

        try 
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, userid, password);

            String sql = "UPDATE patient_registration SET patient_name=?, patient_number=? WHERE patient_id=?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, name);
            pst.setString(2, number);
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
