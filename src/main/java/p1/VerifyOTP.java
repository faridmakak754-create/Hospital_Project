package p1;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/VerifyOTP")
public class VerifyOTP extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get OTP entered by user
        String otpInput = request.getParameter("otp");

        // Get OTP stored in session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("otp") == null) {
            request.setAttribute("msg", "Session expired. Please request a new OTP.");
            request.getRequestDispatcher("otp.jsp").forward(request, response);
            return;
        }

        int sessionOtp = (int) session.getAttribute("otp");

        try {
            int userOtp = Integer.parseInt(otpInput);

            if (userOtp == sessionOtp) {
                session.removeAttribute("otp"); // Remove OTP after successful verification
               response.sendRedirect("admin_login.jsp");
               return;
            } else {
                request.setAttribute("msg", "Invalid OTP. Please try again.");
            }

        } catch (NumberFormatException e) {
            request.setAttribute("msg", "Invalid OTP format.");
        }

        // Forward back to otp.jsp to show the message
        request.getRequestDispatcher("otp.jsp").forward(request, response);
    }
}
