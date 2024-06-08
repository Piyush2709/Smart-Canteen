<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPE html>
<html lang="en">

<head>
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
</style>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>View FeedBacks</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/Logo Smart.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="index.html" class="logo d-flex align-items-center">
        <img src="assets/img/Logo Smart.png" alt="">
        <span class="d-none d-lg-block">Smart Canteen</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <!-- End Icons Navigation -->

  </header><!-- End Header -->

  <!-- ======= Sidebar ======= -->
 <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">
<!--List Pages Starts Heres -->
   <li class="nav-item">
        <a class="nav-link " href="admin_dashbord.jsp">
          <i class="bi bi-grid"></i>
          <span>Dashboard</span>
        </a>
      </li>
       <li class="nav-item">
        <a class="nav-link " href="Add_Menu.jsp">
          <i class="bi bi-bag"></i>
          <span>Add Menu</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="view_menu.jsp">
          <i class="bi bi-card-list"></i>
          <span>View Menu</span>
        </a>
      </li>
        <li class="nav-item">
        <a class="nav-link " href="admin_completedorders.jsp">
          <i class="bi bi-bag-check-fill"></i>
          <span>Completed Orders</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="admin_cancelledorders.jsp">
          <i class="bi bi-cart-x-fill"></i>
          <span>Cancelled Orders</span>
        </a>
      </li>
      <br>
      <br>
        <li class="nav-item">
        <a class="nav-link " href="Add_Emp.jsp">
          <i class="ri-group-fill"></i>
          <span>Add Employee</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="Employee_Attendance.jsp">
          <i class="bi bi-card-list"></i>
          <span>Employee Attendance </span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="View_Employees.jsp">
          <i class="bi bi-person-lines-fill"></i>
          <span>View Employee</span>
        </a>
      </li>
      <!-- End Tables Nav -->
        
      <li class="nav-item">
        <a class="nav-link " href="View_Feedback.jsp">
          <i class="bi bi-envelope"></i>
          <span>View FeedBack</span>
        </a>
      </li><!-- End Feedback Page Nav -->
      <br>
      <!-- End Register Page Nav -->

      <li class="nav-item">
        <a class="nav-link" href="admin_Login.jsp">
          <i class="bi bi-box-arrow-in-right"></i>
          <span>Logout</span>
        </a>
      </li><!-- End Login Page Nav -->
      </ul>

  </aside><!-- End Sidebar-->

<!-- Main Card-->
<main id="main" class="main">

   <div class="col-12">
              <div class="card recent-sales overflow-auto">

                  <div class="card-body">
                  <h5 class="card-title">Feedback<span>| Today</span></h5>

                   <table id="myTable">
            <tr>
              <th scope="col">#</th>
              <th>Customer Name</th>
              <th>Feedback Message</th>
              
              
            </tr>
            <% int counter = 1;
            Connection cn = null;
            Statement st = null;
            try {
              Class.forName("com.mysql.jdbc.Driver");
              cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_canteen", "root", "root");
              st = cn.createStatement();
              String sql = "select * from tbl_feedback";
              ResultSet rs = st.executeQuery(sql);
              while (rs.next()) {
                String feedback_id = rs.getString("feedback_id");
            %>
            <form action="update_order" method="POST">
                <th scope="row"><%=counter++%></th>
               <input type="hidden" name="feedback_id" value="<%=rs.getString("feedback_id")%>" >   
               <td><%=rs.getString("username")%></td>
        <input type="hidden" name="username" value="<%=rs.getString("username")%>">
        <td><%=rs.getString("Message")%></td>
        <input type="hidden" name="Message" value="<%=rs.getString("Message")%>">
       
             
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

<!-- Main Card End-->
  

  

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/chart.js/chart.umd.js"></script>
  <script src="assets/vendor/echarts/echarts.min.js"></script>
  <script src="assets/vendor/quill/quill.min.js"></script>
  <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>