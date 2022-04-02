<%@page import="com.homemate.entities.CustomerTbl"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>HomeMate Cleaning Services</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Cleaning Company Website Template" name="keywords">
        <meta content="Cleaning Company Website Template" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;300;400&display=swap" rel="stylesheet">
        
        <!-- CSS Libraries -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>
        <div class="wrapper">
            <!-- Header Start -->
            <div class="header home">
                <div class="container-fluid">
                    <div class="header-top row align-items-center">
                        <div class="col-lg-3">
                            <div class="brand">
                                <a href="/">
                                    <i><b>H</b>ome<b>M</b>ate</i>
                                    <!-- <img src="img/logo" alt="Logo"> -->
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-9">
                            
                            <div class="navbar navbar-expand-lg bg-light navbar-light">
                                <a href="#" class="navbar-brand">MENU</a>
                                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                                    <span class="navbar-toggler-icon"></span>
                                </button>

                                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                                    <div class="navbar-nav ml-auto">
                                        <a href="/home" class="nav-item nav-link active">Home</a>
                                        <a href="/servicelogin" class="nav-item nav-link">Services</a>
                                        <!-- <a href="Login.html" class="nav-item nav-link">Login</a>   -->                                      
                                        <!-- <a href="" class="nav-item nav-link">Order</a> -->
                                        <!-- <a href="profile.html" class="nav-item nav-link">Profile</a>   -->
                                    <%
                                        CustomerTbl customer = (CustomerTbl)session.getAttribute("customer");
                                    %>
                                        <div class="nav-item dropdown">
                                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown"> Hello <%=customer.getCustomerFirstname()%></a>
                                            <div class="dropdown-menu">
                                                <a href="/customerprofile" class="dropdown-item">View Profile</a>
                                                <a href="/logout" class="dropdown-item">Logout</a>
                                                
                                            </div>
                                        </div>
                                                                           
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- <div class="hero row align-items-center">
                        <div class="col-md-7">
                            <h2>Best & Trusted</h2>
                            <h2><span>Cleaning</span> Service</h2>
                            <p>Lorem ipsum dolor sit amet elit pretium facilisis ornare</p>
                            <a class="btn" href="">Explore Now</a>
                        </div>
                    </div> -->
                </div>
                
            </div>
            <!-- Header End -->
             
            <!-- Page Header Start -->
            <!-- <div class="page-header">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <h2>Our Services</h2>
                        </div>
                        <div class="col-12">
                            <a href="">Home</a>
                            <a href="">Our Services</a>
                        </div>
                    </div>
                </div>
            </div> -->
            <!-- Page Header End -->
            <!-- About Start -->
            <!-- <div class="about">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5 col-md-6">
                            <div class="about-img">
                                <img src="img/about.jpg" alt="Image">
                            </div>
                        </div>
                        <div class="col-lg-7 col-md-6">
                            <div class="about-text">
                                <h2><span>10</span> Years Experience</h2>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec pretium mi. Curabitur facilisis ornare velit non vulputate. Aliquam metus tortor, auctor id gravida condimentum, viverra quis sem.
                                </p>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec pretium mi. Curabitur facilisis ornare velit non vulputate. Aliquam metus tortor, auctor id gravida condimentum, viverra quis sem. Curabitur non nisl nec nisi scelerisque maximus. Aenean consectetur convallis porttitor. Aliquam interdum at lacus non blandit.
                                </p>
                                <a class="btn" href="">Learn More</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div> -->
            <!-- About End -->
                        <!-- Pricing Plan Start -->
                        <!-- <div class="price">
                            <div class="container">
                                <div class="section-header">
                                    <p>Pricing Plan</p>
                                    <h2>No Extra Hidden Charges</h2>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="price-item">
                                            <div class="price-header">
                                                <div class="price-icon">
                                                    <i class="fa fa-home"></i>
                                                </div>
                                                <div class="price-title">
                                                    <h2>Standard</h2>
                                                </div>
                                                <div class="price-pricing">
                                                    <h2><small>$</small>99</h2>
                                                </div>
                                            </div>
                                            <div class="price-body">
                                                <div class="price-des">
                                                    <ul>
                                                        <li>3 Bedrooms cleaning</li>
                                                        <li>2 Bathrooms cleaning</li>
                                                        <li>1 Living room Cleaning</li>
                                                        <li>Vacuum Cleaning</li>
                                                        <li>Within 6 Hours</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="price-footer">
                                                <div class="price-action">
                                                    <a href=""><i class="fa fa-shopping-cart"></i>Book Now</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="price-item featured-item">
                                            <div class="price-header">
                                                <div class="price-icon">
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <div class="price-title">
                                                    <h2>Premium</h2>
                                                </div>
                                                <div class="price-pricing">
                                                    <h2><small>$</small>149</h2>
                                                </div>
                                            </div>
                                            <div class="price-body">
                                                <div class="price-des">
                                                    <ul>
                                                        <li>5 Bedrooms cleaning</li>
                                                        <li>3 Bathrooms cleaning</li>
                                                        <li>2 Living room Cleaning</li>
                                                        <li>Vacuum Cleaning</li>
                                                        <li>Within 6 Hours</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="price-footer">
                                                <div class="price-action">
                                                    <a href=""><i class="fa fa-shopping-cart"></i>Book Now</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="price-item">
                                            <div class="price-header">
                                                <div class="price-icon">
                                                    <i class="fa fa-gift"></i>
                                                </div>
                                                <div class="price-title">
                                                    <h2>Enterprise</h2>
                                                </div>
                                                <div class="price-pricing">
                                                    <h2><small>$</small>199</h2>
                                                </div>
                                            </div>
                                            <div class="price-body">
                                                <div class="price-des">
                                                    <ul>
                                                        <li>8 Bedrooms cleaning</li>
                                                        <li>5 Bathrooms cleaning</li>
                                                        <li>3 Living room Cleaning</li>
                                                        <li>Vacuum Cleaning</li>
                                                        <li>Within 12 Hours</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="price-footer">
                                                <div class="price-action">
                                                    <a href=""><i class="fa fa-shopping-cart"></i>Book Now</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> -->
                        <!-- Pricing Plan End -->

<!-- Service Start -->
<div class="service">
    <div class="container">
        <div class="section-header">
            <p><b>Our Services</b></p>
            <h2>Provide Services Worldwide</h2>
        </div>
        <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="service-item">
                    <img src="img/service-1.jpg" alt="Service">
                    <h3>Bedroom Cleaning</h3>
                    
                    <a class="btn" href="/getvendors?servicename=Bedroom Cleaning&custid=${customer.getCustomerId()}">Book Now</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="service-item">
                    <img src="img/service-2.jpg" alt="Service">
                    <h3>Before Festive Cleaning</h3>
                   
                    <a class="btn" href="/getvendors?servicename=Before Festive Cleaning">Book Now</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="service-item">
                    <img src="img/service-3.jpg" alt="Service">
                    <h3>Common Room Cleaning</h3>
                    <a class="btn" href="/getvendors?servicename=Common Room Cleaning">Book Now</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="service-item">
                    <img src="img/service-4.jpg" alt="Service">
                    <h3>Living Room Cleaning</h3>
                    <a class="btn" href="/getvendors?servicename=Living Room Cleaning">Book Now</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="service-item">
                    <img src="img/service-5.jpg" alt="Service">
                    <h3>Kitchen Cleaning</h3>
                    
                    <a class="btn" href="/getvendors?servicename=Kitchen Cleaning">Book Now</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="service-item">
                    <img src="img/service-6.jpg" alt="Service">
                    <h3> Bathroom Cleaning</h3>
                    
                    <a class="btn" href="/getvendors?servicename=Bathroom Cleaning">Book Now</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="service-item">
                    <img src="img/service-7.jpg" alt="Service">
                    <h3>Pest Control</h3>
                    <a class="btn" href="/getvendors?servicename=Pest Control">Book Now</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Service End -->
            
            <!-- Feature Start -->
            
            <!-- Call to Action End -->


            <!-- Blog Start -->
            
            <!-- Blog End -->


 <!-- Footer Start -->
 <div class="footer" size>
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-lg-4">
                <div class="footer-contact">
                    <h2>Get In Touch</h2>
                    <p><i class="fa fa-map-marker-alt"></i>IET Pune,India</p>
                    <p><i class="fa fa-phone-alt"></i>+919873456787</p>
                    <p><i class="fa fa-envelope"></i>homematecleaningservices@gmail.com</p>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="footer-link">
                    <h2>Useful Link</h2>
                    <a href="/aboutus">About Us</a>
                   
                    <a href="/service">Our Services</a>
                    
                    <a href="/contactus">Contact Us</a>
                </div>
            </div>
            
            
        </div>
    </div>
    
    <!-- <div class="container copyright">
        <div class="row">
            <div class="col-md-6">
                <p>&copy; <a href="https://htmlcodex.com">HTML Codex</a>, All Right Reserved.</p>
            </div>
            <div class="col-md-6">
                <p>Designed By <a href="https://htmlcodex.com">HTML Codex</a></p>
            </div>
        </div>
    </div> -->
</div>
<!-- Footer End -->


</div>
            
            
        </div>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/isotope/isotope.pkgd.min.js"></script>
        <script src="lib/lightbox/js/lightbox.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>
</html>
