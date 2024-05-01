<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Account from Cus Rep</title>

</head>
<body>

<%
	try {	
		//somehow get the 
		String userName = request.getParameter("user");
		String password = request.getParameter("pass");	
		ApplicationDB db1 = new ApplicationDB();	
		Connection con1 = db1.getConnection();
		PreparedStatement updateStud=con1.prepareStatement("delete from users where userName = ? and password = ?"); 
		updateStud.setString(1,userName); 
		updateStud.setString(2,password); 
		updateStud.executeUpdate(); 
		con1.close();
		%> 
       		 <script type="text/javascript">
       		 alert('Account Successfully Deleted!');
       		 window.location= "OtherAccountInfo.jsp";
    		 </script>
		<% 
	
	} catch (Exception ex) {
	
		out.print(ex+"Something went wrong");
	}
%>				  

</body>
</html>