<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.Properties"%>
<%@page import="java.sql.*"%>
<%@ include file="banner.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
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
		<script src="js/jquery-1.12.1.min.js"></script>
<script src="js/jquery-3.3.1.min.js"></script>


<script type="text/javascript">
function cal(){
	 var mrps = [];
	console.log('started');
	$("input[name='mrp[]']").each(function() {
	    mrps.push($(this).val());
	});
	console.log('mrps length',mrps.length);
	var qtys = [];
	$("input[name='qty[]']").each(function() {
	    qtys.push($(this).val());
	});    
	console.log('qtys length',qtys.length);
	var total=0;
	for(i=0;i<qtys.length;i++){
		total=total+(qtys[i]*mrps[i]);
	}
	console.log('Total: ',total);
	document.getElementById("total").innerHTML = "Total bill: Rs. "+total+" /-";
	
}
function getid(){
	 var id = $("#id").val();
	 
     var urli = "fetchid.jsp?id="+id;
     $.ajax({
     	type: 'GET',
     	url:urli,
     	dataType:'json',
     	success:function(res){
     		console.log('success',res);
     		var data="";
     		console.log('length Json',res.length);
     		if(res.length == null ){
     			alert("No Student Found");
     		}
         	for(i=0;i<res.length;i++){
         		var p=JSON.parse(res[i]);
         		if(p.cash<0){
         			alert("Low Balance: "+p.cash);
         		}
         		document.getElementById("stud").innerHTML = "Student "+p.name+" has Rs. "+p.cash+" in deposite";
         		document.getElementById("studclass").value = p.class1
         	}
         	
     	}
     	
     
     });
}
function mergeData(p,qty){
	var qtys = [];
	$("input[name='qty[]']").each(function() {
	    qtys.push($(this).val());
	});
	var temp;
	var temp1;
	//var myMap = new Map();
	var length=$($('#example-table').find('tbody tr')).length;
	for(j=0;j<length;j++){
		temp=$($('#example-table').find('tbody tr')[j]).find('td').eq(1).text();
		temp1=$($('#example-table').find('tbody tr')[j]).find('td').eq(2).text();
		if(temp == p.iname && temp1 == p.itype ){
			
			$("table tbody").find('tr').each(function (i) {
		        var $tds = $(this).find('td'),
		            iname1 = $tds.eq(1).text(),
		            itype1 = $tds.eq(2).text();
		            if(iname1 == p.iname && itype1 == p.itype){
	                    $(this).remove();
	                }
		    });
			return parseInt(qty) + parseInt(qtys[j]);
		}
	}
	return qty;
}
</script>
<script type="text/javascript">
    $(document).ready(function(){     
    	 $("#add-row").click(function(){
    	        var itemname = $("#itemname").val();
    	        var itemtype = $("#itemtype").val();
    	        var class1 = $("#studclass").val();
    	        var qty = $("#qty1").val();
    	        
    	        var id = $("#id").val();
    	        
    	        if(!(itemname==""||itemtype==""|| id=="" || qty=="" || isNaN(qty))){
    	        	
    	        	if(parseInt(qty)>0){	
    	       
    	        //console.log('base0');
    	        //var mrps1 = [];
    	    	//console.log('base1');
    	    	//$("input[name='iname[]']").each(function() {
    	    	  //  mrps1.push($(this).val());
    	    	//});
    	    	//console.log('base mrps length',mrps1.length);
    	    	//var qtys1 = [];
    	    	//$("input[name='itype[]']").each(function() {
    	    	    //qtys1.push($(this).val());
    	    	//});    
    	    	//boolean fl=true;
    	    	//for(i=0;i<qtys1.length;i++){
    	    		//if(qtys1[i]===itemtype && mrps1[i]===itemname){
    	    			//fl=false;
    	    		//}
    	    	//}
    	    	//if(fl){
    	        var urli = "fetchStandard.jsp?iname="+itemname+"&itype="+itemtype+"&class="+class1;
    	        $.ajax({
    	        	type: 'GET',
    	        	url:urli,
    	        	dataType:'json',
    	        	success:function(res){
    	        		console.log('success',res);
    	        		var data="";
    	        		console.log('length Json',res.length);
    	        		if(res.length == null ){
    	        			alert("No Item Found");
    	        		}
    	            	for(i=0;i<res.length;i++){
    	            		var p=JSON.parse(res[i]);
        	            	var qty1 = mergeData(p,qty);
        	            	
    	            		data+="<tr><td><input type='checkbox' name='record'></td><td><input type=\"hidden\" value=\""+p.iname+"\" name=\"iname[]\">"+p.iname+"</td><td><input type=\"hidden\" value=\""+p.itype+"\" name=\"itype[]\">"+p.itype+"</td><td><input type=\"hidden\" value=\""+p.class1+"\" name=\"class1[]\">"+p.class1+"</td><td><input type=\"hidden\" value=\""+p.mrp+"\" name=\"mrp[]\">"+p.mrp+"</td><td><input type=\"text\" value=\""+qty1+"\" name=\"qty[]\" onchange=\"cal()\"></td></tr>";
    	            	}
    	            	
    	            	$("table tbody").append(data);
    	            	cal();
    	            	 $("#qty1").val("");
    	            	 $("#itemname").val("");
    	            	 $("#itemtype").val("");
    	        	}
    	        	
    	        
    	        });
    	    	}else{
    	    		alert("qty should not be: "+qty);
    	    	}
    	    	}else{
    	    		alert("Please enter all details");
    	    	}
				
    	    	//}else{
    	    		//alert("Item already in the cart");
    	    	//}
    	    });
    	 
        $("#delete-row").click(function(){
            $("table tbody").find('input[name="record"]').each(function(){
            	if($(this).is(":checked")){
                    $(this).parents("tr").remove();
                }
            });
            cal();
        });
        $('.flexdatalist').flexdatalist({
            selectionRequired: true,
            minLength: 1
       });
    });    
</script>
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

		
		<%

Properties prop = new Properties();
try {
	

	
	
	InputStream input = new FileInputStream("config.properties");
	prop.load(input);
	Class.forName(prop.getProperty("classname"));
	Connection con = DriverManager.getConnection(prop.getProperty("databasepath"),
			prop.getProperty("dbuser"), prop.getProperty("dbpassword"));
	Statement stmt=con.createStatement();
	Set<String> items=new HashSet<String>();
	Set<String> itemtype=new HashSet<String>();
	Set<String> classhash=new HashSet<String>();
	ResultSet rs;
	String sql="SELECT * FROM stddetails;";
	rs=stmt.executeQuery(sql);
	while(rs.next()){
		//out.print(rs.getString("itemname"));
		items.add(rs.getString("itemname"));
		itemtype.add(rs.getString("itemtype"));
		classhash.add(rs.getString("class"));
	}
	%>
	<div class="container">
        
        		
        <div class="col-md-12 order-md-1">
        <%
        if(session.getAttribute("status")!=null){
    		if(session.getAttribute("status").equals("succ")){
    			%>
    			<div class="alert alert-success">
    			<strong>Successfully added</strong>
    			</div>
    			</div>
    			<%
    		}else if(session.getAttribute("status").equals("fail")){
    			%>
    			<div class="alert alert-danger">
    			<strong>Failed to add</strong>
    			</div>
    			</div>
    			<%
    		}else if(session.getAttribute("status").equals("succd")){
    			%>
    			<div class="alert alert-warning">
    			<strong>Added but deposite money is over</strong>
    			</div>
    			</div>
    			<%
    		}
    		session.setAttribute("status", "");
    	}
        %>
        <center><h4>Sell Standard</h4></center>
	<form action="SellStandard_action.jsp" method="get">
	<div class="row">
	<div class="col-md-2 mb-3">
		<input type="text" id="id" class="form-control" list="id" placeholder="Id number" value="" onchange="getid()" name="id">
		 <div class="invalid-feedback">
                  Enter a valid Id Number
                </div>
                </div>
              <div class="col-md-3 mb-3">
              <input type="hidden" name="studclass" id="studclass">
		<input type="text" id="itemname" class="form-control flexdatalist" list="itemnamelist" placeholder="Item Name" value=""  data-min-length='1' data-selection-required='true'>
				<datalist id="itemnamelist">
		<%
		String temp[]=new String[items.size()];
		items.toArray(temp);
		
		for(int i=0;i<temp.length;i++){
			out.print("<option value=\""+temp[i]+"\">"+temp[i]+"</option>");
		}
		%>
		</datalist>
		
		 <div class="invalid-feedback">
                  Enter a valid Item Name
                </div>
				
		</div>
		<%
		//out.print(temp.length);
		%>
		 
		 <div class="col-md-3 mb-3">
		<input type="text" id="itemtype" class="form-control" list="itemtypelist" placeholder="Item Type" value="" >
		<datalist id="itemtypelist">
		<%
		temp=new String[itemtype.size()];
		itemtype.toArray(temp);
		for(int i=0;i<temp.length;i++){
			out.print("<option value=\""+temp[i]+"\">"+temp[i]+"</option>");
		}
		%>
		</datalist>
		 <div class="invalid-feedback">
                  Enter a valid Item Type
                </div>
		
		</div>
	 	<div class="col-md-2 mb-3">
		<input type="text" id="qty1" id="qty1" list="class_list" placeholder="qty" class="form-control" value="" >
		 <div class="invalid-feedback">
                  Enter a valid Class
                </div>
		<!-- <datalist id="class_list"> -->
		<%
		/*String temp1[]=new String[classhash.size()];
		classhash.toArray(temp1);
		for(int i=0;i<temp1.length;i++){
			out.print("<option value=\""+temp1[i]+"\">");
		}*/
		%>
		<!-- </datalist> -->
		</div>
		<div class="col-md-2 mb-3">
		<button value="add" id="add-row" type="button" class="btn btn-success btn-block" >Add</button>
		</div>
		</div>
	 <div class="row">
         
            
            <div class="col-lg-12">
              <div class="card">
                <div class="card-header">
				 <h4>Selling Details</h4>
                </div>
				<div class="card-body">
                  <div class="table-responsive">
	<table id='example-table' class="table table-striped table-sm" border="1">
		<thead>
			<tr>
				<th>Select</th>
				<th>Item Name</th>
				<th>Item Type</th>
				<th>Class</th>
				<th>Mrp</th>
				<th>Qty</th>
			</tr>
		</thead>
		<tbody>
			<!-- <tr><td><input type="checkbox" name="record"></td>
				<td>Item Name</td>
				<td>Item Type</td>
				<td>Class</td>
				<td></td></tr>-->
		</tbody>
	
	</table>
	</div>
                </div>
				<div class="card-footer">
				
				<div class="col-md-12 order-md-1">
				<div class="row">
				<div class="col-md-2 mb-3">
				 <button type="button" id="delete-row" class="btn btn-success btn-block">Delete Row</button>
				 </div>
				 <div class="col-md-2 mb-3">
				 </div>
				 <div class="col-md-4 mb-3">
				 <center><font size="6"><p id="total" name="total">No Bill</p></font></center>
				 </div>
				 <div class="col-md-2 mb-3">
				 </div>
				 <div class="col-md-2 mb-3">
				<button type="submit" class="btn btn-success btn-block">Sell</button>
				</div>
				</div>
                </div>
              </div>
              </div>
            </div>
          </div>
	
	</form>
	<center><font size="4" id="stud"><p></p></font></center>
	<%
			} catch (Exception e) {
				out.print(e);
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