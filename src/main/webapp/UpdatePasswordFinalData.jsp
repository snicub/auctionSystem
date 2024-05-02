<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
	try {	
		
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		String newUser = request.getParameter("userName");
		PreparedStatement stmt=con.prepareStatement("SELECT u.userName FROM Users u WHERE u.userName = ?;");  
		stmt.setString(1, newUser);
		ResultSet rs=stmt.executeQuery();	
		String DBemail = null;
		
		
		
		while(rs.next()){
			 String fname = new String(rs.getString(1));
		if(fname.equals(newUser)){ //userName exists, need to check email	
			ApplicationDB db1 = new ApplicationDB();	
			Connection con1 = db1.getConnection();
			String pass = request.getParameter("password");
			PreparedStatement updateStud=con1.prepareStatement("UPDATE Users SET password=? WHERE userName = ?"); 
					updateStud.setString(1,pass); 
					updateStud.setString(2,fname); 
					updateStud.executeUpdate(); 
			
			con.close();
			con1.close();
			 %>
	           
	            <script type="text/javascript">
	            alert('Successfully updated password');
	      
	            window.location= "http://localhost:8080/CSBay/";
	         </script>
	         <%	
			
		}
		else{ //userName is NOT in DB
			con.close();
			  %>
	           
	            <script type="text/javascript">
	            alert('UserName Does Not Exist');
	      
	            window.location= "http://localhost:8080/CSBay/";
	         </script>
	         <%		
		} 
	} 
		
	} catch (Exception ex) {
	
		out.print("Insert failed");
	}
%>				  

</body>
</html>