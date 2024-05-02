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
			String useremail = request.getParameter("email");
			PreparedStatement stmt1=con1.prepareStatement("SELECT email FROM Users u WHERE u.userName = ? and u.email = ?;");  
			stmt1.setString(1, newUser);
			stmt1.setString(2, useremail);
			ResultSet rs1=stmt1.executeQuery();
			while(rs1.next()){
				DBemail = new String(rs1.getString(1));
			} 
			if(useremail.equals(DBemail)){//userName exists, pass exists
				con.close();
				con1.close();

				response.sendRedirect("http://localhost:8080/CSBay/UpdatePasswordFinal.jsp");
			}else{ //email does not match db's email
				con.close();
				con1.close();
				  %>
		           
		            <script type="text/javascript">
		            alert('Incorrect email');
		      
		            window.location= "http://localhost:8080/CSBay/";
		         </script>
		         <% 
			}
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