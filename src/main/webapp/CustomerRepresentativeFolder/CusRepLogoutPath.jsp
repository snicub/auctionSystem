<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Rep Logout Path</title>

</head>
<body>
<%
	session.invalidate();
	response.sendRedirect("http://localhost:8080/CSBay/CustomerRepresentativeFolder/CusRepLogin.jsp");
	
%>				  
	<script type="text/javascript">
		alert('Cus Rep Log out Sucesssful!');
	</script>

</body>
</html>