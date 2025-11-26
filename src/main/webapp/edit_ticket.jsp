<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    
    
    <%@ page import="java.sql.*" %>

<%
    int ticketId = Integer.parseInt(request.getParameter("ticket_id"));

    String url = "jdbc:mysql://localhost:3306/farid_hospital";
    String userid = "root";
    String password = "system";

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(url, userid, password);

    String sql = "SELECT * FROM opd_ticket WHERE ticket_id=?";
    PreparedStatement pst = con.prepareStatement(sql);
    pst.setInt(1, ticketId);
    ResultSet rs = pst.executeQuery();

    rs.next();
%>

<!DOCTYPE html>
<html>
<head>
<title>Edit Ticket</title>
<style>
    input, select 
    { padding: 8px; width: 300px; margin: 5px;
     }
    button 
    { 
    padding: 10px 20px;
     }
</style>
</head>
<body>

<h2>Edit OPD Ticket</h2>

<form action="UpdateTicketServlet" method="post">
    <input type="hidden" name="ticket_id" value="<%= ticketId %>">

    OPD Department:<br>
    <input type="text" name="opd_department" value="<%= rs.getString("opd_department") %>" required><br>

    DOB:<br>
    <input type="date" name="dob" value="<%= rs.getString("dob") %>" required><br>

    <button type="submit">Update</button>
</form>

</body>
</html>

<%
    con.close();
%>