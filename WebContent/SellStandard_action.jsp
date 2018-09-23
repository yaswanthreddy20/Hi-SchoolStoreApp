<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.Properties"%>
<%@page import="java.sql.*"%>
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
		String id = request.getParameter("id");
		String[] items = request.getParameterValues("iname[]");
		String[] itemtypes = request.getParameterValues("itype[]");
		String[] classes = request.getParameterValues("class1[]");
		String[] mrps = request.getParameterValues("mrp[]");
		String[] qtys = request.getParameterValues("qty[]");
		out.print(id);
		Properties prop = new Properties();
		try {

			InputStream input = new FileInputStream("config.properties");
			prop.load(input);
			Class.forName(prop.getProperty("classname"));
			Connection con = DriverManager.getConnection(prop.getProperty("databasepath"),
					prop.getProperty("dbuser"), prop.getProperty("dbpassword"));
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM student_details WHERE id='" + id + "';");
			int deposite = 0;
			out.print("1<br>");
			if (rs.next()) {
				deposite = Integer.parseInt(rs.getString("deposite"));
			} else {
				response.sendRedirect("");
			}
			out.print(items.length);
			int totalcost = 0;
			Date dt = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String cDate = sdf.format(dt);
			String sql = "";
			for (int i = 0; i < items.length; i++) {
				out.print(items[i]+" "+itemtypes[i]+" "+classes[i]+"<br>");
				sql = "select * from stddetails where itemname='" + items[i] + "' AND itemtype='" + itemtypes[i]+ "' AND class='" + classes[i] + "';";
				ResultSet rs2= stmt.executeQuery(sql);
				out.print("5<br>");
				rs2.next();
				int fromstore = rs2.getInt(5);
				out.print("15<br>");
				int toschool = rs2.getInt(6);
				int icount = rs2.getInt("countitems");
				out.print(icount+"<br>");
				sql = "insert into stdpurchase values('" + classes[i] + "','" + id + "','" + items[i] + "',"+ mrps[i] + "," + fromstore + "," + toschool + ",'" + cDate + "','" + qtys[i] + "')";
				totalcost = totalcost + (Integer.parseInt(mrps[i]) * Integer.parseInt(qtys[i]));
				int r = stmt.executeUpdate(sql);
				if (r > 0) {
					sql = "UPDATE stddetails SET countitems='" + (icount - Integer.parseInt(qtys[i]))
							+ "' WHERE itemname='" + items[i] + "' AND itemtype='" + itemtypes[i] + "' AND class='"
							+ classes[i] + "';";
					int r2 = stmt.executeUpdate(sql);
					if (r2 > 0) {
						out.print("added successfully<br>");
					}
				} else {
					con.rollback();
				}
			}
			
			sql = "UPDATE student_details SET deposite='" + (deposite - totalcost) + "' WHERE id='" + id + "';";
			int r2 = stmt.executeUpdate(sql);
			if (r2 > 0) {
				out.print("successfully decremented");
				session.setAttribute("status", "succ");
				if(deposite<0){
					session.setAttribute("status", "succd");
				}
				response.sendRedirect("SellStandard.jsp");
			}else{
				con.rollback();
				session.setAttribute("status", "fail");
				
				response.sendRedirect("SellStandard.jsp");
			}
		} catch (Exception e) {
			out.print(e);
			e.printStackTrace();
			session.setAttribute("status", "fail");
			response.sendRedirect("SellStandard.jsp");
		}
	%>
</body>
</html>