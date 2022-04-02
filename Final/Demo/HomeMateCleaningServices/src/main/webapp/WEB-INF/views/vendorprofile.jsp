
<!DOCTYPE html>
<%@page import="com.homemate.entities.ServicesTbl"%>
<%@page import="java.util.List"%>
<%@page import="com.homemate.entities.VendorTbl"%>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Vendor Panel</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Cleaning Company Website Template" name="keywords">
<meta content="Cleaning Company Website Template" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;300;400&display=swap"
	rel="stylesheet">

<!-- CSS Libraries -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
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
							<a href="adminHome.html"> <i><b>H</b>ome<b>M</b>ate</i> <!-- <img src="img/logo.png" alt="Logo"> -->
							</a>
						</div>
					</div>
					<div class="col-lg-9">

						<div class="navbar navbar-expand-lg bg-light navbar-light">
							<a href="#" class="navbar-brand">MENU</a>
							<button type="button" class="navbar-toggler"
								data-toggle="collapse" data-target="#navbarCollapse">
								<span class="navbar-toggler-icon"></span>
							</button>

							<div class="collapse navbar-collapse justify-content-between"
								id="navbarCollapse">
								<div class="navbar-nav ml-auto">
									<a href="/vendorhome" class="nav-item nav-link active">Home</a>

									 <div class="nav-item dropdown">
                                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Profile</a>
                                            <div class="dropdown-menu">
                                                <a href="/editVendorProfile" class="dropdown-item">Edit Profile</a>
                                                <a href="/logout" class="dropdown-item">Logout</a>
                                            </div>
                                        </div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- Header End -->
		<!-- Page Header Start -->
		<div class="text-center">
			<div class="container">
				<div class="row">
					<div class="section-header">
						<h2>Profile</h2>
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
			<%
			VendorTbl vendor = (VendorTbl) request.getAttribute("profile");
			
			/* Blob image = null;

			byte[] imgData = null;

			image = vendor.getVendorImage();

			imgData = image.getBytes(1, (int) image.length());

			//String base64Image = Base64.getEncoder().encodeToString(imgData);

			// display the image

			response.setContentType("image/gif");

			OutputStream o = response.getOutputStream();

			o.write(imgData);

			o.flush();

			o.close(); */
			
			%>
			 <form action="/updateVendorProfile" method="post" >
			<div class="row">
				<div class="col-md-3 border-right">
					<div
						class="d-flex flex-column align-items-center text-center p-3 py-5"
						id="img">
						
						<img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"> 						
						
					</div>
				</div>
				
				<div class="col-md-8 border-right">
					<div class="p-3 py-5">
						<!-- <div class="d-flex justify-content-between align-items-center mb-3">
                                <b><h4 class="text-right">Profile Settings</h4></b>
                            </div> -->
						<div class="row mt-2">
							<div class="col-md-6">
								<label class="labels">First Name</label><input type="text" name="fname"
									class="form-control" value="<%=vendor.getVendorFirstname()%>">
							</div>
							<div class="col-md-6">
								<label class="labels">Last Name</label><input type="text" name="lname"
									class="form-control" value="<%=vendor.getVendorLastname()%>">
							</div>
						</div>
						<div class="row mt-2">
							<div class="col-md-6">
								<label class="labels">Mobile Number</label><input type="text" name="mobile"
									class="form-control" value="<%=vendor.getVendorMobile()%>">
							</div>
							<div class="col-md-6">
								<label class="labels">Email</label><input type="text" name="email"
									class="form-control" value="<%=vendor.getVendorEmail()%>">
							</div>
							<div class="col-md-12">
								<label class="labels">Address</label><input type="text" name="address"
									class="form-control" value="<%=vendor.getVendorAddress()%>">
							</div>
							<div class="col-md-6">
								<label class="labels">Pincode</label><input type="text" name="pincode"
									class="form-control" value="<%=vendor.getVendorPincode()%>">
							</div>
							<div class="col-md-6">
								<label class="labels">city</label><input type="text" name="city"
									class="form-control" value="<%=vendor.getVendorCity()%>">
							</div>
							
						<div class="mt-5 text-center">
							<button class="btn btn-success" style="font-size: large;" type="submit">Save Profile</button>

						</div>
					</div>
				</div>
				<!-- <div class="col-md-4">
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center experience"><span>Edit Experience</span><span class="border px-3 p-1 add-experience"><i class="fa fa-plus"></i>&nbsp;Experience</span></div><br>
                            <div class="col-md-12"><label class="labels">Experience in Designing</label><input type="text" class="form-control" placeholder="experience" value=""></div> <br>
                            <div class="col-md-12"><label class="labels">Additional Details</label><input type="text" class="form-control" placeholder="additional details" value=""></div>
                        </div>
                    </div> -->
			</div>
		</div>
		</form>
	</div>
	
	</div>

	<!-- Sign Up End -->

	<!-- Footer Start -->
	<div class="footer" size>
		<div class="container">
			<div class="row">

				<div class="col-md-6 col-lg-3">
					<div class="footer-link">
						<h2>Useful Link</h2>
						<a href="">About Us</a> <a href="">Our Services</a> <a href="">Contact
							Us</a>
					</div>
				</div>
				<div class="col-md-6 col-lg-3">
					<div class="footer-link">
						<h2>Useful Link</h2>

						<a href="">Clients Review</a>

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
		<!-- Footer End -->

		<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
	</div>

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="lib/isotope/isotope.pkgd.min.js"></script>
	<script src="lib/lightbox/js/lightbox.min.js"></script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>
</body>
</html>
