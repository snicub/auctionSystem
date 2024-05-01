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
<form method="post" action="UpdatePasswordFinalData.jsp">
			<table>
				 <tr>    
					<td>Enter User Name</td><td><input type="text" name="userName"></td>
				</tr> 
				<tr>
					<td>Enter New Password</td><td><input type="text" name="password"></td>
				</tr>
			</table>
			
			<input type="submit" value="Update Password">
</form>	

</body>
</html>