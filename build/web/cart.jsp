<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
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
                    .hero-img-wrap img {
   padding-left: 220px;
padding-top: 10px;
      width: auto;
  height: 550px;
                    }
                    .img-wrap{
                        padding-top: 20px;
                    }
                    .sofa-img{
                        padding-top: 50px;
                    }
                </style>
	</head>

	<body>

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


		

		<div class="untree_co-section before-footer-section">
    <div class="container">
      <div class="row mb-5">
          <div class="site-blocks-table">
            <table class="table">
              <thead>
                <tr>
                  <th class="product-thumbnail">Image</th>
                  <th class="product-name">Product</th>
                  <th class="product-price">Price</th>
                  <th class="product-quantity">Quantity</th>
                  <th class="product-total">Total</th>
                  <th class="product-remove">Remove</th>
                </tr>
              </thead>
              <tbody>
                <% 
                  Connection cn = null;
                  Statement st = null;
                  try {
                    Class.forName("com.mysql.jdbc.Driver");
                    cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_canteen", "root", "root");
                    st = cn.createStatement();
                    String sql = "select * from tbl_cart";
                    ResultSet rs = st.executeQuery(sql);
                    while (rs.next()) { 
                %>
                <tr>
                  <td class="product-thumbnail">
                    <img src="<%= rs.getString("menu_img") %>" alt="Image" class="img-fluid">
                  </td>
                  <td class="product-name">
                    <h2 class="h5 text-black"><%= rs.getString("menu_name") %></h2>
                  </td>
                  <td><%= rs.getString("menu_price") %></td>
                  <td>
                    1
                    
                  </td>
                  <td class="product-total">
                    <%= rs.getString("menu_price") %>
                  </td>
                  <form action="update_cart" method="post">
                <input type="hidden" name="menu_id" value="<%= rs.getString("menu_id") %>">
                <input type="hidden" name="menu_name" value="<%= rs.getString("menu_name") %>">
                <input type="hidden" name="menu_img" value="<%= rs.getString("menu_img") %>">
                <input type="hidden" name="menu_price" value="<%= rs.getString("menu_price") %>">
                <td><button class="btn btn-black btn-lg py-3 btn-block"name="Delete" value="Delete">X</button></td>
                </tr>
                 
                  </form>
                <!-- Add other hidden fields as needed -->
                <% 
                    }
                    rs.close();
                    st.close();
                    cn.close();
                  } catch (Exception ex) {
                    ex.printStackTrace();
                  } 
                %>
              </tbody>
              <tfoot>
              </tfoot>
            </table>
          </div>
        </form>
      </div>
    </div>
              <!-- Your existing code... -->

<div class="row justify-content-end">
  <div class="col-md-7">
    <div class="row">
      <div class="col-md-12 text-right border-bottom mb-5">
        <h3 class="text-black h4 text-uppercase">Cart Totals</h3>
      </div>
    </div>
    <div class="row mb-3">
      <div class="col-md-6">
      </div>
      <div class="col-md-6 text-right">
      </div>
    </div>
    <div class="row mb-5">
      <div class="col-md-6">
        <span class="text-black">Total</span>
      </div>
      <div class="col-md-6 text-right">
        <strong class="text-black">
          <% 
            cn = null;
            st = null;
            double subtotal = 0.0;
            try {
              Class.forName("com.mysql.jdbc.Driver");
              cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_canteen", "root", "root");
              st = cn.createStatement();
              String sql = "select menu_price from tbl_cart";
              ResultSet rs = st.executeQuery(sql);
              while (rs.next()) { 
                subtotal += Double.parseDouble(rs.getString("menu_price"));
              }
              rs.close();
              st.close();
              cn.close();
            } catch (Exception ex) {
              ex.printStackTrace();
            } 
            out.print(subtotal);
          %>
        </strong>
      </div>
    </div>

    <!-- Form to submit cart details to checkout.jsp -->
    <div class="row">
      <div class="col-md-12">
        <form action="checkout.jsp" method="POST">
          <!-- Include necessary hidden fields for the specific menus -->
          <% 
            cn = null;
            st = null;
            try {
              Class.forName("com.mysql.jdbc.Driver");
              cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_canteen", "root", "root");
              st = cn.createStatement();
              String sql = "select * from tbl_cart";
              ResultSet rs = st.executeQuery(sql);
              while (rs.next()) { 
          %>
          <input type="hidden" name="menu_id" value="<%= rs.getString("menu_id") %>">
          <input type="hidden" name="menu_name" value="<%= rs.getString("menu_name") %>">
          <input type="hidden" name="menu_price" value="<%= rs.getString("menu_price") %>">
          <!-- Add other hidden fields as needed -->
          <% 
              }
              rs.close();
              st.close();
              cn.close();
            } catch (Exception ex) {
              ex.printStackTrace();
            } 
          %>
          <button type="submit" class="btn btn-black btn-lg py-3 btn-block">Proceed To Checkout</button>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Your remaining HTML code... -->

  </div>
                 <!-- Cart Totals -->
      
    </div>
  </div>
		

		<!-- Start Footer Section -->
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
                <li style="display: inline-block;"><a class="nav-link" href="shop.jsp">Shop</a></li>
                <li style="display: inline-block;"><a class="nav-link" href="index.jsp">About us</a></li>
                 <li style="display: inline-block;"><a class="nav-link" href="user_login.jsp">Logout</a></li>
                <li style="display: inline-block;"><a class="nav-link" href="feedback.jsp">Feedback</a></li>
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
    