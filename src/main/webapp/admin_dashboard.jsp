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
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f5f5f5;
            padding: 20px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 2px solid #4a90e2;
        }

        .header h2 {
            color: #333;
        }

        .logout-form {
            display: inline;
        }

        .logout-btn {
            background-color: #e74c3c;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }

        .logout-btn:hover {
            background-color: #c0392b;
        }

        .container {
            width: 95%;
            margin: 0 auto;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        h3 {
            color: #333;
            margin: 30px 0 15px 0;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
            background-color: white;
        }

        th, td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background: #4a90e2;
            color: white;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        tr:hover {
            background-color: #f1f3f4;
        }

        .blocked {
            color: #e74c3c;
            font-weight: bold;
        }

        button {
            background-color: #4a90e2;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 13px;
            margin: 2px;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #357ae8;
        }

        form[action="BlockPatientServlet"] button {
            background-color: #e74c3c;
        }

        form[action="BlockPatientServlet"] button:hover {
            background-color: #c0392b;
        }

        form[action="DeleteTicketServlet"] button {
            background-color: #e74c3c;
        }

        form[action="DeleteTicketServlet"] button:hover {
            background-color: #c0392b;
        }

        .section-title {
            color: #666;
            font-size: 14px;
            margin-top: 40px;
            margin-bottom: 10px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
    </style>
</head>

<body>
   <% response.setHeader("Cache-control","no-cache,no-store,must-revalidate");
        if(session.getAttribute("admin_id")==null)
    {
    response.sendRedirect("admin_login.jsp");
    }
    %>

<div class="container">
    <div class="header">
        <h2>Admin Dashboard</h2>
        <form action="Logout" class="logout-form">
            <button type="submit" class="logout-btn">Logout</button>
        </form>
    </div>

    <div class="section-title">Table 1 — Patient Details</div>
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

    <div class="section-title">Table 2 — OPD Ticket Details</div>
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
                <form action="edit_ticket.jsp" method="post" style="display:inline;">
                    <input type="hidden" name="ticket_id" value="<%= rsTickets.getInt("ticket_id") %>">
                    <button type="submit">Edit</button>
                </form>

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