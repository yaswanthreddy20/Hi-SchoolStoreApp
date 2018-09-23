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
<%@page import="java.util.Properties"%>
<%@ include file="banner.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Properties prop = new Properties();
try {
	InputStream input = new FileInputStream("config.properties");
	prop.load(input);
	Class.forName(prop.getProperty("classname"));
	Connection con = DriverManager.getConnection(prop.getProperty("databasepath"),
			prop.getProperty("dbuser"), prop.getProperty("dbpassword"));

	//if (request.getParameter("itemname") != null && request.getParameter("class") != null) {
	//	out.print("1");
		String iname=request.getParameter("iname");
		String itype=request.getParameter("itype");
		String pfs=request.getParameter("pfs");
		String mrp=request.getParameter("mrp");
		String store=request.getParameter("store");
		int co=Integer.parseInt(request.getParameter("count"));
		String sql="SELECT * FROM statdetails WHERE itemname='"+iname+"' AND itemtype='"+itype+"';";
		//out.print("2");
		Statement stmt = con.createStatement();
		ResultSet r = stmt.executeQuery(sql);
		boolean fl=false;
		if(r.next()){
			int count=r.getInt("countitems");
			sql="UPDATE statdetails SET countitems="+(count+co)+", fromstore="+pfs+",mrp="+mrp+"  WHERE itemname='"+iname+"' AND itemtype='"+itype+"';";
			int rs=stmt.executeUpdate(sql);
			if(rs>0){
				out.print("successinc");
				fl=true;
				//session.setAttribute("status", "succinc");
				
				//response.sendRedirect("addStationery.jsp");
			}
		}else{
			sql="INSERT INTO statdetails VALUES('"+iname+"','"+itype+"',"+pfs+","+mrp+","+co+")";
			int rs=stmt.executeUpdate(sql);
			if(rs>0){
				out.print("success");
				fl=true;
				//session.setAttribute("status", "succ");
				//response.sendRedirect("addStationery.jsp");
			}
		}
		if(fl){
			int tamount=co*Integer.parseInt(pfs);
			sql="INSERT INTO statstorepurchase VALUES('"+store+"','"+iname+"','"+itype+"',"+pfs+","+co+","+tamount+")";
			int rs=stmt.executeUpdate(sql);
			if(rs>0){
				out.print("success");
				session.setAttribute("status", "succ");
				response.sendRedirect("addStationery.jsp");
			}else{
				out.print("fail");
				session.setAttribute("status", "fail");
				response.sendRedirect("addStationery.jsp");
			}
		}
}catch(Exception e){
	session.setAttribute("status", "fail");
	out.print(e);
	response.sendRedirect("addStationery.jsp");
}
%>
</body>
</html>
