<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cus Rep Login Path</title>

</head>
<body>
<%
	try {	
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		String newUser = request.getParameter("userName");
		//make sure the cusRep attribute within the user is true
		PreparedStatement stmt=con.prepareStatement("SELECT userName FROM cr c WHERE c.userName = ?;");  
		stmt.setString(1, newUser);
		ResultSet rs=stmt.executeQuery();	
		String DBpassword = null;
	
		  if(rs.next()){ //if there is a matching userName
				String fname = new String(rs.getString(1));
		 		
			if(newUser.equals(fname)){ //userName exists, need to check password
				
				ApplicationDB db1 = new ApplicationDB();	
				Connection con1 = db1.getConnection();
				String userPass = request.getParameter("password");
				PreparedStatement stmt1=con1.prepareStatement("SELECT password FROM cr c WHERE c.userName = ? and c.password = ?;");  
				stmt1.setString(1, newUser);
				stmt1.setString(2, userPass);
				ResultSet rs1=stmt1.executeQuery();
				//out.print("User Pas: " + userPass);
				while(rs1.next()){
					  DBpassword = new String(rs1.getString(1));
				       //out.println("DB Password: "+ DBpassword);  
				} 
				if(userPass.equals(DBpassword)){//userName exists, pass exists
					con.close();
					con1.close();
		         	session.setAttribute("user", fname);
		         	session.setAttribute("pass", userPass);
		         	//login success and redirect to home page for cus rep
					response.sendRedirect("http://localhost:8080/CSBay/CustomerRepresentativeFolder/CusRepHome.jsp");
				}else{ //pass does not match db's pass
					con.close();
					con1.close();
					  %>
			            <script type="text/javascript">
			            alert('Incorrect Password');
			            window.location= "http://localhost:8080/CSBay/CustomerRepresentativeFolder/CusRepLogin.jsp";
			         </script>
			         <% 
					//response.sendRedirect("http://localhost:8080/B_Bay/");
				}
			} 
		}else{ //userName is NOT in DB that is a customer rep
			con.close();
			  %>
	           
	            <script type="text/javascript">
	            alert('UserName Does Not Exist');
	      
	            window.location= "http://localhost:8080/CSBay/CustomerRepresentativeFolder/CusRepLogin.jsp";
	         </script>
	         <%
		    //response.sendRedirect("http://localhost:8080/B_Bay/");
		
		}   
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		//con.close();
		//con1.close();
		
		
	} catch (Exception ex) {
	
		out.print("insert failed");
	}
%>				  

</body>
</html>