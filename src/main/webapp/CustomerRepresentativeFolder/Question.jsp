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
	<p>Welcome to Question and Answers Page!</p>
	
	<%
		int temp=0;
	%>
	
	 <% 
		try{
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
			PreparedStatement stmt=con.prepareStatement("SELECT * FROM questionsAndAnswers;");
			
			ResultSet rs=stmt.executeQuery();
	%>	
		<% while(rs.next())
        {
            %>
            
            <p>
            <tr>
                <td>Question ID :  <%=rs.getString("questionid") %></td>
                </br>
                <td>Q: <%=rs.getString("questions") %></td>
                </br>
                <td>A: <%=rs.getString("answers") %></td>
                </br>
                 <%--  Answer/Re-Answer: 
                 <input name="replyAnswers" type="text">
                 <% 
                 	String newAns = request.getParameter("replyAnswers");
                 	out.print(newAns);
                 %>
                <a href="UpdateAnswers.jsp?questionID=<%=rs.getString("questionid")%>&answers=<%=newAns%>">
            	<button >Submit</button>
            	</br>  --%>
            	
            	   
                  Answer : 
                  
                  <%  String check = "editAns" + temp ;%>
                
                
                 <% String newPassword = request.getParameter("editAns"+temp); 
                 	
                 %>
                 
                 <form action="UpdateAnswers.jsp?questionID=<%=rs.getString("questionid")%>&answers=<%=temp%>" method="POST">
                 	 <input name="editAns0" type="text"/>
           			<button type="submit">Confirm</button>
           		</form>
                  <% temp++; %>
                 
            	
            	
            	
            </tr>
           	</p>
            
        <%}%>
          
	<%		
	 		con.close();
		}catch(Exception ex){
			out.print(ex+"Questions Load in failed.");
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
            <button type="button">Submit</button>
        </tr>
        </br>
	 </form>
	 	
    <% } %>
    </br> --%>
	
	
</body>
</html>