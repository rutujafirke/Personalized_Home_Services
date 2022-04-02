<!DOCTYPE html>
<%@page import="com.homemate.entities.OrderBookingTbl"%>
<%@page import="com.homemate.entities.CustomerTbl"%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>HomeMate - Feedback</title>
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
            <%
                
            	 OrderBookingTbl tbl = (OrderBookingTbl)request.getAttribute("feedback");
            %>
            
            
            <!-- About Start -->
            <!-- Contact Start -->
            <div class="contact">
                <div class="container">
                    <div class="section-header">
                        <p><b>Feedback</b></p>
                        <h2>Send valuable  feedback Message</h2>
                    </div>
                    <div class="row ">
                        <div class="col-md-12">
                            <div class="contact-form text-center">
                                <form method="post" action="/feed" >
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <input type="text" value="${customer.getCustomerFirstname()}" class="form-control" placeholder="Your Name" required="required" readonly />
                                        </div>
                                        <div class="form-group col-md-6">
                                            <input type="email" value="${customer.getCustomerEmail()}" class="form-control" placeholder="Your Email" required="required" readonly />
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        
                                            <input type="hidden" value="<%=tbl.getBookingId() %>" class="form-control" name="bookid" placeholder="booking id" required="required" readonly />
                                      
                                        <div class="form-group col-md-6">
                                            <input type="number" class="form-control" name="rating" id="feedbackrating" placeholder="Enter rating out of five"  min="1" max="5" required >
                                        </div>
                                    </div>
                                   
                                    <div class="form-group">
                                        <textarea class="form-control" rows="6" name="message" placeholder="Message" required="required" ></textarea>
                                    </div>
                                    <div><button class="btn" type="submit">Send Message</button></div>
                                </form>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Contact End -->


            <!-- Footer Start -->
            <div class="footer" size>
                <div class="container">
                    <div class="row">
                        
                        <div class="col-md-6 col-lg-3">
                            <div class="footer-link">
                                <h2>Useful Link</h2>
                                <a href="about.html">About Us</a>
                               
                                <a href="services.html">Our Services</a>
                                
                                <a href="contacts.html">Contact Us</a>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                            <div class="footer-link">
                                <h2>Useful Link</h2>
                               
                                <a href="clientsreview.html">Clients Review</a>
                               
                                <!-- <a href="">Customer Support</a> -->
                              
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
