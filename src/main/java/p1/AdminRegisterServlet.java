package p1;

import java.io.IOException;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.*;
import java.util.Properties;

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
            
            // 2️⃣ Generate 6-digit OTP
            int otp = (int) (Math.random() * 900000) + 100000;

            // Gmail SMTP settings
            String host = "smtp.gmail.com";
            int port = 587;
            String from = "faridmakak754@gmail.com";     // Your Gmail
            String appPassword = "ehyc piya nnyc vjli"; // Your Gmail App Password

            Properties props = new Properties();
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.port", String.valueOf(port));
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");

            Session mailSession = Session.getInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(from, appPassword);
                }
            });
            mailSession.setDebug(true);

            // Create OTP message
            Message msg = new MimeMessage(mailSession);
            msg.setFrom(new InternetAddress(from));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(admin_email));
            msg.setSubject("Your OTP Code");
            msg.setText("Hello " + admin_name + ",\n\nYour OTP is: " + otp + "\n\nDo not share this OTP with anyone.");

            // Send email
            Transport.send(msg);

            // Store OTP and email in session
            HttpSession hs = request.getSession();
            hs.setAttribute("otp", otp);
            hs.setAttribute("email",admin_email);

            // Redirect to OTP verification page
            response.sendRedirect("otp.jsp");

        } catch (ClassNotFoundException | SQLException | MessagingException e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        } 
            }
        
    }

