<%@page import="java.util.Random"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Properties"%>
<%@ include file="banner.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
	<%
		if (session.getAttribute("type")!=null&&!session.getAttribute("type").equals("admin")) {
			response.sendRedirect("home.jsp");
		}
		if(session.getAttribute("status")!=null){
			if(session.getAttribute("status").equals("delsuc")){
				%>
				<div  style="padding: 20px;">
				<div class="alert alert-success">
				<strong>Successfully deleted</strong>
				</div>
				</div>
				<%
			}else if(session.getAttribute("status").equals("delfail")){
				 %>
				 <div  style="padding: 20px;">
				<div class="alert alert-danger">
				<strong>Failed to delete</strong>
				</div>
				</div>
				 <%
			}
			session.setAttribute("status", "");
			session.setAttribute("status", "");
		}
		
		Properties prop = new Properties();
		try {
			InputStream input = new FileInputStream("config.properties");
			prop.load(input);
			Class.forName(prop.getProperty("classname"));
			Connection con = DriverManager.getConnection(prop.getProperty("databasepath"),
					prop.getProperty("dbuser"), prop.getProperty("dbpassword"));
			String sql = "";
			Statement stmt = con.createStatement();
			ResultSet rs=null;
			//out.print(request.getAttribute("uname"));
			
			Enumeration e=request.getParameterNames();
			//out.print(e.nextElement().toString());
			//out.print(request.getParameter(e.nextElement().toString()));
			//if(request.getAttribute("uname")!=null&&request.getAttribute("name")!=null){
			if(e.hasMoreElements()){
				String uname=null,name=null,type=null;
				if(e.hasMoreElements())
				 	uname=request.getParameter(e.nextElement().toString());
				if(e.hasMoreElements())
					type=request.getParameter(e.nextElement().toString());
				if(e.hasMoreElements())
					name=request.getParameter(e.nextElement().toString());
				if(type!=null){
					Random rnd=new Random();
					String pass=uname.substring(0,uname.length()/3)+name.substring(0,name.length()/3)+rnd.nextInt(30);
				//out.print(uname+" "+type+" "+name);
				sql="SELECT * FROM login WHERE username='"+uname+"';";
				rs=stmt.executeQuery(sql);
				//out.print("entered");
				if(rs.next()){
					 %>
					 <div  style="padding: 20px;">
					<div class="alert alert-danger">
					<strong>Cannot create user, user already exists</strong>
					</div>
					</div>
					 <%
				}else{
					sql="INSERT INTO login VALUES('"+uname+"','"+pass+"','"+type+"','"+name+"','');";
					int r1=stmt.executeUpdate(sql);
					if(r1>0){
						out.print("<h5>Successfully created with User: "+uname+" and Password: "+pass+"</h5>");
					}
				}
				}
				
			}
			sql = "SELECT * FROM login";
			//		out.print(sql);
			
			%>
			  <div class="container">
		            <div class="row">
		        
				<div class="col-md-1 order-md-1">
				</div>
				
		        <div class="col-md-10 order-md-1">
		          <center><h4 class="mb-3">User Management</h4></center>
		          <form action="UserManagement.jsp" method="POST">
		            <div class="row">
		              <div class="col-md-4 mb-3">
		                
		                
		                <input type="text" class="form-control" name="uname" placeholder="Enter Username" value="" required>
		                <div class="invalid-feedback">
		                  Enter a valid username
		                </div>
		              </div>
					  <div class="col-md-3 mb-3">
		                <select class="custom-select d-block w-100" name="type" required>
		                  <option value="">Choose Permission</option>
		                  <option value="admin">Admin</option>
		                  <option value="worker">Worker</option>
		                </select>
		                <div class="invalid-feedback">
		                  Please select a valid permission.
		                </div>
		              </div>
		              <div class="col-md-3 mb-3">
		                
		                
		                <input type="text" class="form-control" name="name" placeholder="Enter Name" value="" required>
		                <div class="invalid-feedback">
		                  Enter a valid name
		                </div>
		              </div>
		             <div class="col-md-2 mb-3">
					 
		                         <button class="btn btn-success btn-md btn-block" type="submit">Add User</button>
					</div>
					</div>
		          </form>
		        </div>
				
				<div class="col-md-1 order-md-1">
				</div>
		      </div>
		
		  </div>
			
			<%
			
			rs = stmt.executeQuery(sql);
	%>
	<div class="table-responsive">
	<table class="table">
		<tr>
			<th>User Name</th>
			<th>Password</th>
			<th>Permission</th>
			<th>Name</th>
			<th>Action</th>
		</tr>
		<%
		while(rs.next()){
			String pass=rs.getString(2);
			String s="";
			if(pass!=null){
			for(int i=0;i<pass.length();i++){
				s=s+"*";
			}
			}
			out.print("<tr><td>"+rs.getString(1)+"</td><td>"+s+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td>");
			out.print("<td><a href=\"delete.jsp?name=login&page="+request.getRequestURI().toString()+"&username="+rs.getString(1)+"&type="+rs.getString(3)+"\">Delete</a><td></tr>");
		}
		%>
	</table>
	</div>
	<%
		} catch (Exception e) {
			out.print(e.toString());
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