<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSetMetaData"%>
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
    //out.print(request.getRequestURL());
Properties prop = new Properties();
try {
	InputStream input = new FileInputStream("config.properties");
	prop.load(input);
	Class.forName(prop.getProperty("classname"));
	Connection con = DriverManager.getConnection(prop.getProperty("databasepath"),
			prop.getProperty("dbuser"), prop.getProperty("dbpassword"));
String name=request.getParameter("table");
String page1=request.getRequestURL().toString();
		String sql="";
		if(request.getParameter("itemname")!=null && request.getParameter("class")!=null){
			sql="SELECT * FROM "+name+" WHERE "+request.getParameter("class")+" LIKE '%"+request.getParameter("itemname")+"%';";
		}else{
			sql="SELECT * FROM "+name+";";
		}
//		out.print(sql);
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		ResultSetMetaData rdm=rs.getMetaData();
		
		int count=rdm.getColumnCount();
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
		}
%>
  <div style="">
  </div>
    <div class="container">
            <div class="row">
        
		<div class="col-md-2 order-md-1">
		</div>
		
        <div class="col-md-8 order-md-1">
          <h4 class="mb-3">Search and Export</h4>
          <form action="SearchAndView.jsp">
            <div class="row">
            <%
            out.print("<input type=\"hidden\" name=\"table\" value=\""+name.toString()+"\">");
            %>
            
              <div class="col-md-5 mb-3">
                
                
                <input type="text" class="form-control" name="itemname" placeholder="Enter Search Term" value="" required>
                <div class="invalid-feedback">
                  Enter a valid Search
                </div>
              </div>
			  <div class="col-md-5 mb-3">
                <select class="custom-select d-block w-100" name="class" required>
                  <option value="">--Search by--</option>
                  <%
                  for(int i=1;i<=count;i++){
                	out.print("<option value=\""+rdm.getColumnName(i)+"\">"+rdm.getColumnName(i)+"</option>");  
                  }
                  %>
                </select>
                <div class="invalid-feedback">
                  Please select a valid SearchBy.
                </div>
              </div>
             <div class="col-md-2 mb-3">
			 
                         <button class="btn btn-success btn-md btn-block" type="submit">Submit</button>
			</div>
			</div>
          </form>
        </div>
		
		<div class="col-md-2 order-md-1">
		</div>
      </div>

  </div>
  <div class="row">
         
            
            <div class="col-lg-12">
              <div class="card">
                <div class="card-header">
                </div>
				 <div class="card-body">
                  <div class="table-responsive">
<table class="table table-striped table-sm">
 <thead>
<!-- <tr>
<th>Item Name:</th>
<th>Class</th>
<th>Item Type</th>
<th>MRP</th>
<th>Price From Store</th>
<th>Price To school</th>
<th>Meduim</th>
<th>Available</th>
<th>Action</th>
</tr>-->

<tr>
<%
for(int i=1;i<=count;i++){
	out.print("<th>"+rdm.getColumnName(i)+"<th>");
}
%><th>Action</th></tr> </thead><tbody>
<%
/*while(rs.next()){
	out.println("<tr>");
	String s="<td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(8)+"</td><td>"+rs.getString(7)+"</td><td><a href=\"delete.jsp?type=stddetails&page=standardDetails.jsp&itemname="+rs.getString(1)+"&class="+rs.getString(2)+"&itemtype="+rs.getString(3)+"\">Delete</a></td>";
	out.println(s);
	out.println("</tr>");
}*/
int count2=0;
while(rs.next()){
	count2++;
	out.println("<tr>");
//	String s="<td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(8)+"</td><td>"+rs.getString(7)+"</td><td><a href=\"delete.jsp?type=stddetails&page=standardDetails.jsp&itemname="+rs.getString(1)+"&class="+rs.getString(2)+"&itemtype="+rs.getString(3)+"\">Delete</a></td>";
String s="";
	for(int i=1;i<=count;i++){
		//out.print("<td>"+rdm.getColumnName(i)+"<td>");
		s=s+"<td>"+rs.getString(i)+"<td>";
	}
	s=s+"<td><a href=\"delete.jsp?name="+name+"&page="+page1;
	for(int i=1;i<=count;i++){
		s=s+"&"+rdm.getColumnName(i)+"="+rs.getString(i);
	}
	s=s+"\">Delete</a></td>";
	out.println(s);
	out.println("</tr>");
}
%>
</tbody>
</table>
  </div>
  <%
  if(count2<=0)
  out.print("no records found");
  %>
                </div>
              </div>
            </div>
          </div>
		
<center>
<div style="padding-top: 0.5cm">
<%if(request.getParameter("itemname")!=null && request.getParameter("class")!=null){ %>
	<a href="export.jsp?for=self&table=<%=name%>&page=<%=page1 %>&iname=<%=request.getParameter("itemname") %>&class=<%=request.getParameter("class") %>" class="btn btn-success">Export for self</a>
	<%
	if(name.startsWith("std")){
	%>
	<a href="export.jsp?for=school&table=<%=name%>&page=<%=page1 %>&iname=<%=request.getParameter("itemname") %>&class=<%=request.getParameter("class") %>" class="btn btn-success">Export for school</a>
	<%
	}
}else{%>
	<a href="export.jsp?for=self&table=<%=name%>&page=<%=page1 %>" class="btn btn-success">Export for self</a>
	<%
	if(name.startsWith("std")){
	%>
	<a href="export.jsp?for=school&table=<%=name%>&page=<%=page1 %>" class="btn btn-success">Export for school</a>
	<%
	}	
}
if(request.getParameter("type")!=null && request.getParameter("type").equals("download")){
	%>
	</div>
	<br>
	<h4>Your file is ready to download</h4>
	<a href="files/exported.csv" class="btn btn-success" download>Download here</a>
	</center>
	<%
}
}catch(Exception e){
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