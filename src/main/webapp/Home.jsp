<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>B-BAY</title>
		<base href="http://localhost:8080/B_Bay/" />
		 <script>
     	 function confirmAction() {
	        let confirmAction = confirm("Are you sure to delete your account?");
	        if (confirmAction) {
	        	window.location= "http://localhost:8080/CSBay/DeleteFolder/DeleteAccount.jsp";
	        	
	        } else {
	        	window.location= "http://localhost:8080/CSBay/Home.jsp";
	        
	        }
	      }
    </script>
	</head>
<body>
	
	
	Welcome <%=session.getAttribute("user") %>
	<br>
	Your userID is <%
	HttpSession sess = request.getSession();
	out.print(sess.getAttribute("userID"));
	%>
	<br>
	
	<a href="LoginFolder/LogoutPath.jsp">
		<button>Log Out</button>
	</a>
	
	<br>
	
	<a >
		<button onclick="confirmAction()">Delete Account</button>
	</a>
	<br>
	<a href="SearchAuctionFolder/SearchAllAuction.jsp">
		<button>Search For Items</button>
	</a>

	<br>
	<a href="SellFolder/Sell.jsp">
		<button>Sell Items</button>
	</a>
	
	

</body>
</html>
