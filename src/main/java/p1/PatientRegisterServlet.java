package p1;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.*;

@WebServlet("/PatientRegisterServlet")
public class PatientRegisterServlet extends HttpServlet {

    private static final String URL = "jdbc:mysql://localhost:3306/farid_hospital";
    private static final String USER = "root";
    private static final String PASS = "system";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        String name = request.getParameter("patient_name");
        String number = request.getParameter("patient_number");
        String password = request.getParameter("patient_password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USER, PASS);

            // 1️⃣ Check if number already exists
            String checkSql = "SELECT patient_number FROM patient_registration WHERE patient_number = ?";
            PreparedStatement checkPst = con.prepareStatement(checkSql);
            checkPst.setString(1, number);
            ResultSet rs = checkPst.executeQuery();

            if (rs.next()) {
                // Number exists → return with error message
                request.setAttribute("error", "This number is already registered!");
                RequestDispatcher rd = request.getRequestDispatcher("patientregister.jsp");
                rd.forward(request, response); // IMPORTANT → forward keeps message
                return;
            }

            // 2️⃣ Insert new patient
            String insertSql = "INSERT INTO patient_registration (patient_name, patient_number, patient_password) VALUES (?,?,?)";
            PreparedStatement pst = con.prepareStatement(insertSql);

            pst.setString(1, name);
            pst.setString(2, number);
            pst.setString(3, password);

            pst.executeUpdate();

            con.close();

            // Success → redirect to login page
            response.sendRedirect("patient_login.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Server error! Please try again.");
            RequestDispatcher rd = request.getRequestDispatcher("patientregister.jsp");
            rd.forward(request, response);
        }
    }
}
