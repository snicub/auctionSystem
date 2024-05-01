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
		String minPrice = request.getParameter("minPrice"); 
		String maxPrice = request.getParameter("maxPrice"); 
		session.setAttribute("clothingType",clothingType);
		
		
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		%>
		<br>
		<a href="http://localhost:8080/B_Bay/Home.jsp">
			<button>Go To Home</button>
		</a>
		<br>
		<% 
		// show tables of Pant,Shirt,Shoe 
		if(clothingType.equals("Pant")){
			PreparedStatement stmt1=con.prepareStatement("select pant_waist from pant group by pant_waist;");  
			ResultSet pant_waistrs=stmt1.executeQuery();
			
			%>
			<form  method="post" action="SearchAuctionClothingTypeResults.jsp">
				<p>Select pants waist</p>
				  	 <select name="pantWaistOption">
				  	 	<option value = "null">-</option>
				        <%  while(pant_waistrs.next()){ int pWaistval = pant_waistrs.getInt(1);%>
				            <option value = "<%=pWaistval%>"><%=pWaistval%></option>
				        <% } %>
				     </select>
				 	
				<br>
				<% 
				PreparedStatement stmt2=con.prepareStatement("select pant_type from pant group by pant_type;");  
				ResultSet pant_type=stmt2.executeQuery();
				
				%>
				<p>Select Pants Type</p>
				
				  	 <select name = "pantTypeOption">
				  	 	<option value = "null">-</option>
				        <%  while(pant_type.next()){ String pTypeval= pant_type.getString(1); %>
				      	  
				            <option value = "<%=pTypeval%>"><%= pTypeval%></option>
				        <% } %>
				        </select>
				 	<!--  <input type="submit" value="Submit">  -->
				
				<br>
				<% 
			
				PreparedStatement stmt3=con.prepareStatement("select pant_gender from pant group by pant_gender;");  
				ResultSet pant_gender=stmt3.executeQuery();
				
				%>
				<p>Select Pants Gender</p>
				
				  	 <select name = "pantGenderOption">
				  	 	<option value = "null">-</option>
				        <%  while(pant_gender.next()){ String pGenderVal=pant_gender.getString(1); %>
				        	
				            <option value = "<%=pGenderVal%>"><%= pGenderVal%></option>
				        <% } %>
				        </select>
				 	 <!-- <input type="submit" value="Submit">  -->
				
				<br>
				<% 
	
				PreparedStatement stmt4=con.prepareStatement("select color from pant group by color;");  
				ResultSet color=stmt4.executeQuery();
				
				%>
				<p>Select Pants Color</p>
				
				  	 <select name = "pantColorOption">
				  	 	<option value = "null">-</option>
				        <%  while(color.next()){ String colorVal = color.getString(1); %>
				        	
				            <option value = "<%=colorVal%>"><%=colorVal %></option>
				        <% } %>
				        </select>
				 	 <!-- <input type="submit" value="Submit"> --> 
			
				<br>
				<% 
				PreparedStatement stmt5=con.prepareStatement("select bidPrice from pant where bidPrice < ? and bidPrice > ? group by bidPrice;");  
				stmt5.setString(1, maxPrice);
				stmt5.setString(2, minPrice);
				ResultSet bidPrice=stmt5.executeQuery();
				
				%>
				<p>Select Pants Pricing</p>
				  	 <select name = "pantBidPriceOption">
				  	 	<option value = "null">-</option>
				        <%  while(bidPrice.next()){ double pantPrice = Double.valueOf(bidPrice.getString(1));%>
				        	
				            <option value ="<%=pantPrice%>"><%=pantPrice%></option>
				        <% } %>
				        </select>
				 	 <input type="submit" value="Submit"> 
				<br>
			</form>
			<% 
			
			
		}else if(clothingType.equals("Shirt")){
			
				PreparedStatement stmt1=con.prepareStatement("select shirt_size from shirt group by shirt_size;");  
				ResultSet shirt_size=stmt1.executeQuery();
				
				%>
				<form  method="post" action="SearchAuctionClothingTypeResults.jsp">
					<p>Select Shirt size</p>
					  	 <select name="shirtSizeOption">
					  	 	<option value = "null">-</option>
					        <%  while(shirt_size.next()){ String shirtSize = shirt_size.getString(1);%>
					            <option value = "<%=shirtSize%>"><%=shirtSize%></option>
					        <% } %>
					     </select>
					 	
					<br>
					<% 
					PreparedStatement stmt2=con.prepareStatement("select shirt_gender from shirt group by shirt_gender;");  
					ResultSet shirt_gender=stmt2.executeQuery();
					
					%>
					<p>Select Shirt Gender</p>
					
					  	 <select name = "shirtGenderOption">
					  	 	<option value = "null">-</option>
					        <%  while(shirt_gender.next()){ String shirtGender= shirt_gender.getString(1); %>
					      	  
					            <option value = "<%=shirtGender%>"><%= shirtGender%></option>
					        <% } %>
					        </select>
				
					
					<br>
					<% 
				
					PreparedStatement stmt3=con.prepareStatement("select shirt_brand from shirt group by shirt_brand;");  
					ResultSet shirt_brand=stmt3.executeQuery();
					
					%>
					<p>Select shirt brand</p>
					
					  	 <select name = "shirtBrandOption">
					  	 	<option value = "null">-</option>
					        <%  while(shirt_brand.next()){ String shirtBrand=shirt_brand.getString(1); %>
					        	
					            <option value = "<%=shirtBrand%>"><%= shirtBrand%></option>
					        <% } %>
					        </select>
					 	 
					
					<br>
					<% 
		
					PreparedStatement stmt4=con.prepareStatement("select color from shirt group by color;");  
					ResultSet color=stmt4.executeQuery();
					
					%>
					<p>Select Shirt Color</p>
					
					  	 <select name = "shirtColorOption">
					  	 	<option value = "null">-</option>
					        <%  while(color.next()){ String colorVal = color.getString(1); %>
					            <option value = "<%=colorVal%>"><%=colorVal %></option>
					        <% } %>
					        </select>
					 	 <!-- <input type="submit" value="Submit"> --> 
				
					<br>
					<% 
					PreparedStatement stmt5=con.prepareStatement("select bidPrice from shirt where bidPrice < ? and bidPrice > ? group by bidPrice;");  
					stmt5.setString(1, maxPrice);
					stmt5.setString(2, minPrice);
					ResultSet bidPrice=stmt5.executeQuery();
					
					%>
					<p>Select Shirt Pricing</p>
					  	 <select name = "shirtBidPriceOption">
					  	 	<option value = "null">-</option>
					        <%  while(bidPrice.next()){ double pantPrice =  Double.valueOf(bidPrice.getString(1));%>
					        	
					            <option value ="<%=pantPrice%>"><%=pantPrice%></option>
					        <% } %>
					        </select>
					 	 <input type="submit" value="Submit"> 
					<br>
				</form>
				<% 
				
		}else{//shoe
			PreparedStatement stmt1=con.prepareStatement("select shoe_size from shoe group by shoe_size;");  
			ResultSet shoe_size=stmt1.executeQuery();
			
			%>
			<form  method="post" action="SearchAuctionClothingTypeResults.jsp">
				<p>Select Shoe size</p>
				  	 <select name="shoeSizeOption">
				  	 	<option value = "null">-</option>
				        <%  while(shoe_size.next()){ String shoeSize = shoe_size.getString(1);%>
				            <option value = "<%=shoeSize%>"><%=shoeSize%></option>
				        <% } %>
				     </select>
				 	
				<br>
				<% 
				PreparedStatement stmt2=con.prepareStatement("select shoe_gender from shoe group by shoe_gender;");  
				ResultSet shoe_gender=stmt2.executeQuery();
				
				%>
				<p>Select Shoe Gender</p>
				
				  	 <select name = "shoeGenderOption">
				  	 	<option value = "null">-</option>
				        <%  while(shoe_gender.next()){ String shoeGender= shoe_gender.getString(1); %>
				      	  
				            <option value = "<%=shoeGender%>"><%= shoeGender%></option>
				        <% } %>
				        </select>
			
				
				<br>
				<% 
			
				PreparedStatement stmt3=con.prepareStatement("select shoe_brand from shoe group by shoe_brand;");  
				ResultSet shoe_brand=stmt3.executeQuery();
				
				%>
				<p>Select shoe brand</p>
				
				  	 <select name = "shoeBrandOption">
				  	 	<option value = "null">-</option>
				        <%  while(shoe_brand.next()){ String shoeBrand=shoe_brand.getString(1); %>
				        	
				            <option value = "<%=shoeBrand%>"><%= shoeBrand%></option>
				        <% } %>
				        </select>
				 	 
				
				<br>
				<% 
	
				PreparedStatement stmt4=con.prepareStatement("select color from shoe group by color;");  
				ResultSet color=stmt4.executeQuery();
				
				%>
				<p>Select Shoe Color</p>
				
				  	 <select name = "shoeColorOption">
				  	 	<option value = "null">-</option>
				        <%  while(color.next()){ String colorVal = color.getString(1); %>
				            <option value = "<%=colorVal%>"><%=colorVal %></option>
				        <% } %>
				        </select>
				 	 <!-- <input type="submit" value="Submit"> --> 
			
				<br>
				<% 
				PreparedStatement stmt5=con.prepareStatement("select bidPrice from shoe where bidPrice < ? and bidPrice > ? group by bidPrice;");  
				stmt5.setString(1, maxPrice);
				stmt5.setString(2, minPrice);
				ResultSet bidPrice=stmt5.executeQuery();
				
				%>
				<p>Select Shoe Pricing</p>
				  	 <select name = "shoeBidPriceOption">
				  	 	<option value = "null">-</option>
				        <%  while(bidPrice.next()){ double shoePrice =  Double.valueOf(bidPrice.getString(1));%>
				        	
				            <option value ="<%=shoePrice%>"><%=shoePrice%></option>
				        <% } %>
				        </select>
				 	 <input type="submit" value="Submit"> 
				<br>
			</form>
			<% 
		}
		con.close();
	}catch(Exception e){
		
	}
%>
</body>
</html>