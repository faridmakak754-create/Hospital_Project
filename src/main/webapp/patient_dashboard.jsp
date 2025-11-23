<%@ page import="java.sql.*, jakarta.servlet.http.*, jakarta.servlet.*" %>

<%
    HttpSession session1 = request.getSession(false);
    if (session1 == null || session1.getAttribute("patient_id") == null) 
    {
        response.sendRedirect("patient_login.jsp");
        return;
    }

    int patientId = (Integer) session.getAttribute("patient_id");
    String patientName = (String) session.getAttribute("patient_name");

    
    String url = "jdbc:mysql://localhost:3306/farid_hospital";
    String user = "root";
    String pass = "system";

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(url, user, pass);

    
    String sql = "SELECT * FROM opd_ticket WHERE patient_id=? ORDER BY ticket_id DESC";
    PreparedStatement pst = con.prepareStatement(sql);
    pst.setInt(1, patientId);
    ResultSet rs = pst.executeQuery();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="patient_dashboard.css">
        
</head>

<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <div class="profile">
            <img src="https://i.pravatar.cc/150?img=32" alt="Profile" class="profile-img">
            <h2 class="profile-name"> <%= patientName %>!</h2>
            <p class="profile-info">35 Years : Male</p>
            <p class="profile-info">Blood Type: O+</p>
            <div class="patient-id">Patient Id :<%= patientId %></div>
        </div>

        <div class="nav-links">
            <a href="#" class="nav-item active">
                <i class="fas fa-home"></i>
                <span class="nav-text">Dashboard</span>
            </a>
            <a href="#" class="nav-item">
                <i class="fas fa-calendar-check"></i>
                <span class="nav-text">My Appointments</span>
            </a>
            <a href="#" class="nav-item">
                <i class="fas fa-file-medical"></i>
                <span class="nav-text">OPD Tickets</span>
            </a>
            <a href="#" class="nav-item">
                <i class="fas fa-prescription"></i>
                <span class="nav-text">Prescriptions</span>
            </a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Header -->
        <div class="header">
            <div class="header-left">
                <h1>My Health Dashboard</h1>
                <p>Welcome to your patient portal</p>
            </div>
            <div class="header-right">
                <div class="notification-icon">
                    <i class="fas fa-bell"></i>
                    <span class="notification-badge">3</span>
                </div>
                <div class="user-info">
                    <img src="https://i.pravatar.cc/150?img=32" alt="User" class="user-avatar">
                    <span class="user-name"> <%= patientName %></span>
                </div>
                <a href="logout.jsp" class="logout-btn">
                    <i class="fas fa-sign-out-alt"></i>
                    <span>Logout</span>
                </a>
            </div>
        </div>

        <!-- Body Content -->
        <div class="body-content">
            <!-- Left Content -->
            <div class="content-left">
                <!-- Welcome Banner -->
                <div class="welcome-banner">
                    <div class="welcome-text">
                        <h2>Hello, <%= patientName %>!</h2>
                        <p>Your health is our priority. Manage your appointments and OPD tickets easily.</p>
                    </div>
                </div>

                <!-- Quick Stats -->
                <div class="quick-stats">
                    <div class="stat-card">
                        <i class="fas fa-calendar-day"></i>
                        <div class="stat-value">2</div>
                        <div class="stat-label">Upcoming Appointments</div>
                    </div>
                    <div class="stat-card">
                        <i class="fas fa-file-medical"></i>
                        <div class="stat-value">5</div>
                        <div class="stat-label">OPD Tickets This Month</div>
                    </div>
                    <div class="stat-card">
                        <i class="fas fa-prescription"></i>
                        <div class="stat-value">3</div>
                        <div class="stat-label">Active Prescriptions</div>
                    </div>
                    <div class="stat-card">
                        <i class="fas fa-file-invoice-dollar"></i>
                        <div class="stat-value">$120</div>
                        <div class="stat-label">Pending Payments</div>
                    </div>
                </div>

                <!-- OPD Tickets Table Section -->
                <div class="section-title">
                    <i class="fas fa-file-medical"></i> Your OPD Ticket History
                </div>

                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>Ticket ID</th>
                                <th>OPD Department</th>
                                <th>Date of Birth</th>
                                <th>Created On</th>
                            </tr>
                        </thead>
                   <%
   					 boolean hasTickets = false;
    				 while (rs.next()) 
    					{
        					hasTickets = true;
					%>
                        
                        <tbody>
                            <tr>
                                <td><%= rs.getInt("ticket_id") %></td>
                                <td><%= rs.getString("opd_department") %></td>
                                <td><%= rs.getString("dob") %></td>
                                <td><%= rs.getTimestamp("created_at") != null 
                                		   ? rs.getTimestamp("created_at") 
                                	       : "N/A" %></td>                              
                            </tr>
                           
                        </tbody>
                  <%
    				}

   					 if (!hasTickets) {
				   %>
   			 <tr>
        		<td colspan="4" style="text-align:center">No OPD tickets found.</td>
    		</tr>
		<%
   		 	}	

   		 	con.close();
		%>
                        
                    </table>
                </div>
            </div>

            <!-- Right Side Form -->
            <div class="content-right">
                <div class="form-sidebar">
                    <div class="form-icon">
                        <i class="fas fa-calendar-plus"></i>
                    </div>
                    <div class="form-header">
                        <h2>OPD Ticket Form</h2>
                    </div>

                    <form action="OpdTicketServlet" method="POST">
                     <input type="hidden" name="patient_id" value="<%= patientId %>">
                        <div class="form-group">
                           
                            <label for="department" class="form-label">Department</label>
                            <select id="department" name="opd_department" class="form-control" required>
                                <option value="">Select Department</option>
                                <option value="Cardiology">Cardiology</option>
                                <option value="Dermatology">Dermatology</option>
                                <option value="Endocrinology">Endocrinology</option>
                                <option value="Gastroenterology">Gastroenterology</option>
                                <option value="Neurology">Neurology</option>
                                <option value="Orthopedics">Orthopedics</option>
                                <option value="Pediatrics">Pediatrics</option>
                                <option value="Psychiatry">Psychiatry</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="date" class="form-label">Date of Birth</label>
                            <input type="date" id="date" name="dob" class="form-control" required>
                        </div>
                        <div class="action-buttons">
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-calendar-check"></i> Submit OPD Ticket
                            </button>
                            <button type="reset" class="btn btn-outline">
                                <i class="fas fa-redo"></i> Cancel Ticket
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>