<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Auctions Path</title>

</head>
<body>

<%
	try {	
		//how to get attribute from another jsp?
				
		/*
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		
		//Create a SQL statement
		Statement stmt = con.createStatement();
		
		String str = "SELECT type, COUNT(*) FROM AUCTION GROUP BY type ORDER BY COUNT(*) DESC";
		ResultSet result = stmt.executeQuery(str);
		*/
		
		String dum = request.getParameter("auctionID");
		int auctionID = Integer.parseInt(dum);
		out.print(auctionID);
		
		
		ApplicationDB db1 = new ApplicationDB();
		%> here<% 
		Connection con = db1.getConnection();
		%> 2<% 
		Statement stmt = con.createStatement();
		int i = stmt.executeUpdate("DELETE FROM bid where auctionID = " + auctionID);
		int t = stmt.executeUpdate("DELETE FROM auction where auctionID = " + auctionID);
		//PreparedStatement updateStud = con1.prepareStatement("DELETE FROM AUCTION where AuctionID = ?"); 
		%> 3<% 
		//updateStud.setInt(1,auctionID); 
		%> 4<% 
		
		//updateStud.executeUpdate(); 
		%> 5<% 
		con.close();
		%> 
       		 <script type="text/javascript">
       		 alert('Auctions Successfully Deleted!');
       		 window.location= "http://localhost:8080/cs336Sample/CustomerRepresentativeFolder/EditAuctions.jsp";
    		 </script>
		<% 
	
	} catch (Exception ex) {
	
		out.print(ex+"Deletion failed");
	}
%>				  

</body>
</html>