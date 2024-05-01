<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Account</title>
</head>
<body>

	<form method="post" action="CreateAccountData.jsp">
		<table>
			<tr>    
				<td>User Name</td><td><input type="text" required="required"name="userName"></td>
			</tr>
			<tr>
				<td>Email</td><td><input type="text"required="required"name="email"></td>
			</tr>
			<tr>
				<td>Password</td><td><input type="password" required="required"name="password"></td>
			</tr>
			<tr>
				<td>Address</td><td><input type="text" required="required"name="address"></td>
			</tr>
			<tr>    
				<td>Birthday</td><td><input type="text" required="required" value="yyyy-mm-dd" name="birthday"></td>
			</tr>
		</table>
		<input type="submit" value="Create Account">
	</form>
</body>