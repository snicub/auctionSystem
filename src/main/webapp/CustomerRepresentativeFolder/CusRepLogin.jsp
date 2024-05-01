<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> --%>
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Representative Login</title>
</head>
<body>

	<p>Welcome to Customer Representative Login</p>
	
<form method="post" action="CusRepHome.jsp">
			<table>
				<tr>    
					<td>Rep Username</td><td><input type="text" name="userName"></td>
				</tr>
				<tr>
					<td>Password</td><td><input type="text" name="password"></td>
				</tr>
			</table>
			<input type="submit" value="Log In">
</form>
	
<a href="CusRepHome.jsp">
	<button>Assuming logged in</button>
</a>
<br/>

<a href="../">
	<button> Go Back to User</button>
</a>
<br/>

</body>
</html>