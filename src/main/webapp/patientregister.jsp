<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Registration - FIMS</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
	<link rel="stylesheet" href="patient.css">
	<link rel="stylesheet" href="index.css">
</head>
<body>
    <!-- Header -->
    <header>
        <div class="container">
            <div class="header-top">
                <div class="logo-section">
                   <div class="logo">
                    <img src="logo1.png" alt="FIMS Logo">
                </div>
                    <div class="institute-name">
                        ꯐꯔꯤꯗ  ꯏꯟꯁꯇꯤꯇꯨꯠ ꯑꯣꯐ  ꯃꯦꯗꯤꯀꯦꯜ ꯁꯥꯏꯟ (ꯐꯤꯝꯁ), ꯂꯤꯂꯣꯡ  <br>
                        FARID  INSTITUTE OF MEDICAL SCIENCE (FIMS), LILONG
                    </div>
                </div>
                
                <div class="header-links">
                    <a href="#"><i class="fab fa-facebook-f"></i> Facebook</a>
                    <a href="#"><i class="fab fa-twitter"></i> Twitter</a>
                    <a href="#"><i class="fab fa-instagram"></i> Instagram</a>
                    <a href="#"><i class="fab fa-youtube"></i> YouTube</a>
                    <a href="#"><i class="fab fa-linkedin-in"></i> LinkedIn</a>
                </div>
            </div>
            
            <div class="search-section">
                <div class="search-container">
                    <form class="search-form" action="#" method="GET">
                        <input type="text" class="search-input" name="query" 
                               placeholder="Search for doctors, departments, services..." 
                               aria-label="Search">
                        <button type="submit" class="search-button">
                            <i class="fas fa-search"></i> Search
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </header>
    
     <!-- Navigation -->
    <nav>
        <div class="container">
            <ul class="main-nav">
                <li><a href="index.jsp" >Home</a></li>
                <li><a href="#">Notices</a></li>
                <li><a href="about.html">About Us</a></li>
                <li><a href="#">Departments</a></li>
                <li><a href="#">Patient Care</a></li>
                <li><a href="patientregister.jsp" class="active">Appointments</a></li>
                <li><a href="contact.html"> Contact us</a></li>
                
            </ul>
        </div>
    </nav>
    
    <!-- Registration Section -->
    <section class="registration-section">
        <div class="container">
            <h2 class="section-title">Patient Registration</h2>
            <div class="registration-container">
                <div class="registration-info">
                    <h2>Create Your Patient Account</h2>
                    <p>Register with FIMS to book appointments, access your medical records, and receive personalized healthcare services.</p>
                    
                    <ul class="info-list">
                        <li><i class="fas fa-check-circle"></i> Quick and easy registration</li>
                        <li><i class="fas fa-check-circle"></i> Secure account with password protection</li>
                        <li><i class="fas fa-check-circle"></i> Access to online appointment booking</li>
                        <li><i class="fas fa-check-circle"></i> View your medical history online</li>
                    </ul>
                    
                    <div class="emergency-contact">
                        <h3>Already have an account?</h3>
                        <p>Sign in to access your patient portal</p>
                        <a href="patientlogin.jsp" class="btn btn-secondary" style="margin-top: 10px; display: inline-block;">Login Here</a>
                    </div>
                </div>
                
                <div class="registration-form-container">
                    <div class="form-header">
                        <h2>Create Account</h2>
                        <p>Please fill in all required fields marked with *</p>
                    </div>
                    
                    <div class="form-instructions">
                        <h4>Registration Instructions:</h4>
                        <ul>
                            <li>Use your full legal name as per government ID</li>
                            <li>Phone number must be 10 digits</li>
                            <li>Password must be at least 8 characters long</li>
                            <li>Ensure passwords match in both fields</li>
                        </ul>
                    </div>
                    
                    <!-- Form with POST method for Servlet -->
                    <form class="registration-form" id="patient-registration-form" action="PatientRegisterServlet" >
                        <div class="form-group required">
                            <label for="name">Full Name</label>
                            <input type="text" id="name" name="patient_name" required placeholder="Enter your full name">
                        </div>
                        
                        <div class="form-group required">
                            <label for="phone">Phone Number</label>
                            <input type="tel" id="phone" name="patient_number" required placeholder="10-digit phone number" pattern="[0-9]{10}" title="Please enter a 10-digit phone number">
                        </div>
                        
                        <div class="form-group required">
                            <label for="password">Password</label>
                            <input type="password" id="password" name="patient_password" required placeholder="At least 8 characters" minlength="8" title="Password must be at least 8 characters">
                        </div>
                        
<!--                         <div class="form-group required"> -->
<!--                             <label for="confirm-password">Confirm Password</label> -->
<!--                             <input type="text" id="confirm-password" name="patient_password" required placeholder="Re-enter your password"> -->
<!--                         </div> -->
                        
                        <div class="form-actions">
                            <button type="reset" class="btn btn-secondary">Reset Form</button>
                            <button type="submit" class="btn btn-primary">Create Account</button>
                        </div>
                    </form>
                    
                    <div class="login-link">
                        <p>Already have an account? <a href="patientlogin.jsp">Sign in here</a></p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- footer -->
   <footer>
    <div class="container">
        <div class="footer-content">
            <div class="footer-columns">
                <div class="footer-column">
                    <h3>About FIMS</h3>
                    <p>Farid Institute of Medical Sciences (FIMS), Lilong is a premier medical institute dedicated to excellence in healthcare and medical education since 2020.</p>
                    <div class="contact-info">
                        <p><i class="fas fa-map-marker-alt"></i> Lilong, Manipur, India</p>
                        <p><i class="fas fa-phone"></i> +91-123-456-7890</p>
                        <p><i class="fas fa-envelope"></i> info@fims.edu.in</p>
                    </div>
                </div>
                
                <div class="footer-column">
                    <h3>Quick Links</h3>
                    <ul>
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="about.html">About Us</a></li>
                        <li><a href="#">Departments</a></li>
                        <li><a href="#">Patient Care</a></li>
                        <li><a href="patientregister.jsp">Appointments</a></li>
                        <li><a href="contact.html">Contact Us</a></li>
                        <li><a href="privacy.html">Privacy policy</a></li>
                        <li><a href="term.html">Terms & Condition</a></li>
                        <li><a href="refund.html">Refund Policy </a></li>
                    </ul>
                </div>
                
                <div class="footer-column">
                    <h3>Patient Services</h3>
                    <ul>
                        <li><a href="#">Find a Doctor</a></li>
                        <li><a href="#">OPD Schedule</a></li>
                        <li><a href="#">Emergency Services</a></li>
                        <li><a href="#">Health Checkup Packages</a></li>
                        <li><a href="#">Patient Portal</a></li>
                        <li><a href="#">Insurance & Billing</a></li>
                    </ul>
                </div>
                
                <div class="footer-column">
                    <h3>Academic</h3>
                    <ul>
                        <li><a href="#">Courses Offered</a></li>
                        <li><a href="#">Admissions</a></li>
                        <li><a href="#">Research</a></li>
                        <li><a href="#">Library</a></li>
                        <li><a href="#">Student Portal</a></li>
                        <li><a href="#">Faculty Directory</a></li>
                    </ul>
                </div>
            </div>
            
            <div class="footer-newsletter">
                <h3>Subscribe to Our Newsletter</h3>
                <p>Stay updated with the latest news and announcements from FIMS</p>
                <form class="newsletter-form">
                    <input type="email" placeholder="Enter your email address" required>
                    <button type="submit">Subscribe</button>
                </form>
            </div>
        </div>
        
        <div class="footer-bottom">
            <p>© 2025 Farid Institute of Medical Sciences, Lilong. All Rights Reserved.</p>
        </div>
    </div>
</footer>
</body>
</html>