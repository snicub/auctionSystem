<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Bids</title>
</head>
<body>
	<p>Welcome to Edit Bids Page!</p>
	
	<% 
		try{
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
			PreparedStatement stmt=con.prepareStatement("SELECT * FROM bid;");
			ResultSet rs=stmt.executeQuery();
	%>	
		<% while(rs.next())
        {
            %>
            <form  action="http://localhost:8080/CSBay/CustomerRepresentativeFolder/deleteBids.jsp?bidID=<%=rs.getString("bidID")%>" method="POST">
            <p>
            <tr>
                <td>Bid ID :  <%=rs.getString("bidID") %></td>
                </br>
                <td>Bid Price: <%=rs.getString("bid_price") %> </td>
                </br>
                <td>Auction ID : <%=rs.getString("auctionID") %></td>
                </br>
                <td>bidder: <%=rs.getString("userID") %></td>
            	</br>
                <td>Bid Time: <%=rs.getString("time") %></td>
                </br>
               
            	<button type="submit">Delete</button>
            	
            </tr>
            </p>
            </form>
            
        <%}%>
          
	<%	
	 		con.close();
		}catch(Exception ex){
			out.print("Something went wrong.");
		}
			
	%>
	
	
	
	
	<%--  <% int temp=0;  
		String[] prices={"200.0","3.15","25.75"};
		String[] dates={"5/1/22","5/1/22","5/2/22"};
		String[] time={"8:15 AM","10:00 AM", "3:00 PM"};
		%>
	 <% for(int i = 0; i< prices.length ; i++) { %>
	 <form>
	 	</br>
        <tr>      
        	<td>bid ID: <%=i %></td>
        	</br> 
            <td>bid Price: <%=prices[i]%></td>
            </br>
            <td>bidder: NULL</td>
            </br>
            <td>Auction ID: NULL</td>
            </br>
            <td>bid Time: <%=time[i]%></td>
            </br>
            
            <button>Delete</button>
            
        </tr>
        </br>
	 </form>
	 	
    <% } %>
    </br> --%>
    
   
	
</body>
</html>