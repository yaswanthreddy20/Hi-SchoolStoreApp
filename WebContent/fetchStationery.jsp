<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.Properties"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

	<%
		try {
			Properties prop = new Properties();
			
				InputStream input = new FileInputStream("config.properties");
				prop.load(input);
			String jdbcdriver = prop.getProperty("classname");
			final String url = prop.getProperty("databasepath");
			final String user = prop.getProperty("dbuser");
			final String pass = prop.getProperty("dbpassword");
			
			Connection con = null;
			Statement stmt = null;
			ResultSet result = null;
			try {
				Class.forName(jdbcdriver);
				con = DriverManager.getConnection(url, user, pass);
			} catch (ClassNotFoundException e) {
			} catch (SQLException e) {
			}
			try {
				String query;
				stmt = con.createStatement();
				query = "SELECT * FROM statdetails WHERE itemname='"+request.getParameter("iname")+"' AND itemtype='"+request.getParameter("itype")+"';";
				//out.print("1");
				result = stmt.executeQuery(query);
				if (!result.next()) {
					out.print("0");
					//out.print("[{\"username\":\""+result.getString("username")+"\",\"type\":\""+result.getString("type")+"\",\"name\":\""+result.getString("name")+"\"}]");
				} else {
					
					JSONArray array = new JSONArray();
				
						
						JSONObject obj = new JSONObject();
						obj.put("iname", result.getString("itemname"));
						obj.put("itype", result.getString("itemtype"));
						obj.put("mrp", result.getString("mrp"));
						
						array.put(obj.toString());
				
						//out.print("1");
					out.print(array);
				}
				out.close();
			} catch (SQLException e) {
				out.print("Exception: " + e);
			} finally {
				if (stmt != null) {
					try {
						stmt.close();
					} catch (SQLException e) {
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
					}
				}
			}
		} catch (Exception e) {

		}
	%>
