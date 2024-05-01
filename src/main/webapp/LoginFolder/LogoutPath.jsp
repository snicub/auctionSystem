<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout Path</title>

</head>
<body>
<%
	session.invalidate();
	response.sendRedirect("http://localhost:8080/B_Bay/LoginFolder/Login.jsp");
%>				  

</body>
</html>