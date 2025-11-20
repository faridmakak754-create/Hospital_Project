package p1;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.*;

@WebServlet("/OpdTicketServlet")
public class OpdTicketServlet extends HttpServlet {

    private static final String URL = "jdbc:mysql://localhost:3306/farid_hospital";
    private static final String USER = "root";
    private static final String PASS = "system";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        int patientId = Integer.parseInt(request.getParameter("patient_id"));
        String opdDepartment = request.getParameter("opd_department");
        String dob = request.getParameter("dob");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USER, PASS);

            String sql = "INSERT INTO opd_ticket (patient_id, opd_department, dob) VALUES (?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setInt(1, patientId);
            pst.setString(2, opdDepartment);
            pst.setString(3, dob);

            int row = pst.executeUpdate();

            if (row > 0) {
                out.println("<h3 style='color:green;'>OPD Ticket Submitted Successfully!</h3>");
            } else {
                out.println("<h3 style='color:red;'>Failed to submit ticket.</h3>");
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
        }
    }
}