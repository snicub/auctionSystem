<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Bids Path</title>

</head>
<body>

<%
	try {	
		//how to get attribute from another jsp?
		
		String dum = request.getParameter("bidID");
		int bidID = Integer.parseInt(dum);
		
		ApplicationDB db1 = new ApplicationDB();	
		Connection con1 = db1.getConnection();
		PreparedStatement updateStud=con1.prepareStatement("delete from bid where auctionID = " + bidID);  
		updateStud.executeUpdate(); 
		con1.close();
		%> 
       		 <script type="text/javascript">
       		 alert('Bids Successfully Deleted! ');
       		 //go back to delete bid site
       		  window.location= "http://localhost:8080/cs336Sample/CustomerRepresentativeFolder/EditBids.jsp";
    		 </script>
		<% 
	
	} catch (Exception ex) {
	
		out.print("Deletion failed");
	}
%>				  

</body>
</html>