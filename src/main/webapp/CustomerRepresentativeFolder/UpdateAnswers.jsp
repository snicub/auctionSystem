<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Answers</title>
</head>
<body>
<%
	try {	
		//somehow get the ID
		String dum = request.getParameter("questionID");
		
		int questionID = Integer.parseInt(dum);
		
		
		ApplicationDB db1 = new ApplicationDB();	
		Connection con1 = db1.getConnection();
		
		String answers = request.getParameter("answers");
		
		//answers = Integer.toString(answers);
		String ans = "editAns"+ answers;
		out.print(ans);
		String ok = request.getParameter("editAns0");
		out.print(ok);
		//answers = "double check your wifi connection";
		out.print(answers);
		PreparedStatement updateStud=con1.prepareStatement("UPDATE questionsAndAnswers SET answers =? WHERE questionID = ?"); 
				updateStud.setString(1,ok); 
				updateStud.setInt(2,questionID); 
				updateStud.executeUpdate(); 
		con1.close(); 
		out.print("finish");
		%>
        
         

     	 <script type="text/javascript">
       		 alert('Update Question Sucess!');
       		 window.location= "http://localhost:8080/cs336Sample/CustomerRepresentativeFolder/Question.jsp";
    		</script>
     	<%	
     	 
	} catch (Exception ex) {	
		out.print(ex+"Insert failed");
	}
%>				  

</body>
</html>