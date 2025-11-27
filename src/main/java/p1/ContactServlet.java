package p1;

import java.io.IOException;
import java.util.Properties;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import jakarta.mail.*;
import jakarta.mail.internet.*;

@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");   // ✅ CLIENT EMAIL
        String userMessage = request.getParameter("message");

        final String senderEmail = "faridmakak754@gmail.com";   // ✅ Your Gmail
        final String appPassword = "ehyc piya nnyc vjli";    // ✅ Use NEW one

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props,
            new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(senderEmail, appPassword);
                }
            });

        try {

            // ✅ 1. MAIL TO YOU (ADMIN)
            Message adminMail = new MimeMessage(session);
            adminMail.setFrom(new InternetAddress(senderEmail));
            adminMail.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(senderEmail));
            adminMail.setSubject("📩 New Contact Message");

            String adminBody =
                    "Name: " + name +
                    "\nEmail: " + email +
                    "\n\nMessage:\n" + userMessage;

            adminMail.setText(adminBody);
            Transport.send(adminMail);

            // ✅ 2. AUTO-REPLY TO CLIENT (THIS WAS MISSING IN YOUR CODE)
            Message clientMail = new MimeMessage(session);
            clientMail.setFrom(new InternetAddress(senderEmail));
            clientMail.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(email));   // ✅ SEND TO CLIENT

            clientMail.setSubject("✅ We Received Your Message");

            String clientBody =
                    "Hello " + name + ",\n\n" +
                    "Thank you for contacting us ✅\n" +
                    "We have successfully received your message.\n\n" +
                    "Your Message:\n" + userMessage + "\n\n" +
                    "We will contact you very soon.\n\n" +
                    "Best Regards,\nYour Website Team";

            clientMail.setText(clientBody);
            Transport.send(clientMail);

            // ✅ SUCCESS REDIRECT
            response.sendRedirect("success.html");

        } catch (MessagingException e) {
            e.printStackTrace();
            response.getWriter().print("Error Sending Email");
        }
    }
}
