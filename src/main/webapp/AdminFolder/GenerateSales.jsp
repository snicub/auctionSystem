<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Auction Search</title>	
 
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <!--Stylesheet-->
    <style media="screen">
      *,
*:before,
*:after{
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}
body{
    background-color: #080710;
}
table {
  width: 100%;
  border-collapse: collapse;
}
th {
  text-align: left;
  color: #fff;
  font-weight: 400;
  font-size: 13px;
  text-transform: uppercase;
  border-bottom: 1px solid rgba(255, 255, 255, 0.1);
  padding: 0 10px;
  padding-bottom: 14px;
}
tr:not(:first-child):hover {
  background: rgba(255, 255, 255, 0.1);
}
td {
  height: 40px;
  line-height: 40px;
  font-weight: 300;
  color: rgba(255, 255, 255, 0.4);
  padding: 0 10px;
}

    </style>
</head>
<body style="background-color: #080710; color: #eaf0fb;">
	<%
	try {	
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		
		//Create a SQL statement
		Statement stmt = con.createStatement();
		%>
		<div style="height: 100px; background-color: rgb(255,255,255,0.9);">
		<a href="AdminHome.jsp">
			<button style="background-color: #ffffff; height: 50px; margin-top:25px; align-item: center;">Home</button>
		</a>
		</div>
		<div class="background">
			<div class="shape"></div>
	        <div class="shape"></div>
	    </div>
	    <div style="display: flex;
    		justify-content: center;
    		margin-top: 3vw;
   			display: flex;
    		align-items: center;">
	    <div style="width: 500px;
            height: 310px;
            overflow: auto; margin-right: 300px;">
	    <h1 style="font-size: 25px;
		  font-weight: 200;
		  letter-spacing: 1px;
		  text-transform: uppercase;
		  text-align: center;
		  margin: 0;">
		  Best-Selling Items
		</h1>
		<%
		
		out.print("<table>");
		out.print("<tr>");
		out.print("<th>");
		out.print("Item Type");
		out.print("</th>");
		out.print("<th>");
		out.print("Sold");
		out.print("</th>");
		out.print("</tr>");
		
		String str = "SELECT type, COUNT(*) FROM auction GROUP BY type ORDER BY COUNT(*) DESC";
		ResultSet result = stmt.executeQuery(str);
		
		while(result.next()){
			out.print("<tr>");
			out.print("<td>");
			out.print(result.getString("type"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getInt("COUNT(*)"));
			out.print("</td>");
			out.print("</tr>");
		}
		out.print("</table>");
		%>
		</div>
		<div style="width: 500px;
                height: 310px;
                overflow: auto;">
		<h1 style="font-size: 25px;
			font-weight: 200;
			letter-spacing: 1px;
			text-transform: uppercase;
			text-align: center;
			margin: 0;">
			Best Buyers
		</h1>
		<%
		
		out.print("<table>");
		
		out.print("<tr>");
		out.print("<th>");
		out.print("End-User");
		out.print("</th>");
		out.print("<th>");
		out.print("Bought");
		out.print("</th>");
		out.print("</tr>");
		
		str = "SELECT userID, COUNT(*) FROM auction JOIN bid ON auction.auctionID = bid.auctionID JOIN items ON auction.itemID = items.itemID GROUP BY userID ORDER BY COUNT(*) DESC";
		result = stmt.executeQuery(str);
		while(result.next()){
			out.print("<tr>");
			out.print("<td>");
			out.print(result.getString("userID"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getInt("COUNT(*)"));
			out.print("</td>");
			out.print("</tr>");
		}
		out.print("</table>");
		
		
		//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
		str = "SELECT * FROM auction JOIN bid ON auction.auctionID = bid.auctionID JOIN items ON auction.itemID = items.itemID";
		
		//Run the query against the database.
		result = stmt.executeQuery(str);
		int totalEarnings = 0;
		
		%>
		</div>
		</div>
		<div style="
                height: 310px;
                overflow: auto;">
		<h1 style="font-size: 25px;
			font-weight: 200;
			letter-spacing: 1px;
			text-transform: uppercase;
			text-align: center;
			margin: 0;">
			Sales
		</h1>
		<%
	
		//Make an HTML table to show the results in:
		out.print("<table>");

		//make a row
		out.print("<tr>");
		//make a column
		out.print("<th>");
		//print out column header
		out.print("Item Type");
		out.print("</th>");
		//make a column
		out.print("<th>");
		out.print("Item Description");
		out.print("</th>");
		//make a column
		out.print("<th>");
		out.print("Sold At");
		out.print("</th>");
		//make a column
		out.print("<th>");
		out.print("End-User");
		out.print("</th>");
		out.print("</tr>");
		
		//parse out the results
		while (result.next()) {
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//Print out current bar name:
			out.print(result.getString("type"));
			out.print("</td>");
			out.print("<td>");
			//Print out current beer name:
			out.print(result.getString("description"));
			out.print("</td>");
			out.print("<td>");
			//Print out current beer name:
			out.print(result.getInt("currentBidPrice"));
			totalEarnings+=result.getInt("currentBidPrice");
			out.print("</td>");
			out.print("<td>");
			//Print out current beer name:
			out.print(result.getInt("userID"));
			out.print("</td>");
			out.print("</tr>");
			//Date today = new Date();
			//out.print("Today is " + today);
			
		}
		//make a column
		
		out.print("<tr>");
		out.print("<td>");
		out.print("Total Earnings");
		out.print("</td>");
		out.print("<td>");
		out.print(totalEarnings);
		out.print("</td>");
		out.print("</tr>");
		out.print("</table>");
		%>
		</div>
		<%

		//close the connection.
		con.close();
		
	} catch (Exception ex) {
		
	}
	%>			
		  
	
		
		
</body>
</html>