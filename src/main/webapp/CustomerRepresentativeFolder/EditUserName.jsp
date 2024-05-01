<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit User Name</title>
</head>
<body>
<%
	try {	
		//somehow get the userID
		
		String dum = request.getParameter("userId");
		
		int userID = Integer.parseInt(dum);
		
		ApplicationDB db1 = new ApplicationDB();	
		Connection con1 = db1.getConnection();
		String newUserName = request.getParameter("editUserName");
		PreparedStatement updateStud=con1.prepareStatement("UPDATE users SET userName= ? WHERE userID = ?"); 
				updateStud.setString(1,newUserName); 
				updateStud.setInt(2,userID); 
				updateStud.executeUpdate(); 
		con1.close();
		%>
        
        <script type="text/javascript">
        alert('Successfully updated usernames');
        //should move back to otheraccountinfo page
        window.location= "OtherAccountInfo.jsp";
     	</script>
     	<%	

	} catch (Exception ex) {	
		out.print(ex+"Insert failed");
	}
%>				  

</body>
</html>