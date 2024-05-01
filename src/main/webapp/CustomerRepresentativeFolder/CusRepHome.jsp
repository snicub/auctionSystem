<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cus Rep Home</title>
</head>
<body>

	<p>
	Welcome to Customer Representative's Home page!
	</p>
	
	<a href="Question.jsp">
		<button >Q & A</button>
	</a>
	<br/>
	
	<a href="OtherAccountInfo.jsp">
		<button>Other User Accounts Info</button>
	</a>
	<br/>
	
	<a href="EditBids.jsp">
		<button>Edit Bids</button>
	</a>
	<br/>
	
	<a href="EditAuctions.jsp">
		<button>Edit Auctions</button>
	</a>
	<br/>
	
	<a href="../">
		<button type="button">Log Out</button>
	</a>
	
</body>
</html>