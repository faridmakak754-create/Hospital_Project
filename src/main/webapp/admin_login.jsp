<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
</head>
<body>
    <form action="AdminLoginServlet" method="post">
        <input type="tel" name="admin_phone" placeholder="Enter Your Number"><br><br>
        <input type="password" name="admin_password" placeholder="Enter your password"><br><br>
        <input type="submit" value="Login">
    </form>
</body>
</html>