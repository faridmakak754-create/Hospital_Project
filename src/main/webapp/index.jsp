<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FIMS -  Farid Institute Of Medical Sciences</title>
     <link rel="stylesheet" href="index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

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
                    <input type="text" class="search-input" name="search" 
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
                <li><a href="index.jsp" class="active">Home</a></li>
                <li><a href="#">Notices</a></li>
                <li><a href="about.html">About Us</a></li>
                <li><a href="#">Departments</a></li>
                <li><a href="#">Patient Care</a></li>
                <li><a href="patientregister.jsp">Appointments</a></li>
                <li><a href=""> Contact us</a></li>
                
            </ul>
        </div>
    </nav>
    
    <!-- Hero Section -->
    <section class="hero">
        <div class="container">
            <div class="hero-content">
                <h1 class="hero-title">Excellence in Healthcare & Medical Education</h1>
                <p class="hero-subtitle">India's Premier Medical Institute - Serving the Nation Since 2020</p>
                <a href="patientregister.jsp" class="hero-button" target="blank">Book an Appointment</a>
            </div>
        </div>
    </section>
    
    <!-- Quick Links Section -->
    <section class="quick-links">
        <div class="container">
            <div class="quick-links-container">
                <div class="quick-link-item">
                    <div class="quick-link-icon">👨‍⚕️</div>
                    <a href="#"><div class="quick-link-title">Faculty</div></a>
                </div>
                <div class="quick-link-item">
                    <div class="quick-link-icon">👨‍💼</div>
                     <a href="#"><div class="quick-link-title">Patient</div></a>
                </div>
                <div class="quick-link-item">
                    <div class="quick-link-icon">🎓</div>
                     <a href="#"><div class="quick-link-title">Student</div></a>
                </div>
                <div class="quick-link-item">
                    <div class="quick-link-icon">👨‍💻</div>
                     <a href="#"><div class="quick-link-title">Employee</div></a>
                </div>
                <div class="quick-link-item">
                    <div class="quick-link-icon">🏢</div>
                     <a href="#"><div class="quick-link-title">Vendor</div></a>
                </div>
                <div class="quick-link-item">
                    <div class="quick-link-icon">👀</div>
                    <a href="#"> <div class="quick-link-title">Visitor</div></a>
                </div>
            </div>
        </div>
    
   
   <!-- Three Panel Slice Layout -->
<section class="three-panel-slice">
        <div class="container">
            <h2 class="section-title">Hospital Information</h2>
            <div class="panel-container">
                <!-- Left Panel - OPD Schedule -->
                <div class="panel">
                    <div class="panel-header">
                        <i class="fas fa-calendar-alt"></i> OPD Schedule
                    </div>
                    <div class="panel-content" id="opd-schedule-content">
                        <div class="panel-item">
                            <div class="panel-icon">
                                <i class="fas fa-stethoscope"></i>
                            </div>
                            <div class="panel-text">
                                <h4>General Medicine</h4>
                                <p>Monday to Saturday: 9:00 AM - 1:00 PM</p>
                            </div>
                        </div>
                        <div class="panel-item">
                            <div class="panel-icon">
                                <i class="fas fa-heartbeat"></i>
                            </div>
                            <div class="panel-text">
                                <h4>Cardiology</h4>
                                <p>Monday, Wednesday, Friday: 10:00 AM - 2:00 PM</p>
                            </div>
                        </div>
                        <div class="panel-item">
                            <div class="panel-icon">
                                <i class="fas fa-brain"></i>
                            </div>
                            <div class="panel-text">
                                <h4>Neurology</h4>
                                <p>Tuesday, Thursday: 11:00 AM - 3:00 PM</p>
                            </div>
                        </div>
                        <a href="#" class="panel-button">View Full Schedule</a>
                    </div>
                </div>
                
                <!-- Middle Panel - Notices -->
                <div class="panel">
                    <div class="panel-header">
                        <i class="fas fa-bullhorn"></i> Latest Notices
                    </div>
                    <div class="panel-content" id="notices-content">
                        <div class="panel-item">
                            <div class="panel-icon">
                                <i class="fas fa-exclamation-circle"></i>
                            </div>
                            <div class="panel-text">
                                <h4>New Visiting Hours</h4>
                                <p>Effective from 1st October: 4:00 PM - 6:00 PM</p>
                            </div>
                        </div>
                        <div class="panel-item">
                            <div class="panel-icon">
                                <i class="fas fa-calendar-check"></i>
                            </div>
                            <div class="panel-text">
                                <h4>Health Camp</h4>
                                <p>Free health check-up camp on 15th October</p>
                            </div>
                        </div>
                        <div class="panel-item">
                            <div class="panel-icon">
                                <i class="fas fa-user-md"></i>
                            </div>
                            <div class="panel-text">
                                <h4>New Specialist Joining</h4>
                                <p>Dr. Sharma joins as Senior Cardiologist</p>
                            </div>
                        </div>
                        <a href="#" class="panel-button">View All Notices</a>
                    </div>
                </div>
                
                <!-- Right Panel - Video Section -->
                <div class="panel video-panel">
                    <div class="panel-header">
                        <i class="fas fa-video"></i> Video Section
                    </div>
                    <div class="panel-content">
                        <div class="video-container">
                           <iframe width="560" height="300" src="https://www.youtube.com/embed/FG3ohfDASao?si=le0tCoSCV91F2axv&amp;start=60" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                        </div>
                        <div class="video-info">
                            <h3 class="video-title">Surgery With Mr Beast</h3>
                            <p class="video-description">Watch our latest documentary showcasing cutting-edge medical research and innovations happening at FIMS, LILONG.</p>
                            <div class="video-links">
                                <a href="https://youtu.be/2v3mLxd2FfA?si=tni1us0tWEI4gqiJ" class="video-link" target="blank">
                                    <i class="fas fa-play-circle"></i>
                                    <span>Hospital Bean</span>
                                </a>
                                <a href="#" class="video-link">
                                    <i class="fas fa-play-circle"></i>
                                    <span>Patient Success Stories</span>
                                </a>
                                <a href="#" class="video-link">
                                    <i class="fas fa-play-circle"></i>
                                    <span>Medical Research Updates</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    

    <!-- Gallery Section -->
    <section class="gallery-section">
        <div class="container">
            <h2 class="section-title">Gallery</h2>
            <div class="gallery-container">
                <div class="gallery-item">
                    <img src="fims.jpg" alt="AIIMS Campus">
                    <div class="gallery-overlay">
                        <h3>Main Campus</h3>
                        <p>View of AIIMS main building</p>
                    </div>
                </div>
                <div class="gallery-item">
                    <img src="recearch.jpg" alt="Research Lab">
                    <div class="gallery-overlay">
                        <h3>Research Laboratory</h3>
                        <p>Advanced medical research facilities</p>
                    </div>
                </div>
                <div class="gallery-item">
                    <img src="medical conference.jpg" alt="Medical Conference">
                    <div class="gallery-overlay">
                        <h3>Medical Conference</h3>
                        <p>International medical symposium</p>
                    </div>
                </div>
                <div class="gallery-item">
                    <img src="patientcare.jpg" alt="Patient Care">
                    <div class="gallery-overlay">
                        <h3>Patient Care</h3>
                        <p>World-class healthcare services</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    
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
