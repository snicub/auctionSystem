<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<%@page import="com.cs336.pkg.ApplicationDB"%>
<jsp:useBean id="u" class="com.cs336.pkg.Users"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title></title>
	
	</head>
	

<body>		

<%
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	String newUser = request.getParameter("userName");
	PreparedStatement stmt=con.prepareStatement("SELECT userName FROM cr u WHERE u.userName = ?;");  
	stmt.setString(1, newUser);
	ResultSet rs=stmt.executeQuery();	
	
	if(rs.next()){ //if there is a matching userName which means a new account should not be created
		String fname = new String(rs.getString(1));
		//out.println("Input userName: " + newUser);
		//out.println("DB userName: " + fname);
		if(newUser.equals(fname)){
			con.close();
			 %>
	            <script type="text/javascript">
	            	alert('This username is already created. Please use a different username');
	            	window.location= "http://localhost:8080/CSBay/AdminFolder/AdminHome.jsp";
	            </script>
	         <% 
			
		}
	}else{ //there is no same username in the DB
		int i=db.createAccount(u);
		con.close();
		if(i>0){
			%>
		    <script type="text/javascript">
		    	alert('Successfully created a new account!');
		   	 window.location= "http://localhost:8080/CSBay/AdminFolder/AdminHome.jsp";
		 	 </script>
		    <% 
		
		}else{
			con.close();
			%>
		    <script type="text/javascript">
		    	alert('Error');
		   	 window.location= "http://localhost:8080/CSBay/AdminFolder/AdminHome.jsp";
		 	 </script>
		    <% 
		}
	}
%>

</body>
</html>