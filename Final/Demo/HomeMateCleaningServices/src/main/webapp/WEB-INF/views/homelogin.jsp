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
            
            
            
            <!-- About Start -->
            
                       
                        
            <div class="about">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5 col-md-6">
                           
                            <html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Responsive Image Slider | Autoplay With Navigation Visibility</title>
    <link rel="stylesheet" href="style.css">
  </head>
  <body>

    <div class="img-slider">
      <div class="slide active">
        <img src="img/image 1.jpg" alt="">
        <div class="info">
            <h2>Satisfaction Guaranteed</h2>
            <br>
            <h3>We Treat Your Home Like Our Home</h3>
          <p>Our cleaning crews are professionally trained, and if you’re ever unhappy with any area we’ve cleaned, we’ll return the next day and reclean it.</p>
        <h4>We Are Fully Bonded and Insured</h4>
        <p>At The Cleaning Authority, we are fully bonded and insured, meaning you can have peace of mind when we enter your home.</p>
        <h5>Our Passion for the Environment</h5>
        <p>We as a company are committed to using cleaning products that are environmentally responsible, sustainable, and safe for the Earth.</p>
    </div>
      </div>
      <div class="slide">
        <img src="img/image3.jpg" alt="">
        <div class="info">
            <h2>Why HomeMate?</h2>
            <br>
            <h3>Transparent pricing</h3>
          <p>See fixed prices before you book. No hidden charges..</p>
          <h4>Experts only</h4>
          <p>Our professionals are well trained and have on-job expertise.</p>
          <h5>Fully equipped</h5>
          <p>We bring everything needed to get the job done well.</p>
        </div>
      </div>
      <div class="slide">
        <img src="img/image 2.jpg" alt="">
        <div class="info">
            <h2>How Does It Works?</h2>
            <br>
            <h3>Tell us about the job</h3>
          <p>Tell us a few details about the job and pick the date and time you'd like to schedule your appointment.</p>
          <br>
          <br>
          <h4>Connect with a Professional</h4>
          <p>We'll connect you with a toprated pro, or you can read real customer reviews and request the pro you'd like to hire.</p>
          <br>
          <br>
          <h5>Sit back and relax</h5>
          <p>An experienced, fully-equipped housekeeping professional will be there on time. </p>
      </div>
      </div>
      <div class="navigation">
        <div class="btn active"></div>
        <div class="btn"></div>
        <div class="btn"></div>
      </div>
    </div>

    <script type="text/javascript">
    var slides = document.querySelectorAll('.slide');
    var btns = document.querySelectorAll('.btn');
    let currentSlide = 1;

    // Javascript for image slider manual navigation
    var manualNav = function(manual){
      slides.forEach((slide) => {
        slide.classList.remove('active');

        btns.forEach((btn) => {
          btn.classList.remove('active');
        });
      });

      slides[manual].classList.add('active');
      btns[manual].classList.add('active');
    }

    btns.forEach((btn, i) => {
      btn.addEventListener("click", () => {
        manualNav(i);
        currentSlide = i;
      });
    });

    // Javascript for image slider autoplay navigation
    var repeat = function(activeClass){
      let active = document.getElementsByClassName('active');
      let i = 1;

      var repeater = () => {
        setTimeout(function(){
          [...active].forEach((activeSlide) => {
            activeSlide.classList.remove('active');
          });

        slides[i].classList.add('active');
        btns[i].classList.add('active');
        i++;

        if(slides.length == i){
          i = 0;
        }
        if(i >= slides.length){
          return;
        }
        repeater();
      }, 10000);
      }
      repeater();
    }
    repeat();
    </script>
<!-- Home deep cleaning includes everything that a standard cleaning by a house maid will not For starters, the equipment and the number of people involved in the process are more. A manual cleaning would usually just involve
sweeping the floor, dusting and perhaps Cleaning the ceiling fans grudgingly. Home deep cleaning includes cleaning every nook and corner ofyour house in the best way possible. -->
  </body>
</html>
  
                        </div>
                    </div>
                </div>
            </div>
                                
                        <!-- Pricing Plan Start -->
                        <div class="price">
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
                                                    <h2>Silver</h2>
                                                </div>
                                                <div class="price-pricing">
                                                    <h2><small>Rs</small>999</h2>
                                                </div>
                                            </div>
                                            <div class="price-body">
                                                <div class="price-des">
                                                    <ul>
                                                        <li><b>Outdoor</b> </li>
                                                        <li>Lawn trimming</li>
                                                        <li>Leaf Blowing </li>
                                                        <li>House Exterior</li>
                                                        <li>Within 6 Hours</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="price-footer">
                                                <div class="price-action">
                                                    <a href="services.html"><i class="fa fa-shopping-cart"></i>Book Now</a>
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
                                                    <h2>Gold</h2>
                                                </div>
                                                <div class="price-pricing">
                                                    <h2><small>Rs</small>1099</h2>
                                                </div>
                                            </div>
                                            <div class="price-body">
                                                <div class="price-des">
                                                    <ul>
                                                        <li><b>Indoor</b></li>
                                                        <li>Kitchen and Bathroom deep clean</li>
                                                        <li>Furniture reconditioning</li>
                                                        <li>Glass and doors polishing</li>
                                                        <li>Within 6 Hours</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="price-footer">
                                                <div class="price-action">
                                                    <a href="services.html"><i class="fa fa-shopping-cart"></i>Book Now</a>
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
                                                    <h2>Platinum</h2>
                                                </div>
                                                <div class="price-pricing">
                                                    <h2><small>Rs</small>2499</h2>
                                                </div>
                                            </div>
                                            <div class="price-body">
                                                <div class="price-des">
                                                    <ul>
                                                        <li><b>Indoor and outdoor </b></li>
                                                        <li>Sanitation and sewage </li>
                                                        <li>Pest control and fumigation</li>
                                                        <li>Glass and furniture polishing</li>
                                                        <li>Within 12 hours </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="price-footer">
                                                <div class="price-action">
                                                    <a href="services.html"><i class="fa fa-shopping-cart"></i>Book Now</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Pricing Plan End -->


            
            <!-- Feature Start -->
            <div class="feature">
                <div class="container">
                    <div class="row">
                        <div class="col-md-5">
                            <div class="section-header left">
                                <p>Why choose HomeMate?</p>
                                <h2>Expert Cleaners and World Class Services</h2>
                            </div>
                            <p>
                            <b> Complete cleaning and sanitation:</b> From pressure vacuuming to sanitizing the entire house, the
HomeMate cleaning professionals make sure to deep clean your home thoroughly that provides lasting effects for 2-3 months.
<br>	 
<b> Insurance Against Damage:</b> With HomeMate you get insurance coverage up to Rs. 10,000
on every booking against any damage.
<br>
<b> Usage of Professional grade chemicals:</b> Considering the hygiene of your house, 
we at HomeMate only use Professional grade non-hozordous chemicals for home deep cleaning.
<br>
<b> Flexibility:</b> HomeMate provides you a comprehensive professional home cleaning service
 to meet all your cleaning needs at your chosen location and time.
</p>
                            <a class="btn" href="">Learn More</a>
                        </div>
                        <div class="col-md-7">
                            <div class="row align-items-center feature-item">
                                <div class="col-5">
                                    <img src="img/feature-1.jpg" alt="Feature">
                                </div>
                                <div class="col-7">
                                    <h3>Well-Trained & Verified Cleaners </h3>
                                    <p>
                                        All HomeMate professionals are trained and taken through levels of background verification before getting on board to ensure the quality of work.
                                    </p>
                                </div>
                            </div>
                            <div class="row align-items-center feature-item">
                                <div class="col-5">
                                    <img src="img/feature-2.jpg" alt="Feature">
                                </div>
                                <div class="col-7">
                                    <h3>Reasonable Prices</h3>
                                    <p>
                                        We ensure to keep our prices as competitive as possible while maintaining standards.
                                    </p>
                                </div>
                            </div>
                            <div class="row align-items-center feature-item">
                                <div class="col-5">
                                    <img src="img/feature-3.jpg" alt="Feature">
                                </div>
                                <div class="col-7">
                                    <h3>Quick & Best Services</h3>
                                    <p>
                                        Customer ease and satisfaction is our first priority and to maintain that we ensure streamlined dispatching of service 
                                        and quality control.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Feature End -->
        

            <!-- FAQs Start -->
            <div class="faqs">
                <div class="container">
                    <div class="row">
                        <div class="col-md-5">
                            <div class="section-header left">
                                <p>You Might Ask</p>
                                <h2>Frequently Asked Questions</h2>
                            </div>
                            <img src="img/faqs.jpg" alt="Image">
                        </div>
                        <div class="col-md-7">
                            <div id="accordion">
                                <div class="card">
                                    <div class="card-header">
                                        <a class="card-link collapsed" data-toggle="collapse" href="#collapseOne" aria-expanded="true">
                                            <span>1</span> What can home deep cleaning do that my maid can't?
                                        </a>
                                    </div>
                                    <div id="collapseOne" class="collapse show" data-parent="#accordion">
                                        <div class="card-body">
                                           
Home deep cleaning includes everything that a standard cleaning by a house
maid will not For starters, the equipment and the number of people involved
in the process are more. A manual cleaning would usually just involve
sweeping the floor, dusting and perhaps Cleaning the ceiling fans grudgingly.
Home deep cleaning includes cleaning every nook and corner ofyour house in
the best way possible.
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header">
                                        <a class="card-link" data-toggle="collapse" href="#collapseTwo">
                                            <span>2</span> What is the HomeMate’s promise?
                                        </a>
                                    </div>
                                    <div id="collapseTwo" class="collapse" data-parent="#accordion">
                                        <div class="card-body">
                                            HomeMate's promise with home deep cleaning service (and every other
                                            offering we have) is to give you: highly trained professionals who hold the
                                            highest standards of quality, high quality of products— cleaning agents that
                                            are professional grade & customer protection against any damages.
                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header">
                                        <a class="card-link" data-toggle="collapse" href="#collapseThree">
                                            <span>3</span> What does home deep cleaning not include? 
                                        </a>
                                    </div>
                                    <div id="collapseThree" class="collapse" data-parent="#accordion">
                                        <div class="card-body">
                                        
If you book the home deep cleaning service from HomeMate, here is
what is not included in the service: cleaning of utensils, walls and ceiling, floor
polishing, wet shampooing of blinds, choir, sofa and carpets & polishing of
wooden furniture.
    
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header">
                                        <a class="card-link" data-toggle="collapse" href="#collapseFour">
                                            <span>4</span> How much time will it take to get my house deep cleaned? 
                                        </a>
                                    </div>
                                    <div id="collapseFour" class="collapse" data-parent="#accordion">
                                        <div class="card-body">
                                            It depends on the service, the package you choose and the size of your house
(number of bedrooms). At the time of booking, we give you a fair idea of the
duration of the service in the ”view details.” section. On an average, home
deep cleaning takes about 6 hours.

                                        </div>
                                    </div>
                                </div>
                                
                            <a class="btn" href="">Ask more</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- FAQs End -->
            
            
            <!-- Pricing Plan Start -->
            
           
        
            <!-- Pricing Plan End -->
            
            
            <!-- Newsletter Start -->
            
            <!-- Newsletter End -->


            <!-- Testimonial Start -->
            <div class="testimonial">
                <div class="container">
                    <div class="section-header">
                        <p>Client Review</p>
                        <h2>What our clients say.</h2>
                    </div>
                    <div class="owl-carousel testimonials-carousel">
                        <div class="testimonial-item">
                            <div class="testimonial-img">
                                <img src="img/testimonial-1.jpg" alt="">
                            </div>
                            <div class="testimonial-content">
                                <p>
                                    With a multi-million dollar property You can't afford to go for anything less than the best.
Pure elegance and class in cleaning services, punctual and professional in every aspect.

                                </p>
                                <h3>Tony Stark</h3>
                                <h4>CEO, Stark Tech.</h4>
                            </div>
                        </div>
                        <div class="testimonial-item">
                            <div class="testimonial-img">
                                <img src="img/testimonial-2.jpg" alt="">
                            </div>
                            <div class="testimonial-content">
                                <p>
                                    Being old fashioned, I like to do all the household chores and cleaning myself 
                                    but that's not always practical as expertise and the right tools are also important, 
                                    In an attempt to keep up with modern times, I was urged to give HomeMate a chance by a friend and
                                     I completely rely on them and love the ease with which I can book a service specific to my need.
                                </p>
                                <h3>Steve Rogers</h3>
                                <h4>Agent, S.H.I.E.L.D</h4>
                            </div>
                        </div>
                        <div class="testimonial-item">
                            <div class="testimonial-img">
                                <img src="img/testimonial-3.jpg" alt="">
                            </div>
                            <div class="testimonial-content">
                                <p>
                                    With the strenuous and demanding job that I have, I don't get much time to look after household chores
                                     and cleaning routines and yet as a woman I don't like anything less than perfect, HomeMate takes care of all 
                                     my household needs and keeps my house  a 'Home'.
                                </p>
                                <h3>Natasha Romanoff</h3>
                                <h4>Agent, S.H.I.E.L.D</h4>
                            </div>
                        </div>
                        <div class="testimonial-item">
                            <div class="testimonial-img">
                                <img src="img/testimonial-4.jpg" alt="">
                            </div>
                            <div class="testimonial-content">
                                <p>
                                    Perfection, precision and pristine, I like my work to have these basic qualities and want the same for 
                                    every aspect of my life. Hygiene and cleanliness can be provided by anyone but I happen to be picky and want
                                     everything according to my liking, HomeMate makes it easy by delivering everything specific to my instructions 
                                     and ensuring zero margin for error.
                                </p>
                                <h3>Dr. Stephen Strange</h3>
                                <h4>Neurosurgeon</h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Testimonial End -->
            
            
           


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
