<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Auctions</title>
</head>
<body>
	 <p>Welcome to Edit Auctions Page!</p>
		 <% 
		try{
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
			PreparedStatement stmt=con.prepareStatement("SELECT * FROM auction;");
			ResultSet rs=stmt.executeQuery();
	%>	
		<% while(rs.next())
        {
            %>
            <form  action="DeleteAuctions.jsp?auctionID=<%=rs.getString("auctionID")%>" method="POST">
            <p>
            <tr>
                <td>Auction ID :  <%=rs.getString("auctionID") %></td>
                </br>
                <!-- there's no item ID within auction, there is only auction ID in CONTAINS TABLE -->
                <%-- <td>Item ID : <%=rs.getString("ItemID") %></td> --%>
                <td>Start Date: <%=rs.getString("startDate") %></td>
                </br>
                <td>End Date: <%=rs.getString("endDate") %></td>
                </br>
               
            	<button type="submit">Delete</button>
            	
            </tr>
            </p>
            </form>
        <%}%>
          
	<%		
		
	 		con.close();
		}catch(Exception ex){
			out.print(ex+"Something went wrong.");
		}
			
	%>
	
	
	 <%-- <% 
	 	//back up version
	 	int temp=0;  
		String[] prices={"200.0","3.15","25.75"};
		String[] dates={"5/1/22","5/1/22","5/2/22"};
		String[] time={"8:15 AM","10:00 AM", "3:00 PM"};
		%>
	 <% for(int i = 0; i< prices.length ; i++) { %>
	 <form>
	 	</br>
        <tr>      
        	<td>Auction ID: <%=i %></td>
        	</br> 
            <td>Item ID: <%=i*2+1 %></td>
            </br>
            <td>Auction Date: <%=dates[i]%></td>
            </br>
            
            <button>Delete</button>
            
        </tr>
        </br>
	 </form>
	 	
    <% } %> --%>
	
	
	
</body>
</html>