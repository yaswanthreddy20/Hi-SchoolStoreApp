<%@ include file="banner.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Hi-Tech School Store</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
    <!-- Fontastic Custom icon font-->
    <link rel="stylesheet" href="css/fontastic.css">
    <!-- Google fonts - Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700">
    <!-- jQuery Circle-->
    <link rel="stylesheet" href="css/grasp_mobile_progress_circle-1.0.0.min.css">
    <!-- Custom Scrollbar-->
    <link rel="stylesheet" href="assets/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="css/style.blue.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/favicon.png">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
  </head>
  <body>
    <!-- Side Navbar -->
<nav class="side-navbar">
      <div class="side-navbar-wrapper">
        <!-- Sidebar Header    -->
        <div class="sidenav-header d-flex align-items-center justify-content-center">
          <!-- User Info-->
          <div class="sidenav-header-inner text-center"><!-- <img src="img/avatar-1.jpg" alt="person" class="img-fluid rounded-circle"> -->
            <h2 class="h5"><%=session.getAttribute("user") %></h2><span><%=session.getAttribute("type") %></span>
          </div>
          <!-- Small Brand information, appears on minimized sidebar-->
          <div class="sidenav-header-logo"><a href="index.html" class="brand-small text-center"> <strong>H</strong><strong class="text-warning">T</strong></a></div>
        </div>
        <!-- Sidebar Navigation Menus-->
        <div class="main-menu">
          <h5 class="sidenav-heading"><font color="white">STANDARD</font></h5>
          <ul id="side-main-menu" class="side-menu list-unstyled">                  
            
          <li><a href="addStandard.jsp"><img src="./img/icons/small/addstandard.png">Add Standard                             </a></li>
			<li><a href="SellStandard.jsp"><img src="./img/icons/small/sellstandard.png">Sell Standard                             </a></li>
			<li>
			<a class="collapsed" href="#statDropdown" area-expanded="false" data-toggle="collapse">EXPORT</a>
			<ul id="statDropdown" class="list-unstyled collapse">
				<li><a href="SearchAndView.jsp?table=stdpurchase"> <img src="./img/icons/small/export.png">Sold Details                          </a></li>
			<li><a href="SearchAndView.jsp?table=stddetails"> <img src="./img/icons/small/export.png">Product Details                         </a></li>
			</ul>
			
			</li>
			
          </ul>
        </div>
        <div class="admin-menu">
          <h5 class="sidenav-heading"><font color="white">STATIONERY</font></h5>
          <ul id="side-main-menu" class="side-menu list-unstyled">                  
           
            <li><a href="addStationery.jsp"> <img src="./img/icons/small/addstationery.png">Add Stationery                            </a></li>
			<li><a href="SellStationery.jsp"> <img src="./img/icons/small/sellstationery.png">Sell Stationery                           </a></li>
			<li>
			<a class="collapsed" href="#stdDropdown" area-expanded="false" data-toggle="collapse">EXPORT</a>
			<ul id="stdDropdown" class="list-unstyled collapse">
			<li><a href="SearchAndView.jsp?table=statpurchase"> <img src="./img/icons/small/export.png">Sold Details                          </a></li>
			<li><a href="SearchAndView.jsp?table=statdetails"> <img src="./img/icons/small/export.png">Product Details                         </a></li>
			</ul>
			</li>
			
            
          </ul>
        </div>
		
		<div class="admin-menu">
          <h5 class="sidenav-heading"><font color="white">USER MANAGEMENT</font></h5>
          <ul id="side-main-menu" class="side-menu list-unstyled">                  
            <li><a href="UserManagement.jsp"> <img src="./img/icons/small/users.png">Users                             </a></li>
			<li><a href="passChange.jsp"> <img src="./img/icons/small/password.png">Change Password                             </a></li>
            
          </ul>
        </div>
		<div class="admin-menu">
          <h5 class="sidenav-heading"><font color="white">STUDENT MANAGEMENT</font></h5>
          <ul id="side-main-menu" class="side-menu list-unstyled">                  
             <li><a href="addStudent.jsp"> <img src="./img/icons/small/rszaddstud.png">Add Student                            </a></li>
             <li><a href="SearchAndView.jsp?table=student_details"> <img src="./img/icons/small/parents.png">Student Manager                            </a></li>
             <li><a href="addDeposite.jsp"> <img src="./img/icons/small/rsz_deposite.png">Add Deposite                            </a></li>
          </ul>
          <h5 class="sidenav-heading"><font color="white">BILLS AND PAYMENTS</font></h5>
          <ul id="side-main-menu" class="side-menu list-unstyled">                  
             <li><a href="standardPayDetails.jsp?table=stdstorepurchase"> <img src="./img/icons/small/rsz_payment1.png">STANDARD PAY                            </a></li>
             <li><a href="standardPayDetails.jsp?table=statstorepurchase"> <img src="./img/icons/small/rsz_payment2.png">STATIONERY PAY                            </a></li>
             
          </ul>
        </div>
      </div>
    </nav>
    <div class="page">
      <!-- navbar-->
      <header class="header">
        <nav class="navbar">
          <div class="container-fluid">
            <div class="navbar-holder d-flex align-items-center justify-content-between">
              <div class="navbar-header"><a id="toggle-btn" href="#" class="menu-btn"><i class="icon-bars"> </i></a><a href="index.html" class="navbar-brand">
                  <div class="brand-text d-none d-md-inline-block"><a href="home.jsp"><img style="width:150px;height:40px"src="./img/logo.png"> </a> </div></a></div>
              <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
                
                <li class="nav-item"><a href="addClass.jsp" class="nav-link logout">Add Class<i class="fa fa-plus-square"></i></a></li>
                
                <li class="nav-item"><a href="logout.jsp" class="nav-link logout">Logout<i class="fa fa-sign-out"></i></a></li>
              </ul>
            </div>
          </div>
        </nav>
      </header>
      
      <!-- Statistics Section-->
      <%
      if(request!=null && request.getParameter("type")!=null && request.getParameter("type").equals("std")){
      %>
      <section class="statistics" style="padding-top:2.5cm">
        <div class="container-fluid">
          <div class="row d-flex">
            
           <div class="col-lg-2"></div>
            <div class="col-lg-4">
              <!-- Income-->
              <div class="card income text-center">
                <div class="icon"><img src="./img/icons/sellstandard.png"></div>
				<p>Enter this section to <strong class="text-success">SOLD STATIONERY</strong> Details</p>
				<a href="SearchAndView.jsp?table=statpurchase" class="btn btn-outline-primary"><strong>View & Export</strong></a>
                
              </div>
            </div>
			
			<div class="col-lg-4">
              <!-- Income-->
              <div class="card income text-center">
                <div class="icon"><img src="./img/icons/export.png"></div>
				<p>Enter this section to <strong class="text-danger">STATIONERY PRODUCT</strong> details</p>
				<a href="SearchAndView.jsp?table=statdetails" class="btn btn-outline-primary"><strong>View & Export</strong></a>
                
              </div>
            </div>
            <div class="col-lg-2"></div>
          </div>
        </div>
      </section>
      <%
      }else{
      %>
       <section class="statistics" style="padding-top:2.5cm">
        <div class="container-fluid">
          <div class="row d-flex">
            
           <div class="col-lg-2"></div>
            <div class="col-lg-4">
              <!-- Income-->
              <div class="card income text-center">
                <div class="icon"><img src="./img/icons/sellstandard.png"></div>
				<p>Enter this section to <strong class="text-success">SOLD STANDARD</strong> Details</p>
				<a href="SearchAndView.jsp?table=stdpurchase" class="btn btn-outline-primary"><strong>View & Export</strong></a>
                
              </div>
            </div>
			
			<div class="col-lg-4">
              <!-- Income-->
              <div class="card income text-center">
                <div class="icon"><img src="./img/icons/export.png"></div>
				<p>Enter this section to <strong class="text-danger">STANDARD PRODUCT</strong> details</p>
				<a href="SearchAndView.jsp?table=stddetails" class="btn btn-outline-primary"><strong>View & Export</strong></a>
                
              </div>
            </div>
            <div class="col-lg-2"></div>
          </div>
        </div>
      </section>
      
	  <%
      }
	  %>
	  
      </section>
      <footer class="main-footer">
        <div class="container-fluid">
          <div class="row">
            <div class="col-sm-6">
              <p>Hi-Tech School Store &copy; 2018-2019</p>
            </div>
            <div class="col-sm-6 text-right">
              <p>&copy; 2018-2019 Designed and built by <a href="./developer_resumes/hafeez.html" target="_blank">Shaik Hafeez</a> and <a href="./developer_resumes/yaswanth.html"target="_blank">Yaswanth Reddy</a></p>
              <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
            </div>
          </div>
        </div>
      </footer>
    </div>
    <!-- Javascript files-->
    <script src="assets/jquery/jquery.min.js"></script>
    <script src="assets/popper.js/umd/popper.min.js"> </script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="js/grasp_mobile_progress_circle-1.0.0.min.js"></script>
    <script src="assets/jquery.cookie/jquery.cookie.js"> </script>
    <script src="assets/chart.js/Chart.min.js"></script>
    <script src="assets/jquery-validation/jquery.validate.min.js"></script>
    <script src="assets/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="js/charts-home.js"></script>
    <!-- Main File-->
    <script src="js/front.js"></script>
  </body>
</html>