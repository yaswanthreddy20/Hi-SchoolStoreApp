<%@page import="java.util.ArrayList"%>
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
		String sql="";
		Statement stmt=con.createStatement();
		Enumeration e=request.getParameterNames();
		//String name=request.getParameter(e.nextElement().toString());
		ArrayList req=new ArrayList<String>();
		while(e.hasMoreElements()){
			req.add(e.nextElement().toString());
		}
		String sql1="";
		for(int i=0;i<(req.size()-2);i++){
			if(i!=0){
				sql1=sql1+" AND "+req.get(i)+"='"+request.getParameter(req.get(i).toString())+"' ";
			}else{
				sql1=sql1+" "+req.get(i)+"='"+request.getParameter(req.get(i).toString())+"' ";
			}
		}
		int amount=Integer.parseInt(request.getParameter("amount"));
		String table=request.getParameter("table");
		sql="SELECT * FROM "+table+" WHERE "+sql1+";";
		out.print(sql+"<br>");
		ResultSet rs=stmt.executeQuery(sql);
		if(rs.next()){
			int moneytobe=Integer.parseInt(rs.getString("money_to_paid"));
			out.print(moneytobe+"<br>");
			sql="UPDATE "+table+" SET money_to_paid="+(moneytobe-amount)+" WHERE "+sql1+";";
			out.print(sql+"<br>");
			int r=stmt.executeUpdate(sql);
			if(r>0){
				out.print("SUCCESS");
				session.setAttribute("status", "succ");
				response.sendRedirect("standardPayDetails.jsp?table="+table);
			}else{
				out.print("FAIL");
			
				session.setAttribute("status", "fail");
				response.sendRedirect("standardPayDetails.jsp?table="+table);
			}
			
		}else{
			out.print("FAIL");
			
			session.setAttribute("status", "fail");
			response.sendRedirect("standardPayDetails.jsp?table="+table);
		}
		out.print(sql1);
			
}catch(Exception e){
	
}
%>
</body>
</html>