<%@page import="java.io.FileWriter"%>
<%@ include file="banner.jsp"%>
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
<%@page import="java.util.Scanner"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
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
	String table=request.getParameter("table");
	String sql="SELECT * FROM "+table+";";
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	ResultSetMetaData rdm=rs.getMetaData();
	int count=rdm.getColumnCount();
	//if(request.getParameter("type").equals("items")){
		if(request.getParameter("for").equals("school")){
		//	sql="SELECT itemname,class,itemtype,mrp, toschool AS storePrice,countitems,meduim FROM stddetails;";
			sql="SELECT ";
			for(int i=1;i<=count;i++){
				if(rdm.getColumnName(i).equals("toschool")){
					sql=sql+" toschool AS 'storeprice'";
					if(i!=count){
						sql=sql+",";
					}
				}else if(!rdm.getColumnName(i).equals("fromstore")){
					sql=sql+rdm.getColumnName(i);
					if(i!=count){
						sql=sql+",";
					}
				}
			}
			//sql=sql+" FROM "+table+";";
		}
		else if(request.getParameter("for").equals("self")){
		//	sql="SELECT itemname,class,itemtype,mrp, tostudents AS storePrice,countitems,meduim FROM stddetails;";
			sql="SELECT ";
			for(int i=1;i<=count;i++){
				if(rdm.getColumnName(i).equals("fromstore")){
					sql=sql+" fromstore AS 'storeprice'";
					if(i!=count){
						sql=sql+",";
					}
				}else if(!rdm.getColumnName(i).equals("toschool")){
					sql=sql+rdm.getColumnName(i);
					if(i!=count){
						sql=sql+",";
					}
				}
			}
			//sql=sql+" FROM "+table+";";
		}
		if(request.getParameter("iname")!=null && request.getParameter("class")!=null){
			sql=sql+" FROM "+table+" WHERE "+request.getParameter("class")+" LIKE '%"+request.getParameter("iname")+"%';";
		}else{
			sql=sql+" FROM "+table+";";
		}
	//}else{
	//	sql="SELECT * FROM stddetails;";
//	}
		out.print(sql);
		 stmt = con.createStatement();
		ResultSet rs1 = stmt.executeQuery(sql);
	File f=new File("G:/Eclipse Workspace/storeappfinal1/WebContent/files/exported.csv");
	ResultSetMetaData md=rs1.getMetaData();
	out.print(f.isFile());
	out.print(f.exists());
	if(!f.exists()){
		f.createNewFile();
		
	}else{
		out.print(f.delete());
		
	//	f.createNewFile();
	}
	FileWriter fw=new FileWriter(f);
	
	String s="";
		for(int i=1;i<=md.getColumnCount();i++){
			if(i==md.getColumnCount()){
				if(md.getColumnName(i).equals("toschool")){
					s=s+"storeprice"+"\n";
				}else{
				s=s+md.getColumnName(i)+"\n";
				}
				
			}else{
				if(md.getColumnName(i).equals("toschool")){
					s=s+"storeprice"+",";
				}else{
				s=s+md.getColumnName(i)+",";
				}
			}
		}
		fw.write(s);
		out.print(s);

	while(rs1.next()){
		 s="";
		for(int i=1;i<=md.getColumnCount();i++){
			if(i==md.getColumnCount()){
				s=s+rs1.getString(i)+"\n";
			}else{
				s=s+rs1.getString(i)+",";
			}
		}
		fw.write(s);
		out.print(s);
	}
	fw.close();
	response.sendRedirect(request.getParameter("page")+"?type=download&table="+table);
	/*String filename = "exported.csv";   
	  String filepath = "file/";   
	  response.setContentType("APPLICATION/CSV");   
	  response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");   
	  
	  java.io.FileInputStream fileInputStream=new java.io.FileInputStream(new File(filepath + filename));  
	            
	  int i;   
	  while ((i=fileInputStream.read()) != -1) {  
	    out.write(i);   
	  }out.flush();
	  fileInputStream.close();*/   
	//response.sendRedirect("files/exported.csv");

}catch(Exception e){
	out.print(e.toString());
}
%>
</body>
</html>