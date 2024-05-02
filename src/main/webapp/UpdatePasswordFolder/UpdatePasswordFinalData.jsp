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
<%
	try {	
		String userName = (String)session.getAttribute("newUser");
		ApplicationDB db1 = new ApplicationDB();	
		Connection con1 = db1.getConnection();
		String pass = request.getParameter("password");
		PreparedStatement updateStud=con1.prepareStatement("UPDATE users SET password=? WHERE userName = ?"); 
				updateStud.setString(1,pass); 
				updateStud.setString(2,userName); 
				updateStud.executeUpdate(); 
		con1.close();
		%>
        
        <script type="text/javascript">
        alert('Successfully updated password');
        window.location= "http://localhost:8080/CSBay/Home.jsp";
     	</script>
     	<%	

	} catch (Exception ex) {	
		out.print("Insert failed");
	}
%>				  

</body>
</html>