
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
							<a href="#"> <i><b>H</b>ome<b>M</b>ate</i> <!-- <img src="img/logo.png" alt="Logo"> -->
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
										<a href="#" class="nav-link dropdown-toggle"
											data-toggle="dropdown">Profile</a>
										<div class="dropdown-menu">
											<a href="/editVendorProfile" class="dropdown-item">Edit
												Profile</a> <a href="/logout" class="dropdown-item">Logout</a>
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
	<div class="container mt-4">
		<div class="row">
			<div class="col-lg-3 my-lg-0 my-md-1">
				<div id="sidebar" class="bg-purple">
					<div class="h4 text-white">Vendor Account</div>
					<ul>
						<li class="active"><a href="/vendorhome"
							class="text-decoration-none d-flex align-items-start">
								<div class="fas fa-box pt-2 me-3"></div>
								<div class="d-flex flex-column">
									<div class="link">My Account</div>
									<div class="link-desc">Vendor Details</div>
								</div>
						</a></li>

						<li><a href="/getServices"
							class="text-decoration-none d-flex align-items-start">
								<div class="fas fa-box-open pt-2 me-3"></div>
								<div class="d-flex flex-column">
									<div class="link">Manage Services</div>
									<div class="link-desc">Add,Edit & Delete Services</div>
								</div>
						</a></li>
						<li><a href="/orderBooking"
							class="text-decoration-none d-flex align-items-start">
								<div class="far fa-address-book pt-2 me-3"></div>
								<div class="d-flex flex-column">
									<div class="link">My Appointment</div>
									<div class="link-desc">Accept & Reject Request</div>
								</div>
						</a></li>
						<li><a href="/vendorFeedback"
							class="text-decoration-none d-flex align-items-start">
								<div class="fas fa-headset pt-2 me-3"></div>
								<div class="d-flex flex-column">
									<div class="link">FeedBack</div>
									<div class="link-desc">View FeedBack</div>
								</div>
						</a></li>




					</ul>
				</div>
			</div>
			<%
			HttpSession session1 = request.getSession();
			VendorTbl vendor = (VendorTbl) session.getAttribute("vendor");
			%>
			<div class="col-lg-9 my-lg-0 my-1">
				<div id="main-content" class="bg-white border">
					<div class="d-flex flex-column">
						<div class="h5">
							Hello
							<%=vendor.getVendorFirstname()%></div>
						<div>
							Logged in as:
							<%=vendor.getVendorEmail()%></div>
						<div class="service">
							<div class="container">
								<table class="table table-border">
									<tr>
										<th>Service Type</th>
										<th>Service Cost</th>
										<th>Service Discount</th>
										<th>Service Time</th>
										<th>Delete Service</th>
										<th>Edit Service</th>
									</tr>

									<%
									List<ServicesTbl> list = (List<ServicesTbl>) request.getAttribute("services");

									for (ServicesTbl service : list) {
									%>
									<tr>
										<td><%=service.getServiceType()%></td>
										<td><%=service.getServiceCost()%></td>
										<td><%=service.getServiceDiscount()%></td>
										<td><%=service.getServiceTimeHrs()%></td>
										<td><a href="/deleteService/<%=service.getServiceId()%>"
											class="btn btn-primary btn-block" type="submit"> Delete </a></td>
										<td><a href="/edit?id=<%=service.getServiceId()%>&type=<%=service.getServiceType() %>"
											class="btn btn-primary btn-block" type="submit"> Edit </a></td>
										<%
										}
										%>
									</tr>
								</table>
								<br> <br>

								<h3>Add Service</h3>
								<form action="insertService" method="post">
									<div class="row">
										<div class="form-group col">
											<label for="serviceType">Service Type <i
												style="color: red;">*</i></label><select class="form-control"
												id="serviceType" name="serviceType">
												<option value="Common Room Cleaning">Common Room Cleaning</option>
												<option value="Bedroom Cleaning">Bedroom Cleaning</option>
												<option value="Kitchen Cleaning">Kitchen Cleaning</option>
												<option value="Bathroom cleaning">Bathroom cleaning</option>
											</select>
										</div>
										<div class="form-group col">
											<label for="cost">Service Cost<i style="color: red;">*</i></label>
											<input type="text" class="form-control" name="cost" required
												placeholder="Cost">
										</div>
									</div>
									<div class="row">
										<div class="form-group col">
											<label for="discount">Discount </label> <input type="text"
												class="form-control" name="discount" required
												placeholder="Disount">
										</div>
										<div class="form-group col">
											<label for="email">Service Time<i style="color: red;">*</i></label>
											<input type="text" class="form-control" name="time" required
												placeholder="Time in hr">
										</div>
									</div>
									<div>
										<button class="btn btn-success" style="font-size: large;"
											type="submit">Submit</button>
									</div>

								</form>

							</div>
							<!-- Service End -->

						</div>


					</div>


				</div>
			</div>
		</div>
	</div>
	</div>





	<!-- Feature Start -->

	<!-- Feature End -->


	<!-- FAQs Start -->

	<!-- FAQs End -->


	<!-- Pricing Plan Start -->



	<!-- Pricing Plan End -->


	<!-- Newsletter Start -->

	<!-- Newsletter End -->


	<!-- Testimonial Start -->


	<!-- Call to Action Start -->


	<!-- Blog Start -->

	<!-- Blog End -->


	<!-- Footer Start -->
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="footer" size>
		<div class="container">
			<div class="row">

				<div class="col-md-6 col-lg-3">
					<div class="footer-link">
						<h2>Useful Link</h2>
						<a href="about.html">About Us</a> <a href="services.html">Our
							Services</a> <a href="contacts.html">Contact Us</a>
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
