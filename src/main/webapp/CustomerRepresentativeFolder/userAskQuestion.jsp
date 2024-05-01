<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>	Questions </title>
</head>
<body>
	<p>Welcome to Ask Answers Page!</p>
	<% 
		try{
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
			PreparedStatement stmt=con.prepareStatement("SELECT * FROM questionsAndAnswers;");
			ResultSet rs=stmt.executeQuery();
	%>	
	
	<form method="POST" action="UserPostQuestion.jsp">
		Ask a Question Here:
		<input type="text" name="userQuestion0"/>
		<button type="submit">Submit</button>
	</form>
	
	<p>View the Questions From Other Users</p>
	  
		<% while(rs.next())
        {
            %>
            <form >
            <tr>
                <td>Question ID :  <%=rs.getString("questionID") %></td>
                <td>Q: <%=rs.getString("questions") %></td>
                <td>A: <%=rs.getString("answers") %></td>
                
            </tr>
            </form>
        <%}%>
          
	<%		
	 		con.close();
		}catch(Exception ex){
			out.print("Questions Load in failed.");
		}
			
	%>  
	
	
	 <%-- <% int temp=0;  
		String[] questions={"how to log in?","How to check my bid?"};
		String[] answers={"go to the home page at /B_Bay/home.jsp","go to your home page and check all bids"};
	 %>
	 <% for(int i = 0; i < questions.length ; i++) { %>
	 <form>
	 	</br>
        <tr>      
        	<td>Question ID : <%=i %></td>
        	</br> 
            <td>Q: <%=questions[i]%></td>
            </br>
            <td>A: <%=answers[i]%></td>
            </br>
            Answer/Re-Answer: <input name="replyAnswers" type="text">
            <button>Submit</button>
        </tr>
        </br>
	 </form>
	 	
    <% } %>
    </br> --%>
	
	
</body>
</html>