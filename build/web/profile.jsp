<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
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
                          
* {
  box-sizing: border-box;
}



#myTable {
  border-collapse: collapse;
  width: 100%;
  border: 1px solid #ddd;
  font-size: 16px;
}

#myTable th, #myTable td {
  text-align: left;
  padding: 4px;
}

#myTable tr {
  border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
  background-color: #f1f1f1;
}
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
                    .feedback-form .card {
      max-width: 600px; /* Adjust the maximum width of the card */
      width: 90%; /* Adjust the width of the card */
    }

    .feedback-form .card-body {
      padding: 30px;
    }
                </style>
	</head>

<body>
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

    <main id="main" class="main">

   <div class="col-12">
              <div class="card recent-sales overflow-auto">

                  <div class="card-body">
                  <h5 class="card-title">Your Orders <span>| Completed</span></h5>

                   <table id="myTable">
            <tr>
              <th scope="col">#</th>
              <th>Customer Name</th>
              <th>Menu Name</th>
              <th>Menu Quantity</th>
              <th>Menu Price</th>
              <th>Status<th>
            </tr>
            <% int counter = 1;
            Connection cn = null;
            Statement st = null;
            try {
              Class.forName("com.mysql.jdbc.Driver");
              cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_canteen", "root", "root");
              st = cn.createStatement();
              String sql = "select * from tbl_completedorders where username='"+session.getAttribute("username")+"' ";
              ResultSet rs = st.executeQuery(sql);
              while (rs.next()) {
                String order_id = rs.getString("order_id");
            %>
            <form action="update_order" method="POST">
                <th scope="row"><%=counter++%></th>
               <input type="hidden" name="order_id" value="<%=rs.getString("order_id")%>" >   
               <td><%=rs.getString("username")%></td>
        <input type="hidden" name="username" value="<%=rs.getString("username")%>">
        <td><%=rs.getString("Menu_name")%></td>
        <input type="hidden" name="Menu_name" value="<%=rs.getString("Menu_name")%>">
        <td><%=rs.getString("Menu_Qunt")%></td>
        <input type="hidden" name="Menu_Qunt" value="<%=rs.getString("Menu_Qunt")%>">
        <td><%=rs.getString("Menu_price")%></td>
        <input type="hidden" name="Menu_price" value="<%=rs.getString("Menu_price")%>">
        <td> Completed</td>   
         </form>
                   </tr>
            <% }
              // Close database connections and handle exceptions
            } catch (Exception ex) {
              out.println(ex.toString());
            } %>
          </table>

<script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>


                </div>

              </div>
            </div>
          
          <div class="col-12">
              <div class="card recent-sales overflow-auto">

                  <div class="card-body">
                  <h5 class="card-title">Your Orders <span>| Cancelled</span></h5>

                   <table id="myTable">
            <tr>
              <th scope="col">#</th>
              <th>Customer Name</th>
              <th>Menu Name</th>
              <th>Menu Quantity</th>
              <th>Menu Price</th>
              <th>Status<th>
            </tr>
            <% counter = 1;
             cn = null;
             st = null;
            try {
              Class.forName("com.mysql.jdbc.Driver");
              cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_canteen", "root", "root");
              st = cn.createStatement();
              String sql = "select * from tbl_cancelledorders where username='"+session.getAttribute("username")+"' ";
              ResultSet rs = st.executeQuery(sql);
              while (rs.next()) {
                String order_id = rs.getString("order_id");
            %>
            <form action="update_order" method="POST">
                <th scope="row"><%=counter++%></th>
               <input type="hidden" name="order_id" value="<%=rs.getString("order_id")%>" >   
               <td><%=rs.getString("username")%></td>
        <input type="hidden" name="username" value="<%=rs.getString("username")%>">
        <td><%=rs.getString("Menu_name")%></td>
        <input type="hidden" name="Menu_name" value="<%=rs.getString("Menu_name")%>">
        <td><%=rs.getString("Menu_Qunt")%></td>
        <input type="hidden" name="Menu_Qunt" value="<%=rs.getString("Menu_Qunt")%>">
        <td><%=rs.getString("Menu_price")%></td>
        <input type="hidden" name="Menu_price" value="<%=rs.getString("Menu_price")%>">
        <td>Cancelled<td
         </form>
                   </tr>
            <% }
              // Close database connections and handle exceptions
            } catch (Exception ex) {
              out.println(ex.toString());
            } %>
          </table>

<script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>


                </div>

              </div>
            </div>

  </main>
    <!-- Other HTML content and scripts -->
</body>
</html>
