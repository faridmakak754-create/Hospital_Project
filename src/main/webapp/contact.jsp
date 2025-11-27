<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Form</title>
    <style>
        /* Form container styling - Increased specificity */
        body .contact-form-container form {
            max-width: 600px;
            margin: 50px auto;
            padding: 30px;
            background-color: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            font-family: 'Arial', sans-serif !important;
        }

        /* Input and textarea styling - Increased specificity */
        body .contact-form-container input[type="text"],
        body .contact-form-container input[type="email"],
        body .contact-form-container .txt2 {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e1e5e9;
            border-radius: 6px;
            font-size: 16px;
            transition: all 0.3s ease;
            box-sizing: border-box !important;
            background-color: white;
            font-family: 'Arial', sans-serif !important;
            margin: 0 !important; /* Override fast.css reset */
        }

        /* Focus state for inputs - Increased specificity */
        body .contact-form-container input[type="text"]:focus,
        body .contact-form-container input[type="email"]:focus,
        body .contact-form-container .txt2:focus {
            outline: none !important;
            border-color: #4a90e2 !important;
            box-shadow: 0 0 5px rgba(74, 144, 226, 0.3) !important;
        }

        /* Textarea specific styling */
        body .contact-form-container .txt2 {
            height: 120px;
            resize: vertical;
        }

        /* Placeholder styling */
        body .contact-form-container ::placeholder {
            color: #a0a0a0;
            opacity: 1;
        }

        /* Button styling - Increased specificity */
        body .contact-form-container .btn2 {
            background-color: #4a90e2 !important;
            color: white !important;
            padding: 12px 30px;
            border: none !important;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: bold;
            display: block;
            width: 100%;
            font-family: 'Arial', sans-serif !important;
            margin: 0 !important; /* Override fast.css reset */
        }

        /* Button hover effect */
        body .contact-form-container .btn2:hover {
            background-color: #357abd !important;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
        }

        /* Button active state */
        body .contact-form-container .btn2:active {
            transform: translateY(0);
        }

        /* Required field indicator */
        body .contact-form-container input:required, 
        body .contact-form-container .txt2:required {
            border-left: 3px solid #4a90e2 !important;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            body .contact-form-container form {
                margin: 20px;
                padding: 20px;
            }
            
            body .contact-form-container input[type="text"],
            body .contact-form-container input[type="email"],
            body .contact-form-container .txt2 {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>

    <%@ include file="header.jsp" %>
    
    <!-- Added wrapper with specific class -->
    <div class="contact-form-container">
        <form action="ContactServlet" method="post">
            <input type="text" name="name" placeholder="Enter Your Name" required>
            <br><br>

            <input type="email" name="email" placeholder="Enter Your Email" required>
            <br><br>

            <textarea class="txt2" name="message" placeholder="Enter Your Message" required></textarea>
            <br><br>

            <button class="btn2" type="submit">Send Message</button>
        </form>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>