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
		Enumeration e=request.getParameterNames();
		String name=request.getParameter(e.nextElement().toString());
		out.print(name);
		String page1=request.getParameter(e.nextElement().toString());
		//out.print(page1);
		sql=sql+"DELETE FROM "+name;
		if(e.hasMoreElements()){
			sql=sql+" WHERE ";
		}
		while(e.hasMoreElements()){
			String par=(String)e.nextElement();
			sql=sql+par+"='"+request.getParameter(par);
			if(e.hasMoreElements()){
				sql=sql+"' AND ";
			}
		}
		sql=sql+"';";
		//sql = "SELECT * FROM login;";
		Statement stmt = con.createStatement();
		int r = stmt.executeUpdate(sql);
		if(r>0){
			session.setAttribute("status", "delsuc");
			response.sendRedirect(page1.toString()+"?table="+request.getParameter("name"));
		}else{
			session.setAttribute("status", "delfail");
			response.sendRedirect(page1.toString());
		}
}catch(Exception e){
	out.print(e.toString());	
}
%>
</body>
</html>