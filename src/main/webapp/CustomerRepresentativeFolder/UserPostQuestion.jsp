<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Post Questions Path</title>
</head>
<body>
 <%
 try {
 	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	//get the question from param
	String userQuestion = request.getParameter("userQuestion0");
	//get the current user
	
	String emptyAnswer="";
	//Make an insert statement for the Sells table:
			String insert = "INSERT INTO questionsAndAnswers(questions, answers)"
					+ "VALUES (?, ?)";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(insert);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, userQuestion);
			ps.setString(2, emptyAnswer);
			
			
			//Run the query against the DB
			ps.executeUpdate();
			
			con.close();
			%>
			<script type="text/javascript">
         		alert('Successfully Asked a new Question!');
         		window.location= "userAskQuestion.jsp"
 			</script>
			
<% 
		con.close();
 } catch(Exception ex){
	 out.print(ex+"Insert failed");
 }
	
 %>
 
 

</body>
</html>