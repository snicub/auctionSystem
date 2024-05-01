<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage User Account</title>
</head>
<body>
	<p>Welcome to Manage User Account page!</p>
	
	 <% 
		try{
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
			PreparedStatement stmt=con.prepareStatement("SELECT * FROM users;");
			ResultSet rs=stmt.executeQuery();
	%>	
		<% 
		//if the result query still have users keep looping
		while(rs.next())
        {
            %>
            
            <p>
            <tr>
                <td>User ID :  <%=rs.getString("userId") %></td>
                </br>
                <td>Username: <%=rs.getString("userName") %></td>
                </br>
            	Edit Username: 
            	
            	<% String newUserName = request.getParameter("editUserName"); %>
            	
            	 <form action="EditUserName.jsp?userId=<%=rs.getString("userId")%>" method="POST">
            		<input name="editUserName" type="text">
            	
            		<button type="submit">Confirm</button>
            	</form> 
            	
            	
            		<%-- <a href="EditUserName.jsp?newUserName=<%=request.getParameter("editUserName")%>&userId=<%=rs.getString("userId")%>">
            			<button type="button">Confirm</button>
            		</a> --%>
            		
            	
            	
            	
            	
                <td>Password: <%=rs.getString("password") %></td>
                </br>
                 Edit Password: 
                
                
                 <% String newPassword= request.getParameter("editPassword"); %>

           		<form action="EditUserPassword.jsp?userID=<%=rs.getString("userId")%>" method="POST">
           			 <input name="editPassword" type="text">
           			<button type="submit">Confirm</button>
           		</form> 
           		
           		<%-- <a href="EditUserPassword.jsp?newPassword=<%=request.getParameter("editPassword")%>&userID=<%=rs.getString("userId")%>">
           			<button type="button">Confirm</button>
           		</a> --%>
           		
           		
            	
            	<form action="DeleteUserAccountsFromCusRep.jsp?user=<%=rs.getString("userName")%>&pass=<%=rs.getString("password")%>" method="POST">
            		<button type="submit">Delete Account</button>
            	</form>
            	
                 
            </tr>
            </p>
           
        <%}%>
          
	<%		
	 		con.close();
		}catch(Exception ex){
			out.print("Questions Load in failed.");
		}
			
	%> 
	
	
	
	
	
	<%--  <% int temp=0;  
		String[] usernames={"tinysheep007","pooyi"};
		String[] passwords={"a123456b","aiaiaiok4"};
		%>
	 <% for(int i = 0; i < usernames.length ; i++) { %>
	 <form>
	 	</br>
        <tr>      
        	<td>Account ID: <%=i %></td>
        	</br> 
            <td>Username : <%=usernames[i]%></td>
            </br>
            Edit Username: <input name="editUserName" type="text">
            <button>Confirm</button>
            </br>
            <td>Password : <%=passwords[i]%></td>
            </br>
            Edit Password: <input name="editPassword" type="text">
            <button>Confirm</button>
            </br>
            
            <button>Delete Account</button>
        </tr>
        </br>
	 </form>
	 	
    <% } %> --%>
	
	
</body>
</html>