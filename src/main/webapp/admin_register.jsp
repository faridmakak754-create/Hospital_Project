<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Registration - FIMS</title>
     
    </head>

    <body>
        <form action="AdminRegisterServlet" method="post">
            <input type="text" name="admin_name" required placeholder="Enter your full name"><br><br>
            <input type="email" name="admin_email" required placeholder="Enter your Email"><br><br>
            <input type="tel" name="admin_phone" required placeholder="10-digit phone number"><br><br>
            <input  type="password" name="admin_password" required placeholder="password">
            <input type="submit" value="Create an Account">
        </form>
    </body>

    </html>