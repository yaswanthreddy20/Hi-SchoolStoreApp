<%@ include file="banner.jsp"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
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
      <section class="statistics col-lg-12 col-sm-2" style="padding-top:1cm">
	  <!-- PASTE YOUR TABLES HERE
		PASTE YOUR TABLES HERE
		PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE
		PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE
PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE
		PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE
PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE
		PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE
PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE
		PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HEREPASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE
		PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HEREPASTEPASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE
		PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE
PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE
		PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE
PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE
		PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HEREPASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE
		PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HEREPASTE
PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE
		PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE
PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE
		PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HEREPASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE
		PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HEREPASTE
PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE
		PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE
PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE
		PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE
PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE
		PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HERE PASTE YOUR TABLES HEREPASTE		-->
		<div style="">
  </div>
    <div class="container">
            <div class="row">
        
		<div class="col-md-2 order-md-1">
		</div>
		
        <div class="col-md-8 order-md-1">
        <%
        if(session.getAttribute("status")!=null){
        	if(session.getAttribute("status").equals("succinc")){
        		%>
        		<div  style="padding: 20px;">
				<div class="alert alert-success">
				<strong>Successfully Incremented Count</strong>
				</div>
				</div>
        		<%
        	}else if(session.getAttribute("status").equals("succ")){
				%>
         		<div  style="padding: 20px;">
				<div class="alert alert-success">
				<strong>Successfully Added</strong>
				</div>
				</div>
        		<%
        	}else if(session.getAttribute("status").equals("fail")){
				%>
           		<div  style="padding: 20px;">
				<div class="alert alert-danger">
				<strong>Unable to add product</strong>
				</div>
				</div> 		
        		<%
        	}
        	session.setAttribute("status","");
        }
        %>
        <div class="card">
        <div class="card-header">
          <center><h4 class="mb-3">Add Stationery</h4></center>
          </div>
          <div class="card-body">
          <form class="needs-validation" action="addStationery_action.jsp" novalidate>
            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="iname">Item Name</label>
                <input type="text" class="form-control" name="iname" placeholder="Item Name" value="" required>
                <div class="invalid-feedback">
                  Valid Item Name is required.
                </div>
              </div>
			  <div class="col-md-6 mb-3">
             <div class="mb-3">
              <label for="itype">Item Type</label>
              <div class="input-group">
                <input type="text" class="form-control" name="itype" placeholder="Item Type" required>
                <div class="invalid-feedback" style="width: 100%;">
                  Your Item Type is required.
                </div>
              </div>
            </div>
			</div>
            </div>

            
			<div class="row">
              <div class="col-md-6">
            <div class="mb-3">
              <label for="mrp">MRP <span class="text-muted"></span></label>
              <input type="mrp" class="form-control" name="mrp" placeholder="MRP">
              <div class="invalid-feedback">
                Please enter MRP.
              </div>
            </div>
			</div>
			<div class="col-md-6">
            <div class="mb-3">
              <label for="pfs">Price From Store</label>
              <input type="text" class="form-control" name="pfs" placeholder="Price From Store" required>
              <div class="invalid-feedback">
                Please enter Price From Store.
              </div>
            </div>
			</div>
            </div>
			

            <div class="mb-3">
              <label for="count">Count <span class="text-muted"></span></label>
              <input type="text" class="form-control" name="count" placeholder="Count" required>
              <div class="invalid-feedback">
                Please enter item count.
              </div>
            </div>
			 <div class="mb-3">
              <label for="store">Store Name <span class="text-muted"></span></label>
              <input type="text" class="form-control" name="store" placeholder="Name of Store" required>
              <div class="invalid-feedback">
                Please enter Name of Store.
              </div>
            </div>
            <hr class="mb-4">
            
           
           
            <button class="btn btn-primary btn-lg btn-block" type="submit">Submit</button>
          </form>
          </div></div>
        </div>
		
		<div class="col-md-2 order-md-1">
		</div>
      </div>

  </div>
    
		
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
      <script>
      // Example starter JavaScript for disabling form submissions if there are invalid fields
      (function() {
        'use strict';

        window.addEventListener('load', function() {
          // Fetch all the forms we want to apply custom Bootstrap validation styles to
          var forms = document.getElementsByClassName('needs-validation');

          // Loop over them and prevent submission
          var validation = Array.prototype.filter.call(forms, function(form) {
            form.addEventListener('submit', function(event) {
              if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
              }
              form.classList.add('was-validated');
            }, false);
          });
        }, false);
      })();
    </script>
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