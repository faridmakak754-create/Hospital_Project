<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Login - FIMS</title>
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
                <li><a href="patientlogin.jsp"class="active">Appointments</a></li>
                <li><a href="contact.html"> Contact us</a></li>
                
            </ul>
        </div>
    </nav>
    
    <!-- Login Section -->
    <section class="login-section">
        <div class="container">
            <div class="login-container">
                <div class="login-info">
                    <h2>Welcome to FIMS Patient Portal</h2>
                    <p>Access your medical records, view test results, and manage your healthcare journey with our secure patient portal.</p>
                    
                    <ul class="info-list">
                        <li><i class="fas fa-check-circle"></i> Secure access to medical records</li>
                        <li><i class="fas fa-check-circle"></i> View lab results and reports</li>
                        <li><i class="fas fa-check-circle"></i> Manage appointments online</li>
                        <li><i class="fas fa-check-circle"></i> Communicate with healthcare providers</li>
                    </ul>
                    
                    <div class="emergency-contact">
                        <h3>New to FIMS?</h3>
                        <p>Create an account to access all patient services</p>
                        <a href="patientregister.jsp" class="btn btn-primary" style="margin-top: 10px; display: inline-block; background: white; color: var(--secondary);">Register Now</a>
                    </div>
                </div>
                
                <div class="login-form-container">
                    <div class="form-header">
                        <h2>Patient Login</h2>
                        <p>Sign in to your account</p>
                    </div>
                    
                    <!-- Form with POST method for Servlet -->
                    <form class="login-form" id="patient-login-form" action="patientLogin" method="post">
                        <div class="form-group required">
                            <label for="phone">Phone Number</label>
                            <input type="tel" id="phone" name="patient_number" required placeholder="10-digit phone number" pattern="[0-9]{10}" title="Please enter your 10-digit phone number">
                        </div>
                        
                        <div class="form-group required">
                            <label for="password">Password</label>
                            <input type="password" id="password" name="patient_password" required placeholder="Enter your password">
                        </div>
                        
                        <div class="form-options">
                            <div class="remember-me">
                                <input type="checkbox" id="remember" name="remember">
                                <label for="remember">Remember me</label>
                            </div>
                            <a href="forgot-password.html" class="forgot-password">Forgot Password?</a>
                        </div>
                        
                        <button type="submit" class="btn btn-primary">Sign In</button>
                    </form>
                    
                    <div class="register-link">
                        <p>Don't have an account? <a href="patientregister.jsp">Register here</a></p>
                    </div>
                    
                    <div class="quick-options">
                        <a href="tel:+918119934105" class="quick-option">
                            <i class="fas fa-ambulance"></i>
                            <span>Emergency Services</span>
                        </a>
                        <a href="tel:+918119934105" class="quick-option">
                            <i class="fas fa-phone-alt"></i>
                            <span>Contact Support</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Footer -->
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