<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
	try{
		String clothingType = request.getParameter("ClothingType"); 
		session.setAttribute("cloth", clothingType);
		%>
		<br>
		<a href="http://localhost:8080/B_Bay/Home.jsp">
			<button>Go To Home</button>
		</a>
		<br>
		<% 
		
		if(clothingType.equals("Pant")){
			%>
			<form action="SellClothingTypeAttributeData.jsp">
				<table>
					<tr>    
						<td>Start Date</td><td><input  type="text" required="required" value="yyyy-mm-dd" name="startDate"></td>
					</tr>
					<tr>
						<td>End Date</td><td><input type="text" required="required" value="yyyy-mm-dd" name="endDate"></td>
					</tr>
					<tr>    
						<td>Initial Bid Price</td><td><input type="number" step = "0.01"required="required"min = "0" name="initialBidPrice"></td>
					</tr>
					<tr>
						<td>Increment Bid Value</td><td><input type="number" step = "0.01"required="required"min = "0" name="incrementBidPrice"></td>
					</tr>
					<tr>    
						<td>Minimum Bid Required</td><td><input type="number" step = "0.01"required="required"min = "0" name="minBid"></td>
					</tr>
				
					<tr>    
						<td>Pant Waist</td><td><input type="number" required="required" min = "0" name="pant_waist"></td>
					</tr>
					<tr>
						<td>Pant Type</td><td><input type="text"required="required" name="pant_type"></td>
					</tr>
					<tr>    
						<td>Pant Gender</td><td><input type="text" required="required"name="pant_gender"></td>
					</tr>
					<tr>
						<td>Pant Color</td><td><input type="text"required="required" name="color"></td>
					</tr>
				</table>
				<p>Would you like the item to be available?</p>
				<select name="isAvailable">
				    	<option value="Y">Yes</option>
				    	<option value="N">No</option>
		  		</select>
		  		<br>
		  	<input type="submit" value="Submit"> 
			</form>
		<% 
		}else if(clothingType.equals("Shirt")){
			%>
			<form action="SellClothingTypeAttributeData.jsp">
				<table>
					<tr>    
						<td>Start Date</td><td><input type="text" value="yyyy-mm-dd" name="startDate"></td>
					</tr>
					<tr>
						<td>End Date</td><td><input type="text" value="yyyy-mm-dd" name="endDate"></td>
					</tr>
					<tr>    
						<td>Initial Bid Price</td><td><input type="number"step = "0.01"required="required" min = "0" name="initialBidPrice"></td>
					</tr>
					<tr>
						<td>Increment Bid Value</td><td><input type="number"step = "0.01" required="required"min = "0" name="incrementBidPrice"></td>
					</tr>
					<tr>    
						<td>Minimum Bid Required</td><td><input type="number" step = "0.01"required="required"min = "0" name="minBid"></td>
					</tr>
				
					<tr>    
						<td>Shirt Size</td><td><input type="text" required="required"name="shirt_size"></td>
					</tr>
					<tr>
						<td>Shirt Gender</td><td><input type="text"required="required" name="shirt_gender"></td>
					</tr>
					<tr>    
						<td>Shirt Brand</td><td><input type="text"required="required" name="shirt_brand"></td>
					</tr>
					<tr>
						<td>Shirt Color</td><td><input type="text"required="required" name="color"></td>
					</tr>
				</table>
				<p>Would you like the item to be available?</p>
				<select name="isAvailable">
				    	<option value="Y">Yes</option>
				    	<option value="N">No</option>
		  		</select>
		  	<input type="submit" value="Submit"> 
			</form>
		<% 
		}else{
			%>
			<form action="SellClothingTypeAttributeData.jsp">
				<table>
					<tr>    
						<td>Start Date</td><td><input type="text"  value="yyyy-mm-dd"name="startDate"></td>
					</tr>
					<tr>
						<td>End Data</td><td><input type="text"  value="yyyy-mm-dd"name="endDate"></td>
					</tr>
					<tr>    
						<td>Initial Bid Price</td><td><input type="number" step = "0.01"required="required" min = "0" name="initialBidPrice"></td>
					</tr>
					<tr>
						<td>Increment Bid Value</td><td><input type="number" step = "0.01"required="required"min = "0" name="incrementBidPrice"></td>
					</tr>
					<tr>    
						<td>Minimum Bid Required</td><td><input type="number"step = "0.01"required="required" min = "0" name="minBid"></td>
					</tr>
				
					<tr>    
						<td>Shoe Size</td><td><input type="number" min = "0"step = "0.5"required="required" name="shoe_size"></td>
					</tr>
					<tr>
						<td>Shoe Gender</td><td><input type="text" required="required" name="shoe_gender"></td>
					</tr>
					<tr>    
						<td>Shoe Brand</td><td><input type="text"required="required" name="shoe_brand"></td>
					</tr>
					<tr>
						<td>Shoe Color</td><td><input type="text"required="required" name="color"></td>
					</tr>
				</table>
				<p>Would you like the item to be available?</p>
				<select name="isAvailable">
				    	<option value="Y">Yes</option>
				    	<option value="N">No</option>
		  		</select>
		  	<input type="submit" value="Submit"> 
			</form>
		<% 
		}
	}catch(Exception e){
		
	}
%>
</body>
</html>