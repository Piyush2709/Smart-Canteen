<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Add Menu</title>
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

    <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-3">
          </div>
          <div class="col-sm-6">
            <h1>Add Menu</h1>
          </div>
          
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-3">
          </div>
          <div class="col-md-6">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h1 class="card-title">Details</h1>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form action="Add_Menu" method="POST">  
                  <%  Connection cn=null;
            Statement st=null;
            String id="1";
            try
        {
         Class.forName("com.mysql.jdbc.Driver");
         cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_canteen","root","root");
         st=cn.createStatement();
         String sql="select menu_id from tbl_menu";
         ResultSet rs= st.executeQuery(sql);
         while(rs.next())
         { 
           id=String.valueOf(Integer.parseInt(rs.getString("menu_id"))+1);
         }

        }catch(Exception ex)
        {
          out.println(ex);
        }

%>
                <div class="card-body">
                   <div class="row mb-2">
          <div class="col-sm-6">
                  <div class="form-group">
                    <label for="Inputcollegename">Menu Name</label>
                    <input type="text" class="form-control" name="menu_name" value="<%=request.getParameter("menu_name")%>"  placeholder="Enter Menu name" required="">
                    </div>
                </div>
                        <div class="col-sm-6">
                  <div class="form-group">
                    <label for="Inputcollegename">Menu Price</label>
                    <input type="text" maxlength="10" class="form-control" name="menu_price" value="<%=request.getParameter("menu_price")%>" placeholder="Enter Menu Price" required="">
                  </div>
                </div>
                       

                <div class="col-sm-6"><br>
                     <div class="form-group">
                    <label for="exampleInputFile">Menu Image</label>
                    <div class="input-group">
                      <div class="custom-file">
                          <input type="file" class="custom-file-input" id="" name="menu_img" required="">
                       
                      </div>
                      
                    </div>
                  </div>
                </div>
                         
              </div>
                    
                  <div class="form-group"><br>
                        <label>Menu Description</label>
                        <textarea name="menu_description" class="form-control" rows="3" value="<%=request.getParameter("menu_description")%>"   required=""></textarea>
                      </div>
                  
                </div>
                <!-- /.card-body -->

               
                <div class="card-footer">
                  <div class="row mb-2">
                    <div class="col-md-8">
                    </div>
                    <div class="col-md-2">
                  <button type="submit" class="btn btn-primary" name="btn_save" value="btn_save">update</button>
                </div>
                      
                
                
                </div>
                </div>
              </form>
            </div>
            <!-- /.card -->
            

          </div>
          
          
          <!--/.col (right) -->
        </div>
       
          
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
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