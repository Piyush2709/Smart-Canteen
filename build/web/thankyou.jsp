<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="author" content="Untree.co">
  <link rel="shortcut icon" href="favicon.png">

  <meta name="description" content="" />
  <meta name="keywords" content="bootstrap, bootstrap4" />

		<!-- Bootstrap CSS -->
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
		<link href="css/tiny-slider.css" rel="stylesheet">
		<link href="css/style.css" rel="stylesheet">
		<title>Smart Canteen</title>
                 <style>
    /* Your existing CSS styles */
    .product-section {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
    }
    .product-item {
      flex: 0 0 25%; /* Set width for responsiveness (adjust as needed) */
      display: flex;
      flex-direction: column;
      align-items: center;
      text-align: center;
      margin-bottom: 20px;
    }
    .product-item img {
      width: 200px; /* Set the image width as desired */
      height: 200px; /* Maintain aspect ratio */
    }
    .product-title {
      margin-top: 10px;
      font-size: 18px;
    }
    .product-price {
      margin-top: 5px;
      font-size: 16px;
    }
   .product-item {
    /* Other styles */

    /* Ensure the content inside aligns in a column */
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
}

.product-price {
    /* Style the product price */
    margin-top: 10px; /* Adjust spacing as needed */
    font-size: 16px;
}

.button-group {
        /* Style the button group */
        display: flex;
        flex-direction: row; /* Change to a row to align buttons horizontally */
        justify-content: center; /* Align buttons horizontally at the center */
        margin-top: 10px; /* Adjust spacing from the price */
    }

    .button-group button {
        /* Style the buttons */
        margin: 5px; /* Adjust margin for spacing between buttons */
        padding: 5px 10px; /* Adjust button padding */
        font-size: 14px; /* Adjust font size */
        width: 90px;
    }


  </style>
</head>

<body>
    <!-- Start Header/Navigation -->
    <!-- Start Header/Navigation -->
		<nav class="custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark" arial-label="Furni navigation bar">

			<div class="container">
				<a class="navbar-brand" href="index.jsp">Smart Canteen<span>.</span></a>

				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsFurni" aria-controls="navbarsFurni" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarsFurni">
					<ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
						<li class="nav-item">
							<a class="nav-link" href="index.jsp">Home</a>
						</li>
                                                <li><a class="nav-link" href="shop.jsp">Shop</a></li>
						
						<li><a class="nav-link" href="user_login.jsp">Logout</a></li>
						<li><a class="nav-link" href="feedback.jsp">Feedback</a></li>
					</ul>

					<ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
						<li><a class="nav-link" href="profile.jsp"><img src="images/user.svg"></a></li>
						<li class="nav-item active"><a class="nav-link active" href="cart.jsp"><img src="images/cart.svg"></a></li>
					</ul>
				</div>
			</div>
				
		</nav>
		<!-- End Header/Navigation -->

		

		

		<div class="untree_co-section">
    <div class="container">
      <div class="row">
        <div class="col-md-12 text-center pt-5">
          <span class="display-3 thankyou-icon text-primary">
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-cart-check mb-5" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
              <path fill-rule="evenodd" d="M11.354 5.646a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L8 8.293l2.646-2.647a.5.5 0 0 1 .708 0z"/>
              <path fill-rule="evenodd" d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
            </svg>
          </span>
          <h2 class="display-3 text-black">Thank you!</h2>
          <p class="lead mb-5">You order was successfuly completed.</p>
          <p><a href="shop.jsp" class="btn btn-sm btn-outline-black">Back to shop</a></p>
        </div>
      </div>
    </div>
  </div><br>
  <br><br><br>

		<!-- Start Footer Section -->
		<footer class="footer-section">
			<div class="container relative">

				<div class="sofa-img">
					<img src="images/canteen11.png" alt="Image" class="rounded mx-auto d-block">
				</div>

				

				<div class="row g-5 mb-5">
					<div class="col-lg-4">
						<div class="mb-4 footer-logo-wrap"><a href="#" class="footer-logo">Smart Canteen<span>.</span></a></div>
						<p class="mb-4">Feeding Your Hunger for Flavors, One Bite at a Time.</p>

											</div>

					<div class="col-lg-8">
    <div class="row links-wrap">
        <div class="col-md-6">
            <ul class="list-unstyled">
                <li style="display: inline-block;"><a class="nav-link" href="shop.html">Shop</a></li>
                <li style="display: inline-block;"><a class="nav-link" href="about.html">About us</a></li>
                 <li style="display: inline-block;"><a class="nav-link" href="user_login.jsp">Login</a></li>
                <li style="display: inline-block;"><a class="nav-link" href="contact.html">Feedback</a></li>
            </ul>
        </div>
        
    </div>
</div>


				</div>

				<div class="border-top copyright">
					<div class="row pt-4">
						<div class="col-lg-6">
							<p class="mb-2 text-center text-lg-start">Copyright &copy;<script>document.write(new Date().getFullYear());</script>. All Rights Reserved. &mdash; Designed with love by <a href="https://piyushadake.000webhostapp.com/">PiyushAdake</a>
            </p>
						</div>

						

					</div>
				</div>

			</div>
		</footer>
		<!-- End Footer Section -->	


		<script src="js/bootstrap.bundle.min.js"></script>
		<script src="js/tiny-slider.js"></script>
		<script src="js/custom.js"></script>
	</body>

</html>
