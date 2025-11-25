<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    
    <%@ page import="java.sql.*" %>

<%
    // Database connection
    String url = "jdbc:mysql://localhost:3306/farid_hospital";
    String user = "root";
    String pass = "system";

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(url, user, pass);

    // Fetch all patients
    String sqlPatients = "SELECT * FROM patient_registration ORDER BY patient_id DESC";
    PreparedStatement pstPatients = con.prepareStatement(sqlPatients);
    ResultSet rsPatients = pstPatients.executeQuery();

    String sqlTickets =
    	    "SELECT t.ticket_id, t.patient_id, p.patient_name, p.patient_number, " +
    	    "t.opd_department, t.dob " +
    	    "FROM opd_ticket t " +
    	    "JOIN patient_registration p ON t.patient_id = p.patient_id " +
    	    "ORDER BY t.ticket_id DESC";

    PreparedStatement pstTickets = con.prepareStatement(sqlTickets);
    ResultSet rsTickets = pstTickets.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        table { width: 100%; border-collapse: collapse; margin-top: 30px; }
        th, td { padding: 10px; border: 1px solid black; text-align: center; }
        th { background: #333; color: white; }
        .blocked { color: red; font-weight: bold; }
        .container { width: 90%; margin: auto; }
    </style>
</head>

<body>

<div class="container">

<h2>Admin Dashboard</h2>

<hr>

TABLE 1 — PATIENT DETAILS


<h3>All Registered Patients</h3>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Number</th>
        <th>Status</th>
        <th>Action</th>
    </tr>

<%
    while (rsPatients.next()) {
%>
    <tr>
        <td><%= rsPatients.getInt("patient_id") %></td>
        <td><%= rsPatients.getString("patient_name") %></td>
        <td><%= rsPatients.getString("patient_number") %></td>

        <td class="<%= rsPatients.getString("status").equals("BLOCKED") ? "blocked" : "" %>">
            <%= rsPatients.getString("status") %>
        </td>

        <td>
            
            <form action="BlockPatientServlet" method="post" style="display:inline;">
                <input type="hidden" name="patient_id" value="<%= rsPatients.getInt("patient_id") %>">
                <button type="submit">Block</button>
            </form>

           
            <form action="edit_patient.jsp" method="post" style="display:inline;">
                <input type="hidden" name="patient_id" value="<%= rsPatients.getInt("patient_id") %>">
                <button type="submit">Edit</button>
            </form>
        </td>
    </tr>
<%
    }
%>
</table>


TABLE 2 — OPD TICKET DETAILS


<h3>All OPD Ticket Records</h3>

<table>
    <tr>
        <th>Ticket ID</th>
        <th>Patient ID</th>
        <th>Patient Name</th>
        <th>Patient Phone</th>
        <th>OPD Department</th>
        <th>DOB</th>
        <th>Action</th>
    </tr>

<%
    while (rsTickets.next()) {
%>
    <tr>
        <td><%= rsTickets.getInt("ticket_id") %></td>
<td><%= rsTickets.getInt("patient_id") %></td>
<td><%= rsTickets.getString("patient_name") %></td>
<td><%= rsTickets.getString("patient_number") %></td>
<td><%= rsTickets.getString("opd_department") %></td>
<td><%= rsTickets.getString("dob") %></td>


        <td>
            <!-- EDIT TICKET -->
            <form action="edit_ticket.jsp" method="post" style="display:inline;">
                <input type="hidden" name="ticket_id" value="<%= rsTickets.getInt("ticket_id") %>">
                <button type="submit">Edit</button>
            </form>

            <!-- DELETE TICKET -->
            <form action="DeleteTicketServlet" method="post" style="display:inline;">
                <input type="hidden" name="ticket_id" value="<%= rsTickets.getInt("ticket_id") %>">
                <button type="submit">Delete</button>
            </form>
        </td>
    </tr>
<%
    }
    con.close();
%>

</table>

</div>

</body>
</html>