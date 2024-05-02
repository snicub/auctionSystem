<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	try{
		String clothingType = (String)session.getAttribute("clothingType");
		%>
	
		<a href="http://localhost:8080/CSBay/Home.jsp">
			<button>Go To Home</button>
		</a>
		
	<br>
		<% 
		if(clothingType.equals("Pant")){
			String pantWaistVal =  request.getParameter("pantWaistOption");
			String pantType = request.getParameter("pantTypeOption");
			String pantGender =request.getParameter("pantGenderOption");
			String pantColor = request.getParameter("pantColorOption");
			String pantBidPrice = request.getParameter("pantBidPriceOption");
			
			int pantWaistValToInt = -1;
			double pantBidPriceToDouble = -1;
			 if(!(pantWaistVal.equals("null"))){//int values must be  convereted from string to int
				 pantWaistValToInt = Integer.parseInt(pantWaistVal);
			 }
			if(!(pantBidPrice.equals("null"))){
				pantBidPriceToDouble = Double.valueOf(pantBidPrice);
			}
				
			
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			//create filter mysql query
			StringBuilder filter = new StringBuilder();
			//there is at least one of the search values 
			//there is pantwaist
			filter.append("select * from pant ");
			if( (pantWaistValToInt != -1) || (!(pantType.equals("null"))) || (!(pantGender.equals("null"))) 
					|| (!(pantColor.equals("null"))) ||  (pantBidPriceToDouble != -1)){
				filter.append("where ");
			}
			//--------
			if(pantWaistValToInt != -1 ){
				filter.append(" pant_waist = " + pantWaistValToInt + " ");
			}
			//there is pants type
			if(  pantWaistValToInt != -1  && ( !(pantType.equals("null")) ||!(pantGender.equals("null")) 
					||!(pantColor.equals("null")) || pantBidPriceToDouble != -1)){
				filter.append(" and ");
			}
			if( !(pantType.equals("null")) ){
				filter.append(" pant_type = '" + pantType + "' ");
			}
			//there is pants gender
			if( !(pantType.equals("null")) && ( !(pantGender.equals("null")) ||!(pantColor.equals("null")) || pantBidPriceToDouble != -1)){
				filter.append(" and ");
			}
			if( !(pantGender.equals("null"))){
				filter.append(" pant_gender = '" + pantGender + "' ");
			}
			//there is pants color
			if(!(pantGender.equals("null")) && (!(pantColor.equals("null")) || pantBidPriceToDouble != -1)){
				filter.append(" and ");
			}
			if(!(pantColor.equals("null"))){
				filter.append(" color = '" + pantColor + "' ");
			}
			//there is bid price
			if( !(pantColor.equals("null")) && pantBidPriceToDouble != -1){
				filter.append(" and ");
			}
			if( pantBidPriceToDouble != -1){
				filter.append(" bidPrice = " + pantBidPriceToDouble + " ");
			}
			String whereQuery = filter.toString(); 
			 
		
			
			PreparedStatement stmt=con.prepareStatement(whereQuery);
	
			ResultSet result=stmt.executeQuery();	
				
		
			%>
			<table border = '1'>
					<tr>    
						<td>Unique Item ID</td>
						<td>Auction ID</td>
						<td>Pant Waist</td>
						<td>Pant Type</td>
						<td>Pant Gender</td>
						<td>Color</td>
						<td>Bid Price</td>
						
					</tr>
						<%
						//parse out the results
						while (result.next()) { %>
							<tr>    
								<td><%= result.getInt("uniqueItemID") %></td>
								<td><%= result.getInt("itemID") %></td>
								<td><%= result.getInt("pant_waist") %></td>
								<td><%= result.getString("pant_type") %></td>
								<td><%= result.getString("pant_gender") %></td>
								<td><%= result.getString("color") %></td>
								<td><%= result.getBigDecimal("bidPrice") %></td>
								
							</tr>
							
			
						<% }
						//close the connection.
						con.close();
						%>
			</table> 
			
			
			<% 
		}else if(clothingType.equals("Shirt")){
			String shirtSize =  request.getParameter("shirtSizeOption");
			String shirtGender = request.getParameter("shirtGenderOption");
			String shirtBrand =request.getParameter("shirtBrandOption");
			String shirtColor = request.getParameter("shirtColorOption");
			String shirtBidPrice = request.getParameter("shirtBidPriceOption");
			double shirtBidPriceToDouble = -1;
			if(!(shirtBidPrice.equals("null"))){
				shirtBidPriceToDouble = Double.valueOf(shirtBidPrice);
			}
			

			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			//create filter mysql query
			StringBuilder filter = new StringBuilder();
			//there is at least one of the search values 
			//there is shirt size
			filter.append("select * from shirt ");
			if((!(shirtSize.equals("null")))  || (!(shirtGender.equals("null"))) || (!(shirtBrand.equals("null"))) 
					|| (!(shirtColor.equals("null"))) ||  (shirtBidPriceToDouble != -1)){
				filter.append("where ");
			}
			//--------
			if(!(shirtSize.equals("null")) ){
				filter.append(" shirt_size = '" + shirtSize + "' ");
			}
			//there is shirt gender
			if(  !(shirtSize.equals("null"))  && ( !(shirtGender.equals("null")) ||!(shirtBrand.equals("null")) 
					||!(shirtColor.equals("null")) || shirtBidPriceToDouble != -1)){
				filter.append(" and ");
			}
			if( !(shirtGender.equals("null")) ){
				filter.append(" shirt_gender = '" + shirtGender + "' ");
			}
			//there is shirt brand
			if( !(shirtGender.equals("null")) && ( !(shirtBrand.equals("null")) ||!(shirtColor.equals("null")) || shirtBidPriceToDouble != -1)){
				filter.append(" and ");
			}
			if( !(shirtBrand.equals("null"))){
				filter.append(" shirt_brand = '" + shirtBrand + "' ");
			}
			//there is shirt color
			if(!(shirtBrand.equals("null")) && (!(shirtColor.equals("null")) || shirtBidPriceToDouble != -1)){
				filter.append(" and ");
			}
			if(!(shirtColor.equals("null"))){
				filter.append(" color = '" + shirtColor + "' ");
			}
			//there is bid price
			if( !(shirtColor.equals("null")) && shirtBidPriceToDouble != -1){
				filter.append(" and ");
			}
			if( shirtBidPriceToDouble != -1){
				filter.append(" bidPrice = " + shirtBidPriceToDouble + " ");
			}
			String whereQuery = filter.toString(); 
			 
			
			
			PreparedStatement stmt=con.prepareStatement(whereQuery);
			ResultSet result=stmt.executeQuery();	
					
			
		
			%>
			<table border = '1'>
					<tr>    
						<td>Unique Item ID</td>
						<td>Auction  ID</td>
						<td>Shirt Size</td>
						<td>Shirt Gender</td>
						<td>Shirt Brand</td>
						<td>Color</td>
						<td>Bid Price</td>
						
					</tr>
						<%
						//parse out the results
						while (result.next()) { %>
							<tr>    
								<td><%= result.getInt("uniqueItemID") %></td>
								<td><%= result.getString("itemID") %></td>
								<td><%= result.getString("shirt_size") %></td>
								<td><%= result.getString("shirt_gender") %></td>
								<td><%= result.getString("shirt_brand") %></td>
								<td><%= result.getString("color") %></td>
								<td><%= result.getBigDecimal("bidPrice") %></td>
								
							</tr>
							
			
						<% }
						//close the connection.
						con.close();
						%>
			</table> 
			
			
			<% 
			
			
			
		}else{
			String shoeSize =  request.getParameter("shoeSizeOption");
			String shoeGender = request.getParameter("shoeGenderOption");
			String shoeBrand =request.getParameter("shoeBrandOption");
			String shoeColor = request.getParameter("shoeColorOption");
			String shoeBidPrice = request.getParameter("shoeBidPriceOption");
			double shoeBidPriceToDouble = -1;
			if(!(shoeBidPrice.equals("null"))){
				shoeBidPriceToDouble = Double.valueOf(shoeBidPrice);
			}
			double shoeSizeToDouble = -1;
			if(!(shoeSize.equals("null"))){
				shoeSizeToDouble = Double.valueOf(shoeSize);
			}
			

			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			//create filter mysql query
			StringBuilder filter = new StringBuilder();
			//there is at least one of the search values 
			//there is shoe size
			filter.append("select * from shoe ");
			if((shoeSizeToDouble != -1) || (!(shoeGender.equals("null"))) || (!(shoeBrand.equals("null"))) 
					|| (!(shoeColor.equals("null"))) ||  (shoeBidPriceToDouble != -1)){
				filter.append("where ");
			}
			//--------
			if(shoeSizeToDouble != -1 ){
				filter.append(" shoe_size = '" + shoeSizeToDouble + "' ");
			}
			//there is shoe gender
			if( shoeSizeToDouble != -1  && ( !(shoeGender.equals("null")) ||!(shoeBrand.equals("null")) 
					||!(shoeColor.equals("null")) || shoeBidPriceToDouble != -1)){
				filter.append(" and ");
			}
			if( !(shoeGender.equals("null")) ){
				filter.append(" shoe_gender = '" + shoeGender + "' ");
			}
			//there is shoe brand
			if( !(shoeGender.equals("null")) && ( !(shoeBrand.equals("null")) ||!(shoeColor.equals("null")) || shoeBidPriceToDouble != -1)){
				filter.append(" and ");
			}
			if( !(shoeBrand.equals("null"))){
				filter.append(" shoe_brand = '" + shoeBrand + "' ");
			}
			//there is shoe color
			if(!(shoeBrand.equals("null")) && (!(shoeColor.equals("null")) || shoeBidPriceToDouble != -1)){
				filter.append(" and ");
			}
			if(!(shoeColor.equals("null"))){
				filter.append(" color = '" + shoeColor + "' ");
			}
			//there is bid price
			if( !(shoeColor.equals("null")) && shoeBidPriceToDouble != -1){
				filter.append(" and ");
			}
			if( shoeBidPriceToDouble != -1){
				filter.append(" bidPrice = " + shoeBidPriceToDouble + " ");
			}
			String whereQuery = filter.toString(); 
			 
		
			
			
			PreparedStatement stmt=con.prepareStatement(whereQuery);
			ResultSet result=stmt.executeQuery();	
					
			
		
			%>
			<table border = '1'>
					<tr>    
						<td>Unique Item ID</td>
						<td>Auction ID</td>
						<td>Shoe Size</td>
						<td>Shoe Gender</td>
						<td>Shoe Brand</td>
						<td>Color</td>
						<td>Bid Price</td>
						
					</tr>
						<%
						//parse out the results
						while (result.next()) { %>
							<tr>    
								<td><%= result.getInt("uniqueItemID") %></td>
								<td><%= result.getInt("itemID") %></td>
								<td><%= result.getBigDecimal("shoe_size") %></td>
								<td><%= result.getString("shoe_gender") %></td>
								<td><%= result.getString("shoe_brand") %></td>
								<td><%= result.getString("color") %></td>
								<td><%= result.getBigDecimal("bidPrice") %></td>		
							</tr>
						<% }
						//close the connection.
						con.close();
						%>
			</table>
			<% 
		}
	
	}catch(Exception e){
		
	}
%>
</body>
</html>