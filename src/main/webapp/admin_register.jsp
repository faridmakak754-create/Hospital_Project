<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin_Register</title>
    <style>
  body{
    margin: 0;
    padding: 0;
  }
    .register {
        margin: 0;
        padding: 0;
        height: 100vh;
        font-family: Arial, sans-serif;
        background: linear-gradient(135deg, #667eea, #764ba2);
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .form {
        background: white;
        padding: 30px 25px;
        border-radius: 10px;
        width: 320px;
        box-shadow: 0px 10px 25px rgba(0,0,0,0.2);
    }

    .form form {
        display: flex;
        flex-direction: column;
        gap: 15px;
    }

    .form input {
        padding: 10px 12px;
        font-size: 14px;
        border-radius: 6px;
        border: 1px solid #ccc;
        outline: none;
    }

    .form input:focus {
        border-color: #667eea;
        box-shadow: 0 0 5px rgba(102, 126, 234, 0.5);
    }

    .submit {
        background: #667eea;
        color: white;
        border: none;
        cursor: pointer;
        font-weight: bold;
        transition: 0.3s;
    }

    .submit:hover {
        background: #5a67d8;
    }
</style>

</head>
<body>
	<%@ include file="header.jsp" %>
    <section class="register">
    <div class="form">
    <form action="AdminRegisterServlet" method="post">
        <input type="text" name="admin_name" required placeholder="Enter your full name">
        <input type="email" name="admin_email" required placeholder="Enter your Email">
        <input type="tel" name="admin_phone" required placeholder="10-digit phone number">
        <input type="password" name="admin_password" required placeholder="Password">
        <input type="submit" value="Create an Account" class="submit">
    </form>
    </div>
    </section>
    <%@ include file="footer.jsp" %>
</body>
</html>