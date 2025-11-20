<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="jakarta.servlet.http.*,jakarta.servlet.*" %>
<%
    HttpSession session1 = request.getSession(false);
    if (session1 == null || session1.getAttribute("patient_name") == null) {
        response.sendRedirect("patient_login.jsp");
        return;
    }
    String patientName = (String) session1.getAttribute("patient_name");
    int patientId = (Integer) session1.getAttribute("patient_id");
    String patientNumber = (String) session1.getAttribute("patient_number");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patient Dashboard</title>
</head>
<body>

<h2>Welcome, <%= patientName %>!</h2>
    <a href="logout.jsp">Logout</a>

    <h3>OPD Ticket Form</h3>
    <form action="OpdTicketServlet" method="post">
        <input type="hidden" name="patient_id" value="<%= patientId %>">

        <label>OPD Department:</label><br>
        <input type="text" name="opd_department" required><br><br>

        <label>Date of Birth:</label><br>
        <input type="date" name="dob" required><br><br>

        <input type="submit" value="Submit OPD Ticket">
    </form>
</body>
</html>