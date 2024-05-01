<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title></title>
	
	</head>
	

<body>		

<%
	try {
		
	
	
		
		//make sure the name does not already exist in the database
		
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		String newUser = request.getParameter("userName");
		PreparedStatement stmt=con.prepareStatement("SELECT userName FROM Users u WHERE u.userName = ?;");  
		stmt.setString(1, newUser);
		ResultSet rs=stmt.executeQuery();	
	
		if(rs.next()){ //if there is a matching userName
			String fname = new String(rs.getString(1));
			out.println("Input userName: " + newUser);
			out.println("DB userName: " + fname);
			if(newUser.equals(fname)){
				con.close();
				 %>
		            <script type="text/javascript">
		            	alert('This username is already created. Please use a different username');
		            	window.location= "http://localhost:8080/B_Bay/";
		            </script>
		         <% 
				
			}
		}
		
		
		

		//Get parameters from the HTML form at the index.jsp
		
		String newPassword = request.getParameter("password");
		String newEmail = request.getParameter("email");
		String newAddress = request.getParameter("address");
		String newBirthday = request.getParameter("birthday");
		
		//Make an insert statement for the Sells table:
		String insert = "INSERT INTO Users(userName, email, password, address, birthday)"
				+ "VALUES (?, ?, ?, ?, ?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, newUser);
		ps.setString(2, newEmail);
		ps.setString(3, newPassword);
		ps.setString(4, newAddress);
		ps.setString(5, newBirthday);
		//Run the query against the DB
		ps.executeUpdate();
		
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		 %>
         <script type="text/javascript">
         	alert('Successfully created a new account!');
        	 window.location= "http://localhost:8080/B_Bay/";
      	 </script>
         <% 
		
	} catch (Exception ex) {
	
		out.print("Insert failed");
	}
%>				  

</body>
</html>