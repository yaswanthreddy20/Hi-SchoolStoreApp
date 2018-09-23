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
		String user = request.getParameter("user");
		String pass = request.getParameter("pass");

		Properties prop = new Properties();
		try {
			InputStream input = new FileInputStream("config.properties");
			prop.load(input);
			if (!(user.equals("") && pass.equals(""))) {
				Class.forName(prop.getProperty("classname"));

				Connection con = DriverManager.getConnection(prop.getProperty("databasepath"),
						prop.getProperty("dbuser"), prop.getProperty("dbpassword"));
				String sql = "SELECT * FROM login WHERE username = '" + user + "' AND password ='" + pass + "';";
				//sql = "SELECT * FROM login;";
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				//PreparedStatement pstmt = con.prepareStatement(sql);
				//ResultSet rs = pstmt.executeQuery();
				
				if(rs.next()){
				//rs.last();
				
				if (rs.getString(1).equals(user) && rs.getString(2).equals(pass)) {
					session.setAttribute("permission", "grant");
					session.setAttribute("type", rs.getString(3));
					session.setAttribute("user", rs.getString(4));
					session.setAttribute("username", rs.getString(1));
					response.sendRedirect("home.jsp");
					out.print(rs.getString(1));
				} else {
					out.println(user + pass);
					session.setAttribute("permission", "incorrect");
					response.sendRedirect("index.jsp");
					;
					out.println(rs.getString(1).toString().equals(user));
					out.print(rs.getString(1) + rs.getString(2));
				}
				}else{
					session.setAttribute("permission", "incorrect");
					response.sendRedirect("index.jsp");
				}
			}else{
				session.setAttribute("permission", "empty");
				response.sendRedirect("index.jsp");
			}
		} catch (Exception e) {
			out.println(e);
		}
	%>
</body>
</html>