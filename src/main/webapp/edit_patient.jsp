<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    
    <%@ page import="java.sql.*" %>

<%
    int patientId = Integer.parseInt(request.getParameter("patient_id"));

    String url = "jdbc:mysql://localhost:3306/farid_hospital";
    String userid = "root";
    String password = "system";

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(url, userid, password);

    String sql = "SELECT * FROM patient_registration WHERE patient_id=?";
    PreparedStatement pst = con.prepareStatement(sql);
    pst.setInt(1, patientId);
    ResultSet rs = pst.executeQuery();

    rs.next();
%>

<!DOCTYPE html>
<html>
<head>
<title>Edit Patient</title>
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
    .form h2{
    text-align:center;
    padding-bottom:5px;
    font-family:"poppins"
    }
</style>
</head>
<body>
  <section class="register">
     <div class="form">
	<h2>Edit Patient Details</h2>

	<form action="UpdatePatientServlet" method="post">
    <input type="hidden" name="patient_id" value="<%= patientId %>">
    <input type="text" name="patient_name" value="<%= rs.getString("patient_name") %>" required>
    <input type="text" name="patient_number" value="<%= rs.getString("patient_number") %>" required>
	<input type="submit" value="Update" class="submit">
</form>

</body>
</html>

<%
    con.close();
%>