<%@page import="com.homemate.entities.ServicesTbl"%>
<%@page import="com.homemate.entities.OrderBookingTbl"%>
<%@page import="com.homemate.entities.VendorTbl"%>
<%@page import="com.homemate.entities.CustomerTbl"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>CleanMe - Cleaning Company Website Template</title>
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
             <!-- Page Header Start -->
             <div class="text-center">
                <div class="container">
                    <div class="row">
                        <div class="section-header">
							<br><br>
                            <h2><b>Services Providers</b></h2>
                        </div>
                        <!-- <div class="col-12">
                            <a href="">Home</a>
                            <a href="">Contact Us</a>
                        </div> -->
                    </div>
                </div>
            </div>
            <!-- Page Header End -->
            
            <div class="container rounded bg-white mt-5 mb-5">
                <center>
               <table>
                   <tbody class="table table-bordered" border="2">
                       <tr>
                           <th>Service Name</th>
                           <th>Service Cost</th>
                           <th>Service Discount</th>
                           <th>Service Provider</th>
                           <th>Time Required</th>
                           <th>Book Now</th>
                          
                       </tr>
						<%
	
						List<ServicesTbl> services = (List<ServicesTbl>) request.getAttribute("servicename");
						for(ServicesTbl service : services )
						{
							%>
							<tr>
                                
								<td><p><%= service.getServiceType() %></p></td>
								<td><p><%= service.getServiceCost() %></p></td>
								<td><p><%= service.getServiceDiscount()%></p></td>
								<td><p><%= service.getVendorTbl().getVendorFirstname() %></p></td>
								<td><p><%= service.getServiceTimeHrs() %></p></td>
                                
								
								<td> <a href="/servicebookpage?serviceid=<%= service.getServiceId()%>&custid=<%= customer.getCustomerId()%>" class="btn btn-primary btn-block" type="submit"> Book </a></td>
                                
                            <%
						}
					%>
                    
					   </tr>
                   </tbody>
               </table> 
            </center>
            </div>
            </div>
            </div>
 
     <!-- Sign Up End -->

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
